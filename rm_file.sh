#remove file with other name than field
export outdir=${WORKDIR}/ORCA025-PIS2DIC/MBG/Analyse/TS_MO

for field in ALK CHL NIT FER OXY SIL CO3
do
 rm -f ${outdir}/ORCA025_*_1M_${field}_surf.nc
done