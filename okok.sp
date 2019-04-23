
.param vthn= 0.63933       $ 7
.param vthp= -0.60157



.model wtf mosra level=1
+tit0 = 1e-6 titfd = 7.5e-10 tittd = 1.45e-20
+tn = 0.25

.appendmodel wtf mosra pmos pmos
          
.mosra reltotaltime='1*90*24*60*60'  lin=91 simmode=2   $'10*365*24*60*60'     $注意这里 第一次跑仿真要用 simmode=0 来获得‘monte 20 sff vth2222222222.radeg0’这个文件

.Measure Tran tdelay1 Trig v(c) Val = 'v(vdd)/2' td=25n rise = 2     *c信号的第一个下降沿开始     
+                     Targ v(q2) Val = 'v(vdd)/2' td=55n fall = 1       *到Clock的上升沿         
   




.Measure Tran ttt param =tdelay1 
.tran 1n 80n  



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


xsff1  a  a    SEL c  q1 sff        
xsff2  q1 q1   SEL c  q2 sff     
xsff3  q2 q2   SEL c  q3 sff        
 
.global vdd 
vin a 0 pulse 1.0v 0v  30n 1n 1n 20n 40n
vdd  vdd 0 1v
vc c 0 pulse 0v 1.0v   20n 1n 1n 10n 20n








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





* ------------11-------------------

.alter
.param vthn= 0.66435       $ 1
.param vthp= -0.59519

.alter
.param vthn= 0.63908       $ 2
.param vthp= -0.58287

.alter
.param vthn= 0.67508       $ 3
.param vthp= -0.59516

.alter
.param vthn= 0.66683       $ 4
.param vthp= -0.58119

.alter
.param vthn= 0.64118       $ 5
.param vthp= -0.58387

.alter
.param vthn= 0.65106       $ 6
.param vthp= -0.60395

.alter
.param vthn= 0.66579       $ 7
.param vthp= -0.59564

.alter
.param vthn= 0.67965       $ 8
.param vthp= -0.58649

.alter
.param vthn= 0.65750       $ 9
.param vthp= -0.58485

.alter
.param vthn= 0.67015       $ 10
.param vthp= -0.58977

.alter
.param vthn= 0.69081       $ 11
.param vthp= -0.58926

.alter
.param vthn= 0.65120       $ 12
.param vthp= -0.59389

.alter
.param vthn= 0.65296       $ 13
.param vthp= -0.57582

.alter
.param vthn= 0.64236       $ 14
.param vthp= -0.58477

.alter
.param vthn= 0.64446       $ 15
.param vthp= -0.58547

.alter
.param vthn= 0.68385       $ 16
.param vthp= -0.58942

.alter
.param vthn= 0.68265       $ 17
.param vthp= -0.59623

.alter
.param vthn= 0.67512       $ 18
.param vthp= -0.60035

.alter
.param vthn= 0.66732       $ 19
.param vthp= -0.59211

.alter
.param vthn= 0.66854       $ 20
.param vthp= -0.58726

.alter
.param vthn= 0.64318       $ 21
.param vthp= -0.58090

.alter
.param vthn= 0.65010       $ 22
.param vthp= -0.58318

.alter
.param vthn= 0.65993       $ 23
.param vthp= -0.58936

.alter
.param vthn= 0.66687       $ 24
.param vthp= -0.58610

.alter
.param vthn= 0.63635       $ 25
.param vthp= -0.58938

.alter
.param vthn= 0.66520       $ 26
.param vthp= -0.57446

.alter
.param vthn= 0.66660       $ 27
.param vthp= -0.58823

.alter
.param vthn= 0.65463       $ 28
.param vthp= -0.58612

.alter
.param vthn= 0.65180       $ 29
.param vthp= -0.57948

.alter
.param vthn= 0.65761       $ 30
.param vthp= -0.59000

.alter
.param vthn= 0.66244       $ 31
.param vthp= -0.58806

.alter
.param vthn= 0.66657       $ 32
.param vthp= -0.58857

.alter
.param vthn= 0.64445       $ 33
.param vthp= -0.58160

.alter
.param vthn= 0.64379       $ 34
.param vthp= -0.58668

.alter
.param vthn= 0.64573       $ 35
.param vthp= -0.58223

.alter
.param vthn= 0.65435       $ 36
.param vthp= -0.57984

.alter
.param vthn= 0.66274       $ 37
.param vthp= -0.58573

.alter
.param vthn= 0.65857       $ 38
.param vthp= -0.58838

.alter
.param vthn= 0.69050       $ 39
.param vthp= -0.58256

.alter
.param vthn= 0.66313       $ 40
.param vthp= -0.58046

.alter
.param vthn= 0.65410       $ 41
.param vthp= -0.58956

.alter
.param vthn= 0.67752       $ 42
.param vthp= -0.59648

.alter
.param vthn= 0.68461       $ 43
.param vthp= -0.57850

.alter
.param vthn= 0.62779       $ 44
.param vthp= -0.58039

.alter
.param vthn= 0.68480       $ 45
.param vthp= -0.58499

.alter
.param vthn= 0.66624       $ 46
.param vthp= -0.59244

.alter
.param vthn= 0.65480       $ 47
.param vthp= -0.59302

.alter
.param vthn= 0.62747       $ 48
.param vthp= -0.57674

.alter
.param vthn= 0.67882       $ 49
.param vthp= -0.58221

.alter
.param vthn= 0.66155       $ 50
.param vthp= -0.59703

.alter
.param vthn= 0.66685       $ 51
.param vthp= -0.58480

.alter
.param vthn= 0.67800       $ 52
.param vthp= -0.58166

.alter
.param vthn= 0.66554       $ 53
.param vthp= -0.58229

.alter
.param vthn= 0.65740       $ 54
.param vthp= -0.58200

.alter
.param vthn= 0.66629       $ 55
.param vthp= -0.59348

.alter
.param vthn= 0.63799       $ 56
.param vthp= -0.59723

.alter
.param vthn= 0.65120       $ 57
.param vthp= -0.59640

.alter
.param vthn= 0.65627       $ 58
.param vthp= -0.59278

.alter
.param vthn= 0.63242       $ 59
.param vthp= -0.58095

.alter
.param vthn= 0.63899       $ 60
.param vthp= -0.58429

.alter
.param vthn= 0.66773       $ 61
.param vthp= -0.59823

.alter
.param vthn= 0.63163       $ 62
.param vthp= -0.58786

.alter
.param vthn= 0.66316       $ 63
.param vthp= -0.58357

.alter
.param vthn= 0.67182       $ 64
.param vthp= -0.58247

.alter
.param vthn= 0.63823       $ 65
.param vthp= -0.58239

.alter
.param vthn= 0.65047       $ 66
.param vthp= -0.60029

.alter
.param vthn= 0.61507       $ 67
.param vthp= -0.58442

.alter
.param vthn= 0.65705       $ 68
.param vthp= -0.59308

.alter
.param vthn= 0.64769       $ 69
.param vthp= -0.58964

.alter
.param vthn= 0.67284       $ 70
.param vthp= -0.59134

.alter
.param vthn= 0.66990       $ 71
.param vthp= -0.59598

.alter
.param vthn= 0.64174       $ 72
.param vthp= -0.58110

.alter
.param vthn= 0.64790       $ 73
.param vthp= -0.59442

.alter
.param vthn= 0.64775       $ 74
.param vthp= -0.59188

.alter
.param vthn= 0.66751       $ 75
.param vthp= -0.59106

.alter
.param vthn= 0.67604       $ 76
.param vthp= -0.59009

.alter
.param vthn= 0.67438       $ 77
.param vthp= -0.58757

.alter
.param vthn= 0.66611       $ 78
.param vthp= -0.58732

.alter
.param vthn= 0.69136       $ 79
.param vthp= -0.59479

.alter
.param vthn= 0.65182       $ 80
.param vthp= -0.58260

.alter
.param vthn= 0.65962       $ 81
.param vthp= -0.58584

.alter
.param vthn= 0.63323       $ 82
.param vthp= -0.58888

.alter
.param vthn= 0.67601       $ 83
.param vthp= -0.58688

.alter
.param vthn= 0.65692       $ 84
.param vthp= -0.57418

.alter
.param vthn= 0.68273       $ 85
.param vthp= -0.58194

.alter
.param vthn= 0.67783       $ 86
.param vthp= -0.59143

.alter
.param vthn= 0.65250       $ 87
.param vthp= -0.59558

.alter
.param vthn= 0.65519       $ 88
.param vthp= -0.58339

.alter
.param vthn= 0.68486       $ 89
.param vthp= -0.59818

.alter
.param vthn= 0.65167       $ 90
.param vthp= -0.59262

.alter
.param vthn= 0.66185       $ 91
.param vthp= -0.59032

.alter
.param vthn= 0.66708       $ 92
.param vthp= -0.58093

.alter
.param vthn= 0.63066       $ 93
.param vthp= -0.58089

.alter
.param vthn= 0.65488       $ 94
.param vthp= -0.58710

.alter
.param vthn= 0.69793       $ 95
.param vthp= -0.58756

.alter
.param vthn= 0.66429       $ 96
.param vthp= -0.58222

.alter
.param vthn= 0.66243       $ 97
.param vthp= -0.59439

.alter
.param vthn= 0.67368       $ 98
.param vthp= -0.59125

.alter
.param vthn= 0.65566       $ 99
.param vthp= -0.58875

.alter
.param vthn= 0.65803       $ 100
.param vthp= -0.59751

.alter
.param vthn= 0.64066       $ 101
.param vthp= -0.57043

.alter
.param vthn= 0.64142       $ 102
.param vthp= -0.57915

.alter
.param vthn= 0.67804       $ 103
.param vthp= -0.59199

.alter
.param vthn= 0.66253       $ 104
.param vthp= -0.58521

.alter
.param vthn= 0.62048       $ 105
.param vthp= -0.59273

.alter
.param vthn= 0.66493       $ 106
.param vthp= -0.58637

.alter
.param vthn= 0.65374       $ 107
.param vthp= -0.58512

.alter
.param vthn= 0.65428       $ 108
.param vthp= -0.58429

.alter
.param vthn= 0.63993       $ 109
.param vthp= -0.60472

.alter
.param vthn= 0.66523       $ 110
.param vthp= -0.58736

.alter
.param vthn= 0.65011       $ 111
.param vthp= -0.59203

.alter
.param vthn= 0.67652       $ 112
.param vthp= -0.59159

.alter
.param vthn= 0.66589       $ 113
.param vthp= -0.58354

.alter
.param vthn= 0.65531       $ 114
.param vthp= -0.59001

.alter
.param vthn= 0.66361       $ 115
.param vthp= -0.58875

.alter
.param vthn= 0.65755       $ 116
.param vthp= -0.59000

.alter
.param vthn= 0.64931       $ 117
.param vthp= -0.59235

.alter
.param vthn= 0.66374       $ 118
.param vthp= -0.59426

.alter
.param vthn= 0.63522       $ 119
.param vthp= -0.59071

.alter
.param vthn= 0.68831       $ 120
.param vthp= -0.58620

.alter
.param vthn= 0.65331       $ 121
.param vthp= -0.58290

.alter
.param vthn= 0.64754       $ 122
.param vthp= -0.60175

.alter
.param vthn= 0.66718       $ 123
.param vthp= -0.59051

.alter
.param vthn= 0.66185       $ 124
.param vthp= -0.57610

.alter
.param vthn= 0.63481       $ 125
.param vthp= -0.58129

.alter
.param vthn= 0.67762       $ 126
.param vthp= -0.59889

.alter
.param vthn= 0.66608       $ 127
.param vthp= -0.58828

.alter
.param vthn= 0.64708       $ 128
.param vthp= -0.57327

.alter
.param vthn= 0.67427       $ 129
.param vthp= -0.58606

.alter
.param vthn= 0.64976       $ 130
.param vthp= -0.58467

.alter
.param vthn= 0.64572       $ 131
.param vthp= -0.59308

.alter
.param vthn= 0.67234       $ 132
.param vthp= -0.56988

.alter
.param vthn= 0.61158       $ 133
.param vthp= -0.58735

.alter
.param vthn= 0.64910       $ 134
.param vthp= -0.58256

.alter
.param vthn= 0.65195       $ 135
.param vthp= -0.58260

.alter
.param vthn= 0.67783       $ 136
.param vthp= -0.58454

.alter
.param vthn= 0.67557       $ 137
.param vthp= -0.58083

.alter
.param vthn= 0.66938       $ 138
.param vthp= -0.58736

.alter
.param vthn= 0.68874       $ 139
.param vthp= -0.58665

.alter
.param vthn= 0.65260       $ 140
.param vthp= -0.57930

.alter
.param vthn= 0.67764       $ 141
.param vthp= -0.57417

.alter
.param vthn= 0.63329       $ 142
.param vthp= -0.59917

.alter
.param vthn= 0.67288       $ 143
.param vthp= -0.58260

.alter
.param vthn= 0.64972       $ 144
.param vthp= -0.59232

.alter
.param vthn= 0.65383       $ 145
.param vthp= -0.58343

.alter
.param vthn= 0.63297       $ 146
.param vthp= -0.57869

.alter
.param vthn= 0.64533       $ 147
.param vthp= -0.58360

.alter
.param vthn= 0.68044       $ 148
.param vthp= -0.58708

.alter
.param vthn= 0.67153       $ 149
.param vthp= -0.59444

.alter
.param vthn= 0.64969       $ 150
.param vthp= -0.58493

.alter
.param vthn= 0.64661       $ 151
.param vthp= -0.59583

.alter
.param vthn= 0.64120       $ 152
.param vthp= -0.58854

.alter
.param vthn= 0.67025       $ 153
.param vthp= -0.57974

.alter
.param vthn= 0.67235       $ 154
.param vthp= -0.57803

.alter
.param vthn= 0.66179       $ 155
.param vthp= -0.57630

.alter
.param vthn= 0.65675       $ 156
.param vthp= -0.58035

.alter
.param vthn= 0.66117       $ 157
.param vthp= -0.58582

.alter
.param vthn= 0.65617       $ 158
.param vthp= -0.60122

.alter
.param vthn= 0.66582       $ 159
.param vthp= -0.57534

.alter
.param vthn= 0.65642       $ 160
.param vthp= -0.59440

.alter
.param vthn= 0.64998       $ 161
.param vthp= -0.58643

.alter
.param vthn= 0.62448       $ 162
.param vthp= -0.58825

.alter
.param vthn= 0.65911       $ 163
.param vthp= -0.59716

.alter
.param vthn= 0.66343       $ 164
.param vthp= -0.58798

.alter
.param vthn= 0.64063       $ 165
.param vthp= -0.58084

.alter
.param vthn= 0.67889       $ 166
.param vthp= -0.58473

.alter
.param vthn= 0.67364       $ 167
.param vthp= -0.58324

.alter
.param vthn= 0.64020       $ 168
.param vthp= -0.59203

.alter
.param vthn= 0.64676       $ 169
.param vthp= -0.57985

.alter
.param vthn= 0.65200       $ 170
.param vthp= -0.58921

.alter
.param vthn= 0.66790       $ 171
.param vthp= -0.58805

.alter
.param vthn= 0.68019       $ 172
.param vthp= -0.58566

.alter
.param vthn= 0.68388       $ 173
.param vthp= -0.59060

.alter
.param vthn= 0.64311       $ 174
.param vthp= -0.57969

.alter
.param vthn= 0.64371       $ 175
.param vthp= -0.58738

.alter
.param vthn= 0.63556       $ 176
.param vthp= -0.58592

.alter
.param vthn= 0.63565       $ 177
.param vthp= -0.59674

.alter
.param vthn= 0.66277       $ 178
.param vthp= -0.58188

.alter
.param vthn= 0.67498       $ 179
.param vthp= -0.59278

.alter
.param vthn= 0.66254       $ 180
.param vthp= -0.60258

.alter
.param vthn= 0.64423       $ 181
.param vthp= -0.57831

.alter
.param vthn= 0.66129       $ 182
.param vthp= -0.59358

.alter
.param vthn= 0.66254       $ 183
.param vthp= -0.58197

.alter
.param vthn= 0.65340       $ 184
.param vthp= -0.58366

.alter
.param vthn= 0.66485       $ 185
.param vthp= -0.58180

.alter
.param vthn= 0.66476       $ 186
.param vthp= -0.58583

.alter
.param vthn= 0.64098       $ 187
.param vthp= -0.59340

.alter
.param vthn= 0.65152       $ 188
.param vthp= -0.58547

.alter
.param vthn= 0.61465       $ 189
.param vthp= -0.59065

.alter
.param vthn= 0.65655       $ 190
.param vthp= -0.59415

.alter
.param vthn= 0.64028       $ 191
.param vthp= -0.59060

.alter
.param vthn= 0.65005       $ 192
.param vthp= -0.58233

.alter
.param vthn= 0.66348       $ 193
.param vthp= -0.58348

.alter
.param vthn= 0.66141       $ 194
.param vthp= -0.58237

.alter
.param vthn= 0.66847       $ 195
.param vthp= -0.59396

.alter
.param vthn= 0.67735       $ 196
.param vthp= -0.58397

.alter
.param vthn= 0.63262       $ 197
.param vthp= -0.59469

.alter
.param vthn= 0.64905       $ 198
.param vthp= -0.58980

.alter
.param vthn= 0.65750       $ 199
.param vthp= -0.59691

.alter
.param vthn= 0.66890       $ 200
.param vthp= -0.58682





.end