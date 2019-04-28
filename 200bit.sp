
*dff
*.options list node post


.subckt inv in out
m2 out in 0 0 nmos l=45n      w=180n
m1 vdd in out vdd pmos l=45n  w=360n
.ends

.subckt transfer in out nc c
m2 out nc in vdd  pmos l=45n  w=180n
m1 in c out 0 nmos l=45n      w=360n          
.ends

.subckt sff  a b  SEL c  q 
mm1 a1 SEL vdd vdd pmos l=45n w=180n
mm2 a1 SEL gnd gnd nmos l=45n w=360n    $jia0   180 360 
Xi011  b out a1 SEL transfer 
Xi012  a out SEL a1 transfer      $mux
xi1 n1 n2 inv 
xi2 n2 n3  n4 c transfer
xi3 n3 n1 inv
xi4 c n4 inv
xi5 q n5 inv
xi6 nq q inv
xi7 n5 nq c n4  transfer
xi8 out n3 c n4  transfer
xi9 n1 nq  n4 c transfer
.ends



.model wtf mosra level=1
+tit0 = 1e-6 titfd = 7.5e-10 tittd = 1.45e-20
+tn = 0.25

*.appendmodel wtf mosra pmos pmos          


*.mosra reltotaltime='1*30*24*60*60'  lin=37 simmode=2   $'10*365*24*60*60'     $注意这里 第一次跑仿真要用 simmode=0 来获得‘monte 20 sff vth2222222222.radeg0’这个文件


.Measure Tran tdelay1 Trig v(c) Val = 'v(vdd)/2' td=25n rise = 2     *c信号的第一个下降沿开始     
+                     Targ v(q2) Val = 'v(vdd)/2' td=55n fall = 1       *到Clock的上升沿         
 
.Measure Tran ttt param =tdelay1
 
.param vthn=agauss(   0.63363   ,0.05,3)    
.param vthp=agauss(  -0.58843   ,0.02,3)   $61



 
.Measure Tran vvvn param =vthn
.Measure Tran vvvp param =vthp




xsff1  a  a    SEL c  q1 sff        
xsff2  q1 q1   SEL c  q2 sff     
xsff3  q2 q2   SEL c  q3 sff        
 
.global vdd 
vin a 0 pulse 1.0v 0v  30n 1n 1n 20n 40n
vdd  vdd 0 1v
vc c 0 pulse 0v 1.0v   20n 1n 1n 10n 20n

.tran 1n 80n  sweep monte=200






* PTM Low Power 45nm Metal Gate / High-K / Strained-Si
* nominal Vdd = 1.1V

.model  nmos  nmos  level = 54



+version = 4.0             binunit = 1               paramchk= 1               mobmod  = 0             
+capmod  = 2               igcmod  = 1               igbmod  = 1               geomod  = 1             
+diomod  = 1               rdsmod  = 0               rbodymod= 1               rgatemod= 1             
+permod  = 1               acnqsmod= 0               trnqsmod= 0             

+tnom    = 27              toxe    = 1.8e-009        toxp    = 1.5e-009        toxm    = 1.8e-009      
+dtox    = 3e-010          epsrox  = 3.9             wint    = 5e-009          lint    = 0             
+ll      = 0               wl      = 0               lln     = 1               wln     = 1             
+lw      = 0               ww      = 0               lwn     = 1               wwn     = 1             
+lwl     = 0               wwl     = 0               xpart   = 0               toxref  = 1.8e-009      

+vth0    = vthn          k1      = 0.4             k2      = 0               k3      = 0             
+k3b     = 0               w0      = 2.5e-006        dvt0    = 1               dvt1    = 2             
+dvt2    = 0               dvt0w   = 0               dvt1w   = 0               dvt2w   = 0             
+dsub    = 0.1             minv    = 0.05            voffl   = 0               dvtp0   = 1e-010        
+dvtp1   = 0.1             lpe0    = 0               lpeb    = 0               xj      = 1.4e-008      
+ngate   = 1e+023          ndep    = 3.24e+018       nsd     = 2e+020          phin    = 0             
+cdsc    = 0               cdscb   = 0               cdscd   = 0               cit     = 0             
+voff    = -0.13           nfactor = 1.6             eta0    = 0.0125          etab    = 0             
+vfb     = -0.55           u0      = 0.049           ua      = 6e-010          ub      = 1.2e-018      
+uc      = 0               vsat    = 130000          a0      = 1               ags     = 0             
+a1      = 0               a2      = 1               b0      = 0               b1      = 0             
+keta    = 0.04            dwg     = 0               dwb     = 0               pclm    = 0.02          
+pdiblc1 = 0.001           pdiblc2 = 0.001           pdiblcb = -0.005          drout   = 0.5           
+pvag    = 1e-020          delta   = 0.01            pscbe1  = 8.14e+008       pscbe2  = 1e-007        
+fprout  = 0.2             pdits   = 0.08            pditsd  = 0.23            pditsl  = 2300000       
+rsh     = 5               rdsw    = 210             rsw     = 80              rdw     = 80            
+rdswmin = 0               rdwmin  = 0               rswmin  = 0               prwg    = 0             
+prwb    = 0               wr      = 1               alpha0  = 0.074           alpha1  = 0.005         
+beta0   = 30              agidl   = 0.0002          bgidl   = 2.1e+009        cgidl   = 0.0002        
+egidl   = 0.8             aigbacc = 0.012           bigbacc = 0.0028          cigbacc = 0.002         
+nigbacc = 1               aigbinv = 0.014           bigbinv = 0.004           cigbinv = 0.004         
+eigbinv = 1.1             nigbinv = 3               aigc    = 0.015211        bigc    = 0.0027432     
+cigc    = 0.002           aigsd   = 0.015211        bigsd   = 0.0027432       cigsd   = 0.002         
+nigc    = 1               poxedge = 1               pigcd   = 1               ntox    = 1             
+xrcrg1  = 12              xrcrg2  = 5             

+cgso    = 1.1e-010        cgdo    = 1.1e-010        cgbo    = 2.56e-011       cgdl    = 2.653e-010    
+cgsl    = 2.653e-010      ckappas = 0.03            ckappad = 0.03            acde    = 2   $ 1 before              
+moin    = 15              noff    = 0.9             voffcv  = 0.02          

+kt1     = -0.11           kt1l    = 0               kt2     = 0.022           ute     = -1.5          
+ua1     = 4.31e-009       ub1     = 7.61e-018       uc1     = -5.6e-011       prt     = 0             
+at      = 33000         

+fnoimod = 1               tnoimod = 0             

+jss     = 0.0001          jsws    = 1e-011          jswgs   = 1e-010          njs     = 1             
+ijthsfwd= 0.01            ijthsrev= 0.001           bvs     = 10              xjbvs   = 1             
+jsd     = 0.0001          jswd    = 1e-011          jswgd   = 1e-010          njd     = 1             
+ijthdfwd= 0.01            ijthdrev= 0.001           bvd     = 10              xjbvd   = 1             
+pbs     = 1               cjs     = 0.0005          mjs     = 0.5             pbsws   = 1             
+cjsws   = 5e-010          mjsws   = 0.33            pbswgs  = 1               cjswgs  = 3e-010        
+mjswgs  = 0.33            pbd     = 1               cjd     = 0.0005          mjd     = 0.5           
+pbswd   = 1               cjswd   = 5e-010          mjswd   = 0.33            pbswgd  = 1             
+cjswgd  = 5e-010          mjswgd  = 0.33            tpb     = 0.005           tcj     = 0.001         
+tpbsw   = 0.005           tcjsw   = 0.001           tpbswg  = 0.005           tcjswg  = 0.001         
+xtis    = 3               xtid    = 3             

+dmcg    = 0               dmci    = 0               dmdg    = 0               dmcgt   = 0             
+dwj     = 0               xgw     = 0               xgl     = 0             

+rshg    = 0.4             gbmin   = 1e-010          rbpb    = 5               rbpd    = 15            
+rbps    = 15              rbdb    = 15              rbsb    = 15              ngcon   = 1             


.model  pmos  pmos  level = 54


+version = 4.0             binunit = 1               paramchk= 1               mobmod  = 0             
+capmod  = 2               igcmod  = 1               igbmod  = 1               geomod  = 1             
+diomod  = 1               rdsmod  = 0               rbodymod= 1               rgatemod= 1             
+permod  = 1               acnqsmod= 0               trnqsmod= 0             

+tnom    = 27              toxe    = 1.82e-009       toxp    = 1.5e-009        toxm    = 1.82e-009     
+dtox    = 3.2e-010        epsrox  = 3.9             wint    = 5e-009          lint    = 0             
+ll      = 0               wl      = 0               lln     = 1               wln     = 1             
+lw      = 0               ww      = 0               lwn     = 1               wwn     = 1             
+lwl     = 0               wwl     = 0               xpart   = 0               toxref  = 1.82e-009     

+vth0    = vthp          k1      = 0.4             k2      = -0.01           k3      = 0             
+k3b     = 0               w0      = 2.5e-006        dvt0    = 1               dvt1    = 2             
+dvt2    = -0.032          dvt0w   = 0               dvt1w   = 0               dvt2w   = 0             
+dsub    = 0.1             minv    = 0.05            voffl   = 0               dvtp0   = 1e-011        
+dvtp1   = 0.05            lpe0    = 0               lpeb    = 0               xj      = 1.4e-008      
+ngate   = 1e+023          ndep    = 2.44e+018       nsd     = 2e+020          phin    = 0             
+cdsc    = 0               cdscb   = 0               cdscd   = 0               cit     = 0             
+voff    = -0.126          nfactor = 1.8             eta0    = 0.0125          etab    = 0             
+vfb     = 0.55            u0      = 0.021           ua      = 2e-009          ub      = 5e-019        
+uc      = 0               vsat    = 90000           a0      = 1               ags     = 1e-020        
+a1      = 0               a2      = 1               b0      = 0               b1      = 0             
+keta    = -0.047          dwg     = 0               dwb     = 0               pclm    = 0.12          
+pdiblc1 = 0.001           pdiblc2 = 0.001           pdiblcb = 3.4e-008        drout   = 0.56          
+pvag    = 1e-020          delta   = 0.01            pscbe1  = 8.14e+008       pscbe2  = 9.58e-007     
+fprout  = 0.2             pdits   = 0.08            pditsd  = 0.23            pditsl  = 2300000       
+rsh     = 5               rdsw    = 250             rsw     = 75              rdw     = 75            
+rdswmin = 0               rdwmin  = 0               rswmin  = 0               prwg    = 0             
+prwb    = 0               wr      = 1               alpha0  = 0.074           alpha1  = 0.005         
+beta0   = 30              agidl   = 0.0002          bgidl   = 2.1e+009        cgidl   = 0.0002        
+egidl   = 0.8             aigbacc = 0.012           bigbacc = 0.0028          cigbacc = 0.002         
+nigbacc = 1               aigbinv = 0.014           bigbinv = 0.004           cigbinv = 0.004         
+eigbinv = 1.1             nigbinv = 3               aigc    = 0.0097          bigc    = 0.00125       
+cigc    = 0.0008          aigsd   = 0.0097          bigsd   = 0.00125         cigsd   = 0.0008        
+nigc    = 1               poxedge = 1               pigcd   = 1               ntox    = 1             
+xrcrg1  = 12              xrcrg2  = 5             

+cgso    = 1.1e-010        cgdo    = 1.1e-010        cgbo    = 2.56e-011       cgdl    = 2.653e-010    
+cgsl    = 2.653e-010      ckappas = 0.03            ckappad = 0.03            acde    = 2 $  1 before           
+moin    = 15              noff    = 0.9             voffcv  = 0.02          

+kt1     = -0.11           kt1l    = 0               kt2     = 0.022           ute     = -1.5          
+ua1     = 4.31e-009       ub1     = 7.61e-018       uc1     = -5.6e-011       prt     = 0             
+at      = 33000         

+fnoimod = 1               tnoimod = 0             

+jss     = 0.0001          jsws    = 1e-011          jswgs   = 1e-010          njs     = 1             
+ijthsfwd= 0.01            ijthsrev= 0.001           bvs     = 10              xjbvs   = 1             
+jsd     = 0.0001          jswd    = 1e-011          jswgd   = 1e-010          njd     = 1             
+ijthdfwd= 0.01            ijthdrev= 0.001           bvd     = 10              xjbvd   = 1             
+pbs     = 1               cjs     = 0.0005          mjs     = 0.5             pbsws   = 1             
+cjsws   = 5e-010          mjsws   = 0.33            pbswgs  = 1               cjswgs  = 3e-010        
+mjswgs  = 0.33            pbd     = 1               cjd     = 0.0005          mjd     = 0.5           
+pbswd   = 1               cjswd   = 5e-010          mjswd   = 0.33            pbswgd  = 1             
+cjswgd  = 5e-010          mjswgd  = 0.33            tpb     = 0.005           tcj     = 0.001         
+tpbsw   = 0.005           tcjsw   = 0.001           tpbswg  = 0.005           tcjswg  = 0.001         
+xtis    = 3               xtid    = 3             

+dmcg    = 0               dmci    = 0               dmdg    = 0               dmcgt   = 0             
+dwj     = 0               xgw     = 0               xgl     = 0             

+rshg    = 0.4             gbmin   = 1e-010          rbpb    = 5               rbpd    = 15            
+rbps    = 15              rbdb    = 15              rbsb    = 15              ngcon   = 1             


.alter
.param vthn=agauss(   0.59753  ,0.05,3)    
.param vthp=agauss(  -0.58673  ,0.02,3)   $62


.alter
.param vthn=agauss( 0.62906   ,0.05,3)    
.param vthp=agauss(  -0.58244  ,0.02,3)   $63


.alter
.param vthn=agauss(  0.63772  ,0.05,3)    
.param vthp=agauss(  -0.58134  ,0.02,3)   $64


.alter
.param vthn=agauss( 0.60413    ,0.05,3)    
.param vthp=agauss( -0.58126  ,0.02,3)   $65

.alter
.param vthn=agauss(  0.61637   ,0.05,3)    
.param vthp=agauss(  -0.59916  ,0.02,3)   $66

.alter
.param vthn=agauss(  0.58097   ,0.05,3)    
.param vthp=agauss(  -0.58329  ,0.02,3)   $67


.alter
.param vthn=agauss(  0.62295  ,0.05,3)    
.param vthp=agauss(  -0.59195  ,0.02,3)   $68


.alter
.param vthn=agauss(  0.61359  ,0.05,3)    
.param vthp=agauss(  -0.58851  ,0.02,3)   $69


.alter
.param vthn=agauss(  0.63874  ,0.05,3)    
.param vthp=agauss(  -0.59021  ,0.02,3)   $70

*------------71_80---------------------------------------------
.alter
.param vthn=agauss(  0.6358   ,0.05,3)    
.param vthp=agauss(  -0.59485  ,0.02,3)   $71

.alter
.param vthn=agauss(  0.60764   ,0.05,3)    
.param vthp=agauss( -0.57997  ,0.02,3)   $72


.alter
.param vthn=agauss(   0.6138  ,0.05,3)    
.param vthp=agauss(  -0.59329  ,0.02,3)   $73


.alter
.param vthn=agauss(   0.61365    ,0.05,3)    
.param vthp=agauss(   -0.59075  ,0.02,3)   $74


.alter
.param vthn=agauss(  0.63341   ,0.05,3)    
.param vthp=agauss(  -0.58993  ,0.02,3)   $75

.alter
.param vthn=agauss(  0.64194  ,0.05,3)    
.param vthp=agauss(  -0.58896  ,0.02,3)   $76

.alter
.param vthn=agauss(   0.64028  ,0.05,3)    
.param vthp=agauss(  -0.58644  ,0.02,3)   $77


.alter
.param vthn=agauss(  0.63201  ,0.05,3)    
.param vthp=agauss(  -0.58619 ,0.02,3)   $78


.alter
.param vthn=agauss(  0.65726  ,0.05,3)    
.param vthp=agauss(  -0.59366 ,0.02,3)   $79


.alter
.param vthn=agauss(  0.61772  ,0.05,3)    
.param vthp=agauss( -0.58147  ,0.02,3)   $80



.end