#!/bin/bash
#return code 0 = running
#return code 1 = finished successfully
#return code 2 = failed

if [ -f finished ]; then
    code=`cat finished`
    if [ $code -eq 0 ]; then
        echo "finished successfully"
        exit 1 #success!
    else
        echo "finished with code:$code"
        exit 2 #failed
    fi
fi

#used to analyze the progress
input_size=`du -s ../upload | cut -f1`

if [ -f jobid ]; then
    jobid=`cat jobid`
    jobstate=`qstat -f $jobid | grep job_state | cut -b17`
    if [ $jobstate == "Q" ]; then
        echo "Job:$jobid Waiting in the queue"
        eststart=`showstart $jobid | grep start`
        curl -s -X POST -H "Content-Type: application/json" -d "{\"msg\":\"Waiting in the PBS queue : $eststart\"}" $SCA_PROGRESS_URL > /dev/null
        exit 0 #running!
    fi
    if [ $jobstate == "R" ]; then

        #get rough estimate of the progress by analyzing the size of input and output directory
        taskdir_size=`du -s . | cut -f1`
        per=`bc -l <<< $taskdir_size/$input_size`
        echo "Running $per%"
        curl -s -X POST -H "Content-Type: application/json" -d "{\"status\": \"running\", \"progress\":$per, \"msg\":\"Executing recon_all\"}" $SCA_PROGRESS_URL > /dev/null

        exit 0 #running!
    fi

    #assume failed for all other state
    echo "Job:$jobid failed - PBS job state: $jobstate"
    exit 2
fi

echo "can't determine the status!"
exit 3


