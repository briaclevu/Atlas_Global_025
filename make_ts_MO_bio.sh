# produce surface monthly time series from model output
outdir=ORCA025-PIS2DIC/MBG/Analyse/TS_MO

#1: Monthly 2D timeseries for MBG carbon
deb=1958
fin=1990

echo Monthly mean MLD for the period ${deb} to $fin

for field in PPPHY PPPHY2
#PHY PHY2 ZOO ZOO2
do
 for ((an = $deb; an <= $fin; an++))
 do
  ifile=${outdir}/ORCA025_${an}_1M_${field}_3D.nc
  echo file ${ifile}
  ferret -script int_biomasse.jnl ${ifile} ${field}
  tmpfile=`echo ${ifile} | sed -e "s:${field}:INV${field}:" -e "s:3D:2D:"`
  newfile=`basename ${tmpfile}`
  cp tmp_file.nc $newfile
  ncrename -O -v NAV_LON,nav_lon -v NAV_LAT,nav_lat -d TIME_COUNTER,time_counter -v TIME_COUNTER,time_counter -v TIME_COUNTER_bnds,time_counter_bnds ${newfile}
  ncatted -O -a calendar,time_counter,o,c,noleap ${newfile}
  ncatted -O -a bounds,time_counter,o,c,time_counter_bnds ${newfile}
 done
 echo concat monthly ${field}
 cdo -f nc copy ORCA025_*_1M_INV${field}_2D.nc ${outdir}/ORCA025_${deb}_${fin}_1M_INV${field}.nc 
 rm ORCA025_*_1M_INV${field}_2D.nc
done

#2: average 0-15m of chlorophyll
for field in NCHL DCHL
do
 for ((an = $deb; an <= $fin; an++))
 do
  ifile=${outdir}/ORCA025_${an}_1M_${field}_3D.nc
  echo file ${ifile}
  ferret -script ave_field.jnl ${ifile} ${field} 0 15
  tmpfile=`echo ${ifile} | sed -e "s:${field}:AVE${field}:" -e "s:3D:2D:"`
  newfile=`basename ${tmpfile}`
  cp tmp_file.nc $newfile
  ncrename -O -v NAV_LON,nav_lon -v NAV_LAT,nav_lat -d TIME_COUNTER,time_counter -v TIME_COUNTER,time_counter -v TIME_COUNTER_bnds,time_counter_bnds ${newfile}
  ncatted -O -a calendar,time_counter,o,c,noleap ${newfile}
  ncatted -O -a bounds,time_counter,o,c,time_counter_bnds ${newfile}
 done
 echo concat monthly ${field}
 cdo -f nc copy ORCA025_*_1M_AVE${field}_2D.nc ${outdir}/ORCA025_${deb}_${fin}_1M_AVE${field}.nc
 rm ORCA025_*_1M_AVE${field}_2D.nc
done

#3: average 200-600m and min of oxygen
for field in O2
do
 for ((an = $deb; an <= $fin; an++))
 do
  ifile=temp/ORCA025/MBG/MO/ORCA025-PIS2DIC_${an}0101_${an}1231_1M_OXY.nc
  echo ave O2 file ${ifile}
  ferret -script ave_field.jnl ${ifile} ${field} 200 600
  tmpfile=`echo ${ifile} | sed -e "s:OXY:AVE${field}:" -e "s:3D:2D:"`
  newfile=`basename ${tmpfile}`
  cp tmp_file.nc $newfile
  ncrename -O -v NAV_LON,nav_lon -v NAV_LAT,nav_lat -d TIME_COUNTER,time_counter -v TIME_COUNTER,time_counter -v TIME_COUNTER_bnds,time_counter_bnds ${newfile}
  ncatted -O -a calendar,time_counter,o,c,noleap ${newfile}
  ncatted -O -a bounds,time_counter,o,c,time_counter_bnds ${newfile}
  echo min O2 file ${ifile}
  ferret -script min_field.jnl ${ifile} ${field}
  tmpfile=`echo ${ifile} | sed -e "s:OXY:MIN${field}:" -e "s:3D:2D:"`
  newfile=`basename ${tmpfile}`
  cp tmp_file.nc $newfile
  ncrename -O -v NAV_LON,nav_lon -v NAV_LAT,nav_lat -d TIME_COUNTER,time_counter -v TIME_COUNTER,time_counter -v TIME_COUNTER_bnds,time_counter_bnds ${newfile}
  ncatted -O -a calendar,time_counter,o,c,noleap ${newfile}
  ncatted -O -a bounds,time_counter,o,c,time_counter_bnds ${newfile}
 done
 echo concat monthly ${field}
 cdo -f nc copy ORCA025*_1M_AVE${field}.nc ${outdir}/ORCA025_${deb}_${fin}_1M_AVE${field}.nc
 rm ORCA025*_1M_AVE${field}.nc
 cdo -f nc copy ORCA025*_1M_MIN${field}.nc ${outdir}/ORCA025_${deb}_${fin}_1M_MIN${field}.nc
 rm ORCA025*_1M_MIN${field}.nc
done