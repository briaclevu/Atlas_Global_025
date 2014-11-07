# mfput the analyses file to ergon storedir
export deb=199
export fin=200

#1: put MBG analyses yearly file
export oudir=/arch/home/rech/fry/rfry938/ORCA025-PIS2DIC/MBG/Analyse
cd ${WORKDIR}/ORCA025-PIS2DIC/MBG/Analyse

for field in NO3 PO4 O2 Si DIC DIC2 Alkalini Alkalini2 Fer NCHL DCHL PH PH2 CO3 CO32 Cflx Cflx2 CO3 CO32 Kg Oflx
do
 mfput TS_YE/ORCA025_1958_2010_1Y_${field}_surf.nc ${oudir}/TS_YE/.
 mfput CLIM_YE/ORCA025_1961_2010_10Y_${field}_surf.nc ${oudir}/CLIM_YE/.
done

#2: put MBG analyses monthly file
for field in PH PH2 CO3 CO32 NO3 PO4 O2 Si DIC DIC2 Alkalini Alkalini2 Fer NCHL DCHL
do
 mfput TS_MO/ORCA025_*_1M_${field}_surf.nc ${oudir}/TS_MO/.
 for ((an = $deb; an <= $fin; an++)); do
    mfput CLIM_MO/ORCA025_${an}1_$((${an}+1))0_12M_${field}_surf.nc ${oudir}/CLIM_MO/.
 done
done

#3: put OCE analyses file
export oudir=/arch/home/rech/fry/rfry938/ORCA025-PIS2DIC/OCE/Analyse
cd ${WORKDIR}/ORCA025-PIS2DIC/OCE/Analyse

for field in votemper vosaline somxl010
do
 mfput TS_YE/ORCA025_1986_2010_1Y_${field}_surf.nc ${oudir}/TS_YE/.
 mfput CLIM_YE/ORCA025_1991_2010_10Y_${field}_surf.nc ${oudir}/CLIM_YE/.
 mfput TS_MO/ORCA025_1991_2000_1M_${field}_surf.nc ${oudir}/TS_MO/.
 for ((an = $deb; an <= $fin; an++)); do
    mfput CLIM_MO/ORCA025_${an}1_$((${an}+1))0_12M_${field}_surf.nc ${oudir}/CLIM_MO/.
 done
done

#4: extra MBG
export oudir=/arch/home/rech/fry/rfry938/ORCA025-PIS2DIC/MBG/Analyse
cd ${WORKDIR}/ORCA025-PIS2DIC/MBG/Analyse
#
for field in CO3sat
do
 mfput TS_MO/ORCA025_*_1M_${field}_surf.nc ${oudir}/TS_MO/.
done
#
for field in Nfix Heup Irondep INVPPPHY INVPPPHY2 INVPNEW INVPNEWD Cflx Cflx2 Oflx Kg Dpco2 Dpco22 Dpo2 
do
 mfput TS_MO/ORCA025_*_1M_${field}.nc ${oudir}/TS_MO/.
done