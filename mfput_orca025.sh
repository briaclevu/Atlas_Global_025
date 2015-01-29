# mfput the analyses file to ergon storedir
deb=199
fin=200

#1: put MBG analyses yearly file
oudir=/arch/home/rech/fry/rfry938/ORCA025-PIS2DIC/MBG/Analyse
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
oudir=/arch/home/rech/fry/rfry938/ORCA025-PIS2DIC/OCE/Analyse
cd ${WORKDIR}/ORCA025-PIS2DIC/OCE/Analyse

for field in sossheig
# votemper vosaline somxl010 somixhgt sowindsp sossheig
do
 mfput TS_YE/ORCA025_1986_2010_1Y_${field}_surf.nc ${oudir}/TS_YE/.
 mfput CLIM_YE/ORCA025_1991_2010_10Y_${field}_surf.nc ${oudir}/CLIM_YE/.
 mfput TS_MO/ORCA025_1991_2010_1M_${field}_surf.nc ${oudir}/TS_MO/.
 for ((an = $deb; an <= $fin; an++)); do
    mfput CLIM_MO/ORCA025_${an}1_$((${an}+1))0_12M_${field}_surf.nc ${oudir}/CLIM_MO/.
 done
done

#4: put OCE analyses 3D file
oudir=/arch/home/rech/fry/rfry938/ORCA025-PIS2DIC/OCE/Analyse
cd ${WORKDIR}/ORCA025-PIS2DIC/OCE/Analyse

for field in votemper vosaline
do
 mfput CLIM_YE/ORCA025_1991_2010_10Y_${field}_3D.nc ${oudir}/CLIM_YE/.
 for ((an = $deb; an <= $fin; an++)); do
    mfput CLIM_MO/ORCA025_${an}1_$((${an}+1))0_12M_${field}_3D.nc ${oudir}/CLIM_MO/.
 done
done

#5: put MBG analyses 3D file
oudir=/arch/home/rech/fry/rfry938/ORCA025-PIS2DIC/MBG/Analyse
cd ${WORKDIR}/ORCA025-PIS2DIC/MBG/Analyse

for field in PH PH2 NO3 PO4 O2 Si DIC DIC2 Alkalini Alkalini2 Fer NCHL DCHL 
do
 mfput CLIM_YE/ORCA025_1991_2010_10Y_${field}_3D.nc ${oudir}/CLIM_YE/.
 for ((an = $deb; an <= $fin; an++)); do
    mfput CLIM_MO/ORCA025_${an}1_$((${an}+1))0_12M_${field}_3D.nc ${oudir}/CLIM_MO/.
 done
done

#6: extra MBG
oudir=/arch/home/rech/fry/rfry938/ORCA025-PIS2DIC/MBG/Analyse
cd ${WORKDIR}/ORCA025-PIS2DIC/MBG/Analyse
#
for field in CO3sat
do
 mfput TS_MO/ORCA025_*_1M_${field}_surf.nc ${oudir}/TS_MO/.
done
#
for field in AVEDCHL AVENCHL AVEO2 INVPHY INVPHY2 INVZOO INVZOO2 MINO2
#Nfix Heup Irondep INVPPPHY INVPPPHY2 INVPNEW INVPNEWD
#Cflx Cflx2 Oflx Kg Dpco2 Dpco22 Dpo2 
do
 mfput TS_MO/ORCA025_*_1M_${field}.nc ${oudir}/TS_MO/INV/.
done

#7: 0_500m MBG
oudir=/arch/home/rech/fry/rfry938/ORCA025-PIS2DIC/MBG/Analyse
cd ${WORKDIR}/ORCA025-PIS2DIC/MBG/Analyse

for field in NO3 PO4 O2 Si Alkalini2 Fer
# PH PH2 NO3 PO4 O2 Si DIC DIC2 Alkalini Alkalini2 Fer NCHL DCHL PHY PHY2 ZOO ZOO2
do
 mfput TS_MO/ORCA025_*_1M_${field}_0_500m.nc ${oudir}/TS_MO/0_500m/.
done

#8: INV MBG
oudir=/arch/home/rech/fry/rfry938/ORCA025-PIS2DIC/MBG/Analyse
cd ${WORKDIR}/ORCA025-PIS2DIC/MBG/Analyse

for field in INVPHY INVPHY2 INVZOO INVZOO2 INVPNEW INVPNEWD
do
 mfput CLIM_MO/ORCA025_*_12M_${field}.nc ${oudir}/CLIM_MO/INV/.
done