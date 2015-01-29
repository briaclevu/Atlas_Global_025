# produce 0_500m monthly time series from model output
outdir=${WORKDIR}/ORCA025-PIS2DIC/MBG/Analyse/TS_MO

deb=1958
fin=1990

#1: Monthly 0_500m timeseries for MBG with fieldname = varname + varname2
echo Monthly mean 0_500m MBG for the period ${deb} to $fin

tmpdir=${WORKDIR}/temp/ORCA025/MBG/MO

for field in DIC
#PHY ZOO
do
 echo field $field
 for ((an = $deb; an <= $fin; an++))
 do
  echo ${an} 
  cdo -f nc select,name=${field}2,levidx=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20 ${tmpdir}/ORCA025-PIS2DIC_${an}*_1M_${field}.nc ${tmpdir}/ORCA025_${an}_1M_${field}2_0_500m.nc
  cdo -f nc select,name=${field},levidx=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20 ${tmpdir}/ORCA025-PIS2DIC_${an}*_1M_${field}.nc ${tmpdir}/ORCA025_${an}_1M_${field}_0_500m.nc
 done

cdo -f nc copy ${tmpdir}/ORCA025*_1M_${field}2_0_500m.nc ${outdir}/ORCA025_${deb}_${fin}_1M_${field}2_0_500m.nc
rm -rf ${tmpdir}/ORCA025*_1M_${field}2_0_500m.nc
cdo -f nc copy ${tmpdir}/ORCA025*_1M_${field}_0_500m.nc ${outdir}/ORCA025_${deb}_${fin}_1M_${field}_0_500m.nc
rm -rf ${tmpdir}/ORCA025*_1M_${field}_0_500m.nc
done

#2: Monthly 0_500m timeseries for MBG with fieldname = Nvarname + Dvarname
echo Monthly mean 0_500m MBG for the period ${deb} to $fin

tmpdir=${WORKDIR}/temp/ORCA025/MBG/MO

for field in CHL
do
 echo field $field
 for ((an = $deb; an <= $fin; an++))
 do
  echo ${an} 
  cdo -f nc select,name=N${field},levidx=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20 ${tmpdir}/ORCA025-PIS2DIC_${an}*_1M_${field}.nc ${tmpdir}/ORCA025_${an}_1M_N${field}_0_500m.nc
  cdo -f nc select,name=D${field},levidx=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20 ${tmpdir}/ORCA025-PIS2DIC_${an}*_1M_${field}.nc ${tmpdir}/ORCA025_${an}_1M_D${field}_0_500m.nc
 done
done

cdo -f nc copy ${tmpdir}/ORCA025*_1M_NCHL_0_500m.nc ${outdir}/ORCA025_${deb}_${fin}_1M_NCHL_0_500m.nc
rm -rf ${tmpdir}/ORCA025*_1M_NCHL_0_500m.nc
cdo -f nc copy ${tmpdir}/ORCA025*_1M_DCHL_0_500m.nc ${outdir}/ORCA025_${deb}_${fin}_1M_DCHL_0_500m.nc
rm -rf ${tmpdir}/ORCA025*_1M_NCHL_0_500m.nc

#3: Monthly 0_500m timeseries for MBG with fieldname = Nvarname + Dvarname
echo Monthly mean 0_500 MBG for the period ${deb} to $fin

tmpdir=${WORKDIR}/temp/ORCA025/MBG/MO

for ((an = $deb; an <= $fin; an++))
do
 echo ${an} 
 cdo -f nc select,name=Alkalini,levidx=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20 ${tmpdir}/ORCA025-PIS2DIC_${an}*_1M_ALK.nc ${tmpdir}/ORCA025_${an}_1M_Alkalini_0_500m.nc
 cdo -f nc select,name=Alkalini2,levidx=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20 ${tmpdir}/ORCA025-PIS2DIC_${an}*_1M_ALK.nc ${tmpdir}/ORCA025_${an}_1M_Alkalini2_0_500m.nc
 cdo -f nc select,name=Fer,levidx=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20 ${tmpdir}/ORCA025-PIS2DIC_${an}*_1M_FER.nc ${tmpdir}/ORCA025_${an}_1M_Fer_0_500m.nc
 cdo -f nc select,name=Si,levidx=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20 ${tmpdir}/ORCA025-PIS2DIC_${an}*_1M_SIL.nc ${tmpdir}/ORCA025_${an}_1M_Si_0_500m.nc
 cdo -f nc select,name=NO3,levidx=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20 ${tmpdir}/ORCA025-PIS2DIC_${an}*_1M_NIT.nc ${tmpdir}/ORCA025_${an}_1M_NO3_0_500m.nc
 cdo -f nc select,name=PO4,levidx=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20 ${tmpdir}/ORCA025-PIS2DIC_${an}*_1M_PO4.nc ${tmpdir}/ORCA025_${an}_1M_PO4_0_500m.nc
done

cdo -f nc copy ${tmpdir}/ORCA025*_1M_Alkalini_0_500m.nc ${outdir}/ORCA025_${deb}_${fin}_1M_Alkalini_0_500m.nc
rm -rf ${tmpdir}/ORCA025*_1M_Alkalini_0_500m.nc
cdo -f nc copy ${tmpdir}/ORCA025*_1M_Alkalini2_0_500m.nc ${outdir}/ORCA025_${deb}_${fin}_1M_Alkalini2_0_500m.nc
rm -rf ${tmpdir}/ORCA025*_1M_Alkalini2_0_500m.nc
cdo -f nc copy ${tmpdir}/ORCA025*_1M_Fer_0_500m.nc ${outdir}/ORCA025_${deb}_${fin}_1M_Fer_0_500m.nc
rm -rf ${tmpdir}/ORCA025*_1M_Fer_0_500m.nc
cdo -f nc copy ${tmpdir}/ORCA025*_1M_Si_0_500m.nc ${outdir}/ORCA025_${deb}_${fin}_1M_Si_0_500m.nc
rm -rf ${tmpdir}/ORCA025*_1M_Si_0_500m.nc
cdo -f nc copy ${tmpdir}/ORCA025*_1M_NO3_0_500m.nc ${outdir}/ORCA025_${deb}_${fin}_1M_NO3_0_500m.nc
rm -rf ${tmpdir}/ORCA025*_1M_NO3_0_500m.nc
cdo -f nc copy ${tmpdir}/ORCA025*_1M_PO4_0_500m.nc ${outdir}/ORCA025_${deb}_${fin}_1M_PO4_0_500m.nc
rm -rf ${tmpdir}/ORCA025*_1M_PO4_0_500m.nc

#4: Monthly 0_500m timeseries for OCE
echo Monthly mean 0_500m OCE for the period ${deb} to $fin

outdir=${WORKDIR}/ORCA025-PIS2DIC/OCE/Analyse/TS_MO
tmpdir=${WORKDIR}/temp/ORCA025/OCE/MO

for field in votemper vosaline
do
 echo field $field
 for ((an = $deb; an <= $fin; an++))
 do
  echo ${an} 
  cdo -f nc select,name=${field},levidx=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20 ${tmpdir}/ORCA025-PIS2DIC_${an}*_1M_grid_T.nc ${tmpdir}/ORCA025_${an}_1M_${field}_0_500m.nc
 done
 cdo -f nc copy ${tmpdir}/ORCA025*_1M_${field}_0_500m.nc ${outdir}/ORCA025_${deb}_${fin}_1M_${field}_0_500m.nc
 rm -rf ${tmpdir}/ORCA025*_1M_${field}_0_500m.nc
done
