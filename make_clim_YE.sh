# produce surface yearly climatology from time series
outdir=${WORKDIR}/ORCA025-PIS2DIC

deb=1991
fin=2010

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

#3: yearly surface climatology for OCE 
echo Year mean surface OCE field for the period present $deb to $fin
for field in somixhgt sossheig sowindsp
do
 echo field $field
 cdo yearmean ${outdir}/OCE/Analyse/CLIM_MO/ORCA025_1991_2000_12M_${field}_surf.nc ${outdir}/OCE/Analyse/CLIM_YE/ORCA025_1991_2000_10Y_${field}_surf.nc
 cdo yearmean ${outdir}/OCE/Analyse/CLIM_MO/ORCA025_2001_2010_12M_${field}_surf.nc ${outdir}/OCE/Analyse/CLIM_YE/ORCA025_2001_2010_10Y_${field}_surf.nc
 cdo copy ${outdir}/OCE/Analyse/CLIM_YE/ORCA025_1991_2000_10Y_${field}_surf.nc ${outdir}/OCE/Analyse/CLIM_YE/ORCA025_2001_2010_10Y_${field}_surf.nc ${outdir}/OCE/Analyse/CLIM_YE/ORCA025_1991_2010_10Y_${field}_surf.nc
done

#4: yearly 3D climatology for OCE 
echo Year mean surface OCE field for the period present $deb to $fin
for field in votemper vosaline
do
 echo field $field
 cdo yearmean ${outdir}/OCE/Analyse/CLIM_MO/ORCA025_1991_2000_12M_${field}_3D.nc ${outdir}/OCE/Analyse/CLIM_YE/ORCA025_1991_2000_10Y_${field}_3D.nc
 cdo yearmean ${outdir}/OCE/Analyse/CLIM_MO/ORCA025_2001_2010_12M_${field}_3D.nc ${outdir}/OCE/Analyse/CLIM_YE/ORCA025_2001_2010_10Y_${field}_3D.nc
 cdo copy ${outdir}/OCE/Analyse/CLIM_YE/ORCA025_1991_2000_10Y_${field}_3D.nc ${outdir}/OCE/Analyse/CLIM_YE/ORCA025_2001_2010_10Y_${field}_3D.nc ${outdir}/OCE/Analyse/CLIM_YE/ORCA025_1991_2010_10Y_${field}_3D.nc
done

#5: yearly 3D climatology for MBG 
echo Year mean surface OCE field for the period present $deb to $fin
for field in NO3 PO4 O2 Si DIC DIC2 Alkalini Alkalini2 Fer NCHL DCHL PH PH2
do
 echo field $field
 cdo yearmean ${outdir}/MBG/Analyse/CLIM_MO/ORCA025_1991_2000_12M_${field}_3D.nc ${outdir}/MBG/Analyse/CLIM_YE/ORCA025_1991_2000_10Y_${field}_3D.nc
 cdo yearmean ${outdir}/MBG/Analyse/CLIM_MO/ORCA025_2001_2010_12M_${field}_3D.nc ${outdir}/MBG/Analyse/CLIM_YE/ORCA025_2001_2010_10Y_${field}_3D.nc
 cdo copy ${outdir}/MBG/Analyse/CLIM_YE/ORCA025_1991_2000_10Y_${field}_3D.nc ${outdir}/MBG/Analyse/CLIM_YE/ORCA025_2001_2010_10Y_${field}_3D.nc ${outdir}/MBG/Analyse/CLIM_YE/ORCA025_1991_2010_10Y_${field}_3D.nc
done
