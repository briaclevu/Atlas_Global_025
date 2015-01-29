#! /bin/ksh

# produce surface monthly time series from model output
tmpdir=${WORKDIR}/temp/ORCA025/MBG/MO
outdir=${WORKDIR}/ORCA025-PIS2DIC

deb=199
fin=200

#1: Monthly surface timeseries for MBG with fieldname = varname + varname2
echo Monthly mean surface MBG for the period ${deb}1 to $(($fin+1))0

for field in DIC CO3 PH
do
 echo field $field
 for ((an = $deb; an <= $fin; an++))
 do
  echo ${an}1 to $((${an}+1))0
  cdo -f nc select,name=${field}2,levidx=1 ${tmpdir}/ORCA025-PIS2DIC_${an}[123456789]*_1M_${field}.nc ${tmpdir}/ORCA025-PIS2DIC_$((${an}+1))0*_1M_${field}.nc ${outdir}/MBG/Analyse/TS_MO/ORCA025_${an}1_$((${an}+1))0_1M_${field}2_surf.nc
  cdo -f nc select,name=${field},levidx=1 ${tmpdir}/ORCA025-PIS2DIC_${an}[123456789]*_1M_${field}.nc ${tmpdir}/ORCA025-PIS2DIC_$((${an}+1))0*_1M_${field}.nc ${outdir}/MBG/Analyse/TS_MO/ORCA025_${an}1_$((${an}+1))0_1M_${field}_surf.nc
 done
# cdo -f nc4c select,name=${field},levidx=1 ${tmpdir}/ORCA025-PIS2DIC_195*_1M_${field}.nc ${tmpdir}/ORCA025-PIS2DIC_196[123456789]*_1M_${field}.nc ${tmpdir}/ORCA025-PIS2DIC_1970*_1M_${field}.nc ${outdir}/MBG/Analyse/TS_MO/ORCA025_1958_1970_1M_${field}_surf.nc
done

#2: Monthly surface timeseries for MBG with fieldname # varname
for field in CO3
#PO4 NIT SIL CHL OXY FER ALK
do
 echo field $field
 for ((an = $deb; an <= $fin; an++))
 do
  echo ${an}1 to $((${an}+1))0
  cdo -f nc select,levidx=1 ${tmpdir}/ORCA025-PIS2DIC_${an}[123456789]*_1M_${field}.nc ${tmpdir}/ORCA025-PIS2DIC_$((${an}+1))0*_1M_${field}.nc ORCA025_${an}1_$((${an}+1))0_1M_${field}_surf.nc
 done
done

#3: Monthly surface timeseries for OCE
tmpdir=${WORKDIR}/temp/ORCA025/OCE/MO

deb=1958
fin=1990

for field in somixhgt sowindsp sossheig somxl010
#votemper vosaline somxl010
do
 echo field $field
 for ((an = $deb; an <= $fin; an++))
 do
  echo ${an}
  cdo -f nc select,name=${field},levidx=1 ${tmpdir}/ORCA025-PIS2DIC_${an}*_1M_grid_T.nc ${tmpdir}/ORCA025_${an}_1M_${field}.nc
 done
done
cdo -f nc copy ${tmpdir}/ORCA025_*_1M_${field}.nc ${outdir}/OCE/Analyse/TS_MO/ORCA025_${deb}_${fin}_1M_${field}.nc
rm ${tmpdir}/ORCA025_*_1M_${field}.nc

#4: extract field from the file with different name than yearly field and erase that file
sh ./select_var.sh
sh ./rm_file.sh
