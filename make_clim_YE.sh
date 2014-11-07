# produce surface yearly climatology from time series
export outdir=${WORKDIR}/ORCA025-PIS2DIC

export deb=1991
export fin=2010

#1: yearly surface climatology for MBG 
echo Year mean surface MBG field for the period $deb to $fin
for field in NO3 PO4 O2 Si DIC DIC2 Alkalini Alkalini2 Fer NCHL DCHL PH PH2 CO3 CO32 Cflx Cflx2 Kg Oflx
do
 echo field $field
 cdo timselmean,10,3 ${outdir}/MBG/Analyse/TS_YE/ORCA025_1958_2010_1Y_${field}_surf.nc ${outdir}/MBG/Analyse/CLIM_YE/ORCA025_${deb}_${fin}_10Y_${field}_surf.nc
done

#2: yearly surface climatology for OCE 
echo Year mean surface OCE field for the period present $deb to $fin
for field in votemper vosaline somxl010
do
 echo field $field
 cdo timselmean,10,5 ${outdir}/OCE/Analyse/TS_YE/ORCA025_1986_2010_1Y_${field}_surf.nc ${outdir}/OCE/Analyse/CLIM_YE/ORCA025_${deb}_${fin}_10Y_${field}_surf.nc
done