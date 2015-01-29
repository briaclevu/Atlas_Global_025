# produce surface monthly time series from model output
outdir=${WORKDIR}/ORCA025-PIS2DIC

deb=1958
fin=1990

#1: Monthly 3D timeseries for MBG with fieldname = varname + varname2
echo Monthly mean surface MBG for the period ${deb} to $fin

tmpdir=${WORKDIR}/temp/ORCA025/MBG/MO

for field in PHY ZOO
# DIC PH
# PHY ZOO
do
 echo field $field
 for ((an = $deb; an <= $fin; an++))
 do
  echo ${an} 
  cdo -f nc select,name=${field}2 ${tmpdir}/ORCA025-PIS2DIC_${an}*_1M_${field}.nc ${outdir}/MBG/Analyse/TS_MO/ORCA025_${an}_1M_${field}2_3D.nc
  cdo -f nc select,name=${field} ${tmpdir}/ORCA025-PIS2DIC_${an}*_1M_${field}.nc ${outdir}/MBG/Analyse/TS_MO/ORCA025_${an}_1M_${field}_3D.nc
 done
done

#2: Monthly 3D timeseries for MBG with fieldname = Nvarname + Dvarname
echo Monthly mean surface MBG for the period ${deb} to $fin

tmpdir=${WORKDIR}/temp/ORCA025/MBG/MO

for field in CHL
do
 echo field $field
 for ((an = $deb; an <= $fin; an++))
 do
  echo ${an} 
  cdo -f nc select,name=N${field} ${tmpdir}/ORCA025-PIS2DIC_${an}*_1M_${field}.nc ${outdir}/MBG/Analyse/TS_MO/ORCA025_${an}_1M_N${field}_3D.nc
  cdo -f nc select,name=D${field} ${tmpdir}/ORCA025-PIS2DIC_${an}*_1M_${field}.nc ${outdir}/MBG/Analyse/TS_MO/ORCA025_${an}_1M_D${field}_3D.nc
 done
done

#3: Monthly 3D timeseries for MBG with fieldname = PvarnameN + PvarnameD
echo Monthly mean surface MBG for the period ${deb} to $fin

tmpdir=${WORKDIR}/temp/ORCA025/MBG/MO

for field in PNEW
do
 echo field $field
 for ((an = $deb; an <= $fin; an++))
 do
  echo ${an} 
  cdo -f nc select,name=P${field}N ${tmpdir}/ORCA025-PIS2DIC_${an}*_1M_${field}.nc ${outdir}/MBG/Analyse/TS_MO/ORCA025_${an}_1M_${field}_3D.nc
  cdo -f nc select,name=P${field}D ${tmpdir}/ORCA025-PIS2DIC_${an}*_1M_${field}.nc ${outdir}/MBG/Analyse/TS_MO/ORCA025_${an}_1M_${field}D_3D.nc
 done
done

#4: Monthly 3D timeseries for MBG with fieldname = varnamePHY + varnamePHY2
echo Monthly mean surface MBG for the period ${deb} to $fin

tmpdir=${WORKDIR}/temp/ORCA025/MBG/MO

for field in PP
do
 echo field $field
 for ((an = $deb; an <= $fin; an++))
 do
  echo ${an} 
  cdo -f nc select,name=${field}PHY ${tmpdir}/ORCA025-PIS2DIC_${an}*_1M_${field}.nc ${outdir}/MBG/Analyse/TS_MO/ORCA025_${an}_1M_${field}PHY_3D.nc
  cdo -f nc select,name=${field}PHY2 ${tmpdir}/ORCA025-PIS2DIC_${an}*_1M_${field}.nc ${outdir}/MBG/Analyse/TS_MO/ORCA025_${an}_1M_${field}PHY2_3D.nc
 done
done

#5: Monthly 3D timeseries for MBG with fieldname # varname
echo Monthly mean surface MBG for the period ${deb} to $fin

tmpdir=${WORKDIR}/temp/ORCA025/MBG/MO

for ((an = $deb; an <= $fin; an++))
do
 echo ${an} 
 cdo -f nc select,name=Alkalini ${tmpdir}/ORCA025-PIS2DIC_${an}*_1M_ALK.nc ${outdir}/MBG/Analyse/TS_MO/ORCA025_${an}_1M_Alkalini_3D.nc
 cdo -f nc select,name=Alkalini2 ${tmpdir}/ORCA025-PIS2DIC_${an}*_1M_ALK.nc ${outdir}/MBG/Analyse/TS_MO/ORCA025_${an}_1M_Alkalini2_3D.nc
 cdo -f nc select,name=Fer ${tmpdir}/ORCA025-PIS2DIC_${an}*_1M_FER.nc ${outdir}/MBG/Analyse/TS_MO/ORCA025_${an}_1M_Fer_3D.nc
 cdo -f nc select,name=Si ${tmpdir}/ORCA025-PIS2DIC_${an}*_1M_SIL.nc ${outdir}/MBG/Analyse/TS_MO/ORCA025_${an}_1M_Si_3D.nc
 cdo -f nc select,name=NO3 ${tmpdir}/ORCA025-PIS2DIC_${an}*_1M_NIT.nc ${outdir}/MBG/Analyse/TS_MO/ORCA025_${an}_1M_NO3_3D.nc
 cdo -f nc select,name=PO4 ${tmpdir}/ORCA025-PIS2DIC_${an}*_1M_PO4.nc ${outdir}/MBG/Analyse/TS_MO/ORCA025_${an}_1M_PO4_3D.nc
 cdo -f nc select,name=O2 ${tmpdir}/ORCA025-PIS2DIC_${an}*_1M_OXY.nc ${outdir}/MBG/Analyse/TS_MO/ORCA025_${an}_1M_O2_3D.nc
done

#4: Monthly surface timeseries for OCE

tmpdir=${WORKDIR}/temp/ORCA025/OCE/MO

for field in votemper vosaline 
do
 echo field $field
 for ((an = $deb; an <= $fin; an++))
 do
  echo ${an} 
  cdo -f nc select,name=${field} ${tmpdir}/ORCA025-PIS2DIC_${an}*_1M_grid_T.nc ${outdir}/OCE/Analyse/TS_MO/ORCA025_${an}_1M_${field}_3D.nc
 done
done
