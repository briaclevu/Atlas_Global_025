#extract field from MBG monthly file with fieldname # varname
export deb=197
export fin=200

export outdir=${WORKDIR}/ORCA025-PIS2DIC/MBG/Analyse/TS_MO

for ((an = $deb; an <= $fin; an++))
do
 field=ALK
 for var in Alkalini Alkalini2
 do
  echo $var from ORCA025_${an}1_$((${an}+1))0_1M_${field}_surf.nc
  cdo selname,${var} ORCA025_${an}1_$((${an}+1))0_1M_${field}_surf.nc ${outdir}/ORCA025_${an}1_$((${an}+1))0_1M_${var}_surf.nc
 done

 field=CHL
 for var in DCHL NCHL
 do
  echo $var from ORCA025_${an}1_$((${an}+1))0_1M_${field}_surf.nc
  cdo selname,${var} ORCA025_${an}1_$((${an}+1))0_1M_${field}_surf.nc ${outdir}/ORCA025_${an}1_$((${an}+1))0_1M_${var}_surf.nc
 done

 field=CO3
 for var in CO3sat
 do
  echo $var from ORCA025_${an}1_$((${an}+1))0_1M_${field}_surf.nc
  cdo selname,${var} ORCA025_${an}1_$((${an}+1))0_1M_${field}_surf.nc ${outdir}/ORCA025_${an}1_$((${an}+1))0_1M_${var}_surf.nc
 done

 field=NIT
 for var in NO3
 do
  echo $var from ORCA025_${an}1_$((${an}+1))0_1M_${field}_surf.nc
  cdo selname,${var} ORCA025_${an}1_$((${an}+1))0_1M_${field}_surf.nc ${outdir}/ORCA025_${an}1_$((${an}+1))0_1M_${var}_surf.nc
 done

 field=FER
 for var in Fer
 do
  echo $var from ORCA025_${an}1_$((${an}+1))0_1M_${field}_surf.nc
  cdo selname,${var} ORCA025_${an}1_$((${an}+1))0_1M_${field}_surf.nc ${outdir}/ORCA025_${an}1_$((${an}+1))0_1M_${var}_surf.nc
 done

 field=OXY
 for var in O2
 do
  echo $var from ORCA025_${an}1_$((${an}+1))0_1M_${field}_surf.nc
  cdo selname,${var} ORCA025_${an}1_$((${an}+1))0_1M_${field}_surf.nc ${outdir}/ORCA025_${an}1_$((${an}+1))0_1M_${var}_surf.nc
 done

 field=SIL
 for var in Si
 do
  echo $var from ORCA025_${an}1_$((${an}+1))0_1M_${field}_surf.nc
  cdo selname,${var} ORCA025_${an}1_$((${an}+1))0_1M_${field}_surf.nc ${outdir}/ORCA025_${an}1_$((${an}+1))0_1M_${var}_surf.nc
 done
done