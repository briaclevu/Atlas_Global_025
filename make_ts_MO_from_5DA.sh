# produce surface monthly time series from model output
export tmpdir=temp/ORCA025/MBG/DA
export outdir=${WORKDIR}/ORCA025-PIS2DIC/MBG/Analyse/TS_MO

#1: Monthly 2D timeseries for MBG carbon
export deb=1958
export fin=2010

echo Monthly mean surface MBG for the period ${deb}1 to $(($fin+1))0

for var in Cflx Cflx2 Oflx Kg Dpco2 Dpco22 Dpo2
do
 for ((an = $deb; an <= $fin; an++))
 do
  ifile=${tmpdir}/ORCA025-PIS2DIC_${an}*_5D_diad_T.nc
  echo field ${var} file ${ifile}
  ferret -script 5d2mon.jnl ${ifile} ${var} 
  var_UP=`echo ${var} | tr '[:lower:]' '[:upper:]' | sed s:$:_MO:` 
  tmpfile=`echo ${ifile} | sed -e "s:diad_T:${var}:" -e "s:5D:1M:"`
  newfile=`basename ${tmpfile}`
  ncrename -O -v ${var_UP},${var} -v NAV_LON,nav_lon -v NAV_LAT,nav_lat -d MONTH_NOLEAP,time_counter -v MONTH_NOLEAP,time_counter -v MONTH_NOLEAP_bnds,time_counter_bnds ${newfile} ${newfile}
  ncatted -O -a calendar,time_counter,o,c,noleap ${newfile}
  ncatted -O -a bounds,time_counter,o,c,time_counter_bnds ${newfile}
 done
 echo concat monthly ${var}
 cdo -f nc copy ORCA025-PIS2DIC_*_1M_${var}.nc ${outdir}/ORCA025_${deb}_${fin}_1M_${var}.nc 
 rm ORCA025-PIS2DIC_*_1M_${var}.nc
done

#2: Monthly other MBG
export deb=1991
export fin=2010

for var in Nfix Heup Irondep INVPPPHY INVPPPHY2 INVPNEW INVPNEWD
do
 for ((an = $deb; an <= $fin; an++))
 do
  ifile=${tmpdir}/ORCA025-PIS2DIC_${an}*_5D_diad_T.nc
  echo field ${var} file ${ifile}
  ferret -script 5d2mon.jnl ${ifile} ${var} 
  var_UP=`echo ${var} | tr '[:lower:]' '[:upper:]' | sed s:$:_MO:` 
  tmpfile=`echo ${ifile} | sed -e "s:diad_T:${var}:" -e "s:5D:1M:"`
  newfile=`basename ${tmpfile}`
  ncrename -v ${var_UP},${var} -v NAV_LON,nav_lon -v NAV_LAT,nav_lat -d MONTH_NOLEAP,time_counter -v MONTH_NOLEAP,time_counter -v MONTH_NOLEAP_bnds,time_counter_bnds ${newfile}
  ncatted -O -a calendar,time_counter,o,c,noleap ${newfile}
  ncatted -O -a bounds,time_counter,o,c,time_counter_bnds ${newfile}
 done
 echo concat monthly ${var}
 cdo -f nc copy ORCA025-PIS2DIC_*_1M_${var}.nc ${outdir}/ORCA025_${deb}_${fin}_1M_${var}.nc 
 rm ORCA025-PIS2DIC_*_1M_${var}.nc
done