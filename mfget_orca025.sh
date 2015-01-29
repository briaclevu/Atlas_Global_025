# Caution do not keep all these files in the workdir at the same time

# mfget the model output ORCA025 to the idris $workdir to produce analyses file
export indir=/arch/home/rech/fry/rfry451/IGCM_OUT/ORCA025_LIM2_PISCES/ORCA025-PIS2DIC

#1: get the MBG yearly output ptrc and diad
export deb=1958
export fin=2010
# go to the MBG/YE tmpdir 
cd ${WORKDIR}/temp/ORCA025/MBG/YE
# get the ptrc and diad of each year
for ((an = $deb; an <= $fin; an++)); do
    mfget ${indir}/MBG/Output/YE/ORCA025-PIS2DIC_${an}0101_${an}1231_1Y_ptrc_T.nc .
    mfget ${indir}/MBG/Output/YE/ORCA025-PIS2DIC_${an}0101_${an}1231_1Y_diad_T.nc .
done

#2: get the OCE yearly output grid
export deb=1958
export fin=2010
# go to the OCE/YE tmpdir 
cd ${WORKDIR}/temp/ORCA025/OCE/YE
# get the grid of each year
for ((an = $deb; an <= $fin; an++)); do
    mfget ${indir}/OCE/Output/YE/ORCA025-PIS2DIC_${an}0101_${an}1231_1Y_grid_T.nc .
done

#3: get the MBG monthly output fields
deb=1958
fin=1990
# go to the MBG/MO tmpdir 
cd ${WORKDIR}/temp/ORCA025/MBG/MO
# get each monthly field of each year
for field in PNEW PP
# PO4 NIT SIL CHL OXY FER DIC ALK CO3 PH
do
 for ((an = $deb; an <= $fin; an++)); do
    mfget ${indir}/MBG/Output/MO/ORCA025-PIS2DIC_${an}0101_${an}1231_1M_${field}.nc .
 done
done
#
deb=1958
fin=1972
# go to the MBG/MO tmpdir 
cd ${WORKDIR}/temp/ORCA025/MBG/MO
# get each monthly field of each year
for field in PO4 NIT SIL FER DIC ALK
#PHY ZOO
#CHL OXY PO4 NIT SIL FER DIC ALK
#PHY ZOO CHL OXY
#PH CO3 PO4 NIT SIL CHL OXY FER DIC ALK
do
 for ((an = $deb; an <= $fin; an++)); do
    mfget ${indir}/MBG/Output/MO/ORCA025-PIS2DIC_${an}0101_${an}1231_1M_${field}.nc .
 done
done

#4: get the OCE monthly output fields
export deb=1991
export fin=2010
# go to the MBG/MO tmpdir 
cd ${WORKDIR}/temp/ORCA025/OCE/MO
# get the monthly grid of each year
for ((an = $deb; an <= $fin; an++)); do
    mfget ${indir}/OCE/Output/MO/ORCA025-PIS2DIC_${an}0101_${an}1231_1M_grid_T.nc .
done

#5: get the MBG 5 daily output fields
export deb=1958
export fin=2010
# go to the MBG/DA tmpdir 
cd ${WORKDIR}/temp/ORCA025/MBG/DA
# get each 5 daily field of each year
for ((an = $deb; an <= $fin; an++)); do
    mfget ${indir}/MBG/Output/DA/ORCA025-PIS2DIC_${an}0101_${an}1231_5D_diad_T.nc .
done