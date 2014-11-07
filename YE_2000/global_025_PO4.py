
# coding: utf-8

# <hr>
# Patrick BROCKMANN - 10/2014<br>
# Briac LE VU - 10/2014<br>
# James ORR - 04/2014<br>
# 
# <img align="left" width="40%" src="http://www.lsce.ipsl.fr/Css/img/banniere_LSCE_75.png" \><br><br>
# <hr>

# Notebook to visualze global PO4 ORCA025-PISCES output using PyFerret
# ---

##### First thing is to install the ferret extension

# In[1]:

get_ipython().magic(u'install_ext https://raw.github.com/PBrockmann/ipython-ferretmagic/master/ferretmagic.py')


##### Then load the extension

# In[2]:

get_ipython().magic(u'load_ext ferretmagic')


##### Build a list of files from http://dods.idris.fr/rfry451/ORCA025-PIS2DIC/ in remote access and open it

# In[3]:

get_ipython().run_cell_magic(u'ferret', u'', u'use "/home/biomac1/blevu/GLOBAL_025/mesh_zgr.nc"\nuse "/home/biomac1/blevu/GLOBAL_025/mask.nc"\nuse "http://dods.idris.fr/cgi-bin/nph-dods/rfry451/ORCA025-PIS2DIC/MBG/Output/MO/ORCA025-PIS2DIC_20000101_20001231_1M_PO4.nc"\n!use "/home/biomac1/blevu/GLOBAL_025/ORCA025-PIS2DIC_20000101_20001231_1M_PO4.nc"\nuse "/home/biomac1/blevu/DATA/CARS2009/phosphate_cars2009.nc"\nuse "/home/biomac2/jpalm/WOA/phosphate_annual_1deg.nc"\nsh d')


##### Reshape mask to remove T axis which is in contradiction with time_counter axis of modele output

# In[13]:

get_ipython().run_cell_magic(u'ferret', u'', u'  let var0 = x[gx=PO4[d=3]]*y[gy=PO4[d=3]]*z[gz=PO4[d=3]]\n  let my_mask=if reshape(tmask[d=2],var0) eq 1 then 1\n\n! let PO4m = PO4*my_mask\n! let PO4m = if PO4 gt 0 then PO4\n  let PO4m = if my_mask eq 1 then PO4[d=3]')


##### Set memories and subreg for big data

# In[14]:

get_ipython().run_cell_magic(u'ferret', u'', u'\n  set mem/siz=300\n\n! set reg/i=1:1442:5/j=1:1021:5\n\n! def sym subreg gi=1:1442:1,gj=1:1021:1\n  def sym subreg gi=1:1442:5,gj=1:1021:5\n\n! sho sym ($subreg)')


##### Plot surface PO4 in 2000 model & CARS & WOA

# In[24]:

get_ipython().run_cell_magic(u'ferret', u'', u"! shade/hlim=120:480:30/vlim=-90:90:30/mod PO4m[k=1,l=@ave], nav_lon, nav_lat\n! shade/nolab/hlim=120:480:30/vlim=-90:90:30/mod PO4m[k=1,l=@ave,($subreg)], nav_lon[($subreg)], nav_lat[($subreg)]\n\n!%ferret_run -q -s 800,400 'shade/hlim=120:480:30/vlim=-90:90:30/mod PO4m[k=1,l=@ave,($subreg)], nav_lon[d=3,($subreg)], nav_lat[d=3,($subreg)]' % locals()\n\n!%ferret_run -q -s 800,400 'shade PO4m[k=1,l=@ave], nav_lon, nav_lat' % locals()\n!%ferret_run -q -s 800,400 'shade PO4[k=1,l=@ave]' % locals()")


# In[49]:

get_ipython().magic(u"ferret_run -q -s 800,400 'shade/hlim=0:360:30/vlim=-90:90:30/mod/levels=(0,2,0.2) PO4m[k=2,l=@ave,($subreg)]/122*1e6, nav_lon[d=3,($subreg)], nav_lat[d=3,($subreg)]; go land; go fland' % locals()")
get_ipython().magic(u"ferret_run -q -s 800,400 'shade/levels=(0,2,0.2) mean[d=4,k=3]; go land; go fland'")
get_ipython().magic(u"ferret_run -q -s 800,400 'shade/levels=(0,2,0.2) P_AN[d=5,k=2]; go land; go fland'")


# In[45]:

get_ipython().run_cell_magic(u'ferret', u'', u'list z[g=PO4m]\nlist z[g=mean[d=4]]\nlist z[g=P_AN[d=5]]')


# First conclusion
# --
# * no enough latitudinal contrast 
# 
# Perspective
# --
# * Climato

# In[ ]:



