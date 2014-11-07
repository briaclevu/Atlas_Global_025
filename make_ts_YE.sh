# produce surface yearly time series from model output
export tmpdir=${WORKDIR}/temp/ORCA025
export outdir=${WORKDIR}/ORCA025-PIS2DIC

#1: yearly surface timeseries for MBG ptrc
export deb=1958
export fin=2010

echo Year mean surface MBG fields for the period $deb to $fin

for field in NO3 PO4 O2 Si DIC DIC2 Alkalini Alkalini2 Fer NCHL DCHL
do
 echo field $field
 cdo -f nc select,name=${field},levidx=1 ${tmpdir}/MBG/YE/ORCA025-PIS2DIC_*_1Y_ptrc_T.nc ${outdir}/MBG/Analyse/TS_YE/ORCA025_${deb}_${fin}_1Y_${field}_surf.nc
done

#2: yearly surface timeseries for MBG diad
for field in PH PH2 CO3 CO32 Cflx Cflx2 Kg Oflx
do
 echo field $field
 cdo -f nc select,name=${field},levidx=1 ${tmpdir}/MBG/YE/ORCA025-PIS2DIC_*_1Y_diad_T.nc ${outdir}/MBG/Analyse/TS_YE/ORCA025_${deb}_${fin}_1Y_${field}_surf.nc
done

#3: yearly surface timeseries for OCE grid
export deb=1986
export fin=2010

echo Year mean surface OCE fields for the period present $deb to $fin

for field in votemper vosaline somxl010
do
 echo field $field
 cdo -f nc select,name=${field},levidx=1 ${tmpdir}/OCE/YE/ORCA025-PIS2DIC_*_1Y_grid_T.nc ${outdir}/OCE/Analyse/TS_YE/ORCA025_${deb}_${fin}_1Y_${field}_surf.nc
done