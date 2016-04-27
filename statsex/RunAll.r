
args <- commandArgs(trailingOnly = TRUE)

basedir <- args[1]
temp_dir <- args[2]

#basedir <- "/usr/local/tmp/DICOM_QC_FreeSurfer/10142_3_RES"
#temp_dir <- "/home/hayashis/git/sca-service-freesurfer/statsex_template"

#fix this
#dir.create(paste(basedir,"/Results""))

source("statsex/Aparc_CInd.r")
source("statsex/Aparc_ThxAvg.r")
#source("statsex/Aparc_FInd.r")
#source("statsex/Aparc_GCurv.r")
#source("statsex/Aparc_GVol.r")
#source("statsex/Aparc_MCurv.r")
#source("statsex/Aparc_SArea.r")
#source("statsex/Aparc_ThxStd.r")
#source("statsex/Aseg_IntMax.r")
#source("statsex/Aseg_IntMean.r")
#source("statsex/Aseg_IntMin.r")
#source("statsex/Aseg_IntRange.r")
#source("statsex/Aseg_IntStdDev.r")
#source("statsex/Aseg_Vol.r")
#source("statsex/BA_CInd.r")
#source("statsex/BA_FInd.r")
#source("statsex/BA_GCurv.r")
#source("statsex/BA_GVol.r")
#source("statsex/BA_MCurv.r")
#source("statsex/BA_NumVert.R")
source("statsex/BA_SArea.r")
#source("statsex/BA_ThxAvg.r")
#source("statsex/BA_ThxStd.r")
#source("statsex/Wmparc_IntMax.r")
#source("statsex/Wmparc_IntMean.r")
#source("statsex/Wmparc_IntMin.r")
#source("statsex/Wmparc_IntRag.r")
#source("statsex/Wmparc_StdDev.r")
#source("statsex/Wmparc_Vol.r")


