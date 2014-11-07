# produce surface monthly climatology from decadal time series
export outdir=${WORKDIR}/ORCA025-PIS2DIC

export deb=199
export fin=200

echo Monthly decadal climatology for the period ${deb}1 to $(($fin+1))0

#1: surface climatology for MBG 
for field in NO3 PO4 O2 Si DIC DIC2 Alkalini Alkalini2 Fer NCHL DCHL PH PH2 CO3 CO32
do
 echo field $field
 for ((an = $deb; an <= $fin; an++))
 do
  echo ${an}1 to $((${an}+1))0
  cdo ymonmean ${outdir}/MBG/Analyse/TS_MO/ORCA025_${an}1_$((${an}+1))0_1M_${field}_surf.nc ${outdir}/MBG/Analyse/CLIM_MO/ORCA025_${an}1_$((${an}+1))0_12M_${field}_surf.nc
 done
done

#2: surface climatology for OCE 
for field in votemper vosaline somxl010
do
 echo field $field
 for ((an = $deb; an <= $fin; an++))
 do
  echo ${an}1 to $((${an}+1))0
  cdo ymonmean ${outdir}/OCE/Analyse/TS_MO/ORCA025_${an}1_$((${an}+1))0_1M_${field}_surf.nc ${outdir}/OCE/Analyse/CLIM_MO/ORCA025_${an}1_$((${an}+1))0_12M_${field}_surf.nc
 done
done