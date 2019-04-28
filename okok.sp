
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






* ------------41_60-------------------

.alter
.param vthn= 0.62764       $ 1
.param vthp= -0.59549

.alter
.param vthn= 0.60237       $ 2
.param vthp= -0.58317

.alter
.param vthn= 0.63837       $ 3
.param vthp= -0.59546

.alter
.param vthn= 0.63012       $ 4
.param vthp= -0.58149

.alter
.param vthn= 0.60447       $ 5
.param vthp= -0.58417

.alter
.param vthn= 0.61435       $ 6
.param vthp= -0.60425

.alter
.param vthn= 0.62908       $ 7
.param vthp= -0.59594

.alter
.param vthn= 0.64294       $ 8
.param vthp= -0.58679

.alter
.param vthn= 0.62079       $ 9
.param vthp= -0.58515

.alter
.param vthn= 0.63344       $ 10
.param vthp= -0.59007

.alter
.param vthn= 0.65410       $ 11
.param vthp= -0.58956

.alter
.param vthn= 0.61449       $ 12
.param vthp= -0.59419

.alter
.param vthn= 0.61625       $ 13
.param vthp= -0.57612

.alter
.param vthn= 0.60565       $ 14
.param vthp= -0.58507

.alter
.param vthn= 0.60775       $ 15
.param vthp= -0.58577

.alter
.param vthn= 0.64714       $ 16
.param vthp= -0.58972

.alter
.param vthn= 0.64594       $ 17
.param vthp= -0.59653

.alter
.param vthn= 0.63841       $ 18
.param vthp= -0.60065

.alter
.param vthn= 0.63061       $ 19
.param vthp= -0.59241

.alter
.param vthn= 0.63183       $ 20
.param vthp= -0.58756

.alter
.param vthn= 0.60647       $ 21
.param vthp= -0.58120

.alter
.param vthn= 0.61339       $ 22
.param vthp= -0.58348

.alter
.param vthn= 0.62322       $ 23
.param vthp= -0.58966

.alter
.param vthn= 0.63016       $ 24
.param vthp= -0.58640

.alter
.param vthn= 0.59964       $ 25
.param vthp= -0.58968

.alter
.param vthn= 0.62849       $ 26
.param vthp= -0.57476

.alter
.param vthn= 0.62989       $ 27
.param vthp= -0.58853

.alter
.param vthn= 0.61792       $ 28
.param vthp= -0.58642

.alter
.param vthn= 0.61509       $ 29
.param vthp= -0.57978

.alter
.param vthn= 0.62090       $ 30
.param vthp= -0.59030

.alter
.param vthn= 0.62573       $ 31
.param vthp= -0.58836

.alter
.param vthn= 0.62986       $ 32
.param vthp= -0.58887

.alter
.param vthn= 0.60774       $ 33
.param vthp= -0.58190

.alter
.param vthn= 0.60708       $ 34
.param vthp= -0.58698

.alter
.param vthn= 0.60902       $ 35
.param vthp= -0.58253

.alter
.param vthn= 0.61764       $ 36
.param vthp= -0.58014

.alter
.param vthn= 0.62603       $ 37
.param vthp= -0.58603

.alter
.param vthn= 0.62186       $ 38
.param vthp= -0.58868

.alter
.param vthn= 0.65379       $ 39
.param vthp= -0.58286

.alter
.param vthn= 0.62642       $ 40
.param vthp= -0.58076

.alter
.param vthn= 0.61739       $ 41
.param vthp= -0.58986

.alter
.param vthn= 0.64081       $ 42
.param vthp= -0.59678

.alter
.param vthn= 0.64790       $ 43
.param vthp= -0.57880

.alter
.param vthn= 0.59108       $ 44
.param vthp= -0.58069

.alter
.param vthn= 0.64809       $ 45
.param vthp= -0.58529

.alter
.param vthn= 0.62953       $ 46
.param vthp= -0.59274

.alter
.param vthn= 0.61809       $ 47
.param vthp= -0.59332

.alter
.param vthn= 0.59076       $ 48
.param vthp= -0.57704

.alter
.param vthn= 0.64211       $ 49
.param vthp= -0.58251

.alter
.param vthn= 0.62484       $ 50
.param vthp= -0.59733

.alter
.param vthn= 0.63014       $ 51
.param vthp= -0.58510

.alter
.param vthn= 0.64129       $ 52
.param vthp= -0.58196

.alter
.param vthn= 0.62883       $ 53
.param vthp= -0.58259

.alter
.param vthn= 0.62069       $ 54
.param vthp= -0.58230

.alter
.param vthn= 0.62958       $ 55
.param vthp= -0.59378

.alter
.param vthn= 0.60128       $ 56
.param vthp= -0.59753

.alter
.param vthn= 0.61449       $ 57
.param vthp= -0.59670

.alter
.param vthn= 0.61956       $ 58
.param vthp= -0.59308

.alter
.param vthn= 0.59571       $ 59
.param vthp= -0.58125

.alter
.param vthn= 0.60228       $ 60
.param vthp= -0.58459

.alter
.param vthn= 0.63102       $ 61
.param vthp= -0.59853

.alter
.param vthn= 0.59492       $ 62
.param vthp= -0.58816

.alter
.param vthn= 0.62645       $ 63
.param vthp= -0.58387

.alter
.param vthn= 0.63511       $ 64
.param vthp= -0.58277

.alter
.param vthn= 0.60152       $ 65
.param vthp= -0.58269

.alter
.param vthn= 0.61376       $ 66
.param vthp= -0.60059

.alter
.param vthn= 0.57836       $ 67
.param vthp= -0.58472

.alter
.param vthn= 0.62034       $ 68
.param vthp= -0.59338

.alter
.param vthn= 0.61098       $ 69
.param vthp= -0.58994

.alter
.param vthn= 0.63613       $ 70
.param vthp= -0.59164

.alter
.param vthn= 0.63319       $ 71
.param vthp= -0.59628

.alter
.param vthn= 0.60503       $ 72
.param vthp= -0.58140

.alter
.param vthn= 0.61119       $ 73
.param vthp= -0.59472

.alter
.param vthn= 0.61104       $ 74
.param vthp= -0.59218

.alter
.param vthn= 0.63080       $ 75
.param vthp= -0.59136

.alter
.param vthn= 0.63933       $ 76
.param vthp= -0.59039

.alter
.param vthn= 0.63767       $ 77
.param vthp= -0.58787

.alter
.param vthn= 0.62940       $ 78
.param vthp= -0.58762

.alter
.param vthn= 0.65465       $ 79
.param vthp= -0.59509

.alter
.param vthn= 0.61511       $ 80
.param vthp= -0.58290

.alter
.param vthn= 0.62291       $ 81
.param vthp= -0.58614

.alter
.param vthn= 0.59652       $ 82
.param vthp= -0.58918

.alter
.param vthn= 0.63930       $ 83
.param vthp= -0.58718

.alter
.param vthn= 0.62021       $ 84
.param vthp= -0.57448

.alter
.param vthn= 0.64602       $ 85
.param vthp= -0.58224

.alter
.param vthn= 0.64112       $ 86
.param vthp= -0.59173

.alter
.param vthn= 0.61579       $ 87
.param vthp= -0.59588

.alter
.param vthn= 0.61848       $ 88
.param vthp= -0.58369

.alter
.param vthn= 0.64815       $ 89
.param vthp= -0.59848

.alter
.param vthn= 0.61496       $ 90
.param vthp= -0.59292

.alter
.param vthn= 0.62514       $ 91
.param vthp= -0.59062

.alter
.param vthn= 0.63037       $ 92
.param vthp= -0.58123

.alter
.param vthn= 0.59395       $ 93
.param vthp= -0.58119

.alter
.param vthn= 0.61817       $ 94
.param vthp= -0.58740

.alter
.param vthn= 0.66122       $ 95
.param vthp= -0.58786

.alter
.param vthn= 0.62758       $ 96
.param vthp= -0.58252

.alter
.param vthn= 0.62572       $ 97
.param vthp= -0.59469

.alter
.param vthn= 0.63697       $ 98
.param vthp= -0.59155

.alter
.param vthn= 0.61895       $ 99
.param vthp= -0.58905

.alter
.param vthn= 0.62132       $ 100
.param vthp= -0.59781

.alter
.param vthn= 0.60395       $ 101
.param vthp= -0.57073

.alter
.param vthn= 0.60471       $ 102
.param vthp= -0.57945

.alter
.param vthn= 0.64133       $ 103
.param vthp= -0.59229

.alter
.param vthn= 0.62582       $ 104
.param vthp= -0.58551

.alter
.param vthn= 0.58377       $ 105
.param vthp= -0.59303

.alter
.param vthn= 0.62822       $ 106
.param vthp= -0.58667

.alter
.param vthn= 0.61703       $ 107
.param vthp= -0.58542

.alter
.param vthn= 0.61757       $ 108
.param vthp= -0.58459

.alter
.param vthn= 0.60322       $ 109
.param vthp= -0.60502

.alter
.param vthn= 0.62852       $ 110
.param vthp= -0.58766

.alter
.param vthn= 0.61340       $ 111
.param vthp= -0.59233

.alter
.param vthn= 0.63981       $ 112
.param vthp= -0.59189

.alter
.param vthn= 0.62918       $ 113
.param vthp= -0.58384

.alter
.param vthn= 0.61860       $ 114
.param vthp= -0.59031

.alter
.param vthn= 0.62690       $ 115
.param vthp= -0.58905

.alter
.param vthn= 0.62084       $ 116
.param vthp= -0.59030

.alter
.param vthn= 0.61260       $ 117
.param vthp= -0.59265

.alter
.param vthn= 0.62703       $ 118
.param vthp= -0.59456

.alter
.param vthn= 0.59851       $ 119
.param vthp= -0.59101

.alter
.param vthn= 0.65160       $ 120
.param vthp= -0.58650

.alter
.param vthn= 0.61660       $ 121
.param vthp= -0.58320

.alter
.param vthn= 0.61083       $ 122
.param vthp= -0.60205

.alter
.param vthn= 0.63047       $ 123
.param vthp= -0.59081

.alter
.param vthn= 0.62514       $ 124
.param vthp= -0.57640

.alter
.param vthn= 0.59810       $ 125
.param vthp= -0.58159

.alter
.param vthn= 0.64091       $ 126
.param vthp= -0.59919

.alter
.param vthn= 0.62937       $ 127
.param vthp= -0.58858

.alter
.param vthn= 0.61037       $ 128
.param vthp= -0.57357

.alter
.param vthn= 0.63756       $ 129
.param vthp= -0.58636

.alter
.param vthn= 0.61305       $ 130
.param vthp= -0.58497

.alter
.param vthn= 0.60901       $ 131
.param vthp= -0.59338

.alter
.param vthn= 0.63563       $ 132
.param vthp= -0.57018

.alter
.param vthn= 0.57487       $ 133
.param vthp= -0.58765

.alter
.param vthn= 0.61239       $ 134
.param vthp= -0.58286

.alter
.param vthn= 0.61524       $ 135
.param vthp= -0.58290

.alter
.param vthn= 0.64112       $ 136
.param vthp= -0.58484

.alter
.param vthn= 0.63886       $ 137
.param vthp= -0.58113

.alter
.param vthn= 0.63267       $ 138
.param vthp= -0.58766

.alter
.param vthn= 0.65203       $ 139
.param vthp= -0.58695

.alter
.param vthn= 0.61589       $ 140
.param vthp= -0.57960

.alter
.param vthn= 0.64093       $ 141
.param vthp= -0.57447

.alter
.param vthn= 0.59658       $ 142
.param vthp= -0.59947

.alter
.param vthn= 0.63617       $ 143
.param vthp= -0.58290

.alter
.param vthn= 0.61301       $ 144
.param vthp= -0.59262

.alter
.param vthn= 0.61712       $ 145
.param vthp= -0.58373

.alter
.param vthn= 0.59626       $ 146
.param vthp= -0.57899

.alter
.param vthn= 0.60862       $ 147
.param vthp= -0.58390

.alter
.param vthn= 0.64373       $ 148
.param vthp= -0.58738

.alter
.param vthn= 0.63482       $ 149
.param vthp= -0.59474

.alter
.param vthn= 0.61298       $ 150
.param vthp= -0.58523

.alter
.param vthn= 0.60990       $ 151
.param vthp= -0.59613

.alter
.param vthn= 0.60449       $ 152
.param vthp= -0.58884

.alter
.param vthn= 0.63354       $ 153
.param vthp= -0.58004

.alter
.param vthn= 0.63564       $ 154
.param vthp= -0.57833

.alter
.param vthn= 0.62508       $ 155
.param vthp= -0.57660

.alter
.param vthn= 0.62004       $ 156
.param vthp= -0.58065

.alter
.param vthn= 0.62446       $ 157
.param vthp= -0.58612

.alter
.param vthn= 0.61946       $ 158
.param vthp= -0.60152

.alter
.param vthn= 0.62911       $ 159
.param vthp= -0.57564

.alter
.param vthn= 0.61971       $ 160
.param vthp= -0.59470

.alter
.param vthn= 0.61327       $ 161
.param vthp= -0.58673

.alter
.param vthn= 0.58777       $ 162
.param vthp= -0.58855

.alter
.param vthn= 0.62240       $ 163
.param vthp= -0.59746

.alter
.param vthn= 0.62672       $ 164
.param vthp= -0.58828

.alter
.param vthn= 0.60392       $ 165
.param vthp= -0.58114

.alter
.param vthn= 0.64218       $ 166
.param vthp= -0.58503

.alter
.param vthn= 0.63693       $ 167
.param vthp= -0.58354

.alter
.param vthn= 0.60349       $ 168
.param vthp= -0.59233

.alter
.param vthn= 0.61005       $ 169
.param vthp= -0.58015

.alter
.param vthn= 0.61529       $ 170
.param vthp= -0.58951

.alter
.param vthn= 0.63119       $ 171
.param vthp= -0.58835

.alter
.param vthn= 0.64348       $ 172
.param vthp= -0.58596

.alter
.param vthn= 0.64717       $ 173
.param vthp= -0.59090

.alter
.param vthn= 0.60640       $ 174
.param vthp= -0.57999

.alter
.param vthn= 0.60700       $ 175
.param vthp= -0.58768

.alter
.param vthn= 0.59885       $ 176
.param vthp= -0.58622

.alter
.param vthn= 0.59894       $ 177
.param vthp= -0.59704

.alter
.param vthn= 0.62606       $ 178
.param vthp= -0.58218

.alter
.param vthn= 0.63827       $ 179
.param vthp= -0.59308

.alter
.param vthn= 0.62583       $ 180
.param vthp= -0.60288

.alter
.param vthn= 0.60752       $ 181
.param vthp= -0.57861

.alter
.param vthn= 0.62458       $ 182
.param vthp= -0.59388

.alter
.param vthn= 0.62583       $ 183
.param vthp= -0.58227

.alter
.param vthn= 0.61669       $ 184
.param vthp= -0.58396

.alter
.param vthn= 0.62814       $ 185
.param vthp= -0.58210

.alter
.param vthn= 0.62805       $ 186
.param vthp= -0.58613

.alter
.param vthn= 0.60427       $ 187
.param vthp= -0.59370

.alter
.param vthn= 0.61481       $ 188
.param vthp= -0.58577

.alter
.param vthn= 0.57794       $ 189
.param vthp= -0.59095

.alter
.param vthn= 0.61984       $ 190
.param vthp= -0.59445

.alter
.param vthn= 0.60357       $ 191
.param vthp= -0.59090

.alter
.param vthn= 0.61334       $ 192
.param vthp= -0.58263

.alter
.param vthn= 0.62677       $ 193
.param vthp= -0.58378

.alter
.param vthn= 0.62470       $ 194
.param vthp= -0.58267

.alter
.param vthn= 0.63176       $ 195
.param vthp= -0.59426

.alter
.param vthn= 0.64064       $ 196
.param vthp= -0.58427

.alter
.param vthn= 0.59591       $ 197
.param vthp= -0.59499

.alter
.param vthn= 0.61234       $ 198
.param vthp= -0.59010

.alter
.param vthn= 0.62079       $ 199
.param vthp= -0.59721

.alter
.param vthn= 0.63219       $ 200
.param vthp= -0.58712

.alter
.param vthn= 0.65106       $ 201
.param vthp= -0.60241

.alter
.param vthn= 0.62579       $ 202
.param vthp= -0.59009

.alter
.param vthn= 0.66179       $ 203
.param vthp= -0.60238

.alter
.param vthn= 0.65354       $ 204
.param vthp= -0.58841

.alter
.param vthn= 0.62789       $ 205
.param vthp= -0.59109

.alter
.param vthn= 0.63777       $ 206
.param vthp= -0.61117

.alter
.param vthn= 0.65250       $ 207
.param vthp= -0.60286

.alter
.param vthn= 0.66636       $ 208
.param vthp= -0.59371

.alter
.param vthn= 0.64421       $ 209
.param vthp= -0.59207

.alter
.param vthn= 0.65686       $ 210
.param vthp= -0.59699

.alter
.param vthn= 0.67752       $ 211
.param vthp= -0.59648

.alter
.param vthn= 0.63791       $ 212
.param vthp= -0.60111

.alter
.param vthn= 0.63967       $ 213
.param vthp= -0.58304

.alter
.param vthn= 0.62907       $ 214
.param vthp= -0.59199

.alter
.param vthn= 0.63117       $ 215
.param vthp= -0.59269

.alter
.param vthn= 0.67056       $ 216
.param vthp= -0.59664

.alter
.param vthn= 0.66936       $ 217
.param vthp= -0.60345

.alter
.param vthn= 0.66183       $ 218
.param vthp= -0.60757

.alter
.param vthn= 0.65403       $ 219
.param vthp= -0.59933

.alter
.param vthn= 0.65525       $ 220
.param vthp= -0.59448

.alter
.param vthn= 0.62989       $ 221
.param vthp= -0.58812

.alter
.param vthn= 0.63681       $ 222
.param vthp= -0.59040

.alter
.param vthn= 0.64664       $ 223
.param vthp= -0.59658

.alter
.param vthn= 0.65358       $ 224
.param vthp= -0.59332

.alter
.param vthn= 0.62306       $ 225
.param vthp= -0.59660

.alter
.param vthn= 0.65191       $ 226
.param vthp= -0.58168

.alter
.param vthn= 0.65331       $ 227
.param vthp= -0.59545

.alter
.param vthn= 0.64134       $ 228
.param vthp= -0.59334

.alter
.param vthn= 0.63851       $ 229
.param vthp= -0.58670

.alter
.param vthn= 0.64432       $ 230
.param vthp= -0.59722

.alter
.param vthn= 0.64915       $ 231
.param vthp= -0.59528

.alter
.param vthn= 0.65328       $ 232
.param vthp= -0.59579

.alter
.param vthn= 0.63116       $ 233
.param vthp= -0.58882

.alter
.param vthn= 0.63050       $ 234
.param vthp= -0.59390

.alter
.param vthn= 0.63244       $ 235
.param vthp= -0.58945

.alter
.param vthn= 0.64106       $ 236
.param vthp= -0.58706

.alter
.param vthn= 0.64945       $ 237
.param vthp= -0.59295

.alter
.param vthn= 0.64528       $ 238
.param vthp= -0.59560

.alter
.param vthn= 0.67721       $ 239
.param vthp= -0.58978

.alter
.param vthn= 0.64984       $ 240
.param vthp= -0.58768

.alter
.param vthn= 0.64081       $ 241
.param vthp= -0.59678

.alter
.param vthn= 0.66423       $ 242
.param vthp= -0.60370

.alter
.param vthn= 0.67132       $ 243
.param vthp= -0.58572

.alter
.param vthn= 0.61450       $ 244
.param vthp= -0.58761

.alter
.param vthn= 0.67151       $ 245
.param vthp= -0.59221

.alter
.param vthn= 0.65295       $ 246
.param vthp= -0.59966

.alter
.param vthn= 0.64151       $ 247
.param vthp= -0.60024

.alter
.param vthn= 0.61418       $ 248
.param vthp= -0.58396

.alter
.param vthn= 0.66553       $ 249
.param vthp= -0.58943

.alter
.param vthn= 0.64826       $ 250
.param vthp= -0.60425

.alter
.param vthn= 0.65356       $ 251
.param vthp= -0.59202

.alter
.param vthn= 0.66471       $ 252
.param vthp= -0.58888

.alter
.param vthn= 0.65225       $ 253
.param vthp= -0.58951

.alter
.param vthn= 0.64411       $ 254
.param vthp= -0.58922

.alter
.param vthn= 0.65300       $ 255
.param vthp= -0.60070

.alter
.param vthn= 0.62470       $ 256
.param vthp= -0.60445

.alter
.param vthn= 0.63791       $ 257
.param vthp= -0.60362

.alter
.param vthn= 0.64298       $ 258
.param vthp= -0.60000

.alter
.param vthn= 0.61913       $ 259
.param vthp= -0.58817

.alter
.param vthn= 0.62570       $ 260
.param vthp= -0.59151

.alter
.param vthn= 0.65444       $ 261
.param vthp= -0.60545

.alter
.param vthn= 0.61834       $ 262
.param vthp= -0.59508

.alter
.param vthn= 0.64987       $ 263
.param vthp= -0.59079

.alter
.param vthn= 0.65853       $ 264
.param vthp= -0.58969

.alter
.param vthn= 0.62494       $ 265
.param vthp= -0.58961

.alter
.param vthn= 0.63718       $ 266
.param vthp= -0.60751

.alter
.param vthn= 0.60178       $ 267
.param vthp= -0.59164

.alter
.param vthn= 0.64376       $ 268
.param vthp= -0.60030

.alter
.param vthn= 0.63440       $ 269
.param vthp= -0.59686

.alter
.param vthn= 0.65955       $ 270
.param vthp= -0.59856

.alter
.param vthn= 0.65661       $ 271
.param vthp= -0.60320

.alter
.param vthn= 0.62845       $ 272
.param vthp= -0.58832

.alter
.param vthn= 0.63461       $ 273
.param vthp= -0.60164

.alter
.param vthn= 0.63446       $ 274
.param vthp= -0.59910

.alter
.param vthn= 0.65422       $ 275
.param vthp= -0.59828

.alter
.param vthn= 0.66275       $ 276
.param vthp= -0.59731

.alter
.param vthn= 0.66109       $ 277
.param vthp= -0.59479

.alter
.param vthn= 0.65282       $ 278
.param vthp= -0.59454

.alter
.param vthn= 0.67807       $ 279
.param vthp= -0.60201

.alter
.param vthn= 0.63853       $ 280
.param vthp= -0.58982

.alter
.param vthn= 0.64633       $ 281
.param vthp= -0.59306

.alter
.param vthn= 0.61994       $ 282
.param vthp= -0.59610

.alter
.param vthn= 0.66272       $ 283
.param vthp= -0.59410

.alter
.param vthn= 0.64363       $ 284
.param vthp= -0.58140

.alter
.param vthn= 0.66944       $ 285
.param vthp= -0.58916

.alter
.param vthn= 0.66454       $ 286
.param vthp= -0.59865

.alter
.param vthn= 0.63921       $ 287
.param vthp= -0.60280

.alter
.param vthn= 0.64190       $ 288
.param vthp= -0.59061

.alter
.param vthn= 0.67157       $ 289
.param vthp= -0.60540

.alter
.param vthn= 0.63838       $ 290
.param vthp= -0.59984

.alter
.param vthn= 0.64856       $ 291
.param vthp= -0.59754

.alter
.param vthn= 0.65379       $ 292
.param vthp= -0.58815

.alter
.param vthn= 0.61737       $ 293
.param vthp= -0.58811

.alter
.param vthn= 0.64159       $ 294
.param vthp= -0.59432

.alter
.param vthn= 0.68464       $ 295
.param vthp= -0.59478

.alter
.param vthn= 0.65100       $ 296
.param vthp= -0.58944

.alter
.param vthn= 0.64914       $ 297
.param vthp= -0.60161

.alter
.param vthn= 0.66039       $ 298
.param vthp= -0.59847

.alter
.param vthn= 0.64237       $ 299
.param vthp= -0.59597

.alter
.param vthn= 0.64474       $ 300
.param vthp= -0.60473

.alter
.param vthn= 0.62737       $ 301
.param vthp= -0.57765

.alter
.param vthn= 0.62813       $ 302
.param vthp= -0.58637

.alter
.param vthn= 0.66475       $ 303
.param vthp= -0.59921

.alter
.param vthn= 0.64924       $ 304
.param vthp= -0.59243

.alter
.param vthn= 0.60719       $ 305
.param vthp= -0.59995

.alter
.param vthn= 0.65164       $ 306
.param vthp= -0.59359

.alter
.param vthn= 0.64045       $ 307
.param vthp= -0.59234

.alter
.param vthn= 0.64099       $ 308
.param vthp= -0.59151

.alter
.param vthn= 0.62664       $ 309
.param vthp= -0.61194

.alter
.param vthn= 0.65194       $ 310
.param vthp= -0.59458

.alter
.param vthn= 0.63682       $ 311
.param vthp= -0.59925

.alter
.param vthn= 0.66323       $ 312
.param vthp= -0.59881

.alter
.param vthn= 0.65260       $ 313
.param vthp= -0.59076

.alter
.param vthn= 0.64202       $ 314
.param vthp= -0.59723

.alter
.param vthn= 0.65032       $ 315
.param vthp= -0.59597

.alter
.param vthn= 0.64426       $ 316
.param vthp= -0.59722

.alter
.param vthn= 0.63602       $ 317
.param vthp= -0.59957

.alter
.param vthn= 0.65045       $ 318
.param vthp= -0.60148

.alter
.param vthn= 0.62193       $ 319
.param vthp= -0.59793

.alter
.param vthn= 0.67502       $ 320
.param vthp= -0.59342

.alter
.param vthn= 0.64002       $ 321
.param vthp= -0.59012

.alter
.param vthn= 0.63425       $ 322
.param vthp= -0.60897

.alter
.param vthn= 0.65389       $ 323
.param vthp= -0.59773

.alter
.param vthn= 0.64856       $ 324
.param vthp= -0.58332

.alter
.param vthn= 0.62152       $ 325
.param vthp= -0.58851

.alter
.param vthn= 0.66433       $ 326
.param vthp= -0.60611

.alter
.param vthn= 0.65279       $ 327
.param vthp= -0.59550

.alter
.param vthn= 0.63379       $ 328
.param vthp= -0.58049

.alter
.param vthn= 0.66098       $ 329
.param vthp= -0.59328

.alter
.param vthn= 0.63647       $ 330
.param vthp= -0.59189

.alter
.param vthn= 0.63243       $ 331
.param vthp= -0.60030

.alter
.param vthn= 0.65905       $ 332
.param vthp= -0.57710

.alter
.param vthn= 0.59829       $ 333
.param vthp= -0.59457

.alter
.param vthn= 0.63581       $ 334
.param vthp= -0.58978

.alter
.param vthn= 0.63866       $ 335
.param vthp= -0.58982

.alter
.param vthn= 0.66454       $ 336
.param vthp= -0.59176

.alter
.param vthn= 0.66228       $ 337
.param vthp= -0.58805

.alter
.param vthn= 0.65609       $ 338
.param vthp= -0.59458

.alter
.param vthn= 0.67545       $ 339
.param vthp= -0.59387

.alter
.param vthn= 0.63931       $ 340
.param vthp= -0.58652

.alter
.param vthn= 0.66435       $ 341
.param vthp= -0.58139

.alter
.param vthn= 0.62000       $ 342
.param vthp= -0.60639

.alter
.param vthn= 0.65959       $ 343
.param vthp= -0.58982

.alter
.param vthn= 0.63643       $ 344
.param vthp= -0.59954

.alter
.param vthn= 0.64054       $ 345
.param vthp= -0.59065

.alter
.param vthn= 0.61968       $ 346
.param vthp= -0.58591

.alter
.param vthn= 0.63204       $ 347
.param vthp= -0.59082

.alter
.param vthn= 0.66715       $ 348
.param vthp= -0.59430

.alter
.param vthn= 0.65824       $ 349
.param vthp= -0.60166

.alter
.param vthn= 0.63640       $ 350
.param vthp= -0.59215

.alter
.param vthn= 0.63332       $ 351
.param vthp= -0.60305

.alter
.param vthn= 0.62791       $ 352
.param vthp= -0.59576

.alter
.param vthn= 0.65696       $ 353
.param vthp= -0.58696

.alter
.param vthn= 0.65906       $ 354
.param vthp= -0.58525

.alter
.param vthn= 0.64850       $ 355
.param vthp= -0.58352

.alter
.param vthn= 0.64346       $ 356
.param vthp= -0.58757

.alter
.param vthn= 0.64788       $ 357
.param vthp= -0.59304

.alter
.param vthn= 0.64288       $ 358
.param vthp= -0.60844

.alter
.param vthn= 0.65253       $ 359
.param vthp= -0.58256

.alter
.param vthn= 0.64313       $ 360
.param vthp= -0.60162

.alter
.param vthn= 0.63669       $ 361
.param vthp= -0.59365

.alter
.param vthn= 0.61119       $ 362
.param vthp= -0.59547

.alter
.param vthn= 0.64582       $ 363
.param vthp= -0.60438

.alter
.param vthn= 0.65014       $ 364
.param vthp= -0.59520

.alter
.param vthn= 0.62734       $ 365
.param vthp= -0.58806

.alter
.param vthn= 0.66560       $ 366
.param vthp= -0.59195

.alter
.param vthn= 0.66035       $ 367
.param vthp= -0.59046

.alter
.param vthn= 0.62691       $ 368
.param vthp= -0.59925

.alter
.param vthn= 0.63347       $ 369
.param vthp= -0.58707

.alter
.param vthn= 0.63871       $ 370
.param vthp= -0.59643

.alter
.param vthn= 0.65461       $ 371
.param vthp= -0.59527

.alter
.param vthn= 0.66690       $ 372
.param vthp= -0.59288

.alter
.param vthn= 0.67059       $ 373
.param vthp= -0.59782

.alter
.param vthn= 0.62982       $ 374
.param vthp= -0.58691

.alter
.param vthn= 0.63042       $ 375
.param vthp= -0.59460

.alter
.param vthn= 0.62227       $ 376
.param vthp= -0.59314

.alter
.param vthn= 0.62236       $ 377
.param vthp= -0.60396

.alter
.param vthn= 0.64948       $ 378
.param vthp= -0.58910

.alter
.param vthn= 0.66169       $ 379
.param vthp= -0.60000

.alter
.param vthn= 0.64925       $ 380
.param vthp= -0.60980

.alter
.param vthn= 0.63094       $ 381
.param vthp= -0.58553

.alter
.param vthn= 0.64800       $ 382
.param vthp= -0.60080

.alter
.param vthn= 0.64925       $ 383
.param vthp= -0.58919

.alter
.param vthn= 0.64011       $ 384
.param vthp= -0.59088

.alter
.param vthn= 0.65156       $ 385
.param vthp= -0.58902

.alter
.param vthn= 0.65147       $ 386
.param vthp= -0.59305

.alter
.param vthn= 0.62769       $ 387
.param vthp= -0.60062

.alter
.param vthn= 0.63823       $ 388
.param vthp= -0.59269

.alter
.param vthn= 0.60136       $ 389
.param vthp= -0.59787

.alter
.param vthn= 0.64326       $ 390
.param vthp= -0.60137

.alter
.param vthn= 0.62699       $ 391
.param vthp= -0.59782

.alter
.param vthn= 0.63676       $ 392
.param vthp= -0.58955

.alter
.param vthn= 0.65019       $ 393
.param vthp= -0.59070

.alter
.param vthn= 0.64812       $ 394
.param vthp= -0.58959

.alter
.param vthn= 0.65518       $ 395
.param vthp= -0.60118

.alter
.param vthn= 0.66406       $ 396
.param vthp= -0.59119

.alter
.param vthn= 0.61933       $ 397
.param vthp= -0.60191

.alter
.param vthn= 0.63576       $ 398
.param vthp= -0.59702

.alter
.param vthn= 0.64421       $ 399
.param vthp= -0.60413

.alter
.param vthn= 0.65561       $ 400
.param vthp= -0.59404

.alter
.param vthn= 0.65815       $ 401
.param vthp= -0.58443

.alter
.param vthn= 0.63288       $ 402
.param vthp= -0.57211

.alter
.param vthn= 0.66888       $ 403
.param vthp= -0.58440

.alter
.param vthn= 0.66063       $ 404
.param vthp= -0.57043

.alter
.param vthn= 0.63498       $ 405
.param vthp= -0.57311

.alter
.param vthn= 0.64486       $ 406
.param vthp= -0.59319

.alter
.param vthn= 0.65959       $ 407
.param vthp= -0.58488

.alter
.param vthn= 0.67345       $ 408
.param vthp= -0.57573

.alter
.param vthn= 0.65130       $ 409
.param vthp= -0.57409

.alter
.param vthn= 0.66395       $ 410
.param vthp= -0.57901

.alter
.param vthn= 0.68461       $ 411
.param vthp= -0.57850

.alter
.param vthn= 0.64500       $ 412
.param vthp= -0.58313

.alter
.param vthn= 0.64676       $ 413
.param vthp= -0.56506

.alter
.param vthn= 0.63616       $ 414
.param vthp= -0.57401

.alter
.param vthn= 0.63826       $ 415
.param vthp= -0.57471

.alter
.param vthn= 0.67765       $ 416
.param vthp= -0.57866

.alter
.param vthn= 0.67645       $ 417
.param vthp= -0.58547

.alter
.param vthn= 0.66892       $ 418
.param vthp= -0.58959

.alter
.param vthn= 0.66112       $ 419
.param vthp= -0.58135

.alter
.param vthn= 0.66234       $ 420
.param vthp= -0.57650

.alter
.param vthn= 0.63698       $ 421
.param vthp= -0.57014

.alter
.param vthn= 0.64390       $ 422
.param vthp= -0.57242

.alter
.param vthn= 0.65373       $ 423
.param vthp= -0.57860

.alter
.param vthn= 0.66067       $ 424
.param vthp= -0.57534

.alter
.param vthn= 0.63015       $ 425
.param vthp= -0.57862

.alter
.param vthn= 0.65900       $ 426
.param vthp= -0.56370

.alter
.param vthn= 0.66040       $ 427
.param vthp= -0.57747

.alter
.param vthn= 0.64843       $ 428
.param vthp= -0.57536

.alter
.param vthn= 0.64560       $ 429
.param vthp= -0.56872

.alter
.param vthn= 0.65141       $ 430
.param vthp= -0.57924

.alter
.param vthn= 0.65624       $ 431
.param vthp= -0.57730

.alter
.param vthn= 0.66037       $ 432
.param vthp= -0.57781

.alter
.param vthn= 0.63825       $ 433
.param vthp= -0.57084

.alter
.param vthn= 0.63759       $ 434
.param vthp= -0.57592

.alter
.param vthn= 0.63953       $ 435
.param vthp= -0.57147

.alter
.param vthn= 0.64815       $ 436
.param vthp= -0.56908

.alter
.param vthn= 0.65654       $ 437
.param vthp= -0.57497

.alter
.param vthn= 0.65237       $ 438
.param vthp= -0.57762

.alter
.param vthn= 0.68430       $ 439
.param vthp= -0.57180

.alter
.param vthn= 0.65693       $ 440
.param vthp= -0.56970

.alter
.param vthn= 0.64790       $ 441
.param vthp= -0.57880

.alter
.param vthn= 0.67132       $ 442
.param vthp= -0.58572

.alter
.param vthn= 0.67841       $ 443
.param vthp= -0.56774

.alter
.param vthn= 0.62159       $ 444
.param vthp= -0.56963

.alter
.param vthn= 0.67860       $ 445
.param vthp= -0.57423

.alter
.param vthn= 0.66004       $ 446
.param vthp= -0.58168

.alter
.param vthn= 0.64860       $ 447
.param vthp= -0.58226

.alter
.param vthn= 0.62127       $ 448
.param vthp= -0.56598

.alter
.param vthn= 0.67262       $ 449
.param vthp= -0.57145

.alter
.param vthn= 0.65535       $ 450
.param vthp= -0.58627

.alter
.param vthn= 0.66065       $ 451
.param vthp= -0.57404

.alter
.param vthn= 0.67180       $ 452
.param vthp= -0.57090

.alter
.param vthn= 0.65934       $ 453
.param vthp= -0.57153

.alter
.param vthn= 0.65120       $ 454
.param vthp= -0.57124

.alter
.param vthn= 0.66009       $ 455
.param vthp= -0.58272

.alter
.param vthn= 0.63179       $ 456
.param vthp= -0.58647

.alter
.param vthn= 0.64500       $ 457
.param vthp= -0.58564

.alter
.param vthn= 0.65007       $ 458
.param vthp= -0.58202

.alter
.param vthn= 0.62622       $ 459
.param vthp= -0.57019

.alter
.param vthn= 0.63279       $ 460
.param vthp= -0.57353

.alter
.param vthn= 0.66153       $ 461
.param vthp= -0.58747

.alter
.param vthn= 0.62543       $ 462
.param vthp= -0.57710

.alter
.param vthn= 0.65696       $ 463
.param vthp= -0.57281

.alter
.param vthn= 0.66562       $ 464
.param vthp= -0.57171

.alter
.param vthn= 0.63203       $ 465
.param vthp= -0.57163

.alter
.param vthn= 0.64427       $ 466
.param vthp= -0.58953

.alter
.param vthn= 0.60887       $ 467
.param vthp= -0.57366

.alter
.param vthn= 0.65085       $ 468
.param vthp= -0.58232

.alter
.param vthn= 0.64149       $ 469
.param vthp= -0.57888

.alter
.param vthn= 0.66664       $ 470
.param vthp= -0.58058

.alter
.param vthn= 0.66370       $ 471
.param vthp= -0.58522

.alter
.param vthn= 0.63554       $ 472
.param vthp= -0.57034

.alter
.param vthn= 0.64170       $ 473
.param vthp= -0.58366

.alter
.param vthn= 0.64155       $ 474
.param vthp= -0.58112

.alter
.param vthn= 0.66131       $ 475
.param vthp= -0.58030

.alter
.param vthn= 0.66984       $ 476
.param vthp= -0.57933

.alter
.param vthn= 0.66818       $ 477
.param vthp= -0.57681

.alter
.param vthn= 0.65991       $ 478
.param vthp= -0.57656

.alter
.param vthn= 0.68516       $ 479
.param vthp= -0.58403

.alter
.param vthn= 0.64562       $ 480
.param vthp= -0.57184

.alter
.param vthn= 0.65342       $ 481
.param vthp= -0.57508

.alter
.param vthn= 0.62703       $ 482
.param vthp= -0.57812

.alter
.param vthn= 0.66981       $ 483
.param vthp= -0.57612

.alter
.param vthn= 0.65072       $ 484
.param vthp= -0.56342

.alter
.param vthn= 0.67653       $ 485
.param vthp= -0.57118

.alter
.param vthn= 0.67163       $ 486
.param vthp= -0.58067

.alter
.param vthn= 0.64630       $ 487
.param vthp= -0.58482

.alter
.param vthn= 0.64899       $ 488
.param vthp= -0.57263

.alter
.param vthn= 0.67866       $ 489
.param vthp= -0.58742

.alter
.param vthn= 0.64547       $ 490
.param vthp= -0.58186

.alter
.param vthn= 0.65565       $ 491
.param vthp= -0.57956

.alter
.param vthn= 0.66088       $ 492
.param vthp= -0.57017

.alter
.param vthn= 0.62446       $ 493
.param vthp= -0.57013

.alter
.param vthn= 0.64868       $ 494
.param vthp= -0.57634

.alter
.param vthn= 0.69173       $ 495
.param vthp= -0.57680

.alter
.param vthn= 0.65809       $ 496
.param vthp= -0.57146

.alter
.param vthn= 0.65623       $ 497
.param vthp= -0.58363

.alter
.param vthn= 0.66748       $ 498
.param vthp= -0.58049

.alter
.param vthn= 0.64946       $ 499
.param vthp= -0.57799

.alter
.param vthn= 0.65183       $ 500
.param vthp= -0.58675

.alter
.param vthn= 0.63446       $ 501
.param vthp= -0.55967

.alter
.param vthn= 0.63522       $ 502
.param vthp= -0.56839

.alter
.param vthn= 0.67184       $ 503
.param vthp= -0.58123

.alter
.param vthn= 0.65633       $ 504
.param vthp= -0.57445

.alter
.param vthn= 0.61428       $ 505
.param vthp= -0.58197

.alter
.param vthn= 0.65873       $ 506
.param vthp= -0.57561

.alter
.param vthn= 0.64754       $ 507
.param vthp= -0.57436

.alter
.param vthn= 0.64808       $ 508
.param vthp= -0.57353

.alter
.param vthn= 0.63373       $ 509
.param vthp= -0.59396

.alter
.param vthn= 0.65903       $ 510
.param vthp= -0.57660

.alter
.param vthn= 0.64391       $ 511
.param vthp= -0.58127

.alter
.param vthn= 0.67032       $ 512
.param vthp= -0.58083

.alter
.param vthn= 0.65969       $ 513
.param vthp= -0.57278

.alter
.param vthn= 0.64911       $ 514
.param vthp= -0.57925

.alter
.param vthn= 0.65741       $ 515
.param vthp= -0.57799

.alter
.param vthn= 0.65135       $ 516
.param vthp= -0.57924

.alter
.param vthn= 0.64311       $ 517
.param vthp= -0.58159

.alter
.param vthn= 0.65754       $ 518
.param vthp= -0.58350

.alter
.param vthn= 0.62902       $ 519
.param vthp= -0.57995

.alter
.param vthn= 0.68211       $ 520
.param vthp= -0.57544

.alter
.param vthn= 0.64711       $ 521
.param vthp= -0.57214

.alter
.param vthn= 0.64134       $ 522
.param vthp= -0.59099

.alter
.param vthn= 0.66098       $ 523
.param vthp= -0.57975

.alter
.param vthn= 0.65565       $ 524
.param vthp= -0.56534

.alter
.param vthn= 0.62861       $ 525
.param vthp= -0.57053

.alter
.param vthn= 0.67142       $ 526
.param vthp= -0.58813

.alter
.param vthn= 0.65988       $ 527
.param vthp= -0.57752

.alter
.param vthn= 0.64088       $ 528
.param vthp= -0.56251

.alter
.param vthn= 0.66807       $ 529
.param vthp= -0.57530

.alter
.param vthn= 0.64356       $ 530
.param vthp= -0.57391

.alter
.param vthn= 0.63952       $ 531
.param vthp= -0.58232

.alter
.param vthn= 0.66614       $ 532
.param vthp= -0.55912

.alter
.param vthn= 0.60538       $ 533
.param vthp= -0.57659

.alter
.param vthn= 0.64290       $ 534
.param vthp= -0.57180

.alter
.param vthn= 0.64575       $ 535
.param vthp= -0.57184

.alter
.param vthn= 0.67163       $ 536
.param vthp= -0.57378

.alter
.param vthn= 0.66937       $ 537
.param vthp= -0.57007

.alter
.param vthn= 0.66318       $ 538
.param vthp= -0.57660

.alter
.param vthn= 0.68254       $ 539
.param vthp= -0.57589

.alter
.param vthn= 0.64640       $ 540
.param vthp= -0.56854

.alter
.param vthn= 0.67144       $ 541
.param vthp= -0.56341

.alter
.param vthn= 0.62709       $ 542
.param vthp= -0.58841

.alter
.param vthn= 0.66668       $ 543
.param vthp= -0.57184

.alter
.param vthn= 0.64352       $ 544
.param vthp= -0.58156

.alter
.param vthn= 0.64763       $ 545
.param vthp= -0.57267

.alter
.param vthn= 0.62677       $ 546
.param vthp= -0.56793

.alter
.param vthn= 0.63913       $ 547
.param vthp= -0.57284

.alter
.param vthn= 0.67424       $ 548
.param vthp= -0.57632

.alter
.param vthn= 0.66533       $ 549
.param vthp= -0.58368

.alter
.param vthn= 0.64349       $ 550
.param vthp= -0.57417

.alter
.param vthn= 0.64041       $ 551
.param vthp= -0.58507

.alter
.param vthn= 0.63500       $ 552
.param vthp= -0.57778

.alter
.param vthn= 0.66405       $ 553
.param vthp= -0.56898

.alter
.param vthn= 0.66615       $ 554
.param vthp= -0.56727

.alter
.param vthn= 0.65559       $ 555
.param vthp= -0.56554

.alter
.param vthn= 0.65055       $ 556
.param vthp= -0.56959

.alter
.param vthn= 0.65497       $ 557
.param vthp= -0.57506

.alter
.param vthn= 0.64997       $ 558
.param vthp= -0.59046

.alter
.param vthn= 0.65962       $ 559
.param vthp= -0.56458

.alter
.param vthn= 0.65022       $ 560
.param vthp= -0.58364

.alter
.param vthn= 0.64378       $ 561
.param vthp= -0.57567

.alter
.param vthn= 0.61828       $ 562
.param vthp= -0.57749

.alter
.param vthn= 0.65291       $ 563
.param vthp= -0.58640

.alter
.param vthn= 0.65723       $ 564
.param vthp= -0.57722

.alter
.param vthn= 0.63443       $ 565
.param vthp= -0.57008

.alter
.param vthn= 0.67269       $ 566
.param vthp= -0.57397

.alter
.param vthn= 0.66744       $ 567
.param vthp= -0.57248

.alter
.param vthn= 0.63400       $ 568
.param vthp= -0.58127

.alter
.param vthn= 0.64056       $ 569
.param vthp= -0.56909

.alter
.param vthn= 0.64580       $ 570
.param vthp= -0.57845

.alter
.param vthn= 0.66170       $ 571
.param vthp= -0.57729

.alter
.param vthn= 0.67399       $ 572
.param vthp= -0.57490

.alter
.param vthn= 0.67768       $ 573
.param vthp= -0.57984

.alter
.param vthn= 0.63691       $ 574
.param vthp= -0.56893

.alter
.param vthn= 0.63751       $ 575
.param vthp= -0.57662

.alter
.param vthn= 0.62936       $ 576
.param vthp= -0.57516

.alter
.param vthn= 0.62945       $ 577
.param vthp= -0.58598

.alter
.param vthn= 0.65657       $ 578
.param vthp= -0.57112

.alter
.param vthn= 0.66878       $ 579
.param vthp= -0.58202

.alter
.param vthn= 0.65634       $ 580
.param vthp= -0.59182

.alter
.param vthn= 0.63803       $ 581
.param vthp= -0.56755

.alter
.param vthn= 0.65509       $ 582
.param vthp= -0.58282

.alter
.param vthn= 0.65634       $ 583
.param vthp= -0.57121

.alter
.param vthn= 0.64720       $ 584
.param vthp= -0.57290

.alter
.param vthn= 0.65865       $ 585
.param vthp= -0.57104

.alter
.param vthn= 0.65856       $ 586
.param vthp= -0.57507

.alter
.param vthn= 0.63478       $ 587
.param vthp= -0.58264

.alter
.param vthn= 0.64532       $ 588
.param vthp= -0.57471

.alter
.param vthn= 0.60845       $ 589
.param vthp= -0.57989

.alter
.param vthn= 0.65035       $ 590
.param vthp= -0.58339

.alter
.param vthn= 0.63408       $ 591
.param vthp= -0.57984

.alter
.param vthn= 0.64385       $ 592
.param vthp= -0.57157

.alter
.param vthn= 0.65728       $ 593
.param vthp= -0.57272

.alter
.param vthn= 0.65521       $ 594
.param vthp= -0.57161

.alter
.param vthn= 0.66227       $ 595
.param vthp= -0.58320

.alter
.param vthn= 0.67115       $ 596
.param vthp= -0.57321

.alter
.param vthn= 0.62642       $ 597
.param vthp= -0.58393

.alter
.param vthn= 0.64285       $ 598
.param vthp= -0.57904

.alter
.param vthn= 0.65130       $ 599
.param vthp= -0.58615

.alter
.param vthn= 0.66270       $ 600
.param vthp= -0.57606

.alter
.param vthn= 0.60133       $ 601
.param vthp= -0.58632

.alter
.param vthn= 0.57606       $ 602
.param vthp= -0.57400

.alter
.param vthn= 0.61206       $ 603
.param vthp= -0.58629

.alter
.param vthn= 0.60381       $ 604
.param vthp= -0.57232

.alter
.param vthn= 0.57816       $ 605
.param vthp= -0.57500

.alter
.param vthn= 0.58804       $ 606
.param vthp= -0.59508

.alter
.param vthn= 0.60277       $ 607
.param vthp= -0.58677

.alter
.param vthn= 0.61663       $ 608
.param vthp= -0.57762

.alter
.param vthn= 0.59448       $ 609
.param vthp= -0.57598

.alter
.param vthn= 0.60713       $ 610
.param vthp= -0.58090

.alter
.param vthn= 0.62779       $ 611
.param vthp= -0.58039

.alter
.param vthn= 0.58818       $ 612
.param vthp= -0.58502

.alter
.param vthn= 0.58994       $ 613
.param vthp= -0.56695

.alter
.param vthn= 0.57934       $ 614
.param vthp= -0.57590

.alter
.param vthn= 0.58144       $ 615
.param vthp= -0.57660

.alter
.param vthn= 0.62083       $ 616
.param vthp= -0.58055

.alter
.param vthn= 0.61963       $ 617
.param vthp= -0.58736

.alter
.param vthn= 0.61210       $ 618
.param vthp= -0.59148

.alter
.param vthn= 0.60430       $ 619
.param vthp= -0.58324

.alter
.param vthn= 0.60552       $ 620
.param vthp= -0.57839

.alter
.param vthn= 0.58016       $ 621
.param vthp= -0.57203

.alter
.param vthn= 0.58708       $ 622
.param vthp= -0.57431

.alter
.param vthn= 0.59691       $ 623
.param vthp= -0.58049

.alter
.param vthn= 0.60385       $ 624
.param vthp= -0.57723

.alter
.param vthn= 0.57333       $ 625
.param vthp= -0.58051

.alter
.param vthn= 0.60218       $ 626
.param vthp= -0.56559

.alter
.param vthn= 0.60358       $ 627
.param vthp= -0.57936

.alter
.param vthn= 0.59161       $ 628
.param vthp= -0.57725

.alter
.param vthn= 0.58878       $ 629
.param vthp= -0.57061

.alter
.param vthn= 0.59459       $ 630
.param vthp= -0.58113

.alter
.param vthn= 0.59942       $ 631
.param vthp= -0.57919

.alter
.param vthn= 0.60355       $ 632
.param vthp= -0.57970

.alter
.param vthn= 0.58143       $ 633
.param vthp= -0.57273

.alter
.param vthn= 0.58077       $ 634
.param vthp= -0.57781

.alter
.param vthn= 0.58271       $ 635
.param vthp= -0.57336

.alter
.param vthn= 0.59133       $ 636
.param vthp= -0.57097

.alter
.param vthn= 0.59972       $ 637
.param vthp= -0.57686

.alter
.param vthn= 0.59555       $ 638
.param vthp= -0.57951

.alter
.param vthn= 0.62748       $ 639
.param vthp= -0.57369

.alter
.param vthn= 0.60011       $ 640
.param vthp= -0.57159

.alter
.param vthn= 0.59108       $ 641
.param vthp= -0.58069

.alter
.param vthn= 0.61450       $ 642
.param vthp= -0.58761

.alter
.param vthn= 0.62159       $ 643
.param vthp= -0.56963

.alter
.param vthn= 0.56477       $ 644
.param vthp= -0.57152

.alter
.param vthn= 0.62178       $ 645
.param vthp= -0.57612

.alter
.param vthn= 0.60322       $ 646
.param vthp= -0.58357

.alter
.param vthn= 0.59178       $ 647
.param vthp= -0.58415

.alter
.param vthn= 0.56445       $ 648
.param vthp= -0.56787

.alter
.param vthn= 0.61580       $ 649
.param vthp= -0.57334

.alter
.param vthn= 0.59853       $ 650
.param vthp= -0.58816

.alter
.param vthn= 0.60383       $ 651
.param vthp= -0.57593

.alter
.param vthn= 0.61498       $ 652
.param vthp= -0.57279

.alter
.param vthn= 0.60252       $ 653
.param vthp= -0.57342

.alter
.param vthn= 0.59438       $ 654
.param vthp= -0.57313

.alter
.param vthn= 0.60327       $ 655
.param vthp= -0.58461

.alter
.param vthn= 0.57497       $ 656
.param vthp= -0.58836

.alter
.param vthn= 0.58818       $ 657
.param vthp= -0.58753

.alter
.param vthn= 0.59325       $ 658
.param vthp= -0.58391

.alter
.param vthn= 0.56940       $ 659
.param vthp= -0.57208

.alter
.param vthn= 0.57597       $ 660
.param vthp= -0.57542

.alter
.param vthn= 0.60471       $ 661
.param vthp= -0.58936

.alter
.param vthn= 0.56861       $ 662
.param vthp= -0.57899

.alter
.param vthn= 0.60014       $ 663
.param vthp= -0.57470

.alter
.param vthn= 0.60880       $ 664
.param vthp= -0.57360

.alter
.param vthn= 0.57521       $ 665
.param vthp= -0.57352

.alter
.param vthn= 0.58745       $ 666
.param vthp= -0.59142

.alter
.param vthn= 0.55205       $ 667
.param vthp= -0.57555

.alter
.param vthn= 0.59403       $ 668
.param vthp= -0.58421

.alter
.param vthn= 0.58467       $ 669
.param vthp= -0.58077

.alter
.param vthn= 0.60982       $ 670
.param vthp= -0.58247

.alter
.param vthn= 0.60688       $ 671
.param vthp= -0.58711

.alter
.param vthn= 0.57872       $ 672
.param vthp= -0.57223

.alter
.param vthn= 0.58488       $ 673
.param vthp= -0.58555

.alter
.param vthn= 0.58473       $ 674
.param vthp= -0.58301

.alter
.param vthn= 0.60449       $ 675
.param vthp= -0.58219

.alter
.param vthn= 0.61302       $ 676
.param vthp= -0.58122

.alter
.param vthn= 0.61136       $ 677
.param vthp= -0.57870

.alter
.param vthn= 0.60309       $ 678
.param vthp= -0.57845

.alter
.param vthn= 0.62834       $ 679
.param vthp= -0.58592

.alter
.param vthn= 0.58880       $ 680
.param vthp= -0.57373

.alter
.param vthn= 0.59660       $ 681
.param vthp= -0.57697

.alter
.param vthn= 0.57021       $ 682
.param vthp= -0.58001

.alter
.param vthn= 0.61299       $ 683
.param vthp= -0.57801

.alter
.param vthn= 0.59390       $ 684
.param vthp= -0.56531

.alter
.param vthn= 0.61971       $ 685
.param vthp= -0.57307

.alter
.param vthn= 0.61481       $ 686
.param vthp= -0.58256

.alter
.param vthn= 0.58948       $ 687
.param vthp= -0.58671

.alter
.param vthn= 0.59217       $ 688
.param vthp= -0.57452

.alter
.param vthn= 0.62184       $ 689
.param vthp= -0.58931

.alter
.param vthn= 0.58865       $ 690
.param vthp= -0.58375

.alter
.param vthn= 0.59883       $ 691
.param vthp= -0.58145

.alter
.param vthn= 0.60406       $ 692
.param vthp= -0.57206

.alter
.param vthn= 0.56764       $ 693
.param vthp= -0.57202

.alter
.param vthn= 0.59186       $ 694
.param vthp= -0.57823

.alter
.param vthn= 0.63491       $ 695
.param vthp= -0.57869

.alter
.param vthn= 0.60127       $ 696
.param vthp= -0.57335

.alter
.param vthn= 0.59941       $ 697
.param vthp= -0.58552

.alter
.param vthn= 0.61066       $ 698
.param vthp= -0.58238

.alter
.param vthn= 0.59264       $ 699
.param vthp= -0.57988

.alter
.param vthn= 0.59501       $ 700
.param vthp= -0.58864

.alter
.param vthn= 0.57764       $ 701
.param vthp= -0.56156

.alter
.param vthn= 0.57840       $ 702
.param vthp= -0.57028

.alter
.param vthn= 0.61502       $ 703
.param vthp= -0.58312

.alter
.param vthn= 0.59951       $ 704
.param vthp= -0.57634

.alter
.param vthn= 0.55746       $ 705
.param vthp= -0.58386

.alter
.param vthn= 0.60191       $ 706
.param vthp= -0.57750

.alter
.param vthn= 0.59072       $ 707
.param vthp= -0.57625

.alter
.param vthn= 0.59126       $ 708
.param vthp= -0.57542

.alter
.param vthn= 0.57691       $ 709
.param vthp= -0.59585

.alter
.param vthn= 0.60221       $ 710
.param vthp= -0.57849

.alter
.param vthn= 0.58709       $ 711
.param vthp= -0.58316

.alter
.param vthn= 0.61350       $ 712
.param vthp= -0.58272

.alter
.param vthn= 0.60287       $ 713
.param vthp= -0.57467

.alter
.param vthn= 0.59229       $ 714
.param vthp= -0.58114

.alter
.param vthn= 0.60059       $ 715
.param vthp= -0.57988

.alter
.param vthn= 0.59453       $ 716
.param vthp= -0.58113

.alter
.param vthn= 0.58629       $ 717
.param vthp= -0.58348

.alter
.param vthn= 0.60072       $ 718
.param vthp= -0.58539

.alter
.param vthn= 0.57220       $ 719
.param vthp= -0.58184

.alter
.param vthn= 0.62529       $ 720
.param vthp= -0.57733

.alter
.param vthn= 0.59029       $ 721
.param vthp= -0.57403

.alter
.param vthn= 0.58452       $ 722
.param vthp= -0.59288

.alter
.param vthn= 0.60416       $ 723
.param vthp= -0.58164

.alter
.param vthn= 0.59883       $ 724
.param vthp= -0.56723

.alter
.param vthn= 0.57179       $ 725
.param vthp= -0.57242

.alter
.param vthn= 0.61460       $ 726
.param vthp= -0.59002

.alter
.param vthn= 0.60306       $ 727
.param vthp= -0.57941

.alter
.param vthn= 0.58406       $ 728
.param vthp= -0.56440

.alter
.param vthn= 0.61125       $ 729
.param vthp= -0.57719

.alter
.param vthn= 0.58674       $ 730
.param vthp= -0.57580

.alter
.param vthn= 0.58270       $ 731
.param vthp= -0.58421

.alter
.param vthn= 0.60932       $ 732
.param vthp= -0.56101

.alter
.param vthn= 0.54856       $ 733
.param vthp= -0.57848

.alter
.param vthn= 0.58608       $ 734
.param vthp= -0.57369

.alter
.param vthn= 0.58893       $ 735
.param vthp= -0.57373

.alter
.param vthn= 0.61481       $ 736
.param vthp= -0.57567

.alter
.param vthn= 0.61255       $ 737
.param vthp= -0.57196

.alter
.param vthn= 0.60636       $ 738
.param vthp= -0.57849

.alter
.param vthn= 0.62572       $ 739
.param vthp= -0.57778

.alter
.param vthn= 0.58958       $ 740
.param vthp= -0.57043

.alter
.param vthn= 0.61462       $ 741
.param vthp= -0.56530

.alter
.param vthn= 0.57027       $ 742
.param vthp= -0.59030

.alter
.param vthn= 0.60986       $ 743
.param vthp= -0.57373

.alter
.param vthn= 0.58670       $ 744
.param vthp= -0.58345

.alter
.param vthn= 0.59081       $ 745
.param vthp= -0.57456

.alter
.param vthn= 0.56995       $ 746
.param vthp= -0.56982

.alter
.param vthn= 0.58231       $ 747
.param vthp= -0.57473

.alter
.param vthn= 0.61742       $ 748
.param vthp= -0.57821

.alter
.param vthn= 0.60851       $ 749
.param vthp= -0.58557

.alter
.param vthn= 0.58667       $ 750
.param vthp= -0.57606

.alter
.param vthn= 0.58359       $ 751
.param vthp= -0.58696

.alter
.param vthn= 0.57818       $ 752
.param vthp= -0.57967

.alter
.param vthn= 0.60723       $ 753
.param vthp= -0.57087

.alter
.param vthn= 0.60933       $ 754
.param vthp= -0.56916

.alter
.param vthn= 0.59877       $ 755
.param vthp= -0.56743

.alter
.param vthn= 0.59373       $ 756
.param vthp= -0.57148

.alter
.param vthn= 0.59815       $ 757
.param vthp= -0.57695

.alter
.param vthn= 0.59315       $ 758
.param vthp= -0.59235

.alter
.param vthn= 0.60280       $ 759
.param vthp= -0.56647

.alter
.param vthn= 0.59340       $ 760
.param vthp= -0.58553

.alter
.param vthn= 0.58696       $ 761
.param vthp= -0.57756

.alter
.param vthn= 0.56146       $ 762
.param vthp= -0.57938

.alter
.param vthn= 0.59609       $ 763
.param vthp= -0.58829

.alter
.param vthn= 0.60041       $ 764
.param vthp= -0.57911

.alter
.param vthn= 0.57761       $ 765
.param vthp= -0.57197

.alter
.param vthn= 0.61587       $ 766
.param vthp= -0.57586

.alter
.param vthn= 0.61062       $ 767
.param vthp= -0.57437

.alter
.param vthn= 0.57718       $ 768
.param vthp= -0.58316

.alter
.param vthn= 0.58374       $ 769
.param vthp= -0.57098

.alter
.param vthn= 0.58898       $ 770
.param vthp= -0.58034

.alter
.param vthn= 0.60488       $ 771
.param vthp= -0.57918

.alter
.param vthn= 0.61717       $ 772
.param vthp= -0.57679

.alter
.param vthn= 0.62086       $ 773
.param vthp= -0.58173

.alter
.param vthn= 0.58009       $ 774
.param vthp= -0.57082

.alter
.param vthn= 0.58069       $ 775
.param vthp= -0.57851

.alter
.param vthn= 0.57254       $ 776
.param vthp= -0.57705

.alter
.param vthn= 0.57263       $ 777
.param vthp= -0.58787

.alter
.param vthn= 0.59975       $ 778
.param vthp= -0.57301

.alter
.param vthn= 0.61196       $ 779
.param vthp= -0.58391

.alter
.param vthn= 0.59952       $ 780
.param vthp= -0.59371

.alter
.param vthn= 0.58121       $ 781
.param vthp= -0.56944

.alter
.param vthn= 0.59827       $ 782
.param vthp= -0.58471

.alter
.param vthn= 0.59952       $ 783
.param vthp= -0.57310

.alter
.param vthn= 0.59038       $ 784
.param vthp= -0.57479

.alter
.param vthn= 0.60183       $ 785
.param vthp= -0.57293

.alter
.param vthn= 0.60174       $ 786
.param vthp= -0.57696

.alter
.param vthn= 0.57796       $ 787
.param vthp= -0.58453

.alter
.param vthn= 0.58850       $ 788
.param vthp= -0.57660

.alter
.param vthn= 0.55163       $ 789
.param vthp= -0.58178

.alter
.param vthn= 0.59353       $ 790
.param vthp= -0.58528

.alter
.param vthn= 0.57726       $ 791
.param vthp= -0.58173

.alter
.param vthn= 0.58703       $ 792
.param vthp= -0.57346

.alter
.param vthn= 0.60046       $ 793
.param vthp= -0.57461

.alter
.param vthn= 0.59839       $ 794
.param vthp= -0.57350

.alter
.param vthn= 0.60545       $ 795
.param vthp= -0.58509

.alter
.param vthn= 0.61433       $ 796
.param vthp= -0.57510

.alter
.param vthn= 0.56960       $ 797
.param vthp= -0.58582

.alter
.param vthn= 0.58603       $ 798
.param vthp= -0.58093

.alter
.param vthn= 0.59448       $ 799
.param vthp= -0.58804

.alter
.param vthn= 0.60588       $ 800
.param vthp= -0.57795

.alter
.param vthn= 0.65834       $ 801
.param vthp= -0.59092

.alter
.param vthn= 0.63307       $ 802
.param vthp= -0.57860

.alter
.param vthn= 0.66907       $ 803
.param vthp= -0.59089

.alter
.param vthn= 0.66082       $ 804
.param vthp= -0.57692

.alter
.param vthn= 0.63517       $ 805
.param vthp= -0.57960

.alter
.param vthn= 0.64505       $ 806
.param vthp= -0.59968

.alter
.param vthn= 0.65978       $ 807
.param vthp= -0.59137

.alter
.param vthn= 0.67364       $ 808
.param vthp= -0.58222

.alter
.param vthn= 0.65149       $ 809
.param vthp= -0.58058

.alter
.param vthn= 0.66414       $ 810
.param vthp= -0.58550

.alter
.param vthn= 0.68480       $ 811
.param vthp= -0.58499

.alter
.param vthn= 0.64519       $ 812
.param vthp= -0.58962

.alter
.param vthn= 0.64695       $ 813
.param vthp= -0.57155

.alter
.param vthn= 0.63635       $ 814
.param vthp= -0.58050

.alter
.param vthn= 0.63845       $ 815
.param vthp= -0.58120

.alter
.param vthn= 0.67784       $ 816
.param vthp= -0.58515

.alter
.param vthn= 0.67664       $ 817
.param vthp= -0.59196

.alter
.param vthn= 0.66911       $ 818
.param vthp= -0.59608

.alter
.param vthn= 0.66131       $ 819
.param vthp= -0.58784

.alter
.param vthn= 0.66253       $ 820
.param vthp= -0.58299

.alter
.param vthn= 0.63717       $ 821
.param vthp= -0.57663

.alter
.param vthn= 0.64409       $ 822
.param vthp= -0.57891

.alter
.param vthn= 0.65392       $ 823
.param vthp= -0.58509

.alter
.param vthn= 0.66086       $ 824
.param vthp= -0.58183

.alter
.param vthn= 0.63034       $ 825
.param vthp= -0.58511

.alter
.param vthn= 0.65919       $ 826
.param vthp= -0.57019

.alter
.param vthn= 0.66059       $ 827
.param vthp= -0.58396

.alter
.param vthn= 0.64862       $ 828
.param vthp= -0.58185

.alter
.param vthn= 0.64579       $ 829
.param vthp= -0.57521

.alter
.param vthn= 0.65160       $ 830
.param vthp= -0.58573

.alter
.param vthn= 0.65643       $ 831
.param vthp= -0.58379

.alter
.param vthn= 0.66056       $ 832
.param vthp= -0.58430

.alter
.param vthn= 0.63844       $ 833
.param vthp= -0.57733

.alter
.param vthn= 0.63778       $ 834
.param vthp= -0.58241

.alter
.param vthn= 0.63972       $ 835
.param vthp= -0.57796

.alter
.param vthn= 0.64834       $ 836
.param vthp= -0.57557

.alter
.param vthn= 0.65673       $ 837
.param vthp= -0.58146

.alter
.param vthn= 0.65256       $ 838
.param vthp= -0.58411

.alter
.param vthn= 0.68449       $ 839
.param vthp= -0.57829

.alter
.param vthn= 0.65712       $ 840
.param vthp= -0.57619

.alter
.param vthn= 0.64809       $ 841
.param vthp= -0.58529

.alter
.param vthn= 0.67151       $ 842
.param vthp= -0.59221

.alter
.param vthn= 0.67860       $ 843
.param vthp= -0.57423

.alter
.param vthn= 0.62178       $ 844
.param vthp= -0.57612

.alter
.param vthn= 0.67879       $ 845
.param vthp= -0.58072

.alter
.param vthn= 0.66023       $ 846
.param vthp= -0.58817

.alter
.param vthn= 0.64879       $ 847
.param vthp= -0.58875

.alter
.param vthn= 0.62146       $ 848
.param vthp= -0.57247

.alter
.param vthn= 0.67281       $ 849
.param vthp= -0.57794

.alter
.param vthn= 0.65554       $ 850
.param vthp= -0.59276

.alter
.param vthn= 0.66084       $ 851
.param vthp= -0.58053

.alter
.param vthn= 0.67199       $ 852
.param vthp= -0.57739

.alter
.param vthn= 0.65953       $ 853
.param vthp= -0.57802

.alter
.param vthn= 0.65139       $ 854
.param vthp= -0.57773

.alter
.param vthn= 0.66028       $ 855
.param vthp= -0.58921

.alter
.param vthn= 0.63198       $ 856
.param vthp= -0.59296

.alter
.param vthn= 0.64519       $ 857
.param vthp= -0.59213

.alter
.param vthn= 0.65026       $ 858
.param vthp= -0.58851

.alter
.param vthn= 0.62641       $ 859
.param vthp= -0.57668

.alter
.param vthn= 0.63298       $ 860
.param vthp= -0.58002

.alter
.param vthn= 0.66172       $ 861
.param vthp= -0.59396

.alter
.param vthn= 0.62562       $ 862
.param vthp= -0.58359

.alter
.param vthn= 0.65715       $ 863
.param vthp= -0.57930

.alter
.param vthn= 0.66581       $ 864
.param vthp= -0.57820

.alter
.param vthn= 0.63222       $ 865
.param vthp= -0.57812

.alter
.param vthn= 0.64446       $ 866
.param vthp= -0.59602

.alter
.param vthn= 0.60906       $ 867
.param vthp= -0.58015

.alter
.param vthn= 0.65104       $ 868
.param vthp= -0.58881

.alter
.param vthn= 0.64168       $ 869
.param vthp= -0.58537

.alter
.param vthn= 0.66683       $ 870
.param vthp= -0.58707

.alter
.param vthn= 0.66389       $ 871
.param vthp= -0.59171

.alter
.param vthn= 0.63573       $ 872
.param vthp= -0.57683

.alter
.param vthn= 0.64189       $ 873
.param vthp= -0.59015

.alter
.param vthn= 0.64174       $ 874
.param vthp= -0.58761

.alter
.param vthn= 0.66150       $ 875
.param vthp= -0.58679

.alter
.param vthn= 0.67003       $ 876
.param vthp= -0.58582

.alter
.param vthn= 0.66837       $ 877
.param vthp= -0.58330

.alter
.param vthn= 0.66010       $ 878
.param vthp= -0.58305

.alter
.param vthn= 0.68535       $ 879
.param vthp= -0.59052

.alter
.param vthn= 0.64581       $ 880
.param vthp= -0.57833

.alter
.param vthn= 0.65361       $ 881
.param vthp= -0.58157

.alter
.param vthn= 0.62722       $ 882
.param vthp= -0.58461

.alter
.param vthn= 0.67000       $ 883
.param vthp= -0.58261

.alter
.param vthn= 0.65091       $ 884
.param vthp= -0.56991

.alter
.param vthn= 0.67672       $ 885
.param vthp= -0.57767

.alter
.param vthn= 0.67182       $ 886
.param vthp= -0.58716

.alter
.param vthn= 0.64649       $ 887
.param vthp= -0.59131

.alter
.param vthn= 0.64918       $ 888
.param vthp= -0.57912

.alter
.param vthn= 0.67885       $ 889
.param vthp= -0.59391

.alter
.param vthn= 0.64566       $ 890
.param vthp= -0.58835

.alter
.param vthn= 0.65584       $ 891
.param vthp= -0.58605

.alter
.param vthn= 0.66107       $ 892
.param vthp= -0.57666

.alter
.param vthn= 0.62465       $ 893
.param vthp= -0.57662

.alter
.param vthn= 0.64887       $ 894
.param vthp= -0.58283

.alter
.param vthn= 0.69192       $ 895
.param vthp= -0.58329

.alter
.param vthn= 0.65828       $ 896
.param vthp= -0.57795

.alter
.param vthn= 0.65642       $ 897
.param vthp= -0.59012

.alter
.param vthn= 0.66767       $ 898
.param vthp= -0.58698

.alter
.param vthn= 0.64965       $ 899
.param vthp= -0.58448

.alter
.param vthn= 0.65202       $ 900
.param vthp= -0.59324

.alter
.param vthn= 0.63465       $ 901
.param vthp= -0.56616

.alter
.param vthn= 0.63541       $ 902
.param vthp= -0.57488

.alter
.param vthn= 0.67203       $ 903
.param vthp= -0.58772

.alter
.param vthn= 0.65652       $ 904
.param vthp= -0.58094

.alter
.param vthn= 0.61447       $ 905
.param vthp= -0.58846

.alter
.param vthn= 0.65892       $ 906
.param vthp= -0.58210

.alter
.param vthn= 0.64773       $ 907
.param vthp= -0.58085

.alter
.param vthn= 0.64827       $ 908
.param vthp= -0.58002

.alter
.param vthn= 0.63392       $ 909
.param vthp= -0.60045

.alter
.param vthn= 0.65922       $ 910
.param vthp= -0.58309

.alter
.param vthn= 0.64410       $ 911
.param vthp= -0.58776

.alter
.param vthn= 0.67051       $ 912
.param vthp= -0.58732

.alter
.param vthn= 0.65988       $ 913
.param vthp= -0.57927

.alter
.param vthn= 0.64930       $ 914
.param vthp= -0.58574

.alter
.param vthn= 0.65760       $ 915
.param vthp= -0.58448

.alter
.param vthn= 0.65154       $ 916
.param vthp= -0.58573

.alter
.param vthn= 0.64330       $ 917
.param vthp= -0.58808

.alter
.param vthn= 0.65773       $ 918
.param vthp= -0.58999

.alter
.param vthn= 0.62921       $ 919
.param vthp= -0.58644

.alter
.param vthn= 0.68230       $ 920
.param vthp= -0.58193

.alter
.param vthn= 0.64730       $ 921
.param vthp= -0.57863

.alter
.param vthn= 0.64153       $ 922
.param vthp= -0.59748

.alter
.param vthn= 0.66117       $ 923
.param vthp= -0.58624

.alter
.param vthn= 0.65584       $ 924
.param vthp= -0.57183

.alter
.param vthn= 0.62880       $ 925
.param vthp= -0.57702

.alter
.param vthn= 0.67161       $ 926
.param vthp= -0.59462

.alter
.param vthn= 0.66007       $ 927
.param vthp= -0.58401

.alter
.param vthn= 0.64107       $ 928
.param vthp= -0.56900

.alter
.param vthn= 0.66826       $ 929
.param vthp= -0.58179

.alter
.param vthn= 0.64375       $ 930
.param vthp= -0.58040

.alter
.param vthn= 0.63971       $ 931
.param vthp= -0.58881

.alter
.param vthn= 0.66633       $ 932
.param vthp= -0.56561

.alter
.param vthn= 0.60557       $ 933
.param vthp= -0.58308

.alter
.param vthn= 0.64309       $ 934
.param vthp= -0.57829

.alter
.param vthn= 0.64594       $ 935
.param vthp= -0.57833

.alter
.param vthn= 0.67182       $ 936
.param vthp= -0.58027

.alter
.param vthn= 0.66956       $ 937
.param vthp= -0.57656

.alter
.param vthn= 0.66337       $ 938
.param vthp= -0.58309

.alter
.param vthn= 0.68273       $ 939
.param vthp= -0.58238

.alter
.param vthn= 0.64659       $ 940
.param vthp= -0.57503

.alter
.param vthn= 0.67163       $ 941
.param vthp= -0.56990

.alter
.param vthn= 0.62728       $ 942
.param vthp= -0.59490

.alter
.param vthn= 0.66687       $ 943
.param vthp= -0.57833

.alter
.param vthn= 0.64371       $ 944
.param vthp= -0.58805

.alter
.param vthn= 0.64782       $ 945
.param vthp= -0.57916

.alter
.param vthn= 0.62696       $ 946
.param vthp= -0.57442

.alter
.param vthn= 0.63932       $ 947
.param vthp= -0.57933

.alter
.param vthn= 0.67443       $ 948
.param vthp= -0.58281

.alter
.param vthn= 0.66552       $ 949
.param vthp= -0.59017

.alter
.param vthn= 0.64368       $ 950
.param vthp= -0.58066

.alter
.param vthn= 0.64060       $ 951
.param vthp= -0.59156

.alter
.param vthn= 0.63519       $ 952
.param vthp= -0.58427

.alter
.param vthn= 0.66424       $ 953
.param vthp= -0.57547

.alter
.param vthn= 0.66634       $ 954
.param vthp= -0.57376

.alter
.param vthn= 0.65578       $ 955
.param vthp= -0.57203

.alter
.param vthn= 0.65074       $ 956
.param vthp= -0.57608

.alter
.param vthn= 0.65516       $ 957
.param vthp= -0.58155

.alter
.param vthn= 0.65016       $ 958
.param vthp= -0.59695

.alter
.param vthn= 0.65981       $ 959
.param vthp= -0.57107

.alter
.param vthn= 0.65041       $ 960
.param vthp= -0.59013

.alter
.param vthn= 0.64397       $ 961
.param vthp= -0.58216

.alter
.param vthn= 0.61847       $ 962
.param vthp= -0.58398

.alter
.param vthn= 0.65310       $ 963
.param vthp= -0.59289

.alter
.param vthn= 0.65742       $ 964
.param vthp= -0.58371

.alter
.param vthn= 0.63462       $ 965
.param vthp= -0.57657

.alter
.param vthn= 0.67288       $ 966
.param vthp= -0.58046

.alter
.param vthn= 0.66763       $ 967
.param vthp= -0.57897

.alter
.param vthn= 0.63419       $ 968
.param vthp= -0.58776

.alter
.param vthn= 0.64075       $ 969
.param vthp= -0.57558

.alter
.param vthn= 0.64599       $ 970
.param vthp= -0.58494

.alter
.param vthn= 0.66189       $ 971
.param vthp= -0.58378

.alter
.param vthn= 0.67418       $ 972
.param vthp= -0.58139

.alter
.param vthn= 0.67787       $ 973
.param vthp= -0.58633

.alter
.param vthn= 0.63710       $ 974
.param vthp= -0.57542

.alter
.param vthn= 0.63770       $ 975
.param vthp= -0.58311

.alter
.param vthn= 0.62955       $ 976
.param vthp= -0.58165

.alter
.param vthn= 0.62964       $ 977
.param vthp= -0.59247

.alter
.param vthn= 0.65676       $ 978
.param vthp= -0.57761

.alter
.param vthn= 0.66897       $ 979
.param vthp= -0.58851

.alter
.param vthn= 0.65653       $ 980
.param vthp= -0.59831

.alter
.param vthn= 0.63822       $ 981
.param vthp= -0.57404

.alter
.param vthn= 0.65528       $ 982
.param vthp= -0.58931

.alter
.param vthn= 0.65653       $ 983
.param vthp= -0.57770

.alter
.param vthn= 0.64739       $ 984
.param vthp= -0.57939

.alter
.param vthn= 0.65884       $ 985
.param vthp= -0.57753

.alter
.param vthn= 0.65875       $ 986
.param vthp= -0.58156

.alter
.param vthn= 0.63497       $ 987
.param vthp= -0.58913

.alter
.param vthn= 0.64551       $ 988
.param vthp= -0.58120

.alter
.param vthn= 0.60864       $ 989
.param vthp= -0.58638

.alter
.param vthn= 0.65054       $ 990
.param vthp= -0.58988

.alter
.param vthn= 0.63427       $ 991
.param vthp= -0.58633

.alter
.param vthn= 0.64404       $ 992
.param vthp= -0.57806

.alter
.param vthn= 0.65747       $ 993
.param vthp= -0.57921

.alter
.param vthn= 0.65540       $ 994
.param vthp= -0.57810

.alter
.param vthn= 0.66246       $ 995
.param vthp= -0.58969

.alter
.param vthn= 0.67134       $ 996
.param vthp= -0.57970

.alter
.param vthn= 0.62661       $ 997
.param vthp= -0.59042

.alter
.param vthn= 0.64304       $ 998
.param vthp= -0.58553

.alter
.param vthn= 0.65149       $ 999
.param vthp= -0.59264

.alter
.param vthn= 0.66289       $ 1000
.param vthp= -0.58255

.alter
.param vthn= 0.63978       $ 1001
.param vthp= -0.59837

.alter
.param vthn= 0.61451       $ 1002
.param vthp= -0.58605

.alter
.param vthn= 0.65051       $ 1003
.param vthp= -0.59834

.alter
.param vthn= 0.64226       $ 1004
.param vthp= -0.58437

.alter
.param vthn= 0.61661       $ 1005
.param vthp= -0.58705

.alter
.param vthn= 0.62649       $ 1006
.param vthp= -0.60713

.alter
.param vthn= 0.64122       $ 1007
.param vthp= -0.59882

.alter
.param vthn= 0.65508       $ 1008
.param vthp= -0.58967

.alter
.param vthn= 0.63293       $ 1009
.param vthp= -0.58803

.alter
.param vthn= 0.64558       $ 1010
.param vthp= -0.59295

.alter
.param vthn= 0.66624       $ 1011
.param vthp= -0.59244

.alter
.param vthn= 0.62663       $ 1012
.param vthp= -0.59707

.alter
.param vthn= 0.62839       $ 1013
.param vthp= -0.57900

.alter
.param vthn= 0.61779       $ 1014
.param vthp= -0.58795

.alter
.param vthn= 0.61989       $ 1015
.param vthp= -0.58865

.alter
.param vthn= 0.65928       $ 1016
.param vthp= -0.59260

.alter
.param vthn= 0.65808       $ 1017
.param vthp= -0.59941

.alter
.param vthn= 0.65055       $ 1018
.param vthp= -0.60353

.alter
.param vthn= 0.64275       $ 1019
.param vthp= -0.59529

.alter
.param vthn= 0.64397       $ 1020
.param vthp= -0.59044

.alter
.param vthn= 0.61861       $ 1021
.param vthp= -0.58408

.alter
.param vthn= 0.62553       $ 1022
.param vthp= -0.58636

.alter
.param vthn= 0.63536       $ 1023
.param vthp= -0.59254

.alter
.param vthn= 0.64230       $ 1024
.param vthp= -0.58928

.alter
.param vthn= 0.61178       $ 1025
.param vthp= -0.59256

.alter
.param vthn= 0.64063       $ 1026
.param vthp= -0.57764

.alter
.param vthn= 0.64203       $ 1027
.param vthp= -0.59141

.alter
.param vthn= 0.63006       $ 1028
.param vthp= -0.58930

.alter
.param vthn= 0.62723       $ 1029
.param vthp= -0.58266

.alter
.param vthn= 0.63304       $ 1030
.param vthp= -0.59318

.alter
.param vthn= 0.63787       $ 1031
.param vthp= -0.59124

.alter
.param vthn= 0.64200       $ 1032
.param vthp= -0.59175

.alter
.param vthn= 0.61988       $ 1033
.param vthp= -0.58478

.alter
.param vthn= 0.61922       $ 1034
.param vthp= -0.58986

.alter
.param vthn= 0.62116       $ 1035
.param vthp= -0.58541

.alter
.param vthn= 0.62978       $ 1036
.param vthp= -0.58302

.alter
.param vthn= 0.63817       $ 1037
.param vthp= -0.58891

.alter
.param vthn= 0.63400       $ 1038
.param vthp= -0.59156

.alter
.param vthn= 0.66593       $ 1039
.param vthp= -0.58574

.alter
.param vthn= 0.63856       $ 1040
.param vthp= -0.58364

.alter
.param vthn= 0.62953       $ 1041
.param vthp= -0.59274

.alter
.param vthn= 0.65295       $ 1042
.param vthp= -0.59966

.alter
.param vthn= 0.66004       $ 1043
.param vthp= -0.58168

.alter
.param vthn= 0.60322       $ 1044
.param vthp= -0.58357

.alter
.param vthn= 0.66023       $ 1045
.param vthp= -0.58817

.alter
.param vthn= 0.64167       $ 1046
.param vthp= -0.59562

.alter
.param vthn= 0.63023       $ 1047
.param vthp= -0.59620

.alter
.param vthn= 0.60290       $ 1048
.param vthp= -0.57992

.alter
.param vthn= 0.65425       $ 1049
.param vthp= -0.58539

.alter
.param vthn= 0.63698       $ 1050
.param vthp= -0.60021

.alter
.param vthn= 0.64228       $ 1051
.param vthp= -0.58798

.alter
.param vthn= 0.65343       $ 1052
.param vthp= -0.58484

.alter
.param vthn= 0.64097       $ 1053
.param vthp= -0.58547

.alter
.param vthn= 0.63283       $ 1054
.param vthp= -0.58518

.alter
.param vthn= 0.64172       $ 1055
.param vthp= -0.59666

.alter
.param vthn= 0.61342       $ 1056
.param vthp= -0.60041

.alter
.param vthn= 0.62663       $ 1057
.param vthp= -0.59958

.alter
.param vthn= 0.63170       $ 1058
.param vthp= -0.59596

.alter
.param vthn= 0.60785       $ 1059
.param vthp= -0.58413

.alter
.param vthn= 0.61442       $ 1060
.param vthp= -0.58747

.alter
.param vthn= 0.64316       $ 1061
.param vthp= -0.60141

.alter
.param vthn= 0.60706       $ 1062
.param vthp= -0.59104

.alter
.param vthn= 0.63859       $ 1063
.param vthp= -0.58675

.alter
.param vthn= 0.64725       $ 1064
.param vthp= -0.58565

.alter
.param vthn= 0.61366       $ 1065
.param vthp= -0.58557

.alter
.param vthn= 0.62590       $ 1066
.param vthp= -0.60347

.alter
.param vthn= 0.59050       $ 1067
.param vthp= -0.58760

.alter
.param vthn= 0.63248       $ 1068
.param vthp= -0.59626

.alter
.param vthn= 0.62312       $ 1069
.param vthp= -0.59282

.alter
.param vthn= 0.64827       $ 1070
.param vthp= -0.59452

.alter
.param vthn= 0.64533       $ 1071
.param vthp= -0.59916

.alter
.param vthn= 0.61717       $ 1072
.param vthp= -0.58428

.alter
.param vthn= 0.62333       $ 1073
.param vthp= -0.59760

.alter
.param vthn= 0.62318       $ 1074
.param vthp= -0.59506

.alter
.param vthn= 0.64294       $ 1075
.param vthp= -0.59424

.alter
.param vthn= 0.65147       $ 1076
.param vthp= -0.59327

.alter
.param vthn= 0.64981       $ 1077
.param vthp= -0.59075

.alter
.param vthn= 0.64154       $ 1078
.param vthp= -0.59050

.alter
.param vthn= 0.66679       $ 1079
.param vthp= -0.59797

.alter
.param vthn= 0.62725       $ 1080
.param vthp= -0.58578

.alter
.param vthn= 0.63505       $ 1081
.param vthp= -0.58902

.alter
.param vthn= 0.60866       $ 1082
.param vthp= -0.59206

.alter
.param vthn= 0.65144       $ 1083
.param vthp= -0.59006

.alter
.param vthn= 0.63235       $ 1084
.param vthp= -0.57736

.alter
.param vthn= 0.65816       $ 1085
.param vthp= -0.58512

.alter
.param vthn= 0.65326       $ 1086
.param vthp= -0.59461

.alter
.param vthn= 0.62793       $ 1087
.param vthp= -0.59876

.alter
.param vthn= 0.63062       $ 1088
.param vthp= -0.58657

.alter
.param vthn= 0.66029       $ 1089
.param vthp= -0.60136

.alter
.param vthn= 0.62710       $ 1090
.param vthp= -0.59580

.alter
.param vthn= 0.63728       $ 1091
.param vthp= -0.59350

.alter
.param vthn= 0.64251       $ 1092
.param vthp= -0.58411

.alter
.param vthn= 0.60609       $ 1093
.param vthp= -0.58407

.alter
.param vthn= 0.63031       $ 1094
.param vthp= -0.59028

.alter
.param vthn= 0.67336       $ 1095
.param vthp= -0.59074

.alter
.param vthn= 0.63972       $ 1096
.param vthp= -0.58540

.alter
.param vthn= 0.63786       $ 1097
.param vthp= -0.59757

.alter
.param vthn= 0.64911       $ 1098
.param vthp= -0.59443

.alter
.param vthn= 0.63109       $ 1099
.param vthp= -0.59193

.alter
.param vthn= 0.63346       $ 1100
.param vthp= -0.60069

.alter
.param vthn= 0.61609       $ 1101
.param vthp= -0.57361

.alter
.param vthn= 0.61685       $ 1102
.param vthp= -0.58233

.alter
.param vthn= 0.65347       $ 1103
.param vthp= -0.59517

.alter
.param vthn= 0.63796       $ 1104
.param vthp= -0.58839

.alter
.param vthn= 0.59591       $ 1105
.param vthp= -0.59591

.alter
.param vthn= 0.64036       $ 1106
.param vthp= -0.58955

.alter
.param vthn= 0.62917       $ 1107
.param vthp= -0.58830

.alter
.param vthn= 0.62971       $ 1108
.param vthp= -0.58747

.alter
.param vthn= 0.61536       $ 1109
.param vthp= -0.60790

.alter
.param vthn= 0.64066       $ 1110
.param vthp= -0.59054

.alter
.param vthn= 0.62554       $ 1111
.param vthp= -0.59521

.alter
.param vthn= 0.65195       $ 1112
.param vthp= -0.59477

.alter
.param vthn= 0.64132       $ 1113
.param vthp= -0.58672

.alter
.param vthn= 0.63074       $ 1114
.param vthp= -0.59319

.alter
.param vthn= 0.63904       $ 1115
.param vthp= -0.59193

.alter
.param vthn= 0.63298       $ 1116
.param vthp= -0.59318

.alter
.param vthn= 0.62474       $ 1117
.param vthp= -0.59553

.alter
.param vthn= 0.63917       $ 1118
.param vthp= -0.59744

.alter
.param vthn= 0.61065       $ 1119
.param vthp= -0.59389

.alter
.param vthn= 0.66374       $ 1120
.param vthp= -0.58938

.alter
.param vthn= 0.62874       $ 1121
.param vthp= -0.58608

.alter
.param vthn= 0.62297       $ 1122
.param vthp= -0.60493

.alter
.param vthn= 0.64261       $ 1123
.param vthp= -0.59369

.alter
.param vthn= 0.63728       $ 1124
.param vthp= -0.57928

.alter
.param vthn= 0.61024       $ 1125
.param vthp= -0.58447

.alter
.param vthn= 0.65305       $ 1126
.param vthp= -0.60207

.alter
.param vthn= 0.64151       $ 1127
.param vthp= -0.59146

.alter
.param vthn= 0.62251       $ 1128
.param vthp= -0.57645

.alter
.param vthn= 0.64970       $ 1129
.param vthp= -0.58924

.alter
.param vthn= 0.62519       $ 1130
.param vthp= -0.58785

.alter
.param vthn= 0.62115       $ 1131
.param vthp= -0.59626

.alter
.param vthn= 0.64777       $ 1132
.param vthp= -0.57306

.alter
.param vthn= 0.58701       $ 1133
.param vthp= -0.59053

.alter
.param vthn= 0.62453       $ 1134
.param vthp= -0.58574

.alter
.param vthn= 0.62738       $ 1135
.param vthp= -0.58578

.alter
.param vthn= 0.65326       $ 1136
.param vthp= -0.58772

.alter
.param vthn= 0.65100       $ 1137
.param vthp= -0.58401

.alter
.param vthn= 0.64481       $ 1138
.param vthp= -0.59054

.alter
.param vthn= 0.66417       $ 1139
.param vthp= -0.58983

.alter
.param vthn= 0.62803       $ 1140
.param vthp= -0.58248

.alter
.param vthn= 0.65307       $ 1141
.param vthp= -0.57735

.alter
.param vthn= 0.60872       $ 1142
.param vthp= -0.60235

.alter
.param vthn= 0.64831       $ 1143
.param vthp= -0.58578

.alter
.param vthn= 0.62515       $ 1144
.param vthp= -0.59550

.alter
.param vthn= 0.62926       $ 1145
.param vthp= -0.58661

.alter
.param vthn= 0.60840       $ 1146
.param vthp= -0.58187

.alter
.param vthn= 0.62076       $ 1147
.param vthp= -0.58678

.alter
.param vthn= 0.65587       $ 1148
.param vthp= -0.59026

.alter
.param vthn= 0.64696       $ 1149
.param vthp= -0.59762

.alter
.param vthn= 0.62512       $ 1150
.param vthp= -0.58811

.alter
.param vthn= 0.62204       $ 1151
.param vthp= -0.59901

.alter
.param vthn= 0.61663       $ 1152
.param vthp= -0.59172

.alter
.param vthn= 0.64568       $ 1153
.param vthp= -0.58292

.alter
.param vthn= 0.64778       $ 1154
.param vthp= -0.58121

.alter
.param vthn= 0.63722       $ 1155
.param vthp= -0.57948

.alter
.param vthn= 0.63218       $ 1156
.param vthp= -0.58353

.alter
.param vthn= 0.63660       $ 1157
.param vthp= -0.58900

.alter
.param vthn= 0.63160       $ 1158
.param vthp= -0.60440

.alter
.param vthn= 0.64125       $ 1159
.param vthp= -0.57852

.alter
.param vthn= 0.63185       $ 1160
.param vthp= -0.59758

.alter
.param vthn= 0.62541       $ 1161
.param vthp= -0.58961

.alter
.param vthn= 0.59991       $ 1162
.param vthp= -0.59143

.alter
.param vthn= 0.63454       $ 1163
.param vthp= -0.60034

.alter
.param vthn= 0.63886       $ 1164
.param vthp= -0.59116

.alter
.param vthn= 0.61606       $ 1165
.param vthp= -0.58402

.alter
.param vthn= 0.65432       $ 1166
.param vthp= -0.58791

.alter
.param vthn= 0.64907       $ 1167
.param vthp= -0.58642

.alter
.param vthn= 0.61563       $ 1168
.param vthp= -0.59521

.alter
.param vthn= 0.62219       $ 1169
.param vthp= -0.58303

.alter
.param vthn= 0.62743       $ 1170
.param vthp= -0.59239

.alter
.param vthn= 0.64333       $ 1171
.param vthp= -0.59123

.alter
.param vthn= 0.65562       $ 1172
.param vthp= -0.58884

.alter
.param vthn= 0.65931       $ 1173
.param vthp= -0.59378

.alter
.param vthn= 0.61854       $ 1174
.param vthp= -0.58287

.alter
.param vthn= 0.61914       $ 1175
.param vthp= -0.59056

.alter
.param vthn= 0.61099       $ 1176
.param vthp= -0.58910

.alter
.param vthn= 0.61108       $ 1177
.param vthp= -0.59992

.alter
.param vthn= 0.63820       $ 1178
.param vthp= -0.58506

.alter
.param vthn= 0.65041       $ 1179
.param vthp= -0.59596

.alter
.param vthn= 0.63797       $ 1180
.param vthp= -0.60576

.alter
.param vthn= 0.61966       $ 1181
.param vthp= -0.58149

.alter
.param vthn= 0.63672       $ 1182
.param vthp= -0.59676

.alter
.param vthn= 0.63797       $ 1183
.param vthp= -0.58515

.alter
.param vthn= 0.62883       $ 1184
.param vthp= -0.58684

.alter
.param vthn= 0.64028       $ 1185
.param vthp= -0.58498

.alter
.param vthn= 0.64019       $ 1186
.param vthp= -0.58901

.alter
.param vthn= 0.61641       $ 1187
.param vthp= -0.59658

.alter
.param vthn= 0.62695       $ 1188
.param vthp= -0.58865

.alter
.param vthn= 0.59008       $ 1189
.param vthp= -0.59383

.alter
.param vthn= 0.63198       $ 1190
.param vthp= -0.59733

.alter
.param vthn= 0.61571       $ 1191
.param vthp= -0.59378

.alter
.param vthn= 0.62548       $ 1192
.param vthp= -0.58551

.alter
.param vthn= 0.63891       $ 1193
.param vthp= -0.58666

.alter
.param vthn= 0.63684       $ 1194
.param vthp= -0.58555

.alter
.param vthn= 0.64390       $ 1195
.param vthp= -0.59714

.alter
.param vthn= 0.65278       $ 1196
.param vthp= -0.58715

.alter
.param vthn= 0.60805       $ 1197
.param vthp= -0.59787

.alter
.param vthn= 0.62448       $ 1198
.param vthp= -0.59298

.alter
.param vthn= 0.63293       $ 1199
.param vthp= -0.60009

.alter
.param vthn= 0.64433       $ 1200
.param vthp= -0.59000

.alter
.param vthn= 0.62834       $ 1201
.param vthp= -0.59895

.alter
.param vthn= 0.60307       $ 1202
.param vthp= -0.58663

.alter
.param vthn= 0.63907       $ 1203
.param vthp= -0.59892

.alter
.param vthn= 0.63082       $ 1204
.param vthp= -0.58495

.alter
.param vthn= 0.60517       $ 1205
.param vthp= -0.58763

.alter
.param vthn= 0.61505       $ 1206
.param vthp= -0.60771

.alter
.param vthn= 0.62978       $ 1207
.param vthp= -0.59940

.alter
.param vthn= 0.64364       $ 1208
.param vthp= -0.59025

.alter
.param vthn= 0.62149       $ 1209
.param vthp= -0.58861

.alter
.param vthn= 0.63414       $ 1210
.param vthp= -0.59353

.alter
.param vthn= 0.65480       $ 1211
.param vthp= -0.59302

.alter
.param vthn= 0.61519       $ 1212
.param vthp= -0.59765

.alter
.param vthn= 0.61695       $ 1213
.param vthp= -0.57958

.alter
.param vthn= 0.60635       $ 1214
.param vthp= -0.58853

.alter
.param vthn= 0.60845       $ 1215
.param vthp= -0.58923

.alter
.param vthn= 0.64784       $ 1216
.param vthp= -0.59318

.alter
.param vthn= 0.64664       $ 1217
.param vthp= -0.59999

.alter
.param vthn= 0.63911       $ 1218
.param vthp= -0.60411

.alter
.param vthn= 0.63131       $ 1219
.param vthp= -0.59587

.alter
.param vthn= 0.63253       $ 1220
.param vthp= -0.59102

.alter
.param vthn= 0.60717       $ 1221
.param vthp= -0.58466

.alter
.param vthn= 0.61409       $ 1222
.param vthp= -0.58694

.alter
.param vthn= 0.62392       $ 1223
.param vthp= -0.59312

.alter
.param vthn= 0.63086       $ 1224
.param vthp= -0.58986

.alter
.param vthn= 0.60034       $ 1225
.param vthp= -0.59314

.alter
.param vthn= 0.62919       $ 1226
.param vthp= -0.57822

.alter
.param vthn= 0.63059       $ 1227
.param vthp= -0.59199

.alter
.param vthn= 0.61862       $ 1228
.param vthp= -0.58988

.alter
.param vthn= 0.61579       $ 1229
.param vthp= -0.58324

.alter
.param vthn= 0.62160       $ 1230
.param vthp= -0.59376

.alter
.param vthn= 0.62643       $ 1231
.param vthp= -0.59182

.alter
.param vthn= 0.63056       $ 1232
.param vthp= -0.59233

.alter
.param vthn= 0.60844       $ 1233
.param vthp= -0.58536

.alter
.param vthn= 0.60778       $ 1234
.param vthp= -0.59044

.alter
.param vthn= 0.60972       $ 1235
.param vthp= -0.58599

.alter
.param vthn= 0.61834       $ 1236
.param vthp= -0.58360

.alter
.param vthn= 0.62673       $ 1237
.param vthp= -0.58949

.alter
.param vthn= 0.62256       $ 1238
.param vthp= -0.59214

.alter
.param vthn= 0.65449       $ 1239
.param vthp= -0.58632

.alter
.param vthn= 0.62712       $ 1240
.param vthp= -0.58422

.alter
.param vthn= 0.61809       $ 1241
.param vthp= -0.59332

.alter
.param vthn= 0.64151       $ 1242
.param vthp= -0.60024

.alter
.param vthn= 0.64860       $ 1243
.param vthp= -0.58226

.alter
.param vthn= 0.59178       $ 1244
.param vthp= -0.58415

.alter
.param vthn= 0.64879       $ 1245
.param vthp= -0.58875

.alter
.param vthn= 0.63023       $ 1246
.param vthp= -0.59620

.alter
.param vthn= 0.61879       $ 1247
.param vthp= -0.59678

.alter
.param vthn= 0.59146       $ 1248
.param vthp= -0.58050

.alter
.param vthn= 0.64281       $ 1249
.param vthp= -0.58597

.alter
.param vthn= 0.62554       $ 1250
.param vthp= -0.60079

.alter
.param vthn= 0.63084       $ 1251
.param vthp= -0.58856

.alter
.param vthn= 0.64199       $ 1252
.param vthp= -0.58542

.alter
.param vthn= 0.62953       $ 1253
.param vthp= -0.58605

.alter
.param vthn= 0.62139       $ 1254
.param vthp= -0.58576

.alter
.param vthn= 0.63028       $ 1255
.param vthp= -0.59724

.alter
.param vthn= 0.60198       $ 1256
.param vthp= -0.60099

.alter
.param vthn= 0.61519       $ 1257
.param vthp= -0.60016

.alter
.param vthn= 0.62026       $ 1258
.param vthp= -0.59654

.alter
.param vthn= 0.59641       $ 1259
.param vthp= -0.58471

.alter
.param vthn= 0.60298       $ 1260
.param vthp= -0.58805

.alter
.param vthn= 0.63172       $ 1261
.param vthp= -0.60199

.alter
.param vthn= 0.59562       $ 1262
.param vthp= -0.59162

.alter
.param vthn= 0.62715       $ 1263
.param vthp= -0.58733

.alter
.param vthn= 0.63581       $ 1264
.param vthp= -0.58623

.alter
.param vthn= 0.60222       $ 1265
.param vthp= -0.58615

.alter
.param vthn= 0.61446       $ 1266
.param vthp= -0.60405

.alter
.param vthn= 0.57906       $ 1267
.param vthp= -0.58818

.alter
.param vthn= 0.62104       $ 1268
.param vthp= -0.59684

.alter
.param vthn= 0.61168       $ 1269
.param vthp= -0.59340

.alter
.param vthn= 0.63683       $ 1270
.param vthp= -0.59510

.alter
.param vthn= 0.63389       $ 1271
.param vthp= -0.59974

.alter
.param vthn= 0.60573       $ 1272
.param vthp= -0.58486

.alter
.param vthn= 0.61189       $ 1273
.param vthp= -0.59818

.alter
.param vthn= 0.61174       $ 1274
.param vthp= -0.59564

.alter
.param vthn= 0.63150       $ 1275
.param vthp= -0.59482

.alter
.param vthn= 0.64003       $ 1276
.param vthp= -0.59385

.alter
.param vthn= 0.63837       $ 1277
.param vthp= -0.59133

.alter
.param vthn= 0.63010       $ 1278
.param vthp= -0.59108

.alter
.param vthn= 0.65535       $ 1279
.param vthp= -0.59855

.alter
.param vthn= 0.61581       $ 1280
.param vthp= -0.58636

.alter
.param vthn= 0.62361       $ 1281
.param vthp= -0.58960

.alter
.param vthn= 0.59722       $ 1282
.param vthp= -0.59264

.alter
.param vthn= 0.64000       $ 1283
.param vthp= -0.59064

.alter
.param vthn= 0.62091       $ 1284
.param vthp= -0.57794

.alter
.param vthn= 0.64672       $ 1285
.param vthp= -0.58570

.alter
.param vthn= 0.64182       $ 1286
.param vthp= -0.59519

.alter
.param vthn= 0.61649       $ 1287
.param vthp= -0.59934

.alter
.param vthn= 0.61918       $ 1288
.param vthp= -0.58715

.alter
.param vthn= 0.64885       $ 1289
.param vthp= -0.60194

.alter
.param vthn= 0.61566       $ 1290
.param vthp= -0.59638

.alter
.param vthn= 0.62584       $ 1291
.param vthp= -0.59408

.alter
.param vthn= 0.63107       $ 1292
.param vthp= -0.58469

.alter
.param vthn= 0.59465       $ 1293
.param vthp= -0.58465

.alter
.param vthn= 0.61887       $ 1294
.param vthp= -0.59086

.alter
.param vthn= 0.66192       $ 1295
.param vthp= -0.59132

.alter
.param vthn= 0.62828       $ 1296
.param vthp= -0.58598

.alter
.param vthn= 0.62642       $ 1297
.param vthp= -0.59815

.alter
.param vthn= 0.63767       $ 1298
.param vthp= -0.59501

.alter
.param vthn= 0.61965       $ 1299
.param vthp= -0.59251

.alter
.param vthn= 0.62202       $ 1300
.param vthp= -0.60127

.alter
.param vthn= 0.60465       $ 1301
.param vthp= -0.57419

.alter
.param vthn= 0.60541       $ 1302
.param vthp= -0.58291

.alter
.param vthn= 0.64203       $ 1303
.param vthp= -0.59575

.alter
.param vthn= 0.62652       $ 1304
.param vthp= -0.58897

.alter
.param vthn= 0.58447       $ 1305
.param vthp= -0.59649

.alter
.param vthn= 0.62892       $ 1306
.param vthp= -0.59013

.alter
.param vthn= 0.61773       $ 1307
.param vthp= -0.58888

.alter
.param vthn= 0.61827       $ 1308
.param vthp= -0.58805

.alter
.param vthn= 0.60392       $ 1309
.param vthp= -0.60848

.alter
.param vthn= 0.62922       $ 1310
.param vthp= -0.59112

.alter
.param vthn= 0.61410       $ 1311
.param vthp= -0.59579

.alter
.param vthn= 0.64051       $ 1312
.param vthp= -0.59535

.alter
.param vthn= 0.62988       $ 1313
.param vthp= -0.58730

.alter
.param vthn= 0.61930       $ 1314
.param vthp= -0.59377

.alter
.param vthn= 0.62760       $ 1315
.param vthp= -0.59251

.alter
.param vthn= 0.62154       $ 1316
.param vthp= -0.59376

.alter
.param vthn= 0.61330       $ 1317
.param vthp= -0.59611

.alter
.param vthn= 0.62773       $ 1318
.param vthp= -0.59802

.alter
.param vthn= 0.59921       $ 1319
.param vthp= -0.59447

.alter
.param vthn= 0.65230       $ 1320
.param vthp= -0.58996

.alter
.param vthn= 0.61730       $ 1321
.param vthp= -0.58666

.alter
.param vthn= 0.61153       $ 1322
.param vthp= -0.60551

.alter
.param vthn= 0.63117       $ 1323
.param vthp= -0.59427

.alter
.param vthn= 0.62584       $ 1324
.param vthp= -0.57986

.alter
.param vthn= 0.59880       $ 1325
.param vthp= -0.58505

.alter
.param vthn= 0.64161       $ 1326
.param vthp= -0.60265

.alter
.param vthn= 0.63007       $ 1327
.param vthp= -0.59204

.alter
.param vthn= 0.61107       $ 1328
.param vthp= -0.57703

.alter
.param vthn= 0.63826       $ 1329
.param vthp= -0.58982

.alter
.param vthn= 0.61375       $ 1330
.param vthp= -0.58843

.alter
.param vthn= 0.60971       $ 1331
.param vthp= -0.59684

.alter
.param vthn= 0.63633       $ 1332
.param vthp= -0.57364

.alter
.param vthn= 0.57557       $ 1333
.param vthp= -0.59111

.alter
.param vthn= 0.61309       $ 1334
.param vthp= -0.58632

.alter
.param vthn= 0.61594       $ 1335
.param vthp= -0.58636

.alter
.param vthn= 0.64182       $ 1336
.param vthp= -0.58830

.alter
.param vthn= 0.63956       $ 1337
.param vthp= -0.58459

.alter
.param vthn= 0.63337       $ 1338
.param vthp= -0.59112

.alter
.param vthn= 0.65273       $ 1339
.param vthp= -0.59041

.alter
.param vthn= 0.61659       $ 1340
.param vthp= -0.58306

.alter
.param vthn= 0.64163       $ 1341
.param vthp= -0.57793

.alter
.param vthn= 0.59728       $ 1342
.param vthp= -0.60293

.alter
.param vthn= 0.63687       $ 1343
.param vthp= -0.58636

.alter
.param vthn= 0.61371       $ 1344
.param vthp= -0.59608

.alter
.param vthn= 0.61782       $ 1345
.param vthp= -0.58719

.alter
.param vthn= 0.59696       $ 1346
.param vthp= -0.58245

.alter
.param vthn= 0.60932       $ 1347
.param vthp= -0.58736

.alter
.param vthn= 0.64443       $ 1348
.param vthp= -0.59084

.alter
.param vthn= 0.63552       $ 1349
.param vthp= -0.59820

.alter
.param vthn= 0.61368       $ 1350
.param vthp= -0.58869

.alter
.param vthn= 0.61060       $ 1351
.param vthp= -0.59959

.alter
.param vthn= 0.60519       $ 1352
.param vthp= -0.59230

.alter
.param vthn= 0.63424       $ 1353
.param vthp= -0.58350

.alter
.param vthn= 0.63634       $ 1354
.param vthp= -0.58179

.alter
.param vthn= 0.62578       $ 1355
.param vthp= -0.58006

.alter
.param vthn= 0.62074       $ 1356
.param vthp= -0.58411

.alter
.param vthn= 0.62516       $ 1357
.param vthp= -0.58958

.alter
.param vthn= 0.62016       $ 1358
.param vthp= -0.60498

.alter
.param vthn= 0.62981       $ 1359
.param vthp= -0.57910

.alter
.param vthn= 0.62041       $ 1360
.param vthp= -0.59816

.alter
.param vthn= 0.61397       $ 1361
.param vthp= -0.59019

.alter
.param vthn= 0.58847       $ 1362
.param vthp= -0.59201

.alter
.param vthn= 0.62310       $ 1363
.param vthp= -0.60092

.alter
.param vthn= 0.62742       $ 1364
.param vthp= -0.59174

.alter
.param vthn= 0.60462       $ 1365
.param vthp= -0.58460

.alter
.param vthn= 0.64288       $ 1366
.param vthp= -0.58849

.alter
.param vthn= 0.63763       $ 1367
.param vthp= -0.58700

.alter
.param vthn= 0.60419       $ 1368
.param vthp= -0.59579

.alter
.param vthn= 0.61075       $ 1369
.param vthp= -0.58361

.alter
.param vthn= 0.61599       $ 1370
.param vthp= -0.59297

.alter
.param vthn= 0.63189       $ 1371
.param vthp= -0.59181

.alter
.param vthn= 0.64418       $ 1372
.param vthp= -0.58942

.alter
.param vthn= 0.64787       $ 1373
.param vthp= -0.59436

.alter
.param vthn= 0.60710       $ 1374
.param vthp= -0.58345

.alter
.param vthn= 0.60770       $ 1375
.param vthp= -0.59114

.alter
.param vthn= 0.59955       $ 1376
.param vthp= -0.58968

.alter
.param vthn= 0.59964       $ 1377
.param vthp= -0.60050

.alter
.param vthn= 0.62676       $ 1378
.param vthp= -0.58564

.alter
.param vthn= 0.63897       $ 1379
.param vthp= -0.59654

.alter
.param vthn= 0.62653       $ 1380
.param vthp= -0.60634

.alter
.param vthn= 0.60822       $ 1381
.param vthp= -0.58207

.alter
.param vthn= 0.62528       $ 1382
.param vthp= -0.59734

.alter
.param vthn= 0.62653       $ 1383
.param vthp= -0.58573

.alter
.param vthn= 0.61739       $ 1384
.param vthp= -0.58742

.alter
.param vthn= 0.62884       $ 1385
.param vthp= -0.58556

.alter
.param vthn= 0.62875       $ 1386
.param vthp= -0.58959

.alter
.param vthn= 0.60497       $ 1387
.param vthp= -0.59716

.alter
.param vthn= 0.61551       $ 1388
.param vthp= -0.58923

.alter
.param vthn= 0.57864       $ 1389
.param vthp= -0.59441

.alter
.param vthn= 0.62054       $ 1390
.param vthp= -0.59791

.alter
.param vthn= 0.60427       $ 1391
.param vthp= -0.59436

.alter
.param vthn= 0.61404       $ 1392
.param vthp= -0.58609

.alter
.param vthn= 0.62747       $ 1393
.param vthp= -0.58724

.alter
.param vthn= 0.62540       $ 1394
.param vthp= -0.58613

.alter
.param vthn= 0.63246       $ 1395
.param vthp= -0.59772

.alter
.param vthn= 0.64134       $ 1396
.param vthp= -0.58773

.alter
.param vthn= 0.59661       $ 1397
.param vthp= -0.59845

.alter
.param vthn= 0.61304       $ 1398
.param vthp= -0.59356

.alter
.param vthn= 0.62149       $ 1399
.param vthp= -0.60067

.alter
.param vthn= 0.63289       $ 1400
.param vthp= -0.59058

.alter
.param vthn= 0.60101       $ 1401
.param vthp= -0.58267

.alter
.param vthn= 0.57574       $ 1402
.param vthp= -0.57035

.alter
.param vthn= 0.61174       $ 1403
.param vthp= -0.58264

.alter
.param vthn= 0.60349       $ 1404
.param vthp= -0.56867

.alter
.param vthn= 0.57784       $ 1405
.param vthp= -0.57135

.alter
.param vthn= 0.58772       $ 1406
.param vthp= -0.59143

.alter
.param vthn= 0.60245       $ 1407
.param vthp= -0.58312

.alter
.param vthn= 0.61631       $ 1408
.param vthp= -0.57397

.alter
.param vthn= 0.59416       $ 1409
.param vthp= -0.57233

.alter
.param vthn= 0.60681       $ 1410
.param vthp= -0.57725

.alter
.param vthn= 0.62747       $ 1411
.param vthp= -0.57674

.alter
.param vthn= 0.58786       $ 1412
.param vthp= -0.58137

.alter
.param vthn= 0.58962       $ 1413
.param vthp= -0.56330

.alter
.param vthn= 0.57902       $ 1414
.param vthp= -0.57225

.alter
.param vthn= 0.58112       $ 1415
.param vthp= -0.57295

.alter
.param vthn= 0.62051       $ 1416
.param vthp= -0.57690

.alter
.param vthn= 0.61931       $ 1417
.param vthp= -0.58371

.alter
.param vthn= 0.61178       $ 1418
.param vthp= -0.58783

.alter
.param vthn= 0.60398       $ 1419
.param vthp= -0.57959

.alter
.param vthn= 0.60520       $ 1420
.param vthp= -0.57474

.alter
.param vthn= 0.57984       $ 1421
.param vthp= -0.56838

.alter
.param vthn= 0.58676       $ 1422
.param vthp= -0.57066

.alter
.param vthn= 0.59659       $ 1423
.param vthp= -0.57684

.alter
.param vthn= 0.60353       $ 1424
.param vthp= -0.57358

.alter
.param vthn= 0.57301       $ 1425
.param vthp= -0.57686

.alter
.param vthn= 0.60186       $ 1426
.param vthp= -0.56194

.alter
.param vthn= 0.60326       $ 1427
.param vthp= -0.57571

.alter
.param vthn= 0.59129       $ 1428
.param vthp= -0.57360

.alter
.param vthn= 0.58846       $ 1429
.param vthp= -0.56696

.alter
.param vthn= 0.59427       $ 1430
.param vthp= -0.57748

.alter
.param vthn= 0.59910       $ 1431
.param vthp= -0.57554

.alter
.param vthn= 0.60323       $ 1432
.param vthp= -0.57605

.alter
.param vthn= 0.58111       $ 1433
.param vthp= -0.56908

.alter
.param vthn= 0.58045       $ 1434
.param vthp= -0.57416

.alter
.param vthn= 0.58239       $ 1435
.param vthp= -0.56971

.alter
.param vthn= 0.59101       $ 1436
.param vthp= -0.56732

.alter
.param vthn= 0.59940       $ 1437
.param vthp= -0.57321

.alter
.param vthn= 0.59523       $ 1438
.param vthp= -0.57586

.alter
.param vthn= 0.62716       $ 1439
.param vthp= -0.57004

.alter
.param vthn= 0.59979       $ 1440
.param vthp= -0.56794

.alter
.param vthn= 0.59076       $ 1441
.param vthp= -0.57704

.alter
.param vthn= 0.61418       $ 1442
.param vthp= -0.58396

.alter
.param vthn= 0.62127       $ 1443
.param vthp= -0.56598

.alter
.param vthn= 0.56445       $ 1444
.param vthp= -0.56787

.alter
.param vthn= 0.62146       $ 1445
.param vthp= -0.57247

.alter
.param vthn= 0.60290       $ 1446
.param vthp= -0.57992

.alter
.param vthn= 0.59146       $ 1447
.param vthp= -0.58050

.alter
.param vthn= 0.56413       $ 1448
.param vthp= -0.56422

.alter
.param vthn= 0.61548       $ 1449
.param vthp= -0.56969

.alter
.param vthn= 0.59821       $ 1450
.param vthp= -0.58451

.alter
.param vthn= 0.60351       $ 1451
.param vthp= -0.57228

.alter
.param vthn= 0.61466       $ 1452
.param vthp= -0.56914

.alter
.param vthn= 0.60220       $ 1453
.param vthp= -0.56977

.alter
.param vthn= 0.59406       $ 1454
.param vthp= -0.56948

.alter
.param vthn= 0.60295       $ 1455
.param vthp= -0.58096

.alter
.param vthn= 0.57465       $ 1456
.param vthp= -0.58471

.alter
.param vthn= 0.58786       $ 1457
.param vthp= -0.58388

.alter
.param vthn= 0.59293       $ 1458
.param vthp= -0.58026

.alter
.param vthn= 0.56908       $ 1459
.param vthp= -0.56843

.alter
.param vthn= 0.57565       $ 1460
.param vthp= -0.57177

.alter
.param vthn= 0.60439       $ 1461
.param vthp= -0.58571

.alter
.param vthn= 0.56829       $ 1462
.param vthp= -0.57534

.alter
.param vthn= 0.59982       $ 1463
.param vthp= -0.57105

.alter
.param vthn= 0.60848       $ 1464
.param vthp= -0.56995

.alter
.param vthn= 0.57489       $ 1465
.param vthp= -0.56987

.alter
.param vthn= 0.58713       $ 1466
.param vthp= -0.58777

.alter
.param vthn= 0.55173       $ 1467
.param vthp= -0.57190

.alter
.param vthn= 0.59371       $ 1468
.param vthp= -0.58056

.alter
.param vthn= 0.58435       $ 1469
.param vthp= -0.57712

.alter
.param vthn= 0.60950       $ 1470
.param vthp= -0.57882

.alter
.param vthn= 0.60656       $ 1471
.param vthp= -0.58346

.alter
.param vthn= 0.57840       $ 1472
.param vthp= -0.56858

.alter
.param vthn= 0.58456       $ 1473
.param vthp= -0.58190

.alter
.param vthn= 0.58441       $ 1474
.param vthp= -0.57936

.alter
.param vthn= 0.60417       $ 1475
.param vthp= -0.57854

.alter
.param vthn= 0.61270       $ 1476
.param vthp= -0.57757

.alter
.param vthn= 0.61104       $ 1477
.param vthp= -0.57505

.alter
.param vthn= 0.60277       $ 1478
.param vthp= -0.57480

.alter
.param vthn= 0.62802       $ 1479
.param vthp= -0.58227

.alter
.param vthn= 0.58848       $ 1480
.param vthp= -0.57008

.alter
.param vthn= 0.59628       $ 1481
.param vthp= -0.57332

.alter
.param vthn= 0.56989       $ 1482
.param vthp= -0.57636

.alter
.param vthn= 0.61267       $ 1483
.param vthp= -0.57436

.alter
.param vthn= 0.59358       $ 1484
.param vthp= -0.56166

.alter
.param vthn= 0.61939       $ 1485
.param vthp= -0.56942

.alter
.param vthn= 0.61449       $ 1486
.param vthp= -0.57891

.alter
.param vthn= 0.58916       $ 1487
.param vthp= -0.58306

.alter
.param vthn= 0.59185       $ 1488
.param vthp= -0.57087

.alter
.param vthn= 0.62152       $ 1489
.param vthp= -0.58566

.alter
.param vthn= 0.58833       $ 1490
.param vthp= -0.58010

.alter
.param vthn= 0.59851       $ 1491
.param vthp= -0.57780

.alter
.param vthn= 0.60374       $ 1492
.param vthp= -0.56841

.alter
.param vthn= 0.56732       $ 1493
.param vthp= -0.56837

.alter
.param vthn= 0.59154       $ 1494
.param vthp= -0.57458

.alter
.param vthn= 0.63459       $ 1495
.param vthp= -0.57504

.alter
.param vthn= 0.60095       $ 1496
.param vthp= -0.56970

.alter
.param vthn= 0.59909       $ 1497
.param vthp= -0.58187

.alter
.param vthn= 0.61034       $ 1498
.param vthp= -0.57873

.alter
.param vthn= 0.59232       $ 1499
.param vthp= -0.57623

.alter
.param vthn= 0.59469       $ 1500
.param vthp= -0.58499

.alter
.param vthn= 0.57732       $ 1501
.param vthp= -0.55791

.alter
.param vthn= 0.57808       $ 1502
.param vthp= -0.56663

.alter
.param vthn= 0.61470       $ 1503
.param vthp= -0.57947

.alter
.param vthn= 0.59919       $ 1504
.param vthp= -0.57269

.alter
.param vthn= 0.55714       $ 1505
.param vthp= -0.58021

.alter
.param vthn= 0.60159       $ 1506
.param vthp= -0.57385

.alter
.param vthn= 0.59040       $ 1507
.param vthp= -0.57260

.alter
.param vthn= 0.59094       $ 1508
.param vthp= -0.57177

.alter
.param vthn= 0.57659       $ 1509
.param vthp= -0.59220

.alter
.param vthn= 0.60189       $ 1510
.param vthp= -0.57484

.alter
.param vthn= 0.58677       $ 1511
.param vthp= -0.57951

.alter
.param vthn= 0.61318       $ 1512
.param vthp= -0.57907

.alter
.param vthn= 0.60255       $ 1513
.param vthp= -0.57102

.alter
.param vthn= 0.59197       $ 1514
.param vthp= -0.57749

.alter
.param vthn= 0.60027       $ 1515
.param vthp= -0.57623

.alter
.param vthn= 0.59421       $ 1516
.param vthp= -0.57748

.alter
.param vthn= 0.58597       $ 1517
.param vthp= -0.57983

.alter
.param vthn= 0.60040       $ 1518
.param vthp= -0.58174

.alter
.param vthn= 0.57188       $ 1519
.param vthp= -0.57819

.alter
.param vthn= 0.62497       $ 1520
.param vthp= -0.57368

.alter
.param vthn= 0.58997       $ 1521
.param vthp= -0.57038

.alter
.param vthn= 0.58420       $ 1522
.param vthp= -0.58923

.alter
.param vthn= 0.60384       $ 1523
.param vthp= -0.57799

.alter
.param vthn= 0.59851       $ 1524
.param vthp= -0.56358

.alter
.param vthn= 0.57147       $ 1525
.param vthp= -0.56877

.alter
.param vthn= 0.61428       $ 1526
.param vthp= -0.58637

.alter
.param vthn= 0.60274       $ 1527
.param vthp= -0.57576

.alter
.param vthn= 0.58374       $ 1528
.param vthp= -0.56075

.alter
.param vthn= 0.61093       $ 1529
.param vthp= -0.57354

.alter
.param vthn= 0.58642       $ 1530
.param vthp= -0.57215

.alter
.param vthn= 0.58238       $ 1531
.param vthp= -0.58056

.alter
.param vthn= 0.60900       $ 1532
.param vthp= -0.55736

.alter
.param vthn= 0.54824       $ 1533
.param vthp= -0.57483

.alter
.param vthn= 0.58576       $ 1534
.param vthp= -0.57004

.alter
.param vthn= 0.58861       $ 1535
.param vthp= -0.57008

.alter
.param vthn= 0.61449       $ 1536
.param vthp= -0.57202

.alter
.param vthn= 0.61223       $ 1537
.param vthp= -0.56831

.alter
.param vthn= 0.60604       $ 1538
.param vthp= -0.57484

.alter
.param vthn= 0.62540       $ 1539
.param vthp= -0.57413

.alter
.param vthn= 0.58926       $ 1540
.param vthp= -0.56678

.alter
.param vthn= 0.61430       $ 1541
.param vthp= -0.56165

.alter
.param vthn= 0.56995       $ 1542
.param vthp= -0.58665

.alter
.param vthn= 0.60954       $ 1543
.param vthp= -0.57008

.alter
.param vthn= 0.58638       $ 1544
.param vthp= -0.57980

.alter
.param vthn= 0.59049       $ 1545
.param vthp= -0.57091

.alter
.param vthn= 0.56963       $ 1546
.param vthp= -0.56617

.alter
.param vthn= 0.58199       $ 1547
.param vthp= -0.57108

.alter
.param vthn= 0.61710       $ 1548
.param vthp= -0.57456

.alter
.param vthn= 0.60819       $ 1549
.param vthp= -0.58192

.alter
.param vthn= 0.58635       $ 1550
.param vthp= -0.57241

.alter
.param vthn= 0.58327       $ 1551
.param vthp= -0.58331

.alter
.param vthn= 0.57786       $ 1552
.param vthp= -0.57602

.alter
.param vthn= 0.60691       $ 1553
.param vthp= -0.56722

.alter
.param vthn= 0.60901       $ 1554
.param vthp= -0.56551

.alter
.param vthn= 0.59845       $ 1555
.param vthp= -0.56378

.alter
.param vthn= 0.59341       $ 1556
.param vthp= -0.56783

.alter
.param vthn= 0.59783       $ 1557
.param vthp= -0.57330

.alter
.param vthn= 0.59283       $ 1558
.param vthp= -0.58870

.alter
.param vthn= 0.60248       $ 1559
.param vthp= -0.56282

.alter
.param vthn= 0.59308       $ 1560
.param vthp= -0.58188

.alter
.param vthn= 0.58664       $ 1561
.param vthp= -0.57391

.alter
.param vthn= 0.56114       $ 1562
.param vthp= -0.57573

.alter
.param vthn= 0.59577       $ 1563
.param vthp= -0.58464

.alter
.param vthn= 0.60009       $ 1564
.param vthp= -0.57546

.alter
.param vthn= 0.57729       $ 1565
.param vthp= -0.56832

.alter
.param vthn= 0.61555       $ 1566
.param vthp= -0.57221

.alter
.param vthn= 0.61030       $ 1567
.param vthp= -0.57072

.alter
.param vthn= 0.57686       $ 1568
.param vthp= -0.57951

.alter
.param vthn= 0.58342       $ 1569
.param vthp= -0.56733

.alter
.param vthn= 0.58866       $ 1570
.param vthp= -0.57669

.alter
.param vthn= 0.60456       $ 1571
.param vthp= -0.57553

.alter
.param vthn= 0.61685       $ 1572
.param vthp= -0.57314

.alter
.param vthn= 0.62054       $ 1573
.param vthp= -0.57808

.alter
.param vthn= 0.57977       $ 1574
.param vthp= -0.56717

.alter
.param vthn= 0.58037       $ 1575
.param vthp= -0.57486

.alter
.param vthn= 0.57222       $ 1576
.param vthp= -0.57340

.alter
.param vthn= 0.57231       $ 1577
.param vthp= -0.58422

.alter
.param vthn= 0.59943       $ 1578
.param vthp= -0.56936

.alter
.param vthn= 0.61164       $ 1579
.param vthp= -0.58026

.alter
.param vthn= 0.59920       $ 1580
.param vthp= -0.59006

.alter
.param vthn= 0.58089       $ 1581
.param vthp= -0.56579

.alter
.param vthn= 0.59795       $ 1582
.param vthp= -0.58106

.alter
.param vthn= 0.59920       $ 1583
.param vthp= -0.56945

.alter
.param vthn= 0.59006       $ 1584
.param vthp= -0.57114

.alter
.param vthn= 0.60151       $ 1585
.param vthp= -0.56928

.alter
.param vthn= 0.60142       $ 1586
.param vthp= -0.57331

.alter
.param vthn= 0.57764       $ 1587
.param vthp= -0.58088

.alter
.param vthn= 0.58818       $ 1588
.param vthp= -0.57295

.alter
.param vthn= 0.55131       $ 1589
.param vthp= -0.57813

.alter
.param vthn= 0.59321       $ 1590
.param vthp= -0.58163

.alter
.param vthn= 0.57694       $ 1591
.param vthp= -0.57808

.alter
.param vthn= 0.58671       $ 1592
.param vthp= -0.56981

.alter
.param vthn= 0.60014       $ 1593
.param vthp= -0.57096

.alter
.param vthn= 0.59807       $ 1594
.param vthp= -0.56985

.alter
.param vthn= 0.60513       $ 1595
.param vthp= -0.58144

.alter
.param vthn= 0.61401       $ 1596
.param vthp= -0.57145

.alter
.param vthn= 0.56928       $ 1597
.param vthp= -0.58217

.alter
.param vthn= 0.58571       $ 1598
.param vthp= -0.57728

.alter
.param vthn= 0.59416       $ 1599
.param vthp= -0.58439

.alter
.param vthn= 0.60556       $ 1600
.param vthp= -0.57430

.alter
.param vthn= 0.65236       $ 1601
.param vthp= -0.58814

.alter
.param vthn= 0.62709       $ 1602
.param vthp= -0.57582

.alter
.param vthn= 0.66309       $ 1603
.param vthp= -0.58811

.alter
.param vthn= 0.65484       $ 1604
.param vthp= -0.57414

.alter
.param vthn= 0.62919       $ 1605
.param vthp= -0.57682

.alter
.param vthn= 0.63907       $ 1606
.param vthp= -0.59690

.alter
.param vthn= 0.65380       $ 1607
.param vthp= -0.58859

.alter
.param vthn= 0.66766       $ 1608
.param vthp= -0.57944

.alter
.param vthn= 0.64551       $ 1609
.param vthp= -0.57780

.alter
.param vthn= 0.65816       $ 1610
.param vthp= -0.58272

.alter
.param vthn= 0.67882       $ 1611
.param vthp= -0.58221

.alter
.param vthn= 0.63921       $ 1612
.param vthp= -0.58684

.alter
.param vthn= 0.64097       $ 1613
.param vthp= -0.56877

.alter
.param vthn= 0.63037       $ 1614
.param vthp= -0.57772

.alter
.param vthn= 0.63247       $ 1615
.param vthp= -0.57842

.alter
.param vthn= 0.67186       $ 1616
.param vthp= -0.58237

.alter
.param vthn= 0.67066       $ 1617
.param vthp= -0.58918

.alter
.param vthn= 0.66313       $ 1618
.param vthp= -0.59330

.alter
.param vthn= 0.65533       $ 1619
.param vthp= -0.58506

.alter
.param vthn= 0.65655       $ 1620
.param vthp= -0.58021

.alter
.param vthn= 0.63119       $ 1621
.param vthp= -0.57385

.alter
.param vthn= 0.63811       $ 1622
.param vthp= -0.57613

.alter
.param vthn= 0.64794       $ 1623
.param vthp= -0.58231

.alter
.param vthn= 0.65488       $ 1624
.param vthp= -0.57905

.alter
.param vthn= 0.62436       $ 1625
.param vthp= -0.58233

.alter
.param vthn= 0.65321       $ 1626
.param vthp= -0.56741

.alter
.param vthn= 0.65461       $ 1627
.param vthp= -0.58118

.alter
.param vthn= 0.64264       $ 1628
.param vthp= -0.57907

.alter
.param vthn= 0.63981       $ 1629
.param vthp= -0.57243

.alter
.param vthn= 0.64562       $ 1630
.param vthp= -0.58295

.alter
.param vthn= 0.65045       $ 1631
.param vthp= -0.58101

.alter
.param vthn= 0.65458       $ 1632
.param vthp= -0.58152

.alter
.param vthn= 0.63246       $ 1633
.param vthp= -0.57455

.alter
.param vthn= 0.63180       $ 1634
.param vthp= -0.57963

.alter
.param vthn= 0.63374       $ 1635
.param vthp= -0.57518

.alter
.param vthn= 0.64236       $ 1636
.param vthp= -0.57279

.alter
.param vthn= 0.65075       $ 1637
.param vthp= -0.57868

.alter
.param vthn= 0.64658       $ 1638
.param vthp= -0.58133

.alter
.param vthn= 0.67851       $ 1639
.param vthp= -0.57551

.alter
.param vthn= 0.65114       $ 1640
.param vthp= -0.57341

.alter
.param vthn= 0.64211       $ 1641
.param vthp= -0.58251

.alter
.param vthn= 0.66553       $ 1642
.param vthp= -0.58943

.alter
.param vthn= 0.67262       $ 1643
.param vthp= -0.57145

.alter
.param vthn= 0.61580       $ 1644
.param vthp= -0.57334

.alter
.param vthn= 0.67281       $ 1645
.param vthp= -0.57794

.alter
.param vthn= 0.65425       $ 1646
.param vthp= -0.58539

.alter
.param vthn= 0.64281       $ 1647
.param vthp= -0.58597

.alter
.param vthn= 0.61548       $ 1648
.param vthp= -0.56969

.alter
.param vthn= 0.66683       $ 1649
.param vthp= -0.57516

.alter
.param vthn= 0.64956       $ 1650
.param vthp= -0.58998

.alter
.param vthn= 0.65486       $ 1651
.param vthp= -0.57775

.alter
.param vthn= 0.66601       $ 1652
.param vthp= -0.57461

.alter
.param vthn= 0.65355       $ 1653
.param vthp= -0.57524

.alter
.param vthn= 0.64541       $ 1654
.param vthp= -0.57495

.alter
.param vthn= 0.65430       $ 1655
.param vthp= -0.58643

.alter
.param vthn= 0.62600       $ 1656
.param vthp= -0.59018

.alter
.param vthn= 0.63921       $ 1657
.param vthp= -0.58935

.alter
.param vthn= 0.64428       $ 1658
.param vthp= -0.58573

.alter
.param vthn= 0.62043       $ 1659
.param vthp= -0.57390

.alter
.param vthn= 0.62700       $ 1660
.param vthp= -0.57724

.alter
.param vthn= 0.65574       $ 1661
.param vthp= -0.59118

.alter
.param vthn= 0.61964       $ 1662
.param vthp= -0.58081

.alter
.param vthn= 0.65117       $ 1663
.param vthp= -0.57652

.alter
.param vthn= 0.65983       $ 1664
.param vthp= -0.57542

.alter
.param vthn= 0.62624       $ 1665
.param vthp= -0.57534

.alter
.param vthn= 0.63848       $ 1666
.param vthp= -0.59324

.alter
.param vthn= 0.60308       $ 1667
.param vthp= -0.57737

.alter
.param vthn= 0.64506       $ 1668
.param vthp= -0.58603

.alter
.param vthn= 0.63570       $ 1669
.param vthp= -0.58259

.alter
.param vthn= 0.66085       $ 1670
.param vthp= -0.58429

.alter
.param vthn= 0.65791       $ 1671
.param vthp= -0.58893

.alter
.param vthn= 0.62975       $ 1672
.param vthp= -0.57405

.alter
.param vthn= 0.63591       $ 1673
.param vthp= -0.58737

.alter
.param vthn= 0.63576       $ 1674
.param vthp= -0.58483

.alter
.param vthn= 0.65552       $ 1675
.param vthp= -0.58401

.alter
.param vthn= 0.66405       $ 1676
.param vthp= -0.58304

.alter
.param vthn= 0.66239       $ 1677
.param vthp= -0.58052

.alter
.param vthn= 0.65412       $ 1678
.param vthp= -0.58027

.alter
.param vthn= 0.67937       $ 1679
.param vthp= -0.58774

.alter
.param vthn= 0.63983       $ 1680
.param vthp= -0.57555

.alter
.param vthn= 0.64763       $ 1681
.param vthp= -0.57879

.alter
.param vthn= 0.62124       $ 1682
.param vthp= -0.58183

.alter
.param vthn= 0.66402       $ 1683
.param vthp= -0.57983

.alter
.param vthn= 0.64493       $ 1684
.param vthp= -0.56713

.alter
.param vthn= 0.67074       $ 1685
.param vthp= -0.57489

.alter
.param vthn= 0.66584       $ 1686
.param vthp= -0.58438

.alter
.param vthn= 0.64051       $ 1687
.param vthp= -0.58853

.alter
.param vthn= 0.64320       $ 1688
.param vthp= -0.57634

.alter
.param vthn= 0.67287       $ 1689
.param vthp= -0.59113

.alter
.param vthn= 0.63968       $ 1690
.param vthp= -0.58557

.alter
.param vthn= 0.64986       $ 1691
.param vthp= -0.58327

.alter
.param vthn= 0.65509       $ 1692
.param vthp= -0.57388

.alter
.param vthn= 0.61867       $ 1693
.param vthp= -0.57384

.alter
.param vthn= 0.64289       $ 1694
.param vthp= -0.58005

.alter
.param vthn= 0.68594       $ 1695
.param vthp= -0.58051

.alter
.param vthn= 0.65230       $ 1696
.param vthp= -0.57517

.alter
.param vthn= 0.65044       $ 1697
.param vthp= -0.58734

.alter
.param vthn= 0.66169       $ 1698
.param vthp= -0.58420

.alter
.param vthn= 0.64367       $ 1699
.param vthp= -0.58170

.alter
.param vthn= 0.64604       $ 1700
.param vthp= -0.59046

.alter
.param vthn= 0.62867       $ 1701
.param vthp= -0.56338

.alter
.param vthn= 0.62943       $ 1702
.param vthp= -0.57210

.alter
.param vthn= 0.66605       $ 1703
.param vthp= -0.58494

.alter
.param vthn= 0.65054       $ 1704
.param vthp= -0.57816

.alter
.param vthn= 0.60849       $ 1705
.param vthp= -0.58568

.alter
.param vthn= 0.65294       $ 1706
.param vthp= -0.57932

.alter
.param vthn= 0.64175       $ 1707
.param vthp= -0.57807

.alter
.param vthn= 0.64229       $ 1708
.param vthp= -0.57724

.alter
.param vthn= 0.62794       $ 1709
.param vthp= -0.59767

.alter
.param vthn= 0.65324       $ 1710
.param vthp= -0.58031

.alter
.param vthn= 0.63812       $ 1711
.param vthp= -0.58498

.alter
.param vthn= 0.66453       $ 1712
.param vthp= -0.58454

.alter
.param vthn= 0.65390       $ 1713
.param vthp= -0.57649

.alter
.param vthn= 0.64332       $ 1714
.param vthp= -0.58296

.alter
.param vthn= 0.65162       $ 1715
.param vthp= -0.58170

.alter
.param vthn= 0.64556       $ 1716
.param vthp= -0.58295

.alter
.param vthn= 0.63732       $ 1717
.param vthp= -0.58530

.alter
.param vthn= 0.65175       $ 1718
.param vthp= -0.58721

.alter
.param vthn= 0.62323       $ 1719
.param vthp= -0.58366

.alter
.param vthn= 0.67632       $ 1720
.param vthp= -0.57915

.alter
.param vthn= 0.64132       $ 1721
.param vthp= -0.57585

.alter
.param vthn= 0.63555       $ 1722
.param vthp= -0.59470

.alter
.param vthn= 0.65519       $ 1723
.param vthp= -0.58346

.alter
.param vthn= 0.64986       $ 1724
.param vthp= -0.56905

.alter
.param vthn= 0.62282       $ 1725
.param vthp= -0.57424

.alter
.param vthn= 0.66563       $ 1726
.param vthp= -0.59184

.alter
.param vthn= 0.65409       $ 1727
.param vthp= -0.58123

.alter
.param vthn= 0.63509       $ 1728
.param vthp= -0.56622

.alter
.param vthn= 0.66228       $ 1729
.param vthp= -0.57901

.alter
.param vthn= 0.63777       $ 1730
.param vthp= -0.57762

.alter
.param vthn= 0.63373       $ 1731
.param vthp= -0.58603

.alter
.param vthn= 0.66035       $ 1732
.param vthp= -0.56283

.alter
.param vthn= 0.59959       $ 1733
.param vthp= -0.58030

.alter
.param vthn= 0.63711       $ 1734
.param vthp= -0.57551

.alter
.param vthn= 0.63996       $ 1735
.param vthp= -0.57555

.alter
.param vthn= 0.66584       $ 1736
.param vthp= -0.57749

.alter
.param vthn= 0.66358       $ 1737
.param vthp= -0.57378

.alter
.param vthn= 0.65739       $ 1738
.param vthp= -0.58031

.alter
.param vthn= 0.67675       $ 1739
.param vthp= -0.57960

.alter
.param vthn= 0.64061       $ 1740
.param vthp= -0.57225

.alter
.param vthn= 0.66565       $ 1741
.param vthp= -0.56712

.alter
.param vthn= 0.62130       $ 1742
.param vthp= -0.59212

.alter
.param vthn= 0.66089       $ 1743
.param vthp= -0.57555

.alter
.param vthn= 0.63773       $ 1744
.param vthp= -0.58527

.alter
.param vthn= 0.64184       $ 1745
.param vthp= -0.57638

.alter
.param vthn= 0.62098       $ 1746
.param vthp= -0.57164

.alter
.param vthn= 0.63334       $ 1747
.param vthp= -0.57655

.alter
.param vthn= 0.66845       $ 1748
.param vthp= -0.58003

.alter
.param vthn= 0.65954       $ 1749
.param vthp= -0.58739

.alter
.param vthn= 0.63770       $ 1750
.param vthp= -0.57788

.alter
.param vthn= 0.63462       $ 1751
.param vthp= -0.58878

.alter
.param vthn= 0.62921       $ 1752
.param vthp= -0.58149

.alter
.param vthn= 0.65826       $ 1753
.param vthp= -0.57269

.alter
.param vthn= 0.66036       $ 1754
.param vthp= -0.57098

.alter
.param vthn= 0.64980       $ 1755
.param vthp= -0.56925

.alter
.param vthn= 0.64476       $ 1756
.param vthp= -0.57330

.alter
.param vthn= 0.64918       $ 1757
.param vthp= -0.57877

.alter
.param vthn= 0.64418       $ 1758
.param vthp= -0.59417

.alter
.param vthn= 0.65383       $ 1759
.param vthp= -0.56829

.alter
.param vthn= 0.64443       $ 1760
.param vthp= -0.58735

.alter
.param vthn= 0.63799       $ 1761
.param vthp= -0.57938

.alter
.param vthn= 0.61249       $ 1762
.param vthp= -0.58120

.alter
.param vthn= 0.64712       $ 1763
.param vthp= -0.59011

.alter
.param vthn= 0.65144       $ 1764
.param vthp= -0.58093

.alter
.param vthn= 0.62864       $ 1765
.param vthp= -0.57379

.alter
.param vthn= 0.66690       $ 1766
.param vthp= -0.57768

.alter
.param vthn= 0.66165       $ 1767
.param vthp= -0.57619

.alter
.param vthn= 0.62821       $ 1768
.param vthp= -0.58498

.alter
.param vthn= 0.63477       $ 1769
.param vthp= -0.57280

.alter
.param vthn= 0.64001       $ 1770
.param vthp= -0.58216

.alter
.param vthn= 0.65591       $ 1771
.param vthp= -0.58100

.alter
.param vthn= 0.66820       $ 1772
.param vthp= -0.57861

.alter
.param vthn= 0.67189       $ 1773
.param vthp= -0.58355

.alter
.param vthn= 0.63112       $ 1774
.param vthp= -0.57264

.alter
.param vthn= 0.63172       $ 1775
.param vthp= -0.58033

.alter
.param vthn= 0.62357       $ 1776
.param vthp= -0.57887

.alter
.param vthn= 0.62366       $ 1777
.param vthp= -0.58969

.alter
.param vthn= 0.65078       $ 1778
.param vthp= -0.57483

.alter
.param vthn= 0.66299       $ 1779
.param vthp= -0.58573

.alter
.param vthn= 0.65055       $ 1780
.param vthp= -0.59553

.alter
.param vthn= 0.63224       $ 1781
.param vthp= -0.57126

.alter
.param vthn= 0.64930       $ 1782
.param vthp= -0.58653

.alter
.param vthn= 0.65055       $ 1783
.param vthp= -0.57492

.alter
.param vthn= 0.64141       $ 1784
.param vthp= -0.57661

.alter
.param vthn= 0.65286       $ 1785
.param vthp= -0.57475

.alter
.param vthn= 0.65277       $ 1786
.param vthp= -0.57878

.alter
.param vthn= 0.62899       $ 1787
.param vthp= -0.58635

.alter
.param vthn= 0.63953       $ 1788
.param vthp= -0.57842

.alter
.param vthn= 0.60266       $ 1789
.param vthp= -0.58360

.alter
.param vthn= 0.64456       $ 1790
.param vthp= -0.58710

.alter
.param vthn= 0.62829       $ 1791
.param vthp= -0.58355

.alter
.param vthn= 0.63806       $ 1792
.param vthp= -0.57528

.alter
.param vthn= 0.65149       $ 1793
.param vthp= -0.57643

.alter
.param vthn= 0.64942       $ 1794
.param vthp= -0.57532

.alter
.param vthn= 0.65648       $ 1795
.param vthp= -0.58691

.alter
.param vthn= 0.66536       $ 1796
.param vthp= -0.57692

.alter
.param vthn= 0.62063       $ 1797
.param vthp= -0.58764

.alter
.param vthn= 0.63706       $ 1798
.param vthp= -0.58275

.alter
.param vthn= 0.64551       $ 1799
.param vthp= -0.58986

.alter
.param vthn= 0.65691       $ 1800
.param vthp= -0.57977

.alter
.param vthn= 0.63509       $ 1801
.param vthp= -0.60296

.alter
.param vthn= 0.60982       $ 1802
.param vthp= -0.59064

.alter
.param vthn= 0.64582       $ 1803
.param vthp= -0.60293

.alter
.param vthn= 0.63757       $ 1804
.param vthp= -0.58896

.alter
.param vthn= 0.61192       $ 1805
.param vthp= -0.59164

.alter
.param vthn= 0.62180       $ 1806
.param vthp= -0.61172

.alter
.param vthn= 0.63653       $ 1807
.param vthp= -0.60341

.alter
.param vthn= 0.65039       $ 1808
.param vthp= -0.59426

.alter
.param vthn= 0.62824       $ 1809
.param vthp= -0.59262

.alter
.param vthn= 0.64089       $ 1810
.param vthp= -0.59754

.alter
.param vthn= 0.66155       $ 1811
.param vthp= -0.59703

.alter
.param vthn= 0.62194       $ 1812
.param vthp= -0.60166

.alter
.param vthn= 0.62370       $ 1813
.param vthp= -0.58359

.alter
.param vthn= 0.61310       $ 1814
.param vthp= -0.59254

.alter
.param vthn= 0.61520       $ 1815
.param vthp= -0.59324

.alter
.param vthn= 0.65459       $ 1816
.param vthp= -0.59719

.alter
.param vthn= 0.65339       $ 1817
.param vthp= -0.60400

.alter
.param vthn= 0.64586       $ 1818
.param vthp= -0.60812

.alter
.param vthn= 0.63806       $ 1819
.param vthp= -0.59988

.alter
.param vthn= 0.63928       $ 1820
.param vthp= -0.59503

.alter
.param vthn= 0.61392       $ 1821
.param vthp= -0.58867

.alter
.param vthn= 0.62084       $ 1822
.param vthp= -0.59095

.alter
.param vthn= 0.63067       $ 1823
.param vthp= -0.59713

.alter
.param vthn= 0.63761       $ 1824
.param vthp= -0.59387

.alter
.param vthn= 0.60709       $ 1825
.param vthp= -0.59715

.alter
.param vthn= 0.63594       $ 1826
.param vthp= -0.58223

.alter
.param vthn= 0.63734       $ 1827
.param vthp= -0.59600

.alter
.param vthn= 0.62537       $ 1828
.param vthp= -0.59389

.alter
.param vthn= 0.62254       $ 1829
.param vthp= -0.58725

.alter
.param vthn= 0.62835       $ 1830
.param vthp= -0.59777

.alter
.param vthn= 0.63318       $ 1831
.param vthp= -0.59583

.alter
.param vthn= 0.63731       $ 1832
.param vthp= -0.59634

.alter
.param vthn= 0.61519       $ 1833
.param vthp= -0.58937

.alter
.param vthn= 0.61453       $ 1834
.param vthp= -0.59445

.alter
.param vthn= 0.61647       $ 1835
.param vthp= -0.59000

.alter
.param vthn= 0.62509       $ 1836
.param vthp= -0.58761

.alter
.param vthn= 0.63348       $ 1837
.param vthp= -0.59350

.alter
.param vthn= 0.62931       $ 1838
.param vthp= -0.59615

.alter
.param vthn= 0.66124       $ 1839
.param vthp= -0.59033

.alter
.param vthn= 0.63387       $ 1840
.param vthp= -0.58823

.alter
.param vthn= 0.62484       $ 1841
.param vthp= -0.59733

.alter
.param vthn= 0.64826       $ 1842
.param vthp= -0.60425

.alter
.param vthn= 0.65535       $ 1843
.param vthp= -0.58627

.alter
.param vthn= 0.59853       $ 1844
.param vthp= -0.58816

.alter
.param vthn= 0.65554       $ 1845
.param vthp= -0.59276

.alter
.param vthn= 0.63698       $ 1846
.param vthp= -0.60021

.alter
.param vthn= 0.62554       $ 1847
.param vthp= -0.60079

.alter
.param vthn= 0.59821       $ 1848
.param vthp= -0.58451

.alter
.param vthn= 0.64956       $ 1849
.param vthp= -0.58998

.alter
.param vthn= 0.63229       $ 1850
.param vthp= -0.60480

.alter
.param vthn= 0.63759       $ 1851
.param vthp= -0.59257

.alter
.param vthn= 0.64874       $ 1852
.param vthp= -0.58943

.alter
.param vthn= 0.63628       $ 1853
.param vthp= -0.59006

.alter
.param vthn= 0.62814       $ 1854
.param vthp= -0.58977

.alter
.param vthn= 0.63703       $ 1855
.param vthp= -0.60125

.alter
.param vthn= 0.60873       $ 1856
.param vthp= -0.60500

.alter
.param vthn= 0.62194       $ 1857
.param vthp= -0.60417

.alter
.param vthn= 0.62701       $ 1858
.param vthp= -0.60055

.alter
.param vthn= 0.60316       $ 1859
.param vthp= -0.58872

.alter
.param vthn= 0.60973       $ 1860
.param vthp= -0.59206

.alter
.param vthn= 0.63847       $ 1861
.param vthp= -0.60600

.alter
.param vthn= 0.60237       $ 1862
.param vthp= -0.59563

.alter
.param vthn= 0.63390       $ 1863
.param vthp= -0.59134

.alter
.param vthn= 0.64256       $ 1864
.param vthp= -0.59024

.alter
.param vthn= 0.60897       $ 1865
.param vthp= -0.59016

.alter
.param vthn= 0.62121       $ 1866
.param vthp= -0.60806

.alter
.param vthn= 0.58581       $ 1867
.param vthp= -0.59219

.alter
.param vthn= 0.62779       $ 1868
.param vthp= -0.60085

.alter
.param vthn= 0.61843       $ 1869
.param vthp= -0.59741

.alter
.param vthn= 0.64358       $ 1870
.param vthp= -0.59911

.alter
.param vthn= 0.64064       $ 1871
.param vthp= -0.60375

.alter
.param vthn= 0.61248       $ 1872
.param vthp= -0.58887

.alter
.param vthn= 0.61864       $ 1873
.param vthp= -0.60219

.alter
.param vthn= 0.61849       $ 1874
.param vthp= -0.59965

.alter
.param vthn= 0.63825       $ 1875
.param vthp= -0.59883

.alter
.param vthn= 0.64678       $ 1876
.param vthp= -0.59786

.alter
.param vthn= 0.64512       $ 1877
.param vthp= -0.59534

.alter
.param vthn= 0.63685       $ 1878
.param vthp= -0.59509

.alter
.param vthn= 0.66210       $ 1879
.param vthp= -0.60256

.alter
.param vthn= 0.62256       $ 1880
.param vthp= -0.59037

.alter
.param vthn= 0.63036       $ 1881
.param vthp= -0.59361

.alter
.param vthn= 0.60397       $ 1882
.param vthp= -0.59665

.alter
.param vthn= 0.64675       $ 1883
.param vthp= -0.59465

.alter
.param vthn= 0.62766       $ 1884
.param vthp= -0.58195

.alter
.param vthn= 0.65347       $ 1885
.param vthp= -0.58971

.alter
.param vthn= 0.64857       $ 1886
.param vthp= -0.59920

.alter
.param vthn= 0.62324       $ 1887
.param vthp= -0.60335

.alter
.param vthn= 0.62593       $ 1888
.param vthp= -0.59116

.alter
.param vthn= 0.65560       $ 1889
.param vthp= -0.60595

.alter
.param vthn= 0.62241       $ 1890
.param vthp= -0.60039

.alter
.param vthn= 0.63259       $ 1891
.param vthp= -0.59809

.alter
.param vthn= 0.63782       $ 1892
.param vthp= -0.58870

.alter
.param vthn= 0.60140       $ 1893
.param vthp= -0.58866

.alter
.param vthn= 0.62562       $ 1894
.param vthp= -0.59487

.alter
.param vthn= 0.66867       $ 1895
.param vthp= -0.59533

.alter
.param vthn= 0.63503       $ 1896
.param vthp= -0.58999

.alter
.param vthn= 0.63317       $ 1897
.param vthp= -0.60216

.alter
.param vthn= 0.64442       $ 1898
.param vthp= -0.59902

.alter
.param vthn= 0.62640       $ 1899
.param vthp= -0.59652

.alter
.param vthn= 0.62877       $ 1900
.param vthp= -0.60528

.alter
.param vthn= 0.61140       $ 1901
.param vthp= -0.57820

.alter
.param vthn= 0.61216       $ 1902
.param vthp= -0.58692

.alter
.param vthn= 0.64878       $ 1903
.param vthp= -0.59976

.alter
.param vthn= 0.63327       $ 1904
.param vthp= -0.59298

.alter
.param vthn= 0.59122       $ 1905
.param vthp= -0.60050

.alter
.param vthn= 0.63567       $ 1906
.param vthp= -0.59414

.alter
.param vthn= 0.62448       $ 1907
.param vthp= -0.59289

.alter
.param vthn= 0.62502       $ 1908
.param vthp= -0.59206

.alter
.param vthn= 0.61067       $ 1909
.param vthp= -0.61249

.alter
.param vthn= 0.63597       $ 1910
.param vthp= -0.59513

.alter
.param vthn= 0.62085       $ 1911
.param vthp= -0.59980

.alter
.param vthn= 0.64726       $ 1912
.param vthp= -0.59936

.alter
.param vthn= 0.63663       $ 1913
.param vthp= -0.59131

.alter
.param vthn= 0.62605       $ 1914
.param vthp= -0.59778

.alter
.param vthn= 0.63435       $ 1915
.param vthp= -0.59652

.alter
.param vthn= 0.62829       $ 1916
.param vthp= -0.59777

.alter
.param vthn= 0.62005       $ 1917
.param vthp= -0.60012

.alter
.param vthn= 0.63448       $ 1918
.param vthp= -0.60203

.alter
.param vthn= 0.60596       $ 1919
.param vthp= -0.59848

.alter
.param vthn= 0.65905       $ 1920
.param vthp= -0.59397

.alter
.param vthn= 0.62405       $ 1921
.param vthp= -0.59067

.alter
.param vthn= 0.61828       $ 1922
.param vthp= -0.60952

.alter
.param vthn= 0.63792       $ 1923
.param vthp= -0.59828

.alter
.param vthn= 0.63259       $ 1924
.param vthp= -0.58387

.alter
.param vthn= 0.60555       $ 1925
.param vthp= -0.58906

.alter
.param vthn= 0.64836       $ 1926
.param vthp= -0.60666

.alter
.param vthn= 0.63682       $ 1927
.param vthp= -0.59605

.alter
.param vthn= 0.61782       $ 1928
.param vthp= -0.58104

.alter
.param vthn= 0.64501       $ 1929
.param vthp= -0.59383

.alter
.param vthn= 0.62050       $ 1930
.param vthp= -0.59244

.alter
.param vthn= 0.61646       $ 1931
.param vthp= -0.60085

.alter
.param vthn= 0.64308       $ 1932
.param vthp= -0.57765

.alter
.param vthn= 0.58232       $ 1933
.param vthp= -0.59512

.alter
.param vthn= 0.61984       $ 1934
.param vthp= -0.59033

.alter
.param vthn= 0.62269       $ 1935
.param vthp= -0.59037

.alter
.param vthn= 0.64857       $ 1936
.param vthp= -0.59231

.alter
.param vthn= 0.64631       $ 1937
.param vthp= -0.58860

.alter
.param vthn= 0.64012       $ 1938
.param vthp= -0.59513

.alter
.param vthn= 0.65948       $ 1939
.param vthp= -0.59442

.alter
.param vthn= 0.62334       $ 1940
.param vthp= -0.58707

.alter
.param vthn= 0.64838       $ 1941
.param vthp= -0.58194

.alter
.param vthn= 0.60403       $ 1942
.param vthp= -0.60694

.alter
.param vthn= 0.64362       $ 1943
.param vthp= -0.59037

.alter
.param vthn= 0.62046       $ 1944
.param vthp= -0.60009

.alter
.param vthn= 0.62457       $ 1945
.param vthp= -0.59120

.alter
.param vthn= 0.60371       $ 1946
.param vthp= -0.58646

.alter
.param vthn= 0.61607       $ 1947
.param vthp= -0.59137

.alter
.param vthn= 0.65118       $ 1948
.param vthp= -0.59485

.alter
.param vthn= 0.64227       $ 1949
.param vthp= -0.60221

.alter
.param vthn= 0.62043       $ 1950
.param vthp= -0.59270

.alter
.param vthn= 0.61735       $ 1951
.param vthp= -0.60360

.alter
.param vthn= 0.61194       $ 1952
.param vthp= -0.59631

.alter
.param vthn= 0.64099       $ 1953
.param vthp= -0.58751

.alter
.param vthn= 0.64309       $ 1954
.param vthp= -0.58580

.alter
.param vthn= 0.63253       $ 1955
.param vthp= -0.58407

.alter
.param vthn= 0.62749       $ 1956
.param vthp= -0.58812

.alter
.param vthn= 0.63191       $ 1957
.param vthp= -0.59359

.alter
.param vthn= 0.62691       $ 1958
.param vthp= -0.60899

.alter
.param vthn= 0.63656       $ 1959
.param vthp= -0.58311

.alter
.param vthn= 0.62716       $ 1960
.param vthp= -0.60217

.alter
.param vthn= 0.62072       $ 1961
.param vthp= -0.59420

.alter
.param vthn= 0.59522       $ 1962
.param vthp= -0.59602

.alter
.param vthn= 0.62985       $ 1963
.param vthp= -0.60493

.alter
.param vthn= 0.63417       $ 1964
.param vthp= -0.59575

.alter
.param vthn= 0.61137       $ 1965
.param vthp= -0.58861

.alter
.param vthn= 0.64963       $ 1966
.param vthp= -0.59250

.alter
.param vthn= 0.64438       $ 1967
.param vthp= -0.59101

.alter
.param vthn= 0.61094       $ 1968
.param vthp= -0.59980

.alter
.param vthn= 0.61750       $ 1969
.param vthp= -0.58762

.alter
.param vthn= 0.62274       $ 1970
.param vthp= -0.59698

.alter
.param vthn= 0.63864       $ 1971
.param vthp= -0.59582

.alter
.param vthn= 0.65093       $ 1972
.param vthp= -0.59343

.alter
.param vthn= 0.65462       $ 1973
.param vthp= -0.59837

.alter
.param vthn= 0.61385       $ 1974
.param vthp= -0.58746

.alter
.param vthn= 0.61445       $ 1975
.param vthp= -0.59515

.alter
.param vthn= 0.60630       $ 1976
.param vthp= -0.59369

.alter
.param vthn= 0.60639       $ 1977
.param vthp= -0.60451

.alter
.param vthn= 0.63351       $ 1978
.param vthp= -0.58965

.alter
.param vthn= 0.64572       $ 1979
.param vthp= -0.60055

.alter
.param vthn= 0.63328       $ 1980
.param vthp= -0.61035

.alter
.param vthn= 0.61497       $ 1981
.param vthp= -0.58608

.alter
.param vthn= 0.63203       $ 1982
.param vthp= -0.60135

.alter
.param vthn= 0.63328       $ 1983
.param vthp= -0.58974

.alter
.param vthn= 0.62414       $ 1984
.param vthp= -0.59143

.alter
.param vthn= 0.63559       $ 1985
.param vthp= -0.58957

.alter
.param vthn= 0.63550       $ 1986
.param vthp= -0.59360

.alter
.param vthn= 0.61172       $ 1987
.param vthp= -0.60117

.alter
.param vthn= 0.62226       $ 1988
.param vthp= -0.59324

.alter
.param vthn= 0.58539       $ 1989
.param vthp= -0.59842

.alter
.param vthn= 0.62729       $ 1990
.param vthp= -0.60192

.alter
.param vthn= 0.61102       $ 1991
.param vthp= -0.59837

.alter
.param vthn= 0.62079       $ 1992
.param vthp= -0.59010

.alter
.param vthn= 0.63422       $ 1993
.param vthp= -0.59125

.alter
.param vthn= 0.63215       $ 1994
.param vthp= -0.59014

.alter
.param vthn= 0.63921       $ 1995
.param vthp= -0.60173

.alter
.param vthn= 0.64809       $ 1996
.param vthp= -0.59174

.alter
.param vthn= 0.60336       $ 1997
.param vthp= -0.60246

.alter
.param vthn= 0.61979       $ 1998
.param vthp= -0.59757

.alter
.param vthn= 0.62824       $ 1999
.param vthp= -0.60468

.alter
.param vthn= 0.63964       $ 2000
.param vthp= -0.59459

.alter
.param vthn= 0.64039       $ 2001
.param vthp= -0.59073

.alter
.param vthn= 0.61512       $ 2002
.param vthp= -0.57841

.alter
.param vthn= 0.65112       $ 2003
.param vthp= -0.59070

.alter
.param vthn= 0.64287       $ 2004
.param vthp= -0.57673

.alter
.param vthn= 0.61722       $ 2005
.param vthp= -0.57941

.alter
.param vthn= 0.62710       $ 2006
.param vthp= -0.59949

.alter
.param vthn= 0.64183       $ 2007
.param vthp= -0.59118

.alter
.param vthn= 0.65569       $ 2008
.param vthp= -0.58203

.alter
.param vthn= 0.63354       $ 2009
.param vthp= -0.58039

.alter
.param vthn= 0.64619       $ 2010
.param vthp= -0.58531

.alter
.param vthn= 0.66685       $ 2011
.param vthp= -0.58480

.alter
.param vthn= 0.62724       $ 2012
.param vthp= -0.58943

.alter
.param vthn= 0.62900       $ 2013
.param vthp= -0.57136

.alter
.param vthn= 0.61840       $ 2014
.param vthp= -0.58031

.alter
.param vthn= 0.62050       $ 2015
.param vthp= -0.58101

.alter
.param vthn= 0.65989       $ 2016
.param vthp= -0.58496

.alter
.param vthn= 0.65869       $ 2017
.param vthp= -0.59177

.alter
.param vthn= 0.65116       $ 2018
.param vthp= -0.59589

.alter
.param vthn= 0.64336       $ 2019
.param vthp= -0.58765

.alter
.param vthn= 0.64458       $ 2020
.param vthp= -0.58280

.alter
.param vthn= 0.61922       $ 2021
.param vthp= -0.57644

.alter
.param vthn= 0.62614       $ 2022
.param vthp= -0.57872

.alter
.param vthn= 0.63597       $ 2023
.param vthp= -0.58490

.alter
.param vthn= 0.64291       $ 2024
.param vthp= -0.58164

.alter
.param vthn= 0.61239       $ 2025
.param vthp= -0.58492

.alter
.param vthn= 0.64124       $ 2026
.param vthp= -0.57000

.alter
.param vthn= 0.64264       $ 2027
.param vthp= -0.58377

.alter
.param vthn= 0.63067       $ 2028
.param vthp= -0.58166

.alter
.param vthn= 0.62784       $ 2029
.param vthp= -0.57502

.alter
.param vthn= 0.63365       $ 2030
.param vthp= -0.58554

.alter
.param vthn= 0.63848       $ 2031
.param vthp= -0.58360

.alter
.param vthn= 0.64261       $ 2032
.param vthp= -0.58411

.alter
.param vthn= 0.62049       $ 2033
.param vthp= -0.57714

.alter
.param vthn= 0.61983       $ 2034
.param vthp= -0.58222

.alter
.param vthn= 0.62177       $ 2035
.param vthp= -0.57777

.alter
.param vthn= 0.63039       $ 2036
.param vthp= -0.57538

.alter
.param vthn= 0.63878       $ 2037
.param vthp= -0.58127

.alter
.param vthn= 0.63461       $ 2038
.param vthp= -0.58392

.alter
.param vthn= 0.66654       $ 2039
.param vthp= -0.57810

.alter
.param vthn= 0.63917       $ 2040
.param vthp= -0.57600

.alter
.param vthn= 0.63014       $ 2041
.param vthp= -0.58510

.alter
.param vthn= 0.65356       $ 2042
.param vthp= -0.59202

.alter
.param vthn= 0.66065       $ 2043
.param vthp= -0.57404

.alter
.param vthn= 0.60383       $ 2044
.param vthp= -0.57593

.alter
.param vthn= 0.66084       $ 2045
.param vthp= -0.58053

.alter
.param vthn= 0.64228       $ 2046
.param vthp= -0.58798

.alter
.param vthn= 0.63084       $ 2047
.param vthp= -0.58856

.alter
.param vthn= 0.60351       $ 2048
.param vthp= -0.57228

.alter
.param vthn= 0.65486       $ 2049
.param vthp= -0.57775

.alter
.param vthn= 0.63759       $ 2050
.param vthp= -0.59257

.alter
.param vthn= 0.64289       $ 2051
.param vthp= -0.58034

.alter
.param vthn= 0.65404       $ 2052
.param vthp= -0.57720

.alter
.param vthn= 0.64158       $ 2053
.param vthp= -0.57783

.alter
.param vthn= 0.63344       $ 2054
.param vthp= -0.57754

.alter
.param vthn= 0.64233       $ 2055
.param vthp= -0.58902

.alter
.param vthn= 0.61403       $ 2056
.param vthp= -0.59277

.alter
.param vthn= 0.62724       $ 2057
.param vthp= -0.59194

.alter
.param vthn= 0.63231       $ 2058
.param vthp= -0.58832

.alter
.param vthn= 0.60846       $ 2059
.param vthp= -0.57649

.alter
.param vthn= 0.61503       $ 2060
.param vthp= -0.57983

.alter
.param vthn= 0.64377       $ 2061
.param vthp= -0.59377

.alter
.param vthn= 0.60767       $ 2062
.param vthp= -0.58340

.alter
.param vthn= 0.63920       $ 2063
.param vthp= -0.57911

.alter
.param vthn= 0.64786       $ 2064
.param vthp= -0.57801

.alter
.param vthn= 0.61427       $ 2065
.param vthp= -0.57793

.alter
.param vthn= 0.62651       $ 2066
.param vthp= -0.59583

.alter
.param vthn= 0.59111       $ 2067
.param vthp= -0.57996

.alter
.param vthn= 0.63309       $ 2068
.param vthp= -0.58862

.alter
.param vthn= 0.62373       $ 2069
.param vthp= -0.58518

.alter
.param vthn= 0.64888       $ 2070
.param vthp= -0.58688

.alter
.param vthn= 0.64594       $ 2071
.param vthp= -0.59152

.alter
.param vthn= 0.61778       $ 2072
.param vthp= -0.57664

.alter
.param vthn= 0.62394       $ 2073
.param vthp= -0.58996

.alter
.param vthn= 0.62379       $ 2074
.param vthp= -0.58742

.alter
.param vthn= 0.64355       $ 2075
.param vthp= -0.58660

.alter
.param vthn= 0.65208       $ 2076
.param vthp= -0.58563

.alter
.param vthn= 0.65042       $ 2077
.param vthp= -0.58311

.alter
.param vthn= 0.64215       $ 2078
.param vthp= -0.58286

.alter
.param vthn= 0.66740       $ 2079
.param vthp= -0.59033

.alter
.param vthn= 0.62786       $ 2080
.param vthp= -0.57814

.alter
.param vthn= 0.63566       $ 2081
.param vthp= -0.58138

.alter
.param vthn= 0.60927       $ 2082
.param vthp= -0.58442

.alter
.param vthn= 0.65205       $ 2083
.param vthp= -0.58242

.alter
.param vthn= 0.63296       $ 2084
.param vthp= -0.56972

.alter
.param vthn= 0.65877       $ 2085
.param vthp= -0.57748

.alter
.param vthn= 0.65387       $ 2086
.param vthp= -0.58697

.alter
.param vthn= 0.62854       $ 2087
.param vthp= -0.59112

.alter
.param vthn= 0.63123       $ 2088
.param vthp= -0.57893

.alter
.param vthn= 0.66090       $ 2089
.param vthp= -0.59372

.alter
.param vthn= 0.62771       $ 2090
.param vthp= -0.58816

.alter
.param vthn= 0.63789       $ 2091
.param vthp= -0.58586

.alter
.param vthn= 0.64312       $ 2092
.param vthp= -0.57647

.alter
.param vthn= 0.60670       $ 2093
.param vthp= -0.57643

.alter
.param vthn= 0.63092       $ 2094
.param vthp= -0.58264

.alter
.param vthn= 0.67397       $ 2095
.param vthp= -0.58310

.alter
.param vthn= 0.64033       $ 2096
.param vthp= -0.57776

.alter
.param vthn= 0.63847       $ 2097
.param vthp= -0.58993

.alter
.param vthn= 0.64972       $ 2098
.param vthp= -0.58679

.alter
.param vthn= 0.63170       $ 2099
.param vthp= -0.58429

.alter
.param vthn= 0.63407       $ 2100
.param vthp= -0.59305

.alter
.param vthn= 0.61670       $ 2101
.param vthp= -0.56597

.alter
.param vthn= 0.61746       $ 2102
.param vthp= -0.57469

.alter
.param vthn= 0.65408       $ 2103
.param vthp= -0.58753

.alter
.param vthn= 0.63857       $ 2104
.param vthp= -0.58075

.alter
.param vthn= 0.59652       $ 2105
.param vthp= -0.58827

.alter
.param vthn= 0.64097       $ 2106
.param vthp= -0.58191

.alter
.param vthn= 0.62978       $ 2107
.param vthp= -0.58066

.alter
.param vthn= 0.63032       $ 2108
.param vthp= -0.57983

.alter
.param vthn= 0.61597       $ 2109
.param vthp= -0.60026

.alter
.param vthn= 0.64127       $ 2110
.param vthp= -0.58290

.alter
.param vthn= 0.62615       $ 2111
.param vthp= -0.58757

.alter
.param vthn= 0.65256       $ 2112
.param vthp= -0.58713

.alter
.param vthn= 0.64193       $ 2113
.param vthp= -0.57908

.alter
.param vthn= 0.63135       $ 2114
.param vthp= -0.58555

.alter
.param vthn= 0.63965       $ 2115
.param vthp= -0.58429

.alter
.param vthn= 0.63359       $ 2116
.param vthp= -0.58554

.alter
.param vthn= 0.62535       $ 2117
.param vthp= -0.58789

.alter
.param vthn= 0.63978       $ 2118
.param vthp= -0.58980

.alter
.param vthn= 0.61126       $ 2119
.param vthp= -0.58625

.alter
.param vthn= 0.66435       $ 2120
.param vthp= -0.58174

.alter
.param vthn= 0.62935       $ 2121
.param vthp= -0.57844

.alter
.param vthn= 0.62358       $ 2122
.param vthp= -0.59729

.alter
.param vthn= 0.64322       $ 2123
.param vthp= -0.58605

.alter
.param vthn= 0.63789       $ 2124
.param vthp= -0.57164

.alter
.param vthn= 0.61085       $ 2125
.param vthp= -0.57683

.alter
.param vthn= 0.65366       $ 2126
.param vthp= -0.59443

.alter
.param vthn= 0.64212       $ 2127
.param vthp= -0.58382

.alter
.param vthn= 0.62312       $ 2128
.param vthp= -0.56881

.alter
.param vthn= 0.65031       $ 2129
.param vthp= -0.58160

.alter
.param vthn= 0.62580       $ 2130
.param vthp= -0.58021

.alter
.param vthn= 0.62176       $ 2131
.param vthp= -0.58862

.alter
.param vthn= 0.64838       $ 2132
.param vthp= -0.56542

.alter
.param vthn= 0.58762       $ 2133
.param vthp= -0.58289

.alter
.param vthn= 0.62514       $ 2134
.param vthp= -0.57810

.alter
.param vthn= 0.62799       $ 2135
.param vthp= -0.57814

.alter
.param vthn= 0.65387       $ 2136
.param vthp= -0.58008

.alter
.param vthn= 0.65161       $ 2137
.param vthp= -0.57637

.alter
.param vthn= 0.64542       $ 2138
.param vthp= -0.58290

.alter
.param vthn= 0.66478       $ 2139
.param vthp= -0.58219

.alter
.param vthn= 0.62864       $ 2140
.param vthp= -0.57484

.alter
.param vthn= 0.65368       $ 2141
.param vthp= -0.56971

.alter
.param vthn= 0.60933       $ 2142
.param vthp= -0.59471

.alter
.param vthn= 0.64892       $ 2143
.param vthp= -0.57814

.alter
.param vthn= 0.62576       $ 2144
.param vthp= -0.58786

.alter
.param vthn= 0.62987       $ 2145
.param vthp= -0.57897

.alter
.param vthn= 0.60901       $ 2146
.param vthp= -0.57423

.alter
.param vthn= 0.62137       $ 2147
.param vthp= -0.57914

.alter
.param vthn= 0.65648       $ 2148
.param vthp= -0.58262

.alter
.param vthn= 0.64757       $ 2149
.param vthp= -0.58998

.alter
.param vthn= 0.62573       $ 2150
.param vthp= -0.58047

.alter
.param vthn= 0.62265       $ 2151
.param vthp= -0.59137

.alter
.param vthn= 0.61724       $ 2152
.param vthp= -0.58408

.alter
.param vthn= 0.64629       $ 2153
.param vthp= -0.57528

.alter
.param vthn= 0.64839       $ 2154
.param vthp= -0.57357

.alter
.param vthn= 0.63783       $ 2155
.param vthp= -0.57184

.alter
.param vthn= 0.63279       $ 2156
.param vthp= -0.57589

.alter
.param vthn= 0.63721       $ 2157
.param vthp= -0.58136

.alter
.param vthn= 0.63221       $ 2158
.param vthp= -0.59676

.alter
.param vthn= 0.64186       $ 2159
.param vthp= -0.57088

.alter
.param vthn= 0.63246       $ 2160
.param vthp= -0.58994

.alter
.param vthn= 0.62602       $ 2161
.param vthp= -0.58197

.alter
.param vthn= 0.60052       $ 2162
.param vthp= -0.58379

.alter
.param vthn= 0.63515       $ 2163
.param vthp= -0.59270

.alter
.param vthn= 0.63947       $ 2164
.param vthp= -0.58352

.alter
.param vthn= 0.61667       $ 2165
.param vthp= -0.57638

.alter
.param vthn= 0.65493       $ 2166
.param vthp= -0.58027

.alter
.param vthn= 0.64968       $ 2167
.param vthp= -0.57878

.alter
.param vthn= 0.61624       $ 2168
.param vthp= -0.58757

.alter
.param vthn= 0.62280       $ 2169
.param vthp= -0.57539

.alter
.param vthn= 0.62804       $ 2170
.param vthp= -0.58475

.alter
.param vthn= 0.64394       $ 2171
.param vthp= -0.58359

.alter
.param vthn= 0.65623       $ 2172
.param vthp= -0.58120

.alter
.param vthn= 0.65992       $ 2173
.param vthp= -0.58614

.alter
.param vthn= 0.61915       $ 2174
.param vthp= -0.57523

.alter
.param vthn= 0.61975       $ 2175
.param vthp= -0.58292

.alter
.param vthn= 0.61160       $ 2176
.param vthp= -0.58146

.alter
.param vthn= 0.61169       $ 2177
.param vthp= -0.59228

.alter
.param vthn= 0.63881       $ 2178
.param vthp= -0.57742

.alter
.param vthn= 0.65102       $ 2179
.param vthp= -0.58832

.alter
.param vthn= 0.63858       $ 2180
.param vthp= -0.59812

.alter
.param vthn= 0.62027       $ 2181
.param vthp= -0.57385

.alter
.param vthn= 0.63733       $ 2182
.param vthp= -0.58912

.alter
.param vthn= 0.63858       $ 2183
.param vthp= -0.57751

.alter
.param vthn= 0.62944       $ 2184
.param vthp= -0.57920

.alter
.param vthn= 0.64089       $ 2185
.param vthp= -0.57734

.alter
.param vthn= 0.64080       $ 2186
.param vthp= -0.58137

.alter
.param vthn= 0.61702       $ 2187
.param vthp= -0.58894

.alter
.param vthn= 0.62756       $ 2188
.param vthp= -0.58101

.alter
.param vthn= 0.59069       $ 2189
.param vthp= -0.58619

.alter
.param vthn= 0.63259       $ 2190
.param vthp= -0.58969

.alter
.param vthn= 0.61632       $ 2191
.param vthp= -0.58614

.alter
.param vthn= 0.62609       $ 2192
.param vthp= -0.57787

.alter
.param vthn= 0.63952       $ 2193
.param vthp= -0.57902

.alter
.param vthn= 0.63745       $ 2194
.param vthp= -0.57791

.alter
.param vthn= 0.64451       $ 2195
.param vthp= -0.58950

.alter
.param vthn= 0.65339       $ 2196
.param vthp= -0.57951

.alter
.param vthn= 0.60866       $ 2197
.param vthp= -0.59023

.alter
.param vthn= 0.62509       $ 2198
.param vthp= -0.58534

.alter
.param vthn= 0.63354       $ 2199
.param vthp= -0.59245

.alter
.param vthn= 0.64494       $ 2200
.param vthp= -0.58236

.alter
.param vthn= 0.65154       $ 2201
.param vthp= -0.58759

.alter
.param vthn= 0.62627       $ 2202
.param vthp= -0.57527

.alter
.param vthn= 0.66227       $ 2203
.param vthp= -0.58756

.alter
.param vthn= 0.65402       $ 2204
.param vthp= -0.57359

.alter
.param vthn= 0.62837       $ 2205
.param vthp= -0.57627

.alter
.param vthn= 0.63825       $ 2206
.param vthp= -0.59635

.alter
.param vthn= 0.65298       $ 2207
.param vthp= -0.58804

.alter
.param vthn= 0.66684       $ 2208
.param vthp= -0.57889

.alter
.param vthn= 0.64469       $ 2209
.param vthp= -0.57725

.alter
.param vthn= 0.65734       $ 2210
.param vthp= -0.58217

.alter
.param vthn= 0.67800       $ 2211
.param vthp= -0.58166

.alter
.param vthn= 0.63839       $ 2212
.param vthp= -0.58629

.alter
.param vthn= 0.64015       $ 2213
.param vthp= -0.56822

.alter
.param vthn= 0.62955       $ 2214
.param vthp= -0.57717

.alter
.param vthn= 0.63165       $ 2215
.param vthp= -0.57787

.alter
.param vthn= 0.67104       $ 2216
.param vthp= -0.58182

.alter
.param vthn= 0.66984       $ 2217
.param vthp= -0.58863

.alter
.param vthn= 0.66231       $ 2218
.param vthp= -0.59275

.alter
.param vthn= 0.65451       $ 2219
.param vthp= -0.58451

.alter
.param vthn= 0.65573       $ 2220
.param vthp= -0.57966

.alter
.param vthn= 0.63037       $ 2221
.param vthp= -0.57330

.alter
.param vthn= 0.63729       $ 2222
.param vthp= -0.57558

.alter
.param vthn= 0.64712       $ 2223
.param vthp= -0.58176

.alter
.param vthn= 0.65406       $ 2224
.param vthp= -0.57850

.alter
.param vthn= 0.62354       $ 2225
.param vthp= -0.58178

.alter
.param vthn= 0.65239       $ 2226
.param vthp= -0.56686

.alter
.param vthn= 0.65379       $ 2227
.param vthp= -0.58063

.alter
.param vthn= 0.64182       $ 2228
.param vthp= -0.57852

.alter
.param vthn= 0.63899       $ 2229
.param vthp= -0.57188

.alter
.param vthn= 0.64480       $ 2230
.param vthp= -0.58240

.alter
.param vthn= 0.64963       $ 2231
.param vthp= -0.58046

.alter
.param vthn= 0.65376       $ 2232
.param vthp= -0.58097

.alter
.param vthn= 0.63164       $ 2233
.param vthp= -0.57400

.alter
.param vthn= 0.63098       $ 2234
.param vthp= -0.57908

.alter
.param vthn= 0.63292       $ 2235
.param vthp= -0.57463

.alter
.param vthn= 0.64154       $ 2236
.param vthp= -0.57224

.alter
.param vthn= 0.64993       $ 2237
.param vthp= -0.57813

.alter
.param vthn= 0.64576       $ 2238
.param vthp= -0.58078

.alter
.param vthn= 0.67769       $ 2239
.param vthp= -0.57496

.alter
.param vthn= 0.65032       $ 2240
.param vthp= -0.57286

.alter
.param vthn= 0.64129       $ 2241
.param vthp= -0.58196

.alter
.param vthn= 0.66471       $ 2242
.param vthp= -0.58888

.alter
.param vthn= 0.67180       $ 2243
.param vthp= -0.57090

.alter
.param vthn= 0.61498       $ 2244
.param vthp= -0.57279

.alter
.param vthn= 0.67199       $ 2245
.param vthp= -0.57739

.alter
.param vthn= 0.65343       $ 2246
.param vthp= -0.58484

.alter
.param vthn= 0.64199       $ 2247
.param vthp= -0.58542

.alter
.param vthn= 0.61466       $ 2248
.param vthp= -0.56914

.alter
.param vthn= 0.66601       $ 2249
.param vthp= -0.57461

.alter
.param vthn= 0.64874       $ 2250
.param vthp= -0.58943

.alter
.param vthn= 0.65404       $ 2251
.param vthp= -0.57720

.alter
.param vthn= 0.66519       $ 2252
.param vthp= -0.57406

.alter
.param vthn= 0.65273       $ 2253
.param vthp= -0.57469

.alter
.param vthn= 0.64459       $ 2254
.param vthp= -0.57440

.alter
.param vthn= 0.65348       $ 2255
.param vthp= -0.58588

.alter
.param vthn= 0.62518       $ 2256
.param vthp= -0.58963

.alter
.param vthn= 0.63839       $ 2257
.param vthp= -0.58880

.alter
.param vthn= 0.64346       $ 2258
.param vthp= -0.58518

.alter
.param vthn= 0.61961       $ 2259
.param vthp= -0.57335

.alter
.param vthn= 0.62618       $ 2260
.param vthp= -0.57669

.alter
.param vthn= 0.65492       $ 2261
.param vthp= -0.59063

.alter
.param vthn= 0.61882       $ 2262
.param vthp= -0.58026

.alter
.param vthn= 0.65035       $ 2263
.param vthp= -0.57597

.alter
.param vthn= 0.65901       $ 2264
.param vthp= -0.57487

.alter
.param vthn= 0.62542       $ 2265
.param vthp= -0.57479

.alter
.param vthn= 0.63766       $ 2266
.param vthp= -0.59269

.alter
.param vthn= 0.60226       $ 2267
.param vthp= -0.57682

.alter
.param vthn= 0.64424       $ 2268
.param vthp= -0.58548

.alter
.param vthn= 0.63488       $ 2269
.param vthp= -0.58204

.alter
.param vthn= 0.66003       $ 2270
.param vthp= -0.58374

.alter
.param vthn= 0.65709       $ 2271
.param vthp= -0.58838

.alter
.param vthn= 0.62893       $ 2272
.param vthp= -0.57350

.alter
.param vthn= 0.63509       $ 2273
.param vthp= -0.58682

.alter
.param vthn= 0.63494       $ 2274
.param vthp= -0.58428

.alter
.param vthn= 0.65470       $ 2275
.param vthp= -0.58346

.alter
.param vthn= 0.66323       $ 2276
.param vthp= -0.58249

.alter
.param vthn= 0.66157       $ 2277
.param vthp= -0.57997

.alter
.param vthn= 0.65330       $ 2278
.param vthp= -0.57972

.alter
.param vthn= 0.67855       $ 2279
.param vthp= -0.58719

.alter
.param vthn= 0.63901       $ 2280
.param vthp= -0.57500

.alter
.param vthn= 0.64681       $ 2281
.param vthp= -0.57824

.alter
.param vthn= 0.62042       $ 2282
.param vthp= -0.58128

.alter
.param vthn= 0.66320       $ 2283
.param vthp= -0.57928

.alter
.param vthn= 0.64411       $ 2284
.param vthp= -0.56658

.alter
.param vthn= 0.66992       $ 2285
.param vthp= -0.57434

.alter
.param vthn= 0.66502       $ 2286
.param vthp= -0.58383

.alter
.param vthn= 0.63969       $ 2287
.param vthp= -0.58798

.alter
.param vthn= 0.64238       $ 2288
.param vthp= -0.57579

.alter
.param vthn= 0.67205       $ 2289
.param vthp= -0.59058

.alter
.param vthn= 0.63886       $ 2290
.param vthp= -0.58502

.alter
.param vthn= 0.64904       $ 2291
.param vthp= -0.58272

.alter
.param vthn= 0.65427       $ 2292
.param vthp= -0.57333

.alter
.param vthn= 0.61785       $ 2293
.param vthp= -0.57329

.alter
.param vthn= 0.64207       $ 2294
.param vthp= -0.57950

.alter
.param vthn= 0.68512       $ 2295
.param vthp= -0.57996

.alter
.param vthn= 0.65148       $ 2296
.param vthp= -0.57462

.alter
.param vthn= 0.64962       $ 2297
.param vthp= -0.58679

.alter
.param vthn= 0.66087       $ 2298
.param vthp= -0.58365

.alter
.param vthn= 0.64285       $ 2299
.param vthp= -0.58115

.alter
.param vthn= 0.64522       $ 2300
.param vthp= -0.58991

.alter
.param vthn= 0.62785       $ 2301
.param vthp= -0.56283

.alter
.param vthn= 0.62861       $ 2302
.param vthp= -0.57155

.alter
.param vthn= 0.66523       $ 2303
.param vthp= -0.58439

.alter
.param vthn= 0.64972       $ 2304
.param vthp= -0.57761

.alter
.param vthn= 0.60767       $ 2305
.param vthp= -0.58513

.alter
.param vthn= 0.65212       $ 2306
.param vthp= -0.57877

.alter
.param vthn= 0.64093       $ 2307
.param vthp= -0.57752

.alter
.param vthn= 0.64147       $ 2308
.param vthp= -0.57669

.alter
.param vthn= 0.62712       $ 2309
.param vthp= -0.59712

.alter
.param vthn= 0.65242       $ 2310
.param vthp= -0.57976

.alter
.param vthn= 0.63730       $ 2311
.param vthp= -0.58443

.alter
.param vthn= 0.66371       $ 2312
.param vthp= -0.58399

.alter
.param vthn= 0.65308       $ 2313
.param vthp= -0.57594

.alter
.param vthn= 0.64250       $ 2314
.param vthp= -0.58241

.alter
.param vthn= 0.65080       $ 2315
.param vthp= -0.58115

.alter
.param vthn= 0.64474       $ 2316
.param vthp= -0.58240

.alter
.param vthn= 0.63650       $ 2317
.param vthp= -0.58475

.alter
.param vthn= 0.65093       $ 2318
.param vthp= -0.58666

.alter
.param vthn= 0.62241       $ 2319
.param vthp= -0.58311

.alter
.param vthn= 0.67550       $ 2320
.param vthp= -0.57860

.alter
.param vthn= 0.64050       $ 2321
.param vthp= -0.57530

.alter
.param vthn= 0.63473       $ 2322
.param vthp= -0.59415

.alter
.param vthn= 0.65437       $ 2323
.param vthp= -0.58291

.alter
.param vthn= 0.64904       $ 2324
.param vthp= -0.56850

.alter
.param vthn= 0.62200       $ 2325
.param vthp= -0.57369

.alter
.param vthn= 0.66481       $ 2326
.param vthp= -0.59129

.alter
.param vthn= 0.65327       $ 2327
.param vthp= -0.58068

.alter
.param vthn= 0.63427       $ 2328
.param vthp= -0.56567

.alter
.param vthn= 0.66146       $ 2329
.param vthp= -0.57846

.alter
.param vthn= 0.63695       $ 2330
.param vthp= -0.57707

.alter
.param vthn= 0.63291       $ 2331
.param vthp= -0.58548

.alter
.param vthn= 0.65953       $ 2332
.param vthp= -0.56228

.alter
.param vthn= 0.59877       $ 2333
.param vthp= -0.57975

.alter
.param vthn= 0.63629       $ 2334
.param vthp= -0.57496

.alter
.param vthn= 0.63914       $ 2335
.param vthp= -0.57500

.alter
.param vthn= 0.66502       $ 2336
.param vthp= -0.57694

.alter
.param vthn= 0.66276       $ 2337
.param vthp= -0.57323

.alter
.param vthn= 0.65657       $ 2338
.param vthp= -0.57976

.alter
.param vthn= 0.67593       $ 2339
.param vthp= -0.57905

.alter
.param vthn= 0.63979       $ 2340
.param vthp= -0.57170

.alter
.param vthn= 0.66483       $ 2341
.param vthp= -0.56657

.alter
.param vthn= 0.62048       $ 2342
.param vthp= -0.59157

.alter
.param vthn= 0.66007       $ 2343
.param vthp= -0.57500

.alter
.param vthn= 0.63691       $ 2344
.param vthp= -0.58472

.alter
.param vthn= 0.64102       $ 2345
.param vthp= -0.57583

.alter
.param vthn= 0.62016       $ 2346
.param vthp= -0.57109

.alter
.param vthn= 0.63252       $ 2347
.param vthp= -0.57600

.alter
.param vthn= 0.66763       $ 2348
.param vthp= -0.57948

.alter
.param vthn= 0.65872       $ 2349
.param vthp= -0.58684

.alter
.param vthn= 0.63688       $ 2350
.param vthp= -0.57733

.alter
.param vthn= 0.63380       $ 2351
.param vthp= -0.58823

.alter
.param vthn= 0.62839       $ 2352
.param vthp= -0.58094

.alter
.param vthn= 0.65744       $ 2353
.param vthp= -0.57214

.alter
.param vthn= 0.65954       $ 2354
.param vthp= -0.57043

.alter
.param vthn= 0.64898       $ 2355
.param vthp= -0.56870

.alter
.param vthn= 0.64394       $ 2356
.param vthp= -0.57275

.alter
.param vthn= 0.64836       $ 2357
.param vthp= -0.57822

.alter
.param vthn= 0.64336       $ 2358
.param vthp= -0.59362

.alter
.param vthn= 0.65301       $ 2359
.param vthp= -0.56774

.alter
.param vthn= 0.64361       $ 2360
.param vthp= -0.58680

.alter
.param vthn= 0.63717       $ 2361
.param vthp= -0.57883

.alter
.param vthn= 0.61167       $ 2362
.param vthp= -0.58065

.alter
.param vthn= 0.64630       $ 2363
.param vthp= -0.58956

.alter
.param vthn= 0.65062       $ 2364
.param vthp= -0.58038

.alter
.param vthn= 0.62782       $ 2365
.param vthp= -0.57324

.alter
.param vthn= 0.66608       $ 2366
.param vthp= -0.57713

.alter
.param vthn= 0.66083       $ 2367
.param vthp= -0.57564

.alter
.param vthn= 0.62739       $ 2368
.param vthp= -0.58443

.alter
.param vthn= 0.63395       $ 2369
.param vthp= -0.57225

.alter
.param vthn= 0.63919       $ 2370
.param vthp= -0.58161

.alter
.param vthn= 0.65509       $ 2371
.param vthp= -0.58045

.alter
.param vthn= 0.66738       $ 2372
.param vthp= -0.57806

.alter
.param vthn= 0.67107       $ 2373
.param vthp= -0.58300

.alter
.param vthn= 0.63030       $ 2374
.param vthp= -0.57209

.alter
.param vthn= 0.63090       $ 2375
.param vthp= -0.57978

.alter
.param vthn= 0.62275       $ 2376
.param vthp= -0.57832

.alter
.param vthn= 0.62284       $ 2377
.param vthp= -0.58914

.alter
.param vthn= 0.64996       $ 2378
.param vthp= -0.57428

.alter
.param vthn= 0.66217       $ 2379
.param vthp= -0.58518

.alter
.param vthn= 0.64973       $ 2380
.param vthp= -0.59498

.alter
.param vthn= 0.63142       $ 2381
.param vthp= -0.57071

.alter
.param vthn= 0.64848       $ 2382
.param vthp= -0.58598

.alter
.param vthn= 0.64973       $ 2383
.param vthp= -0.57437

.alter
.param vthn= 0.64059       $ 2384
.param vthp= -0.57606

.alter
.param vthn= 0.65204       $ 2385
.param vthp= -0.57420

.alter
.param vthn= 0.65195       $ 2386
.param vthp= -0.57823

.alter
.param vthn= 0.62817       $ 2387
.param vthp= -0.58580

.alter
.param vthn= 0.63871       $ 2388
.param vthp= -0.57787

.alter
.param vthn= 0.60184       $ 2389
.param vthp= -0.58305

.alter
.param vthn= 0.64374       $ 2390
.param vthp= -0.58655

.alter
.param vthn= 0.62747       $ 2391
.param vthp= -0.58300

.alter
.param vthn= 0.63724       $ 2392
.param vthp= -0.57473

.alter
.param vthn= 0.65067       $ 2393
.param vthp= -0.57588

.alter
.param vthn= 0.64860       $ 2394
.param vthp= -0.57477

.alter
.param vthn= 0.65566       $ 2395
.param vthp= -0.58636

.alter
.param vthn= 0.66454       $ 2396
.param vthp= -0.57637

.alter
.param vthn= 0.61981       $ 2397
.param vthp= -0.58709

.alter
.param vthn= 0.63624       $ 2398
.param vthp= -0.58220

.alter
.param vthn= 0.64469       $ 2399
.param vthp= -0.58931

.alter
.param vthn= 0.65609       $ 2400
.param vthp= -0.57922

.alter
.param vthn= 0.63908       $ 2401
.param vthp= -0.58822

.alter
.param vthn= 0.61381       $ 2402
.param vthp= -0.57590

.alter
.param vthn= 0.64981       $ 2403
.param vthp= -0.58819

.alter
.param vthn= 0.64156       $ 2404
.param vthp= -0.57422

.alter
.param vthn= 0.61591       $ 2405
.param vthp= -0.57690

.alter
.param vthn= 0.62579       $ 2406
.param vthp= -0.59698

.alter
.param vthn= 0.64052       $ 2407
.param vthp= -0.58867

.alter
.param vthn= 0.65438       $ 2408
.param vthp= -0.57952

.alter
.param vthn= 0.63223       $ 2409
.param vthp= -0.57788

.alter
.param vthn= 0.64488       $ 2410
.param vthp= -0.58280

.alter
.param vthn= 0.66554       $ 2411
.param vthp= -0.58229

.alter
.param vthn= 0.62593       $ 2412
.param vthp= -0.58692

.alter
.param vthn= 0.62769       $ 2413
.param vthp= -0.56885

.alter
.param vthn= 0.61709       $ 2414
.param vthp= -0.57780

.alter
.param vthn= 0.61919       $ 2415
.param vthp= -0.57850

.alter
.param vthn= 0.65858       $ 2416
.param vthp= -0.58245

.alter
.param vthn= 0.65738       $ 2417
.param vthp= -0.58926

.alter
.param vthn= 0.64985       $ 2418
.param vthp= -0.59338

.alter
.param vthn= 0.64205       $ 2419
.param vthp= -0.58514

.alter
.param vthn= 0.64327       $ 2420
.param vthp= -0.58029

.alter
.param vthn= 0.61791       $ 2421
.param vthp= -0.57393

.alter
.param vthn= 0.62483       $ 2422
.param vthp= -0.57621

.alter
.param vthn= 0.63466       $ 2423
.param vthp= -0.58239

.alter
.param vthn= 0.64160       $ 2424
.param vthp= -0.57913

.alter
.param vthn= 0.61108       $ 2425
.param vthp= -0.58241

.alter
.param vthn= 0.63993       $ 2426
.param vthp= -0.56749

.alter
.param vthn= 0.64133       $ 2427
.param vthp= -0.58126

.alter
.param vthn= 0.62936       $ 2428
.param vthp= -0.57915

.alter
.param vthn= 0.62653       $ 2429
.param vthp= -0.57251

.alter
.param vthn= 0.63234       $ 2430
.param vthp= -0.58303

.alter
.param vthn= 0.63717       $ 2431
.param vthp= -0.58109

.alter
.param vthn= 0.64130       $ 2432
.param vthp= -0.58160

.alter
.param vthn= 0.61918       $ 2433
.param vthp= -0.57463

.alter
.param vthn= 0.61852       $ 2434
.param vthp= -0.57971

.alter
.param vthn= 0.62046       $ 2435
.param vthp= -0.57526

.alter
.param vthn= 0.62908       $ 2436
.param vthp= -0.57287

.alter
.param vthn= 0.63747       $ 2437
.param vthp= -0.57876

.alter
.param vthn= 0.63330       $ 2438
.param vthp= -0.58141

.alter
.param vthn= 0.66523       $ 2439
.param vthp= -0.57559

.alter
.param vthn= 0.63786       $ 2440
.param vthp= -0.57349

.alter
.param vthn= 0.62883       $ 2441
.param vthp= -0.58259

.alter
.param vthn= 0.65225       $ 2442
.param vthp= -0.58951

.alter
.param vthn= 0.65934       $ 2443
.param vthp= -0.57153

.alter
.param vthn= 0.60252       $ 2444
.param vthp= -0.57342

.alter
.param vthn= 0.65953       $ 2445
.param vthp= -0.57802

.alter
.param vthn= 0.64097       $ 2446
.param vthp= -0.58547

.alter
.param vthn= 0.62953       $ 2447
.param vthp= -0.58605

.alter
.param vthn= 0.60220       $ 2448
.param vthp= -0.56977

.alter
.param vthn= 0.65355       $ 2449
.param vthp= -0.57524

.alter
.param vthn= 0.63628       $ 2450
.param vthp= -0.59006

.alter
.param vthn= 0.64158       $ 2451
.param vthp= -0.57783

.alter
.param vthn= 0.65273       $ 2452
.param vthp= -0.57469

.alter
.param vthn= 0.64027       $ 2453
.param vthp= -0.57532

.alter
.param vthn= 0.63213       $ 2454
.param vthp= -0.57503

.alter
.param vthn= 0.64102       $ 2455
.param vthp= -0.58651

.alter
.param vthn= 0.61272       $ 2456
.param vthp= -0.59026

.alter
.param vthn= 0.62593       $ 2457
.param vthp= -0.58943

.alter
.param vthn= 0.63100       $ 2458
.param vthp= -0.58581

.alter
.param vthn= 0.60715       $ 2459
.param vthp= -0.57398

.alter
.param vthn= 0.61372       $ 2460
.param vthp= -0.57732

.alter
.param vthn= 0.64246       $ 2461
.param vthp= -0.59126

.alter
.param vthn= 0.60636       $ 2462
.param vthp= -0.58089

.alter
.param vthn= 0.63789       $ 2463
.param vthp= -0.57660

.alter
.param vthn= 0.64655       $ 2464
.param vthp= -0.57550

.alter
.param vthn= 0.61296       $ 2465
.param vthp= -0.57542

.alter
.param vthn= 0.62520       $ 2466
.param vthp= -0.59332

.alter
.param vthn= 0.58980       $ 2467
.param vthp= -0.57745

.alter
.param vthn= 0.63178       $ 2468
.param vthp= -0.58611

.alter
.param vthn= 0.62242       $ 2469
.param vthp= -0.58267

.alter
.param vthn= 0.64757       $ 2470
.param vthp= -0.58437

.alter
.param vthn= 0.64463       $ 2471
.param vthp= -0.58901

.alter
.param vthn= 0.61647       $ 2472
.param vthp= -0.57413

.alter
.param vthn= 0.62263       $ 2473
.param vthp= -0.58745

.alter
.param vthn= 0.62248       $ 2474
.param vthp= -0.58491

.alter
.param vthn= 0.64224       $ 2475
.param vthp= -0.58409

.alter
.param vthn= 0.65077       $ 2476
.param vthp= -0.58312

.alter
.param vthn= 0.64911       $ 2477
.param vthp= -0.58060

.alter
.param vthn= 0.64084       $ 2478
.param vthp= -0.58035

.alter
.param vthn= 0.66609       $ 2479
.param vthp= -0.58782

.alter
.param vthn= 0.62655       $ 2480
.param vthp= -0.57563

.alter
.param vthn= 0.63435       $ 2481
.param vthp= -0.57887

.alter
.param vthn= 0.60796       $ 2482
.param vthp= -0.58191

.alter
.param vthn= 0.65074       $ 2483
.param vthp= -0.57991

.alter
.param vthn= 0.63165       $ 2484
.param vthp= -0.56721

.alter
.param vthn= 0.65746       $ 2485
.param vthp= -0.57497

.alter
.param vthn= 0.65256       $ 2486
.param vthp= -0.58446

.alter
.param vthn= 0.62723       $ 2487
.param vthp= -0.58861

.alter
.param vthn= 0.62992       $ 2488
.param vthp= -0.57642

.alter
.param vthn= 0.65959       $ 2489
.param vthp= -0.59121

.alter
.param vthn= 0.62640       $ 2490
.param vthp= -0.58565

.alter
.param vthn= 0.63658       $ 2491
.param vthp= -0.58335

.alter
.param vthn= 0.64181       $ 2492
.param vthp= -0.57396

.alter
.param vthn= 0.60539       $ 2493
.param vthp= -0.57392

.alter
.param vthn= 0.62961       $ 2494
.param vthp= -0.58013

.alter
.param vthn= 0.67266       $ 2495
.param vthp= -0.58059

.alter
.param vthn= 0.63902       $ 2496
.param vthp= -0.57525

.alter
.param vthn= 0.63716       $ 2497
.param vthp= -0.58742

.alter
.param vthn= 0.64841       $ 2498
.param vthp= -0.58428

.alter
.param vthn= 0.63039       $ 2499
.param vthp= -0.58178

.alter
.param vthn= 0.63276       $ 2500
.param vthp= -0.59054

.alter
.param vthn= 0.61539       $ 2501
.param vthp= -0.56346

.alter
.param vthn= 0.61615       $ 2502
.param vthp= -0.57218

.alter
.param vthn= 0.65277       $ 2503
.param vthp= -0.58502

.alter
.param vthn= 0.63726       $ 2504
.param vthp= -0.57824

.alter
.param vthn= 0.59521       $ 2505
.param vthp= -0.58576

.alter
.param vthn= 0.63966       $ 2506
.param vthp= -0.57940

.alter
.param vthn= 0.62847       $ 2507
.param vthp= -0.57815

.alter
.param vthn= 0.62901       $ 2508
.param vthp= -0.57732

.alter
.param vthn= 0.61466       $ 2509
.param vthp= -0.59775

.alter
.param vthn= 0.63996       $ 2510
.param vthp= -0.58039

.alter
.param vthn= 0.62484       $ 2511
.param vthp= -0.58506

.alter
.param vthn= 0.65125       $ 2512
.param vthp= -0.58462

.alter
.param vthn= 0.64062       $ 2513
.param vthp= -0.57657

.alter
.param vthn= 0.63004       $ 2514
.param vthp= -0.58304

.alter
.param vthn= 0.63834       $ 2515
.param vthp= -0.58178

.alter
.param vthn= 0.63228       $ 2516
.param vthp= -0.58303

.alter
.param vthn= 0.62404       $ 2517
.param vthp= -0.58538

.alter
.param vthn= 0.63847       $ 2518
.param vthp= -0.58729

.alter
.param vthn= 0.60995       $ 2519
.param vthp= -0.58374

.alter
.param vthn= 0.66304       $ 2520
.param vthp= -0.57923

.alter
.param vthn= 0.62804       $ 2521
.param vthp= -0.57593

.alter
.param vthn= 0.62227       $ 2522
.param vthp= -0.59478

.alter
.param vthn= 0.64191       $ 2523
.param vthp= -0.58354

.alter
.param vthn= 0.63658       $ 2524
.param vthp= -0.56913

.alter
.param vthn= 0.60954       $ 2525
.param vthp= -0.57432

.alter
.param vthn= 0.65235       $ 2526
.param vthp= -0.59192

.alter
.param vthn= 0.64081       $ 2527
.param vthp= -0.58131

.alter
.param vthn= 0.62181       $ 2528
.param vthp= -0.56630

.alter
.param vthn= 0.64900       $ 2529
.param vthp= -0.57909

.alter
.param vthn= 0.62449       $ 2530
.param vthp= -0.57770

.alter
.param vthn= 0.62045       $ 2531
.param vthp= -0.58611

.alter
.param vthn= 0.64707       $ 2532
.param vthp= -0.56291

.alter
.param vthn= 0.58631       $ 2533
.param vthp= -0.58038

.alter
.param vthn= 0.62383       $ 2534
.param vthp= -0.57559

.alter
.param vthn= 0.62668       $ 2535
.param vthp= -0.57563

.alter
.param vthn= 0.65256       $ 2536
.param vthp= -0.57757

.alter
.param vthn= 0.65030       $ 2537
.param vthp= -0.57386

.alter
.param vthn= 0.64411       $ 2538
.param vthp= -0.58039

.alter
.param vthn= 0.66347       $ 2539
.param vthp= -0.57968

.alter
.param vthn= 0.62733       $ 2540
.param vthp= -0.57233

.alter
.param vthn= 0.65237       $ 2541
.param vthp= -0.56720

.alter
.param vthn= 0.60802       $ 2542
.param vthp= -0.59220

.alter
.param vthn= 0.64761       $ 2543
.param vthp= -0.57563

.alter
.param vthn= 0.62445       $ 2544
.param vthp= -0.58535

.alter
.param vthn= 0.62856       $ 2545
.param vthp= -0.57646

.alter
.param vthn= 0.60770       $ 2546
.param vthp= -0.57172

.alter
.param vthn= 0.62006       $ 2547
.param vthp= -0.57663

.alter
.param vthn= 0.65517       $ 2548
.param vthp= -0.58011

.alter
.param vthn= 0.64626       $ 2549
.param vthp= -0.58747

.alter
.param vthn= 0.62442       $ 2550
.param vthp= -0.57796

.alter
.param vthn= 0.62134       $ 2551
.param vthp= -0.58886

.alter
.param vthn= 0.61593       $ 2552
.param vthp= -0.58157

.alter
.param vthn= 0.64498       $ 2553
.param vthp= -0.57277

.alter
.param vthn= 0.64708       $ 2554
.param vthp= -0.57106

.alter
.param vthn= 0.63652       $ 2555
.param vthp= -0.56933

.alter
.param vthn= 0.63148       $ 2556
.param vthp= -0.57338

.alter
.param vthn= 0.63590       $ 2557
.param vthp= -0.57885

.alter
.param vthn= 0.63090       $ 2558
.param vthp= -0.59425

.alter
.param vthn= 0.64055       $ 2559
.param vthp= -0.56837

.alter
.param vthn= 0.63115       $ 2560
.param vthp= -0.58743

.alter
.param vthn= 0.62471       $ 2561
.param vthp= -0.57946

.alter
.param vthn= 0.59921       $ 2562
.param vthp= -0.58128

.alter
.param vthn= 0.63384       $ 2563
.param vthp= -0.59019

.alter
.param vthn= 0.63816       $ 2564
.param vthp= -0.58101

.alter
.param vthn= 0.61536       $ 2565
.param vthp= -0.57387

.alter
.param vthn= 0.65362       $ 2566
.param vthp= -0.57776

.alter
.param vthn= 0.64837       $ 2567
.param vthp= -0.57627

.alter
.param vthn= 0.61493       $ 2568
.param vthp= -0.58506

.alter
.param vthn= 0.62149       $ 2569
.param vthp= -0.57288

.alter
.param vthn= 0.62673       $ 2570
.param vthp= -0.58224

.alter
.param vthn= 0.64263       $ 2571
.param vthp= -0.58108

.alter
.param vthn= 0.65492       $ 2572
.param vthp= -0.57869

.alter
.param vthn= 0.65861       $ 2573
.param vthp= -0.58363

.alter
.param vthn= 0.61784       $ 2574
.param vthp= -0.57272

.alter
.param vthn= 0.61844       $ 2575
.param vthp= -0.58041

.alter
.param vthn= 0.61029       $ 2576
.param vthp= -0.57895

.alter
.param vthn= 0.61038       $ 2577
.param vthp= -0.58977

.alter
.param vthn= 0.63750       $ 2578
.param vthp= -0.57491

.alter
.param vthn= 0.64971       $ 2579
.param vthp= -0.58581

.alter
.param vthn= 0.63727       $ 2580
.param vthp= -0.59561

.alter
.param vthn= 0.61896       $ 2581
.param vthp= -0.57134

.alter
.param vthn= 0.63602       $ 2582
.param vthp= -0.58661

.alter
.param vthn= 0.63727       $ 2583
.param vthp= -0.57500

.alter
.param vthn= 0.62813       $ 2584
.param vthp= -0.57669

.alter
.param vthn= 0.63958       $ 2585
.param vthp= -0.57483

.alter
.param vthn= 0.63949       $ 2586
.param vthp= -0.57886

.alter
.param vthn= 0.61571       $ 2587
.param vthp= -0.58643

.alter
.param vthn= 0.62625       $ 2588
.param vthp= -0.57850

.alter
.param vthn= 0.58938       $ 2589
.param vthp= -0.58368

.alter
.param vthn= 0.63128       $ 2590
.param vthp= -0.58718

.alter
.param vthn= 0.61501       $ 2591
.param vthp= -0.58363

.alter
.param vthn= 0.62478       $ 2592
.param vthp= -0.57536

.alter
.param vthn= 0.63821       $ 2593
.param vthp= -0.57651

.alter
.param vthn= 0.63614       $ 2594
.param vthp= -0.57540

.alter
.param vthn= 0.64320       $ 2595
.param vthp= -0.58699

.alter
.param vthn= 0.65208       $ 2596
.param vthp= -0.57700

.alter
.param vthn= 0.60735       $ 2597
.param vthp= -0.58772

.alter
.param vthn= 0.62378       $ 2598
.param vthp= -0.58283

.alter
.param vthn= 0.63223       $ 2599
.param vthp= -0.58994

.alter
.param vthn= 0.64363       $ 2600
.param vthp= -0.57985

.alter
.param vthn= 0.63094       $ 2601
.param vthp= -0.58793

.alter
.param vthn= 0.60567       $ 2602
.param vthp= -0.57561

.alter
.param vthn= 0.64167       $ 2603
.param vthp= -0.58790

.alter
.param vthn= 0.63342       $ 2604
.param vthp= -0.57393

.alter
.param vthn= 0.60777       $ 2605
.param vthp= -0.57661

.alter
.param vthn= 0.61765       $ 2606
.param vthp= -0.59669

.alter
.param vthn= 0.63238       $ 2607
.param vthp= -0.58838

.alter
.param vthn= 0.64624       $ 2608
.param vthp= -0.57923

.alter
.param vthn= 0.62409       $ 2609
.param vthp= -0.57759

.alter
.param vthn= 0.63674       $ 2610
.param vthp= -0.58251

.alter
.param vthn= 0.65740       $ 2611
.param vthp= -0.58200

.alter
.param vthn= 0.61779       $ 2612
.param vthp= -0.58663

.alter
.param vthn= 0.61955       $ 2613
.param vthp= -0.56856

.alter
.param vthn= 0.60895       $ 2614
.param vthp= -0.57751

.alter
.param vthn= 0.61105       $ 2615
.param vthp= -0.57821

.alter
.param vthn= 0.65044       $ 2616
.param vthp= -0.58216

.alter
.param vthn= 0.64924       $ 2617
.param vthp= -0.58897

.alter
.param vthn= 0.64171       $ 2618
.param vthp= -0.59309

.alter
.param vthn= 0.63391       $ 2619
.param vthp= -0.58485

.alter
.param vthn= 0.63513       $ 2620
.param vthp= -0.58000

.alter
.param vthn= 0.60977       $ 2621
.param vthp= -0.57364

.alter
.param vthn= 0.61669       $ 2622
.param vthp= -0.57592

.alter
.param vthn= 0.62652       $ 2623
.param vthp= -0.58210

.alter
.param vthn= 0.63346       $ 2624
.param vthp= -0.57884

.alter
.param vthn= 0.60294       $ 2625
.param vthp= -0.58212

.alter
.param vthn= 0.63179       $ 2626
.param vthp= -0.56720

.alter
.param vthn= 0.63319       $ 2627
.param vthp= -0.58097

.alter
.param vthn= 0.62122       $ 2628
.param vthp= -0.57886

.alter
.param vthn= 0.61839       $ 2629
.param vthp= -0.57222

.alter
.param vthn= 0.62420       $ 2630
.param vthp= -0.58274

.alter
.param vthn= 0.62903       $ 2631
.param vthp= -0.58080

.alter
.param vthn= 0.63316       $ 2632
.param vthp= -0.58131

.alter
.param vthn= 0.61104       $ 2633
.param vthp= -0.57434

.alter
.param vthn= 0.61038       $ 2634
.param vthp= -0.57942

.alter
.param vthn= 0.61232       $ 2635
.param vthp= -0.57497

.alter
.param vthn= 0.62094       $ 2636
.param vthp= -0.57258

.alter
.param vthn= 0.62933       $ 2637
.param vthp= -0.57847

.alter
.param vthn= 0.62516       $ 2638
.param vthp= -0.58112

.alter
.param vthn= 0.65709       $ 2639
.param vthp= -0.57530

.alter
.param vthn= 0.62972       $ 2640
.param vthp= -0.57320

.alter
.param vthn= 0.62069       $ 2641
.param vthp= -0.58230

.alter
.param vthn= 0.64411       $ 2642
.param vthp= -0.58922

.alter
.param vthn= 0.65120       $ 2643
.param vthp= -0.57124

.alter
.param vthn= 0.59438       $ 2644
.param vthp= -0.57313

.alter
.param vthn= 0.65139       $ 2645
.param vthp= -0.57773

.alter
.param vthn= 0.63283       $ 2646
.param vthp= -0.58518

.alter
.param vthn= 0.62139       $ 2647
.param vthp= -0.58576

.alter
.param vthn= 0.59406       $ 2648
.param vthp= -0.56948

.alter
.param vthn= 0.64541       $ 2649
.param vthp= -0.57495

.alter
.param vthn= 0.62814       $ 2650
.param vthp= -0.58977

.alter
.param vthn= 0.63344       $ 2651
.param vthp= -0.57754

.alter
.param vthn= 0.64459       $ 2652
.param vthp= -0.57440

.alter
.param vthn= 0.63213       $ 2653
.param vthp= -0.57503

.alter
.param vthn= 0.62399       $ 2654
.param vthp= -0.57474

.alter
.param vthn= 0.63288       $ 2655
.param vthp= -0.58622

.alter
.param vthn= 0.60458       $ 2656
.param vthp= -0.58997

.alter
.param vthn= 0.61779       $ 2657
.param vthp= -0.58914

.alter
.param vthn= 0.62286       $ 2658
.param vthp= -0.58552

.alter
.param vthn= 0.59901       $ 2659
.param vthp= -0.57369

.alter
.param vthn= 0.60558       $ 2660
.param vthp= -0.57703

.alter
.param vthn= 0.63432       $ 2661
.param vthp= -0.59097

.alter
.param vthn= 0.59822       $ 2662
.param vthp= -0.58060

.alter
.param vthn= 0.62975       $ 2663
.param vthp= -0.57631

.alter
.param vthn= 0.63841       $ 2664
.param vthp= -0.57521

.alter
.param vthn= 0.60482       $ 2665
.param vthp= -0.57513

.alter
.param vthn= 0.61706       $ 2666
.param vthp= -0.59303

.alter
.param vthn= 0.58166       $ 2667
.param vthp= -0.57716

.alter
.param vthn= 0.62364       $ 2668
.param vthp= -0.58582

.alter
.param vthn= 0.61428       $ 2669
.param vthp= -0.58238

.alter
.param vthn= 0.63943       $ 2670
.param vthp= -0.58408

.alter
.param vthn= 0.63649       $ 2671
.param vthp= -0.58872

.alter
.param vthn= 0.60833       $ 2672
.param vthp= -0.57384

.alter
.param vthn= 0.61449       $ 2673
.param vthp= -0.58716

.alter
.param vthn= 0.61434       $ 2674
.param vthp= -0.58462

.alter
.param vthn= 0.63410       $ 2675
.param vthp= -0.58380

.alter
.param vthn= 0.64263       $ 2676
.param vthp= -0.58283

.alter
.param vthn= 0.64097       $ 2677
.param vthp= -0.58031

.alter
.param vthn= 0.63270       $ 2678
.param vthp= -0.58006

.alter
.param vthn= 0.65795       $ 2679
.param vthp= -0.58753

.alter
.param vthn= 0.61841       $ 2680
.param vthp= -0.57534

.alter
.param vthn= 0.62621       $ 2681
.param vthp= -0.57858

.alter
.param vthn= 0.59982       $ 2682
.param vthp= -0.58162

.alter
.param vthn= 0.64260       $ 2683
.param vthp= -0.57962

.alter
.param vthn= 0.62351       $ 2684
.param vthp= -0.56692

.alter
.param vthn= 0.64932       $ 2685
.param vthp= -0.57468

.alter
.param vthn= 0.64442       $ 2686
.param vthp= -0.58417

.alter
.param vthn= 0.61909       $ 2687
.param vthp= -0.58832

.alter
.param vthn= 0.62178       $ 2688
.param vthp= -0.57613

.alter
.param vthn= 0.65145       $ 2689
.param vthp= -0.59092

.alter
.param vthn= 0.61826       $ 2690
.param vthp= -0.58536

.alter
.param vthn= 0.62844       $ 2691
.param vthp= -0.58306

.alter
.param vthn= 0.63367       $ 2692
.param vthp= -0.57367

.alter
.param vthn= 0.59725       $ 2693
.param vthp= -0.57363

.alter
.param vthn= 0.62147       $ 2694
.param vthp= -0.57984

.alter
.param vthn= 0.66452       $ 2695
.param vthp= -0.58030

.alter
.param vthn= 0.63088       $ 2696
.param vthp= -0.57496

.alter
.param vthn= 0.62902       $ 2697
.param vthp= -0.58713

.alter
.param vthn= 0.64027       $ 2698
.param vthp= -0.58399

.alter
.param vthn= 0.62225       $ 2699
.param vthp= -0.58149

.alter
.param vthn= 0.62462       $ 2700
.param vthp= -0.59025

.alter
.param vthn= 0.60725       $ 2701
.param vthp= -0.56317

.alter
.param vthn= 0.60801       $ 2702
.param vthp= -0.57189

.alter
.param vthn= 0.64463       $ 2703
.param vthp= -0.58473

.alter
.param vthn= 0.62912       $ 2704
.param vthp= -0.57795

.alter
.param vthn= 0.58707       $ 2705
.param vthp= -0.58547

.alter
.param vthn= 0.63152       $ 2706
.param vthp= -0.57911

.alter
.param vthn= 0.62033       $ 2707
.param vthp= -0.57786

.alter
.param vthn= 0.62087       $ 2708
.param vthp= -0.57703

.alter
.param vthn= 0.60652       $ 2709
.param vthp= -0.59746

.alter
.param vthn= 0.63182       $ 2710
.param vthp= -0.58010

.alter
.param vthn= 0.61670       $ 2711
.param vthp= -0.58477

.alter
.param vthn= 0.64311       $ 2712
.param vthp= -0.58433

.alter
.param vthn= 0.63248       $ 2713
.param vthp= -0.57628

.alter
.param vthn= 0.62190       $ 2714
.param vthp= -0.58275

.alter
.param vthn= 0.63020       $ 2715
.param vthp= -0.58149

.alter
.param vthn= 0.62414       $ 2716
.param vthp= -0.58274

.alter
.param vthn= 0.61590       $ 2717
.param vthp= -0.58509

.alter
.param vthn= 0.63033       $ 2718
.param vthp= -0.58700

.alter
.param vthn= 0.60181       $ 2719
.param vthp= -0.58345

.alter
.param vthn= 0.65490       $ 2720
.param vthp= -0.57894

.alter
.param vthn= 0.61990       $ 2721
.param vthp= -0.57564

.alter
.param vthn= 0.61413       $ 2722
.param vthp= -0.59449

.alter
.param vthn= 0.63377       $ 2723
.param vthp= -0.58325

.alter
.param vthn= 0.62844       $ 2724
.param vthp= -0.56884

.alter
.param vthn= 0.60140       $ 2725
.param vthp= -0.57403

.alter
.param vthn= 0.64421       $ 2726
.param vthp= -0.59163

.alter
.param vthn= 0.63267       $ 2727
.param vthp= -0.58102

.alter
.param vthn= 0.61367       $ 2728
.param vthp= -0.56601

.alter
.param vthn= 0.64086       $ 2729
.param vthp= -0.57880

.alter
.param vthn= 0.61635       $ 2730
.param vthp= -0.57741

.alter
.param vthn= 0.61231       $ 2731
.param vthp= -0.58582

.alter
.param vthn= 0.63893       $ 2732
.param vthp= -0.56262

.alter
.param vthn= 0.57817       $ 2733
.param vthp= -0.58009

.alter
.param vthn= 0.61569       $ 2734
.param vthp= -0.57530

.alter
.param vthn= 0.61854       $ 2735
.param vthp= -0.57534

.alter
.param vthn= 0.64442       $ 2736
.param vthp= -0.57728

.alter
.param vthn= 0.64216       $ 2737
.param vthp= -0.57357

.alter
.param vthn= 0.63597       $ 2738
.param vthp= -0.58010

.alter
.param vthn= 0.65533       $ 2739
.param vthp= -0.57939

.alter
.param vthn= 0.61919       $ 2740
.param vthp= -0.57204

.alter
.param vthn= 0.64423       $ 2741
.param vthp= -0.56691

.alter
.param vthn= 0.59988       $ 2742
.param vthp= -0.59191

.alter
.param vthn= 0.63947       $ 2743
.param vthp= -0.57534

.alter
.param vthn= 0.61631       $ 2744
.param vthp= -0.58506

.alter
.param vthn= 0.62042       $ 2745
.param vthp= -0.57617

.alter
.param vthn= 0.59956       $ 2746
.param vthp= -0.57143

.alter
.param vthn= 0.61192       $ 2747
.param vthp= -0.57634

.alter
.param vthn= 0.64703       $ 2748
.param vthp= -0.57982

.alter
.param vthn= 0.63812       $ 2749
.param vthp= -0.58718

.alter
.param vthn= 0.61628       $ 2750
.param vthp= -0.57767

.alter
.param vthn= 0.61320       $ 2751
.param vthp= -0.58857

.alter
.param vthn= 0.60779       $ 2752
.param vthp= -0.58128

.alter
.param vthn= 0.63684       $ 2753
.param vthp= -0.57248

.alter
.param vthn= 0.63894       $ 2754
.param vthp= -0.57077

.alter
.param vthn= 0.62838       $ 2755
.param vthp= -0.56904

.alter
.param vthn= 0.62334       $ 2756
.param vthp= -0.57309

.alter
.param vthn= 0.62776       $ 2757
.param vthp= -0.57856

.alter
.param vthn= 0.62276       $ 2758
.param vthp= -0.59396

.alter
.param vthn= 0.63241       $ 2759
.param vthp= -0.56808

.alter
.param vthn= 0.62301       $ 2760
.param vthp= -0.58714

.alter
.param vthn= 0.61657       $ 2761
.param vthp= -0.57917

.alter
.param vthn= 0.59107       $ 2762
.param vthp= -0.58099

.alter
.param vthn= 0.62570       $ 2763
.param vthp= -0.58990

.alter
.param vthn= 0.63002       $ 2764
.param vthp= -0.58072

.alter
.param vthn= 0.60722       $ 2765
.param vthp= -0.57358

.alter
.param vthn= 0.64548       $ 2766
.param vthp= -0.57747

.alter
.param vthn= 0.64023       $ 2767
.param vthp= -0.57598

.alter
.param vthn= 0.60679       $ 2768
.param vthp= -0.58477

.alter
.param vthn= 0.61335       $ 2769
.param vthp= -0.57259

.alter
.param vthn= 0.61859       $ 2770
.param vthp= -0.58195

.alter
.param vthn= 0.63449       $ 2771
.param vthp= -0.58079

.alter
.param vthn= 0.64678       $ 2772
.param vthp= -0.57840

.alter
.param vthn= 0.65047       $ 2773
.param vthp= -0.58334

.alter
.param vthn= 0.60970       $ 2774
.param vthp= -0.57243

.alter
.param vthn= 0.61030       $ 2775
.param vthp= -0.58012

.alter
.param vthn= 0.60215       $ 2776
.param vthp= -0.57866

.alter
.param vthn= 0.60224       $ 2777
.param vthp= -0.58948

.alter
.param vthn= 0.62936       $ 2778
.param vthp= -0.57462

.alter
.param vthn= 0.64157       $ 2779
.param vthp= -0.58552

.alter
.param vthn= 0.62913       $ 2780
.param vthp= -0.59532

.alter
.param vthn= 0.61082       $ 2781
.param vthp= -0.57105

.alter
.param vthn= 0.62788       $ 2782
.param vthp= -0.58632

.alter
.param vthn= 0.62913       $ 2783
.param vthp= -0.57471

.alter
.param vthn= 0.61999       $ 2784
.param vthp= -0.57640

.alter
.param vthn= 0.63144       $ 2785
.param vthp= -0.57454

.alter
.param vthn= 0.63135       $ 2786
.param vthp= -0.57857

.alter
.param vthn= 0.60757       $ 2787
.param vthp= -0.58614

.alter
.param vthn= 0.61811       $ 2788
.param vthp= -0.57821

.alter
.param vthn= 0.58124       $ 2789
.param vthp= -0.58339

.alter
.param vthn= 0.62314       $ 2790
.param vthp= -0.58689

.alter
.param vthn= 0.60687       $ 2791
.param vthp= -0.58334

.alter
.param vthn= 0.61664       $ 2792
.param vthp= -0.57507

.alter
.param vthn= 0.63007       $ 2793
.param vthp= -0.57622

.alter
.param vthn= 0.62800       $ 2794
.param vthp= -0.57511

.alter
.param vthn= 0.63506       $ 2795
.param vthp= -0.58670

.alter
.param vthn= 0.64394       $ 2796
.param vthp= -0.57671

.alter
.param vthn= 0.59921       $ 2797
.param vthp= -0.58743

.alter
.param vthn= 0.61564       $ 2798
.param vthp= -0.58254

.alter
.param vthn= 0.62409       $ 2799
.param vthp= -0.58965

.alter
.param vthn= 0.63549       $ 2800
.param vthp= -0.57956

.alter
.param vthn= 0.63983       $ 2801
.param vthp= -0.59941

.alter
.param vthn= 0.61456       $ 2802
.param vthp= -0.58709

.alter
.param vthn= 0.65056       $ 2803
.param vthp= -0.59938

.alter
.param vthn= 0.64231       $ 2804
.param vthp= -0.58541

.alter
.param vthn= 0.61666       $ 2805
.param vthp= -0.58809

.alter
.param vthn= 0.62654       $ 2806
.param vthp= -0.60817

.alter
.param vthn= 0.64127       $ 2807
.param vthp= -0.59986

.alter
.param vthn= 0.65513       $ 2808
.param vthp= -0.59071

.alter
.param vthn= 0.63298       $ 2809
.param vthp= -0.58907

.alter
.param vthn= 0.64563       $ 2810
.param vthp= -0.59399

.alter
.param vthn= 0.66629       $ 2811
.param vthp= -0.59348

.alter
.param vthn= 0.62668       $ 2812
.param vthp= -0.59811

.alter
.param vthn= 0.62844       $ 2813
.param vthp= -0.58004

.alter
.param vthn= 0.61784       $ 2814
.param vthp= -0.58899

.alter
.param vthn= 0.61994       $ 2815
.param vthp= -0.58969

.alter
.param vthn= 0.65933       $ 2816
.param vthp= -0.59364

.alter
.param vthn= 0.65813       $ 2817
.param vthp= -0.60045

.alter
.param vthn= 0.65060       $ 2818
.param vthp= -0.60457

.alter
.param vthn= 0.64280       $ 2819
.param vthp= -0.59633

.alter
.param vthn= 0.64402       $ 2820
.param vthp= -0.59148

.alter
.param vthn= 0.61866       $ 2821
.param vthp= -0.58512

.alter
.param vthn= 0.62558       $ 2822
.param vthp= -0.58740

.alter
.param vthn= 0.63541       $ 2823
.param vthp= -0.59358

.alter
.param vthn= 0.64235       $ 2824
.param vthp= -0.59032

.alter
.param vthn= 0.61183       $ 2825
.param vthp= -0.59360

.alter
.param vthn= 0.64068       $ 2826
.param vthp= -0.57868

.alter
.param vthn= 0.64208       $ 2827
.param vthp= -0.59245

.alter
.param vthn= 0.63011       $ 2828
.param vthp= -0.59034

.alter
.param vthn= 0.62728       $ 2829
.param vthp= -0.58370

.alter
.param vthn= 0.63309       $ 2830
.param vthp= -0.59422

.alter
.param vthn= 0.63792       $ 2831
.param vthp= -0.59228

.alter
.param vthn= 0.64205       $ 2832
.param vthp= -0.59279

.alter
.param vthn= 0.61993       $ 2833
.param vthp= -0.58582

.alter
.param vthn= 0.61927       $ 2834
.param vthp= -0.59090

.alter
.param vthn= 0.62121       $ 2835
.param vthp= -0.58645

.alter
.param vthn= 0.62983       $ 2836
.param vthp= -0.58406

.alter
.param vthn= 0.63822       $ 2837
.param vthp= -0.58995

.alter
.param vthn= 0.63405       $ 2838
.param vthp= -0.59260

.alter
.param vthn= 0.66598       $ 2839
.param vthp= -0.58678

.alter
.param vthn= 0.63861       $ 2840
.param vthp= -0.58468

.alter
.param vthn= 0.62958       $ 2841
.param vthp= -0.59378

.alter
.param vthn= 0.65300       $ 2842
.param vthp= -0.60070

.alter
.param vthn= 0.66009       $ 2843
.param vthp= -0.58272

.alter
.param vthn= 0.60327       $ 2844
.param vthp= -0.58461

.alter
.param vthn= 0.66028       $ 2845
.param vthp= -0.58921

.alter
.param vthn= 0.64172       $ 2846
.param vthp= -0.59666

.alter
.param vthn= 0.63028       $ 2847
.param vthp= -0.59724

.alter
.param vthn= 0.60295       $ 2848
.param vthp= -0.58096

.alter
.param vthn= 0.65430       $ 2849
.param vthp= -0.58643

.alter
.param vthn= 0.63703       $ 2850
.param vthp= -0.60125

.alter
.param vthn= 0.64233       $ 2851
.param vthp= -0.58902

.alter
.param vthn= 0.65348       $ 2852
.param vthp= -0.58588

.alter
.param vthn= 0.64102       $ 2853
.param vthp= -0.58651

.alter
.param vthn= 0.63288       $ 2854
.param vthp= -0.58622

.alter
.param vthn= 0.64177       $ 2855
.param vthp= -0.59770

.alter
.param vthn= 0.61347       $ 2856
.param vthp= -0.60145

.alter
.param vthn= 0.62668       $ 2857
.param vthp= -0.60062

.alter
.param vthn= 0.63175       $ 2858
.param vthp= -0.59700

.alter
.param vthn= 0.60790       $ 2859
.param vthp= -0.58517

.alter
.param vthn= 0.61447       $ 2860
.param vthp= -0.58851

.alter
.param vthn= 0.64321       $ 2861
.param vthp= -0.60245

.alter
.param vthn= 0.60711       $ 2862
.param vthp= -0.59208

.alter
.param vthn= 0.63864       $ 2863
.param vthp= -0.58779

.alter
.param vthn= 0.64730       $ 2864
.param vthp= -0.58669

.alter
.param vthn= 0.61371       $ 2865
.param vthp= -0.58661

.alter
.param vthn= 0.62595       $ 2866
.param vthp= -0.60451

.alter
.param vthn= 0.59055       $ 2867
.param vthp= -0.58864

.alter
.param vthn= 0.63253       $ 2868
.param vthp= -0.59730

.alter
.param vthn= 0.62317       $ 2869
.param vthp= -0.59386

.alter
.param vthn= 0.64832       $ 2870
.param vthp= -0.59556

.alter
.param vthn= 0.64538       $ 2871
.param vthp= -0.60020

.alter
.param vthn= 0.61722       $ 2872
.param vthp= -0.58532

.alter
.param vthn= 0.62338       $ 2873
.param vthp= -0.59864

.alter
.param vthn= 0.62323       $ 2874
.param vthp= -0.59610

.alter
.param vthn= 0.64299       $ 2875
.param vthp= -0.59528

.alter
.param vthn= 0.65152       $ 2876
.param vthp= -0.59431

.alter
.param vthn= 0.64986       $ 2877
.param vthp= -0.59179

.alter
.param vthn= 0.64159       $ 2878
.param vthp= -0.59154

.alter
.param vthn= 0.66684       $ 2879
.param vthp= -0.59901

.alter
.param vthn= 0.62730       $ 2880
.param vthp= -0.58682

.alter
.param vthn= 0.63510       $ 2881
.param vthp= -0.59006

.alter
.param vthn= 0.60871       $ 2882
.param vthp= -0.59310

.alter
.param vthn= 0.65149       $ 2883
.param vthp= -0.59110

.alter
.param vthn= 0.63240       $ 2884
.param vthp= -0.57840

.alter
.param vthn= 0.65821       $ 2885
.param vthp= -0.58616

.alter
.param vthn= 0.65331       $ 2886
.param vthp= -0.59565

.alter
.param vthn= 0.62798       $ 2887
.param vthp= -0.59980

.alter
.param vthn= 0.63067       $ 2888
.param vthp= -0.58761

.alter
.param vthn= 0.66034       $ 2889
.param vthp= -0.60240

.alter
.param vthn= 0.62715       $ 2890
.param vthp= -0.59684

.alter
.param vthn= 0.63733       $ 2891
.param vthp= -0.59454

.alter
.param vthn= 0.64256       $ 2892
.param vthp= -0.58515

.alter
.param vthn= 0.60614       $ 2893
.param vthp= -0.58511

.alter
.param vthn= 0.63036       $ 2894
.param vthp= -0.59132

.alter
.param vthn= 0.67341       $ 2895
.param vthp= -0.59178

.alter
.param vthn= 0.63977       $ 2896
.param vthp= -0.58644

.alter
.param vthn= 0.63791       $ 2897
.param vthp= -0.59861

.alter
.param vthn= 0.64916       $ 2898
.param vthp= -0.59547

.alter
.param vthn= 0.63114       $ 2899
.param vthp= -0.59297

.alter
.param vthn= 0.63351       $ 2900
.param vthp= -0.60173

.alter
.param vthn= 0.61614       $ 2901
.param vthp= -0.57465

.alter
.param vthn= 0.61690       $ 2902
.param vthp= -0.58337

.alter
.param vthn= 0.65352       $ 2903
.param vthp= -0.59621

.alter
.param vthn= 0.63801       $ 2904
.param vthp= -0.58943

.alter
.param vthn= 0.59596       $ 2905
.param vthp= -0.59695

.alter
.param vthn= 0.64041       $ 2906
.param vthp= -0.59059

.alter
.param vthn= 0.62922       $ 2907
.param vthp= -0.58934

.alter
.param vthn= 0.62976       $ 2908
.param vthp= -0.58851

.alter
.param vthn= 0.61541       $ 2909
.param vthp= -0.60894

.alter
.param vthn= 0.64071       $ 2910
.param vthp= -0.59158

.alter
.param vthn= 0.62559       $ 2911
.param vthp= -0.59625

.alter
.param vthn= 0.65200       $ 2912
.param vthp= -0.59581

.alter
.param vthn= 0.64137       $ 2913
.param vthp= -0.58776

.alter
.param vthn= 0.63079       $ 2914
.param vthp= -0.59423

.alter
.param vthn= 0.63909       $ 2915
.param vthp= -0.59297

.alter
.param vthn= 0.63303       $ 2916
.param vthp= -0.59422

.alter
.param vthn= 0.62479       $ 2917
.param vthp= -0.59657

.alter
.param vthn= 0.63922       $ 2918
.param vthp= -0.59848

.alter
.param vthn= 0.61070       $ 2919
.param vthp= -0.59493

.alter
.param vthn= 0.66379       $ 2920
.param vthp= -0.59042

.alter
.param vthn= 0.62879       $ 2921
.param vthp= -0.58712

.alter
.param vthn= 0.62302       $ 2922
.param vthp= -0.60597

.alter
.param vthn= 0.64266       $ 2923
.param vthp= -0.59473

.alter
.param vthn= 0.63733       $ 2924
.param vthp= -0.58032

.alter
.param vthn= 0.61029       $ 2925
.param vthp= -0.58551

.alter
.param vthn= 0.65310       $ 2926
.param vthp= -0.60311

.alter
.param vthn= 0.64156       $ 2927
.param vthp= -0.59250

.alter
.param vthn= 0.62256       $ 2928
.param vthp= -0.57749

.alter
.param vthn= 0.64975       $ 2929
.param vthp= -0.59028

.alter
.param vthn= 0.62524       $ 2930
.param vthp= -0.58889

.alter
.param vthn= 0.62120       $ 2931
.param vthp= -0.59730

.alter
.param vthn= 0.64782       $ 2932
.param vthp= -0.57410

.alter
.param vthn= 0.58706       $ 2933
.param vthp= -0.59157

.alter
.param vthn= 0.62458       $ 2934
.param vthp= -0.58678

.alter
.param vthn= 0.62743       $ 2935
.param vthp= -0.58682

.alter
.param vthn= 0.65331       $ 2936
.param vthp= -0.58876

.alter
.param vthn= 0.65105       $ 2937
.param vthp= -0.58505

.alter
.param vthn= 0.64486       $ 2938
.param vthp= -0.59158

.alter
.param vthn= 0.66422       $ 2939
.param vthp= -0.59087

.alter
.param vthn= 0.62808       $ 2940
.param vthp= -0.58352

.alter
.param vthn= 0.65312       $ 2941
.param vthp= -0.57839

.alter
.param vthn= 0.60877       $ 2942
.param vthp= -0.60339

.alter
.param vthn= 0.64836       $ 2943
.param vthp= -0.58682

.alter
.param vthn= 0.62520       $ 2944
.param vthp= -0.59654

.alter
.param vthn= 0.62931       $ 2945
.param vthp= -0.58765

.alter
.param vthn= 0.60845       $ 2946
.param vthp= -0.58291

.alter
.param vthn= 0.62081       $ 2947
.param vthp= -0.58782

.alter
.param vthn= 0.65592       $ 2948
.param vthp= -0.59130

.alter
.param vthn= 0.64701       $ 2949
.param vthp= -0.59866

.alter
.param vthn= 0.62517       $ 2950
.param vthp= -0.58915

.alter
.param vthn= 0.62209       $ 2951
.param vthp= -0.60005

.alter
.param vthn= 0.61668       $ 2952
.param vthp= -0.59276

.alter
.param vthn= 0.64573       $ 2953
.param vthp= -0.58396

.alter
.param vthn= 0.64783       $ 2954
.param vthp= -0.58225

.alter
.param vthn= 0.63727       $ 2955
.param vthp= -0.58052

.alter
.param vthn= 0.63223       $ 2956
.param vthp= -0.58457

.alter
.param vthn= 0.63665       $ 2957
.param vthp= -0.59004

.alter
.param vthn= 0.63165       $ 2958
.param vthp= -0.60544

.alter
.param vthn= 0.64130       $ 2959
.param vthp= -0.57956

.alter
.param vthn= 0.63190       $ 2960
.param vthp= -0.59862

.alter
.param vthn= 0.62546       $ 2961
.param vthp= -0.59065

.alter
.param vthn= 0.59996       $ 2962
.param vthp= -0.59247

.alter
.param vthn= 0.63459       $ 2963
.param vthp= -0.60138

.alter
.param vthn= 0.63891       $ 2964
.param vthp= -0.59220

.alter
.param vthn= 0.61611       $ 2965
.param vthp= -0.58506

.alter
.param vthn= 0.65437       $ 2966
.param vthp= -0.58895

.alter
.param vthn= 0.64912       $ 2967
.param vthp= -0.58746

.alter
.param vthn= 0.61568       $ 2968
.param vthp= -0.59625

.alter
.param vthn= 0.62224       $ 2969
.param vthp= -0.58407

.alter
.param vthn= 0.62748       $ 2970
.param vthp= -0.59343

.alter
.param vthn= 0.64338       $ 2971
.param vthp= -0.59227

.alter
.param vthn= 0.65567       $ 2972
.param vthp= -0.58988

.alter
.param vthn= 0.65936       $ 2973
.param vthp= -0.59482

.alter
.param vthn= 0.61859       $ 2974
.param vthp= -0.58391

.alter
.param vthn= 0.61919       $ 2975
.param vthp= -0.59160

.alter
.param vthn= 0.61104       $ 2976
.param vthp= -0.59014

.alter
.param vthn= 0.61113       $ 2977
.param vthp= -0.60096

.alter
.param vthn= 0.63825       $ 2978
.param vthp= -0.58610

.alter
.param vthn= 0.65046       $ 2979
.param vthp= -0.59700

.alter
.param vthn= 0.63802       $ 2980
.param vthp= -0.60680

.alter
.param vthn= 0.61971       $ 2981
.param vthp= -0.58253

.alter
.param vthn= 0.63677       $ 2982
.param vthp= -0.59780

.alter
.param vthn= 0.63802       $ 2983
.param vthp= -0.58619

.alter
.param vthn= 0.62888       $ 2984
.param vthp= -0.58788

.alter
.param vthn= 0.64033       $ 2985
.param vthp= -0.58602

.alter
.param vthn= 0.64024       $ 2986
.param vthp= -0.59005

.alter
.param vthn= 0.61646       $ 2987
.param vthp= -0.59762

.alter
.param vthn= 0.62700       $ 2988
.param vthp= -0.58969

.alter
.param vthn= 0.59013       $ 2989
.param vthp= -0.59487

.alter
.param vthn= 0.63203       $ 2990
.param vthp= -0.59837

.alter
.param vthn= 0.61576       $ 2991
.param vthp= -0.59482

.alter
.param vthn= 0.62553       $ 2992
.param vthp= -0.58655

.alter
.param vthn= 0.63896       $ 2993
.param vthp= -0.58770

.alter
.param vthn= 0.63689       $ 2994
.param vthp= -0.58659

.alter
.param vthn= 0.64395       $ 2995
.param vthp= -0.59818

.alter
.param vthn= 0.65283       $ 2996
.param vthp= -0.58819

.alter
.param vthn= 0.60810       $ 2997
.param vthp= -0.59891

.alter
.param vthn= 0.62453       $ 2998
.param vthp= -0.59402

.alter
.param vthn= 0.63298       $ 2999
.param vthp= -0.60113

.alter
.param vthn= 0.64438       $ 3000
.param vthp= -0.59104

.alter
.param vthn= 0.61153       $ 3001
.param vthp= -0.60316

.alter
.param vthn= 0.58626       $ 3002
.param vthp= -0.59084

.alter
.param vthn= 0.62226       $ 3003
.param vthp= -0.60313

.alter
.param vthn= 0.61401       $ 3004
.param vthp= -0.58916

.alter
.param vthn= 0.58836       $ 3005
.param vthp= -0.59184

.alter
.param vthn= 0.59824       $ 3006
.param vthp= -0.61192

.alter
.param vthn= 0.61297       $ 3007
.param vthp= -0.60361

.alter
.param vthn= 0.62683       $ 3008
.param vthp= -0.59446

.alter
.param vthn= 0.60468       $ 3009
.param vthp= -0.59282

.alter
.param vthn= 0.61733       $ 3010
.param vthp= -0.59774

.alter
.param vthn= 0.63799       $ 3011
.param vthp= -0.59723

.alter
.param vthn= 0.59838       $ 3012
.param vthp= -0.60186

.alter
.param vthn= 0.60014       $ 3013
.param vthp= -0.58379

.alter
.param vthn= 0.58954       $ 3014
.param vthp= -0.59274

.alter
.param vthn= 0.59164       $ 3015
.param vthp= -0.59344

.alter
.param vthn= 0.63103       $ 3016
.param vthp= -0.59739

.alter
.param vthn= 0.62983       $ 3017
.param vthp= -0.60420

.alter
.param vthn= 0.62230       $ 3018
.param vthp= -0.60832

.alter
.param vthn= 0.61450       $ 3019
.param vthp= -0.60008

.alter
.param vthn= 0.61572       $ 3020
.param vthp= -0.59523

.alter
.param vthn= 0.59036       $ 3021
.param vthp= -0.58887

.alter
.param vthn= 0.59728       $ 3022
.param vthp= -0.59115

.alter
.param vthn= 0.60711       $ 3023
.param vthp= -0.59733

.alter
.param vthn= 0.61405       $ 3024
.param vthp= -0.59407

.alter
.param vthn= 0.58353       $ 3025
.param vthp= -0.59735

.alter
.param vthn= 0.61238       $ 3026
.param vthp= -0.58243

.alter
.param vthn= 0.61378       $ 3027
.param vthp= -0.59620

.alter
.param vthn= 0.60181       $ 3028
.param vthp= -0.59409

.alter
.param vthn= 0.59898       $ 3029
.param vthp= -0.58745

.alter
.param vthn= 0.60479       $ 3030
.param vthp= -0.59797

.alter
.param vthn= 0.60962       $ 3031
.param vthp= -0.59603

.alter
.param vthn= 0.61375       $ 3032
.param vthp= -0.59654

.alter
.param vthn= 0.59163       $ 3033
.param vthp= -0.58957

.alter
.param vthn= 0.59097       $ 3034
.param vthp= -0.59465

.alter
.param vthn= 0.59291       $ 3035
.param vthp= -0.59020

.alter
.param vthn= 0.60153       $ 3036
.param vthp= -0.58781

.alter
.param vthn= 0.60992       $ 3037
.param vthp= -0.59370

.alter
.param vthn= 0.60575       $ 3038
.param vthp= -0.59635

.alter
.param vthn= 0.63768       $ 3039
.param vthp= -0.59053

.alter
.param vthn= 0.61031       $ 3040
.param vthp= -0.58843

.alter
.param vthn= 0.60128       $ 3041
.param vthp= -0.59753

.alter
.param vthn= 0.62470       $ 3042
.param vthp= -0.60445

.alter
.param vthn= 0.63179       $ 3043
.param vthp= -0.58647

.alter
.param vthn= 0.57497       $ 3044
.param vthp= -0.58836

.alter
.param vthn= 0.63198       $ 3045
.param vthp= -0.59296

.alter
.param vthn= 0.61342       $ 3046
.param vthp= -0.60041

.alter
.param vthn= 0.60198       $ 3047
.param vthp= -0.60099

.alter
.param vthn= 0.57465       $ 3048
.param vthp= -0.58471

.alter
.param vthn= 0.62600       $ 3049
.param vthp= -0.59018

.alter
.param vthn= 0.60873       $ 3050
.param vthp= -0.60500

.alter
.param vthn= 0.61403       $ 3051
.param vthp= -0.59277

.alter
.param vthn= 0.62518       $ 3052
.param vthp= -0.58963

.alter
.param vthn= 0.61272       $ 3053
.param vthp= -0.59026

.alter
.param vthn= 0.60458       $ 3054
.param vthp= -0.58997

.alter
.param vthn= 0.61347       $ 3055
.param vthp= -0.60145

.alter
.param vthn= 0.58517       $ 3056
.param vthp= -0.60520

.alter
.param vthn= 0.59838       $ 3057
.param vthp= -0.60437

.alter
.param vthn= 0.60345       $ 3058
.param vthp= -0.60075

.alter
.param vthn= 0.57960       $ 3059
.param vthp= -0.58892

.alter
.param vthn= 0.58617       $ 3060
.param vthp= -0.59226

.alter
.param vthn= 0.61491       $ 3061
.param vthp= -0.60620

.alter
.param vthn= 0.57881       $ 3062
.param vthp= -0.59583

.alter
.param vthn= 0.61034       $ 3063
.param vthp= -0.59154

.alter
.param vthn= 0.61900       $ 3064
.param vthp= -0.59044

.alter
.param vthn= 0.58541       $ 3065
.param vthp= -0.59036

.alter
.param vthn= 0.59765       $ 3066
.param vthp= -0.60826

.alter
.param vthn= 0.56225       $ 3067
.param vthp= -0.59239

.alter
.param vthn= 0.60423       $ 3068
.param vthp= -0.60105

.alter
.param vthn= 0.59487       $ 3069
.param vthp= -0.59761

.alter
.param vthn= 0.62002       $ 3070
.param vthp= -0.59931

.alter
.param vthn= 0.61708       $ 3071
.param vthp= -0.60395

.alter
.param vthn= 0.58892       $ 3072
.param vthp= -0.58907

.alter
.param vthn= 0.59508       $ 3073
.param vthp= -0.60239

.alter
.param vthn= 0.59493       $ 3074
.param vthp= -0.59985

.alter
.param vthn= 0.61469       $ 3075
.param vthp= -0.59903

.alter
.param vthn= 0.62322       $ 3076
.param vthp= -0.59806

.alter
.param vthn= 0.62156       $ 3077
.param vthp= -0.59554

.alter
.param vthn= 0.61329       $ 3078
.param vthp= -0.59529

.alter
.param vthn= 0.63854       $ 3079
.param vthp= -0.60276

.alter
.param vthn= 0.59900       $ 3080
.param vthp= -0.59057

.alter
.param vthn= 0.60680       $ 3081
.param vthp= -0.59381

.alter
.param vthn= 0.58041       $ 3082
.param vthp= -0.59685

.alter
.param vthn= 0.62319       $ 3083
.param vthp= -0.59485

.alter
.param vthn= 0.60410       $ 3084
.param vthp= -0.58215

.alter
.param vthn= 0.62991       $ 3085
.param vthp= -0.58991

.alter
.param vthn= 0.62501       $ 3086
.param vthp= -0.59940

.alter
.param vthn= 0.59968       $ 3087
.param vthp= -0.60355

.alter
.param vthn= 0.60237       $ 3088
.param vthp= -0.59136

.alter
.param vthn= 0.63204       $ 3089
.param vthp= -0.60615

.alter
.param vthn= 0.59885       $ 3090
.param vthp= -0.60059

.alter
.param vthn= 0.60903       $ 3091
.param vthp= -0.59829

.alter
.param vthn= 0.61426       $ 3092
.param vthp= -0.58890

.alter
.param vthn= 0.57784       $ 3093
.param vthp= -0.58886

.alter
.param vthn= 0.60206       $ 3094
.param vthp= -0.59507

.alter
.param vthn= 0.64511       $ 3095
.param vthp= -0.59553

.alter
.param vthn= 0.61147       $ 3096
.param vthp= -0.59019

.alter
.param vthn= 0.60961       $ 3097
.param vthp= -0.60236

.alter
.param vthn= 0.62086       $ 3098
.param vthp= -0.59922

.alter
.param vthn= 0.60284       $ 3099
.param vthp= -0.59672

.alter
.param vthn= 0.60521       $ 3100
.param vthp= -0.60548

.alter
.param vthn= 0.58784       $ 3101
.param vthp= -0.57840

.alter
.param vthn= 0.58860       $ 3102
.param vthp= -0.58712

.alter
.param vthn= 0.62522       $ 3103
.param vthp= -0.59996

.alter
.param vthn= 0.60971       $ 3104
.param vthp= -0.59318

.alter
.param vthn= 0.56766       $ 3105
.param vthp= -0.60070

.alter
.param vthn= 0.61211       $ 3106
.param vthp= -0.59434

.alter
.param vthn= 0.60092       $ 3107
.param vthp= -0.59309

.alter
.param vthn= 0.60146       $ 3108
.param vthp= -0.59226

.alter
.param vthn= 0.58711       $ 3109
.param vthp= -0.61269

.alter
.param vthn= 0.61241       $ 3110
.param vthp= -0.59533

.alter
.param vthn= 0.59729       $ 3111
.param vthp= -0.60000

.alter
.param vthn= 0.62370       $ 3112
.param vthp= -0.59956

.alter
.param vthn= 0.61307       $ 3113
.param vthp= -0.59151

.alter
.param vthn= 0.60249       $ 3114
.param vthp= -0.59798

.alter
.param vthn= 0.61079       $ 3115
.param vthp= -0.59672

.alter
.param vthn= 0.60473       $ 3116
.param vthp= -0.59797

.alter
.param vthn= 0.59649       $ 3117
.param vthp= -0.60032

.alter
.param vthn= 0.61092       $ 3118
.param vthp= -0.60223

.alter
.param vthn= 0.58240       $ 3119
.param vthp= -0.59868

.alter
.param vthn= 0.63549       $ 3120
.param vthp= -0.59417

.alter
.param vthn= 0.60049       $ 3121
.param vthp= -0.59087

.alter
.param vthn= 0.59472       $ 3122
.param vthp= -0.60972

.alter
.param vthn= 0.61436       $ 3123
.param vthp= -0.59848

.alter
.param vthn= 0.60903       $ 3124
.param vthp= -0.58407

.alter
.param vthn= 0.58199       $ 3125
.param vthp= -0.58926

.alter
.param vthn= 0.62480       $ 3126
.param vthp= -0.60686

.alter
.param vthn= 0.61326       $ 3127
.param vthp= -0.59625

.alter
.param vthn= 0.59426       $ 3128
.param vthp= -0.58124

.alter
.param vthn= 0.62145       $ 3129
.param vthp= -0.59403

.alter
.param vthn= 0.59694       $ 3130
.param vthp= -0.59264

.alter
.param vthn= 0.59290       $ 3131
.param vthp= -0.60105

.alter
.param vthn= 0.61952       $ 3132
.param vthp= -0.57785

.alter
.param vthn= 0.55876       $ 3133
.param vthp= -0.59532

.alter
.param vthn= 0.59628       $ 3134
.param vthp= -0.59053

.alter
.param vthn= 0.59913       $ 3135
.param vthp= -0.59057

.alter
.param vthn= 0.62501       $ 3136
.param vthp= -0.59251

.alter
.param vthn= 0.62275       $ 3137
.param vthp= -0.58880

.alter
.param vthn= 0.61656       $ 3138
.param vthp= -0.59533

.alter
.param vthn= 0.63592       $ 3139
.param vthp= -0.59462

.alter
.param vthn= 0.59978       $ 3140
.param vthp= -0.58727

.alter
.param vthn= 0.62482       $ 3141
.param vthp= -0.58214

.alter
.param vthn= 0.58047       $ 3142
.param vthp= -0.60714

.alter
.param vthn= 0.62006       $ 3143
.param vthp= -0.59057

.alter
.param vthn= 0.59690       $ 3144
.param vthp= -0.60029

.alter
.param vthn= 0.60101       $ 3145
.param vthp= -0.59140

.alter
.param vthn= 0.58015       $ 3146
.param vthp= -0.58666

.alter
.param vthn= 0.59251       $ 3147
.param vthp= -0.59157

.alter
.param vthn= 0.62762       $ 3148
.param vthp= -0.59505

.alter
.param vthn= 0.61871       $ 3149
.param vthp= -0.60241

.alter
.param vthn= 0.59687       $ 3150
.param vthp= -0.59290

.alter
.param vthn= 0.59379       $ 3151
.param vthp= -0.60380

.alter
.param vthn= 0.58838       $ 3152
.param vthp= -0.59651

.alter
.param vthn= 0.61743       $ 3153
.param vthp= -0.58771

.alter
.param vthn= 0.61953       $ 3154
.param vthp= -0.58600

.alter
.param vthn= 0.60897       $ 3155
.param vthp= -0.58427

.alter
.param vthn= 0.60393       $ 3156
.param vthp= -0.58832

.alter
.param vthn= 0.60835       $ 3157
.param vthp= -0.59379

.alter
.param vthn= 0.60335       $ 3158
.param vthp= -0.60919

.alter
.param vthn= 0.61300       $ 3159
.param vthp= -0.58331

.alter
.param vthn= 0.60360       $ 3160
.param vthp= -0.60237

.alter
.param vthn= 0.59716       $ 3161
.param vthp= -0.59440

.alter
.param vthn= 0.57166       $ 3162
.param vthp= -0.59622

.alter
.param vthn= 0.60629       $ 3163
.param vthp= -0.60513

.alter
.param vthn= 0.61061       $ 3164
.param vthp= -0.59595

.alter
.param vthn= 0.58781       $ 3165
.param vthp= -0.58881

.alter
.param vthn= 0.62607       $ 3166
.param vthp= -0.59270

.alter
.param vthn= 0.62082       $ 3167
.param vthp= -0.59121

.alter
.param vthn= 0.58738       $ 3168
.param vthp= -0.60000

.alter
.param vthn= 0.59394       $ 3169
.param vthp= -0.58782

.alter
.param vthn= 0.59918       $ 3170
.param vthp= -0.59718

.alter
.param vthn= 0.61508       $ 3171
.param vthp= -0.59602

.alter
.param vthn= 0.62737       $ 3172
.param vthp= -0.59363

.alter
.param vthn= 0.63106       $ 3173
.param vthp= -0.59857

.alter
.param vthn= 0.59029       $ 3174
.param vthp= -0.58766

.alter
.param vthn= 0.59089       $ 3175
.param vthp= -0.59535

.alter
.param vthn= 0.58274       $ 3176
.param vthp= -0.59389

.alter
.param vthn= 0.58283       $ 3177
.param vthp= -0.60471

.alter
.param vthn= 0.60995       $ 3178
.param vthp= -0.58985

.alter
.param vthn= 0.62216       $ 3179
.param vthp= -0.60075

.alter
.param vthn= 0.60972       $ 3180
.param vthp= -0.61055

.alter
.param vthn= 0.59141       $ 3181
.param vthp= -0.58628

.alter
.param vthn= 0.60847       $ 3182
.param vthp= -0.60155

.alter
.param vthn= 0.60972       $ 3183
.param vthp= -0.58994

.alter
.param vthn= 0.60058       $ 3184
.param vthp= -0.59163

.alter
.param vthn= 0.61203       $ 3185
.param vthp= -0.58977

.alter
.param vthn= 0.61194       $ 3186
.param vthp= -0.59380

.alter
.param vthn= 0.58816       $ 3187
.param vthp= -0.60137

.alter
.param vthn= 0.59870       $ 3188
.param vthp= -0.59344

.alter
.param vthn= 0.56183       $ 3189
.param vthp= -0.59862

.alter
.param vthn= 0.60373       $ 3190
.param vthp= -0.60212

.alter
.param vthn= 0.58746       $ 3191
.param vthp= -0.59857

.alter
.param vthn= 0.59723       $ 3192
.param vthp= -0.59030

.alter
.param vthn= 0.61066       $ 3193
.param vthp= -0.59145

.alter
.param vthn= 0.60859       $ 3194
.param vthp= -0.59034

.alter
.param vthn= 0.61565       $ 3195
.param vthp= -0.60193

.alter
.param vthn= 0.62453       $ 3196
.param vthp= -0.59194

.alter
.param vthn= 0.57980       $ 3197
.param vthp= -0.60266

.alter
.param vthn= 0.59623       $ 3198
.param vthp= -0.59777

.alter
.param vthn= 0.60468       $ 3199
.param vthp= -0.60488

.alter
.param vthn= 0.61608       $ 3200
.param vthp= -0.59479

.alter
.param vthn= 0.62474       $ 3201
.param vthp= -0.60233

.alter
.param vthn= 0.59947       $ 3202
.param vthp= -0.59001

.alter
.param vthn= 0.63547       $ 3203
.param vthp= -0.60230

.alter
.param vthn= 0.62722       $ 3204
.param vthp= -0.58833

.alter
.param vthn= 0.60157       $ 3205
.param vthp= -0.59101

.alter
.param vthn= 0.61145       $ 3206
.param vthp= -0.61109

.alter
.param vthn= 0.62618       $ 3207
.param vthp= -0.60278

.alter
.param vthn= 0.64004       $ 3208
.param vthp= -0.59363

.alter
.param vthn= 0.61789       $ 3209
.param vthp= -0.59199

.alter
.param vthn= 0.63054       $ 3210
.param vthp= -0.59691

.alter
.param vthn= 0.65120       $ 3211
.param vthp= -0.59640

.alter
.param vthn= 0.61159       $ 3212
.param vthp= -0.60103

.alter
.param vthn= 0.61335       $ 3213
.param vthp= -0.58296

.alter
.param vthn= 0.60275       $ 3214
.param vthp= -0.59191

.alter
.param vthn= 0.60485       $ 3215
.param vthp= -0.59261

.alter
.param vthn= 0.64424       $ 3216
.param vthp= -0.59656

.alter
.param vthn= 0.64304       $ 3217
.param vthp= -0.60337

.alter
.param vthn= 0.63551       $ 3218
.param vthp= -0.60749

.alter
.param vthn= 0.62771       $ 3219
.param vthp= -0.59925

.alter
.param vthn= 0.62893       $ 3220
.param vthp= -0.59440

.alter
.param vthn= 0.60357       $ 3221
.param vthp= -0.58804

.alter
.param vthn= 0.61049       $ 3222
.param vthp= -0.59032

.alter
.param vthn= 0.62032       $ 3223
.param vthp= -0.59650

.alter
.param vthn= 0.62726       $ 3224
.param vthp= -0.59324

.alter
.param vthn= 0.59674       $ 3225
.param vthp= -0.59652

.alter
.param vthn= 0.62559       $ 3226
.param vthp= -0.58160

.alter
.param vthn= 0.62699       $ 3227
.param vthp= -0.59537

.alter
.param vthn= 0.61502       $ 3228
.param vthp= -0.59326

.alter
.param vthn= 0.61219       $ 3229
.param vthp= -0.58662

.alter
.param vthn= 0.61800       $ 3230
.param vthp= -0.59714

.alter
.param vthn= 0.62283       $ 3231
.param vthp= -0.59520

.alter
.param vthn= 0.62696       $ 3232
.param vthp= -0.59571

.alter
.param vthn= 0.60484       $ 3233
.param vthp= -0.58874

.alter
.param vthn= 0.60418       $ 3234
.param vthp= -0.59382

.alter
.param vthn= 0.60612       $ 3235
.param vthp= -0.58937

.alter
.param vthn= 0.61474       $ 3236
.param vthp= -0.58698

.alter
.param vthn= 0.62313       $ 3237
.param vthp= -0.59287

.alter
.param vthn= 0.61896       $ 3238
.param vthp= -0.59552

.alter
.param vthn= 0.65089       $ 3239
.param vthp= -0.58970

.alter
.param vthn= 0.62352       $ 3240
.param vthp= -0.58760

.alter
.param vthn= 0.61449       $ 3241
.param vthp= -0.59670

.alter
.param vthn= 0.63791       $ 3242
.param vthp= -0.60362

.alter
.param vthn= 0.64500       $ 3243
.param vthp= -0.58564

.alter
.param vthn= 0.58818       $ 3244
.param vthp= -0.58753

.alter
.param vthn= 0.64519       $ 3245
.param vthp= -0.59213

.alter
.param vthn= 0.62663       $ 3246
.param vthp= -0.59958

.alter
.param vthn= 0.61519       $ 3247
.param vthp= -0.60016

.alter
.param vthn= 0.58786       $ 3248
.param vthp= -0.58388

.alter
.param vthn= 0.63921       $ 3249
.param vthp= -0.58935

.alter
.param vthn= 0.62194       $ 3250
.param vthp= -0.60417

.alter
.param vthn= 0.62724       $ 3251
.param vthp= -0.59194

.alter
.param vthn= 0.63839       $ 3252
.param vthp= -0.58880

.alter
.param vthn= 0.62593       $ 3253
.param vthp= -0.58943

.alter
.param vthn= 0.61779       $ 3254
.param vthp= -0.58914

.alter
.param vthn= 0.62668       $ 3255
.param vthp= -0.60062

.alter
.param vthn= 0.59838       $ 3256
.param vthp= -0.60437

.alter
.param vthn= 0.61159       $ 3257
.param vthp= -0.60354

.alter
.param vthn= 0.61666       $ 3258
.param vthp= -0.59992

.alter
.param vthn= 0.59281       $ 3259
.param vthp= -0.58809

.alter
.param vthn= 0.59938       $ 3260
.param vthp= -0.59143

.alter
.param vthn= 0.62812       $ 3261
.param vthp= -0.60537

.alter
.param vthn= 0.59202       $ 3262
.param vthp= -0.59500

.alter
.param vthn= 0.62355       $ 3263
.param vthp= -0.59071

.alter
.param vthn= 0.63221       $ 3264
.param vthp= -0.58961

.alter
.param vthn= 0.59862       $ 3265
.param vthp= -0.58953

.alter
.param vthn= 0.61086       $ 3266
.param vthp= -0.60743

.alter
.param vthn= 0.57546       $ 3267
.param vthp= -0.59156

.alter
.param vthn= 0.61744       $ 3268
.param vthp= -0.60022

.alter
.param vthn= 0.60808       $ 3269
.param vthp= -0.59678

.alter
.param vthn= 0.63323       $ 3270
.param vthp= -0.59848

.alter
.param vthn= 0.63029       $ 3271
.param vthp= -0.60312

.alter
.param vthn= 0.60213       $ 3272
.param vthp= -0.58824

.alter
.param vthn= 0.60829       $ 3273
.param vthp= -0.60156

.alter
.param vthn= 0.60814       $ 3274
.param vthp= -0.59902

.alter
.param vthn= 0.62790       $ 3275
.param vthp= -0.59820

.alter
.param vthn= 0.63643       $ 3276
.param vthp= -0.59723

.alter
.param vthn= 0.63477       $ 3277
.param vthp= -0.59471

.alter
.param vthn= 0.62650       $ 3278
.param vthp= -0.59446

.alter
.param vthn= 0.65175       $ 3279
.param vthp= -0.60193

.alter
.param vthn= 0.61221       $ 3280
.param vthp= -0.58974

.alter
.param vthn= 0.62001       $ 3281
.param vthp= -0.59298

.alter
.param vthn= 0.59362       $ 3282
.param vthp= -0.59602

.alter
.param vthn= 0.63640       $ 3283
.param vthp= -0.59402

.alter
.param vthn= 0.61731       $ 3284
.param vthp= -0.58132

.alter
.param vthn= 0.64312       $ 3285
.param vthp= -0.58908

.alter
.param vthn= 0.63822       $ 3286
.param vthp= -0.59857

.alter
.param vthn= 0.61289       $ 3287
.param vthp= -0.60272

.alter
.param vthn= 0.61558       $ 3288
.param vthp= -0.59053

.alter
.param vthn= 0.64525       $ 3289
.param vthp= -0.60532

.alter
.param vthn= 0.61206       $ 3290
.param vthp= -0.59976

.alter
.param vthn= 0.62224       $ 3291
.param vthp= -0.59746

.alter
.param vthn= 0.62747       $ 3292
.param vthp= -0.58807

.alter
.param vthn= 0.59105       $ 3293
.param vthp= -0.58803

.alter
.param vthn= 0.61527       $ 3294
.param vthp= -0.59424

.alter
.param vthn= 0.65832       $ 3295
.param vthp= -0.59470

.alter
.param vthn= 0.62468       $ 3296
.param vthp= -0.58936

.alter
.param vthn= 0.62282       $ 3297
.param vthp= -0.60153

.alter
.param vthn= 0.63407       $ 3298
.param vthp= -0.59839

.alter
.param vthn= 0.61605       $ 3299
.param vthp= -0.59589

.alter
.param vthn= 0.61842       $ 3300
.param vthp= -0.60465

.alter
.param vthn= 0.60105       $ 3301
.param vthp= -0.57757

.alter
.param vthn= 0.60181       $ 3302
.param vthp= -0.58629

.alter
.param vthn= 0.63843       $ 3303
.param vthp= -0.59913

.alter
.param vthn= 0.62292       $ 3304
.param vthp= -0.59235

.alter
.param vthn= 0.58087       $ 3305
.param vthp= -0.59987

.alter
.param vthn= 0.62532       $ 3306
.param vthp= -0.59351

.alter
.param vthn= 0.61413       $ 3307
.param vthp= -0.59226

.alter
.param vthn= 0.61467       $ 3308
.param vthp= -0.59143

.alter
.param vthn= 0.60032       $ 3309
.param vthp= -0.61186

.alter
.param vthn= 0.62562       $ 3310
.param vthp= -0.59450

.alter
.param vthn= 0.61050       $ 3311
.param vthp= -0.59917

.alter
.param vthn= 0.63691       $ 3312
.param vthp= -0.59873

.alter
.param vthn= 0.62628       $ 3313
.param vthp= -0.59068

.alter
.param vthn= 0.61570       $ 3314
.param vthp= -0.59715

.alter
.param vthn= 0.62400       $ 3315
.param vthp= -0.59589

.alter
.param vthn= 0.61794       $ 3316
.param vthp= -0.59714

.alter
.param vthn= 0.60970       $ 3317
.param vthp= -0.59949

.alter
.param vthn= 0.62413       $ 3318
.param vthp= -0.60140

.alter
.param vthn= 0.59561       $ 3319
.param vthp= -0.59785

.alter
.param vthn= 0.64870       $ 3320
.param vthp= -0.59334

.alter
.param vthn= 0.61370       $ 3321
.param vthp= -0.59004

.alter
.param vthn= 0.60793       $ 3322
.param vthp= -0.60889

.alter
.param vthn= 0.62757       $ 3323
.param vthp= -0.59765

.alter
.param vthn= 0.62224       $ 3324
.param vthp= -0.58324

.alter
.param vthn= 0.59520       $ 3325
.param vthp= -0.58843

.alter
.param vthn= 0.63801       $ 3326
.param vthp= -0.60603

.alter
.param vthn= 0.62647       $ 3327
.param vthp= -0.59542

.alter
.param vthn= 0.60747       $ 3328
.param vthp= -0.58041

.alter
.param vthn= 0.63466       $ 3329
.param vthp= -0.59320

.alter
.param vthn= 0.61015       $ 3330
.param vthp= -0.59181

.alter
.param vthn= 0.60611       $ 3331
.param vthp= -0.60022

.alter
.param vthn= 0.63273       $ 3332
.param vthp= -0.57702

.alter
.param vthn= 0.57197       $ 3333
.param vthp= -0.59449

.alter
.param vthn= 0.60949       $ 3334
.param vthp= -0.58970

.alter
.param vthn= 0.61234       $ 3335
.param vthp= -0.58974

.alter
.param vthn= 0.63822       $ 3336
.param vthp= -0.59168

.alter
.param vthn= 0.63596       $ 3337
.param vthp= -0.58797

.alter
.param vthn= 0.62977       $ 3338
.param vthp= -0.59450

.alter
.param vthn= 0.64913       $ 3339
.param vthp= -0.59379

.alter
.param vthn= 0.61299       $ 3340
.param vthp= -0.58644

.alter
.param vthn= 0.63803       $ 3341
.param vthp= -0.58131

.alter
.param vthn= 0.59368       $ 3342
.param vthp= -0.60631

.alter
.param vthn= 0.63327       $ 3343
.param vthp= -0.58974

.alter
.param vthn= 0.61011       $ 3344
.param vthp= -0.59946

.alter
.param vthn= 0.61422       $ 3345
.param vthp= -0.59057

.alter
.param vthn= 0.59336       $ 3346
.param vthp= -0.58583

.alter
.param vthn= 0.60572       $ 3347
.param vthp= -0.59074

.alter
.param vthn= 0.64083       $ 3348
.param vthp= -0.59422

.alter
.param vthn= 0.63192       $ 3349
.param vthp= -0.60158

.alter
.param vthn= 0.61008       $ 3350
.param vthp= -0.59207

.alter
.param vthn= 0.60700       $ 3351
.param vthp= -0.60297

.alter
.param vthn= 0.60159       $ 3352
.param vthp= -0.59568

.alter
.param vthn= 0.63064       $ 3353
.param vthp= -0.58688

.alter
.param vthn= 0.63274       $ 3354
.param vthp= -0.58517

.alter
.param vthn= 0.62218       $ 3355
.param vthp= -0.58344

.alter
.param vthn= 0.61714       $ 3356
.param vthp= -0.58749

.alter
.param vthn= 0.62156       $ 3357
.param vthp= -0.59296

.alter
.param vthn= 0.61656       $ 3358
.param vthp= -0.60836

.alter
.param vthn= 0.62621       $ 3359
.param vthp= -0.58248

.alter
.param vthn= 0.61681       $ 3360
.param vthp= -0.60154

.alter
.param vthn= 0.61037       $ 3361
.param vthp= -0.59357

.alter
.param vthn= 0.58487       $ 3362
.param vthp= -0.59539

.alter
.param vthn= 0.61950       $ 3363
.param vthp= -0.60430

.alter
.param vthn= 0.62382       $ 3364
.param vthp= -0.59512

.alter
.param vthn= 0.60102       $ 3365
.param vthp= -0.58798

.alter
.param vthn= 0.63928       $ 3366
.param vthp= -0.59187

.alter
.param vthn= 0.63403       $ 3367
.param vthp= -0.59038

.alter
.param vthn= 0.60059       $ 3368
.param vthp= -0.59917

.alter
.param vthn= 0.60715       $ 3369
.param vthp= -0.58699

.alter
.param vthn= 0.61239       $ 3370
.param vthp= -0.59635

.alter
.param vthn= 0.62829       $ 3371
.param vthp= -0.59519

.alter
.param vthn= 0.64058       $ 3372
.param vthp= -0.59280

.alter
.param vthn= 0.64427       $ 3373
.param vthp= -0.59774

.alter
.param vthn= 0.60350       $ 3374
.param vthp= -0.58683

.alter
.param vthn= 0.60410       $ 3375
.param vthp= -0.59452

.alter
.param vthn= 0.59595       $ 3376
.param vthp= -0.59306

.alter
.param vthn= 0.59604       $ 3377
.param vthp= -0.60388

.alter
.param vthn= 0.62316       $ 3378
.param vthp= -0.58902

.alter
.param vthn= 0.63537       $ 3379
.param vthp= -0.59992

.alter
.param vthn= 0.62293       $ 3380
.param vthp= -0.60972

.alter
.param vthn= 0.60462       $ 3381
.param vthp= -0.58545

.alter
.param vthn= 0.62168       $ 3382
.param vthp= -0.60072

.alter
.param vthn= 0.62293       $ 3383
.param vthp= -0.58911

.alter
.param vthn= 0.61379       $ 3384
.param vthp= -0.59080

.alter
.param vthn= 0.62524       $ 3385
.param vthp= -0.58894

.alter
.param vthn= 0.62515       $ 3386
.param vthp= -0.59297

.alter
.param vthn= 0.60137       $ 3387
.param vthp= -0.60054

.alter
.param vthn= 0.61191       $ 3388
.param vthp= -0.59261

.alter
.param vthn= 0.57504       $ 3389
.param vthp= -0.59779

.alter
.param vthn= 0.61694       $ 3390
.param vthp= -0.60129

.alter
.param vthn= 0.60067       $ 3391
.param vthp= -0.59774

.alter
.param vthn= 0.61044       $ 3392
.param vthp= -0.58947

.alter
.param vthn= 0.62387       $ 3393
.param vthp= -0.59062

.alter
.param vthn= 0.62180       $ 3394
.param vthp= -0.58951

.alter
.param vthn= 0.62886       $ 3395
.param vthp= -0.60110

.alter
.param vthn= 0.63774       $ 3396
.param vthp= -0.59111

.alter
.param vthn= 0.59301       $ 3397
.param vthp= -0.60183

.alter
.param vthn= 0.60944       $ 3398
.param vthp= -0.59694

.alter
.param vthn= 0.61789       $ 3399
.param vthp= -0.60405

.alter
.param vthn= 0.62929       $ 3400
.param vthp= -0.59396

.alter
.param vthn= 0.62981       $ 3401
.param vthp= -0.59871

.alter
.param vthn= 0.60454       $ 3402
.param vthp= -0.58639

.alter
.param vthn= 0.64054       $ 3403
.param vthp= -0.59868

.alter
.param vthn= 0.63229       $ 3404
.param vthp= -0.58471

.alter
.param vthn= 0.60664       $ 3405
.param vthp= -0.58739

.alter
.param vthn= 0.61652       $ 3406
.param vthp= -0.60747

.alter
.param vthn= 0.63125       $ 3407
.param vthp= -0.59916

.alter
.param vthn= 0.64511       $ 3408
.param vthp= -0.59001

.alter
.param vthn= 0.62296       $ 3409
.param vthp= -0.58837

.alter
.param vthn= 0.63561       $ 3410
.param vthp= -0.59329

.alter
.param vthn= 0.65627       $ 3411
.param vthp= -0.59278

.alter
.param vthn= 0.61666       $ 3412
.param vthp= -0.59741

.alter
.param vthn= 0.61842       $ 3413
.param vthp= -0.57934

.alter
.param vthn= 0.60782       $ 3414
.param vthp= -0.58829

.alter
.param vthn= 0.60992       $ 3415
.param vthp= -0.58899

.alter
.param vthn= 0.64931       $ 3416
.param vthp= -0.59294

.alter
.param vthn= 0.64811       $ 3417
.param vthp= -0.59975

.alter
.param vthn= 0.64058       $ 3418
.param vthp= -0.60387

.alter
.param vthn= 0.63278       $ 3419
.param vthp= -0.59563

.alter
.param vthn= 0.63400       $ 3420
.param vthp= -0.59078

.alter
.param vthn= 0.60864       $ 3421
.param vthp= -0.58442

.alter
.param vthn= 0.61556       $ 3422
.param vthp= -0.58670

.alter
.param vthn= 0.62539       $ 3423
.param vthp= -0.59288

.alter
.param vthn= 0.63233       $ 3424
.param vthp= -0.58962

.alter
.param vthn= 0.60181       $ 3425
.param vthp= -0.59290

.alter
.param vthn= 0.63066       $ 3426
.param vthp= -0.57798

.alter
.param vthn= 0.63206       $ 3427
.param vthp= -0.59175

.alter
.param vthn= 0.62009       $ 3428
.param vthp= -0.58964

.alter
.param vthn= 0.61726       $ 3429
.param vthp= -0.58300

.alter
.param vthn= 0.62307       $ 3430
.param vthp= -0.59352

.alter
.param vthn= 0.62790       $ 3431
.param vthp= -0.59158

.alter
.param vthn= 0.63203       $ 3432
.param vthp= -0.59209

.alter
.param vthn= 0.60991       $ 3433
.param vthp= -0.58512

.alter
.param vthn= 0.60925       $ 3434
.param vthp= -0.59020

.alter
.param vthn= 0.61119       $ 3435
.param vthp= -0.58575

.alter
.param vthn= 0.61981       $ 3436
.param vthp= -0.58336

.alter
.param vthn= 0.62820       $ 3437
.param vthp= -0.58925

.alter
.param vthn= 0.62403       $ 3438
.param vthp= -0.59190

.alter
.param vthn= 0.65596       $ 3439
.param vthp= -0.58608

.alter
.param vthn= 0.62859       $ 3440
.param vthp= -0.58398

.alter
.param vthn= 0.61956       $ 3441
.param vthp= -0.59308

.alter
.param vthn= 0.64298       $ 3442
.param vthp= -0.60000

.alter
.param vthn= 0.65007       $ 3443
.param vthp= -0.58202

.alter
.param vthn= 0.59325       $ 3444
.param vthp= -0.58391

.alter
.param vthn= 0.65026       $ 3445
.param vthp= -0.58851

.alter
.param vthn= 0.63170       $ 3446
.param vthp= -0.59596

.alter
.param vthn= 0.62026       $ 3447
.param vthp= -0.59654

.alter
.param vthn= 0.59293       $ 3448
.param vthp= -0.58026

.alter
.param vthn= 0.64428       $ 3449
.param vthp= -0.58573

.alter
.param vthn= 0.62701       $ 3450
.param vthp= -0.60055

.alter
.param vthn= 0.63231       $ 3451
.param vthp= -0.58832

.alter
.param vthn= 0.64346       $ 3452
.param vthp= -0.58518

.alter
.param vthn= 0.63100       $ 3453
.param vthp= -0.58581

.alter
.param vthn= 0.62286       $ 3454
.param vthp= -0.58552

.alter
.param vthn= 0.63175       $ 3455
.param vthp= -0.59700

.alter
.param vthn= 0.60345       $ 3456
.param vthp= -0.60075

.alter
.param vthn= 0.61666       $ 3457
.param vthp= -0.59992

.alter
.param vthn= 0.62173       $ 3458
.param vthp= -0.59630

.alter
.param vthn= 0.59788       $ 3459
.param vthp= -0.58447

.alter
.param vthn= 0.60445       $ 3460
.param vthp= -0.58781

.alter
.param vthn= 0.63319       $ 3461
.param vthp= -0.60175

.alter
.param vthn= 0.59709       $ 3462
.param vthp= -0.59138

.alter
.param vthn= 0.62862       $ 3463
.param vthp= -0.58709

.alter
.param vthn= 0.63728       $ 3464
.param vthp= -0.58599

.alter
.param vthn= 0.60369       $ 3465
.param vthp= -0.58591

.alter
.param vthn= 0.61593       $ 3466
.param vthp= -0.60381

.alter
.param vthn= 0.58053       $ 3467
.param vthp= -0.58794

.alter
.param vthn= 0.62251       $ 3468
.param vthp= -0.59660

.alter
.param vthn= 0.61315       $ 3469
.param vthp= -0.59316

.alter
.param vthn= 0.63830       $ 3470
.param vthp= -0.59486

.alter
.param vthn= 0.63536       $ 3471
.param vthp= -0.59950

.alter
.param vthn= 0.60720       $ 3472
.param vthp= -0.58462

.alter
.param vthn= 0.61336       $ 3473
.param vthp= -0.59794

.alter
.param vthn= 0.61321       $ 3474
.param vthp= -0.59540

.alter
.param vthn= 0.63297       $ 3475
.param vthp= -0.59458

.alter
.param vthn= 0.64150       $ 3476
.param vthp= -0.59361

.alter
.param vthn= 0.63984       $ 3477
.param vthp= -0.59109

.alter
.param vthn= 0.63157       $ 3478
.param vthp= -0.59084

.alter
.param vthn= 0.65682       $ 3479
.param vthp= -0.59831

.alter
.param vthn= 0.61728       $ 3480
.param vthp= -0.58612

.alter
.param vthn= 0.62508       $ 3481
.param vthp= -0.58936

.alter
.param vthn= 0.59869       $ 3482
.param vthp= -0.59240

.alter
.param vthn= 0.64147       $ 3483
.param vthp= -0.59040

.alter
.param vthn= 0.62238       $ 3484
.param vthp= -0.57770

.alter
.param vthn= 0.64819       $ 3485
.param vthp= -0.58546

.alter
.param vthn= 0.64329       $ 3486
.param vthp= -0.59495

.alter
.param vthn= 0.61796       $ 3487
.param vthp= -0.59910

.alter
.param vthn= 0.62065       $ 3488
.param vthp= -0.58691

.alter
.param vthn= 0.65032       $ 3489
.param vthp= -0.60170

.alter
.param vthn= 0.61713       $ 3490
.param vthp= -0.59614

.alter
.param vthn= 0.62731       $ 3491
.param vthp= -0.59384

.alter
.param vthn= 0.63254       $ 3492
.param vthp= -0.58445

.alter
.param vthn= 0.59612       $ 3493
.param vthp= -0.58441

.alter
.param vthn= 0.62034       $ 3494
.param vthp= -0.59062

.alter
.param vthn= 0.66339       $ 3495
.param vthp= -0.59108

.alter
.param vthn= 0.62975       $ 3496
.param vthp= -0.58574

.alter
.param vthn= 0.62789       $ 3497
.param vthp= -0.59791

.alter
.param vthn= 0.63914       $ 3498
.param vthp= -0.59477

.alter
.param vthn= 0.62112       $ 3499
.param vthp= -0.59227

.alter
.param vthn= 0.62349       $ 3500
.param vthp= -0.60103

.alter
.param vthn= 0.60612       $ 3501
.param vthp= -0.57395

.alter
.param vthn= 0.60688       $ 3502
.param vthp= -0.58267

.alter
.param vthn= 0.64350       $ 3503
.param vthp= -0.59551

.alter
.param vthn= 0.62799       $ 3504
.param vthp= -0.58873

.alter
.param vthn= 0.58594       $ 3505
.param vthp= -0.59625

.alter
.param vthn= 0.63039       $ 3506
.param vthp= -0.58989

.alter
.param vthn= 0.61920       $ 3507
.param vthp= -0.58864

.alter
.param vthn= 0.61974       $ 3508
.param vthp= -0.58781

.alter
.param vthn= 0.60539       $ 3509
.param vthp= -0.60824

.alter
.param vthn= 0.63069       $ 3510
.param vthp= -0.59088

.alter
.param vthn= 0.61557       $ 3511
.param vthp= -0.59555

.alter
.param vthn= 0.64198       $ 3512
.param vthp= -0.59511

.alter
.param vthn= 0.63135       $ 3513
.param vthp= -0.58706

.alter
.param vthn= 0.62077       $ 3514
.param vthp= -0.59353

.alter
.param vthn= 0.62907       $ 3515
.param vthp= -0.59227

.alter
.param vthn= 0.62301       $ 3516
.param vthp= -0.59352

.alter
.param vthn= 0.61477       $ 3517
.param vthp= -0.59587

.alter
.param vthn= 0.62920       $ 3518
.param vthp= -0.59778

.alter
.param vthn= 0.60068       $ 3519
.param vthp= -0.59423

.alter
.param vthn= 0.65377       $ 3520
.param vthp= -0.58972

.alter
.param vthn= 0.61877       $ 3521
.param vthp= -0.58642

.alter
.param vthn= 0.61300       $ 3522
.param vthp= -0.60527

.alter
.param vthn= 0.63264       $ 3523
.param vthp= -0.59403

.alter
.param vthn= 0.62731       $ 3524
.param vthp= -0.57962

.alter
.param vthn= 0.60027       $ 3525
.param vthp= -0.58481

.alter
.param vthn= 0.64308       $ 3526
.param vthp= -0.60241

.alter
.param vthn= 0.63154       $ 3527
.param vthp= -0.59180

.alter
.param vthn= 0.61254       $ 3528
.param vthp= -0.57679

.alter
.param vthn= 0.63973       $ 3529
.param vthp= -0.58958

.alter
.param vthn= 0.61522       $ 3530
.param vthp= -0.58819

.alter
.param vthn= 0.61118       $ 3531
.param vthp= -0.59660

.alter
.param vthn= 0.63780       $ 3532
.param vthp= -0.57340

.alter
.param vthn= 0.57704       $ 3533
.param vthp= -0.59087

.alter
.param vthn= 0.61456       $ 3534
.param vthp= -0.58608

.alter
.param vthn= 0.61741       $ 3535
.param vthp= -0.58612

.alter
.param vthn= 0.64329       $ 3536
.param vthp= -0.58806

.alter
.param vthn= 0.64103       $ 3537
.param vthp= -0.58435

.alter
.param vthn= 0.63484       $ 3538
.param vthp= -0.59088

.alter
.param vthn= 0.65420       $ 3539
.param vthp= -0.59017

.alter
.param vthn= 0.61806       $ 3540
.param vthp= -0.58282

.alter
.param vthn= 0.64310       $ 3541
.param vthp= -0.57769

.alter
.param vthn= 0.59875       $ 3542
.param vthp= -0.60269

.alter
.param vthn= 0.63834       $ 3543
.param vthp= -0.58612

.alter
.param vthn= 0.61518       $ 3544
.param vthp= -0.59584

.alter
.param vthn= 0.61929       $ 3545
.param vthp= -0.58695

.alter
.param vthn= 0.59843       $ 3546
.param vthp= -0.58221

.alter
.param vthn= 0.61079       $ 3547
.param vthp= -0.58712

.alter
.param vthn= 0.64590       $ 3548
.param vthp= -0.59060

.alter
.param vthn= 0.63699       $ 3549
.param vthp= -0.59796

.alter
.param vthn= 0.61515       $ 3550
.param vthp= -0.58845

.alter
.param vthn= 0.61207       $ 3551
.param vthp= -0.59935

.alter
.param vthn= 0.60666       $ 3552
.param vthp= -0.59206

.alter
.param vthn= 0.63571       $ 3553
.param vthp= -0.58326

.alter
.param vthn= 0.63781       $ 3554
.param vthp= -0.58155

.alter
.param vthn= 0.62725       $ 3555
.param vthp= -0.57982

.alter
.param vthn= 0.62221       $ 3556
.param vthp= -0.58387

.alter
.param vthn= 0.62663       $ 3557
.param vthp= -0.58934

.alter
.param vthn= 0.62163       $ 3558
.param vthp= -0.60474

.alter
.param vthn= 0.63128       $ 3559
.param vthp= -0.57886

.alter
.param vthn= 0.62188       $ 3560
.param vthp= -0.59792

.alter
.param vthn= 0.61544       $ 3561
.param vthp= -0.58995

.alter
.param vthn= 0.58994       $ 3562
.param vthp= -0.59177

.alter
.param vthn= 0.62457       $ 3563
.param vthp= -0.60068

.alter
.param vthn= 0.62889       $ 3564
.param vthp= -0.59150

.alter
.param vthn= 0.60609       $ 3565
.param vthp= -0.58436

.alter
.param vthn= 0.64435       $ 3566
.param vthp= -0.58825

.alter
.param vthn= 0.63910       $ 3567
.param vthp= -0.58676

.alter
.param vthn= 0.60566       $ 3568
.param vthp= -0.59555

.alter
.param vthn= 0.61222       $ 3569
.param vthp= -0.58337

.alter
.param vthn= 0.61746       $ 3570
.param vthp= -0.59273

.alter
.param vthn= 0.63336       $ 3571
.param vthp= -0.59157

.alter
.param vthn= 0.64565       $ 3572
.param vthp= -0.58918

.alter
.param vthn= 0.64934       $ 3573
.param vthp= -0.59412

.alter
.param vthn= 0.60857       $ 3574
.param vthp= -0.58321

.alter
.param vthn= 0.60917       $ 3575
.param vthp= -0.59090

.alter
.param vthn= 0.60102       $ 3576
.param vthp= -0.58944

.alter
.param vthn= 0.60111       $ 3577
.param vthp= -0.60026

.alter
.param vthn= 0.62823       $ 3578
.param vthp= -0.58540

.alter
.param vthn= 0.64044       $ 3579
.param vthp= -0.59630

.alter
.param vthn= 0.62800       $ 3580
.param vthp= -0.60610

.alter
.param vthn= 0.60969       $ 3581
.param vthp= -0.58183

.alter
.param vthn= 0.62675       $ 3582
.param vthp= -0.59710

.alter
.param vthn= 0.62800       $ 3583
.param vthp= -0.58549

.alter
.param vthn= 0.61886       $ 3584
.param vthp= -0.58718

.alter
.param vthn= 0.63031       $ 3585
.param vthp= -0.58532

.alter
.param vthn= 0.63022       $ 3586
.param vthp= -0.58935

.alter
.param vthn= 0.60644       $ 3587
.param vthp= -0.59692

.alter
.param vthn= 0.61698       $ 3588
.param vthp= -0.58899

.alter
.param vthn= 0.58011       $ 3589
.param vthp= -0.59417

.alter
.param vthn= 0.62201       $ 3590
.param vthp= -0.59767

.alter
.param vthn= 0.60574       $ 3591
.param vthp= -0.59412

.alter
.param vthn= 0.61551       $ 3592
.param vthp= -0.58585

.alter
.param vthn= 0.62894       $ 3593
.param vthp= -0.58700

.alter
.param vthn= 0.62687       $ 3594
.param vthp= -0.58589

.alter
.param vthn= 0.63393       $ 3595
.param vthp= -0.59748

.alter
.param vthn= 0.64281       $ 3596
.param vthp= -0.58749

.alter
.param vthn= 0.59808       $ 3597
.param vthp= -0.59821

.alter
.param vthn= 0.61451       $ 3598
.param vthp= -0.59332

.alter
.param vthn= 0.62296       $ 3599
.param vthp= -0.60043

.alter
.param vthn= 0.63436       $ 3600
.param vthp= -0.59034

.alter
.param vthn= 0.60596       $ 3601
.param vthp= -0.58688

.alter
.param vthn= 0.58069       $ 3602
.param vthp= -0.57456

.alter
.param vthn= 0.61669       $ 3603
.param vthp= -0.58685

.alter
.param vthn= 0.60844       $ 3604
.param vthp= -0.57288

.alter
.param vthn= 0.58279       $ 3605
.param vthp= -0.57556

.alter
.param vthn= 0.59267       $ 3606
.param vthp= -0.59564

.alter
.param vthn= 0.60740       $ 3607
.param vthp= -0.58733

.alter
.param vthn= 0.62126       $ 3608
.param vthp= -0.57818

.alter
.param vthn= 0.59911       $ 3609
.param vthp= -0.57654

.alter
.param vthn= 0.61176       $ 3610
.param vthp= -0.58146

.alter
.param vthn= 0.63242       $ 3611
.param vthp= -0.58095

.alter
.param vthn= 0.59281       $ 3612
.param vthp= -0.58558

.alter
.param vthn= 0.59457       $ 3613
.param vthp= -0.56751

.alter
.param vthn= 0.58397       $ 3614
.param vthp= -0.57646

.alter
.param vthn= 0.58607       $ 3615
.param vthp= -0.57716

.alter
.param vthn= 0.62546       $ 3616
.param vthp= -0.58111

.alter
.param vthn= 0.62426       $ 3617
.param vthp= -0.58792

.alter
.param vthn= 0.61673       $ 3618
.param vthp= -0.59204

.alter
.param vthn= 0.60893       $ 3619
.param vthp= -0.58380

.alter
.param vthn= 0.61015       $ 3620
.param vthp= -0.57895

.alter
.param vthn= 0.58479       $ 3621
.param vthp= -0.57259

.alter
.param vthn= 0.59171       $ 3622
.param vthp= -0.57487

.alter
.param vthn= 0.60154       $ 3623
.param vthp= -0.58105

.alter
.param vthn= 0.60848       $ 3624
.param vthp= -0.57779

.alter
.param vthn= 0.57796       $ 3625
.param vthp= -0.58107

.alter
.param vthn= 0.60681       $ 3626
.param vthp= -0.56615

.alter
.param vthn= 0.60821       $ 3627
.param vthp= -0.57992

.alter
.param vthn= 0.59624       $ 3628
.param vthp= -0.57781

.alter
.param vthn= 0.59341       $ 3629
.param vthp= -0.57117

.alter
.param vthn= 0.59922       $ 3630
.param vthp= -0.58169

.alter
.param vthn= 0.60405       $ 3631
.param vthp= -0.57975

.alter
.param vthn= 0.60818       $ 3632
.param vthp= -0.58026

.alter
.param vthn= 0.58606       $ 3633
.param vthp= -0.57329

.alter
.param vthn= 0.58540       $ 3634
.param vthp= -0.57837

.alter
.param vthn= 0.58734       $ 3635
.param vthp= -0.57392

.alter
.param vthn= 0.59596       $ 3636
.param vthp= -0.57153

.alter
.param vthn= 0.60435       $ 3637
.param vthp= -0.57742

.alter
.param vthn= 0.60018       $ 3638
.param vthp= -0.58007

.alter
.param vthn= 0.63211       $ 3639
.param vthp= -0.57425

.alter
.param vthn= 0.60474       $ 3640
.param vthp= -0.57215

.alter
.param vthn= 0.59571       $ 3641
.param vthp= -0.58125

.alter
.param vthn= 0.61913       $ 3642
.param vthp= -0.58817

.alter
.param vthn= 0.62622       $ 3643
.param vthp= -0.57019

.alter
.param vthn= 0.56940       $ 3644
.param vthp= -0.57208

.alter
.param vthn= 0.62641       $ 3645
.param vthp= -0.57668

.alter
.param vthn= 0.60785       $ 3646
.param vthp= -0.58413

.alter
.param vthn= 0.59641       $ 3647
.param vthp= -0.58471

.alter
.param vthn= 0.56908       $ 3648
.param vthp= -0.56843

.alter
.param vthn= 0.62043       $ 3649
.param vthp= -0.57390

.alter
.param vthn= 0.60316       $ 3650
.param vthp= -0.58872

.alter
.param vthn= 0.60846       $ 3651
.param vthp= -0.57649

.alter
.param vthn= 0.61961       $ 3652
.param vthp= -0.57335

.alter
.param vthn= 0.60715       $ 3653
.param vthp= -0.57398

.alter
.param vthn= 0.59901       $ 3654
.param vthp= -0.57369

.alter
.param vthn= 0.60790       $ 3655
.param vthp= -0.58517

.alter
.param vthn= 0.57960       $ 3656
.param vthp= -0.58892

.alter
.param vthn= 0.59281       $ 3657
.param vthp= -0.58809

.alter
.param vthn= 0.59788       $ 3658
.param vthp= -0.58447

.alter
.param vthn= 0.57403       $ 3659
.param vthp= -0.57264

.alter
.param vthn= 0.58060       $ 3660
.param vthp= -0.57598

.alter
.param vthn= 0.60934       $ 3661
.param vthp= -0.58992

.alter
.param vthn= 0.57324       $ 3662
.param vthp= -0.57955

.alter
.param vthn= 0.60477       $ 3663
.param vthp= -0.57526

.alter
.param vthn= 0.61343       $ 3664
.param vthp= -0.57416

.alter
.param vthn= 0.57984       $ 3665
.param vthp= -0.57408

.alter
.param vthn= 0.59208       $ 3666
.param vthp= -0.59198

.alter
.param vthn= 0.55668       $ 3667
.param vthp= -0.57611

.alter
.param vthn= 0.59866       $ 3668
.param vthp= -0.58477

.alter
.param vthn= 0.58930       $ 3669
.param vthp= -0.58133

.alter
.param vthn= 0.61445       $ 3670
.param vthp= -0.58303

.alter
.param vthn= 0.61151       $ 3671
.param vthp= -0.58767

.alter
.param vthn= 0.58335       $ 3672
.param vthp= -0.57279

.alter
.param vthn= 0.58951       $ 3673
.param vthp= -0.58611

.alter
.param vthn= 0.58936       $ 3674
.param vthp= -0.58357

.alter
.param vthn= 0.60912       $ 3675
.param vthp= -0.58275

.alter
.param vthn= 0.61765       $ 3676
.param vthp= -0.58178

.alter
.param vthn= 0.61599       $ 3677
.param vthp= -0.57926

.alter
.param vthn= 0.60772       $ 3678
.param vthp= -0.57901

.alter
.param vthn= 0.63297       $ 3679
.param vthp= -0.58648

.alter
.param vthn= 0.59343       $ 3680
.param vthp= -0.57429

.alter
.param vthn= 0.60123       $ 3681
.param vthp= -0.57753

.alter
.param vthn= 0.57484       $ 3682
.param vthp= -0.58057

.alter
.param vthn= 0.61762       $ 3683
.param vthp= -0.57857

.alter
.param vthn= 0.59853       $ 3684
.param vthp= -0.56587

.alter
.param vthn= 0.62434       $ 3685
.param vthp= -0.57363

.alter
.param vthn= 0.61944       $ 3686
.param vthp= -0.58312

.alter
.param vthn= 0.59411       $ 3687
.param vthp= -0.58727

.alter
.param vthn= 0.59680       $ 3688
.param vthp= -0.57508

.alter
.param vthn= 0.62647       $ 3689
.param vthp= -0.58987

.alter
.param vthn= 0.59328       $ 3690
.param vthp= -0.58431

.alter
.param vthn= 0.60346       $ 3691
.param vthp= -0.58201

.alter
.param vthn= 0.60869       $ 3692
.param vthp= -0.57262

.alter
.param vthn= 0.57227       $ 3693
.param vthp= -0.57258

.alter
.param vthn= 0.59649       $ 3694
.param vthp= -0.57879

.alter
.param vthn= 0.63954       $ 3695
.param vthp= -0.57925

.alter
.param vthn= 0.60590       $ 3696
.param vthp= -0.57391

.alter
.param vthn= 0.60404       $ 3697
.param vthp= -0.58608

.alter
.param vthn= 0.61529       $ 3698
.param vthp= -0.58294

.alter
.param vthn= 0.59727       $ 3699
.param vthp= -0.58044

.alter
.param vthn= 0.59964       $ 3700
.param vthp= -0.58920

.alter
.param vthn= 0.58227       $ 3701
.param vthp= -0.56212

.alter
.param vthn= 0.58303       $ 3702
.param vthp= -0.57084

.alter
.param vthn= 0.61965       $ 3703
.param vthp= -0.58368

.alter
.param vthn= 0.60414       $ 3704
.param vthp= -0.57690

.alter
.param vthn= 0.56209       $ 3705
.param vthp= -0.58442

.alter
.param vthn= 0.60654       $ 3706
.param vthp= -0.57806

.alter
.param vthn= 0.59535       $ 3707
.param vthp= -0.57681

.alter
.param vthn= 0.59589       $ 3708
.param vthp= -0.57598

.alter
.param vthn= 0.58154       $ 3709
.param vthp= -0.59641

.alter
.param vthn= 0.60684       $ 3710
.param vthp= -0.57905

.alter
.param vthn= 0.59172       $ 3711
.param vthp= -0.58372

.alter
.param vthn= 0.61813       $ 3712
.param vthp= -0.58328

.alter
.param vthn= 0.60750       $ 3713
.param vthp= -0.57523

.alter
.param vthn= 0.59692       $ 3714
.param vthp= -0.58170

.alter
.param vthn= 0.60522       $ 3715
.param vthp= -0.58044

.alter
.param vthn= 0.59916       $ 3716
.param vthp= -0.58169

.alter
.param vthn= 0.59092       $ 3717
.param vthp= -0.58404

.alter
.param vthn= 0.60535       $ 3718
.param vthp= -0.58595

.alter
.param vthn= 0.57683       $ 3719
.param vthp= -0.58240

.alter
.param vthn= 0.62992       $ 3720
.param vthp= -0.57789

.alter
.param vthn= 0.59492       $ 3721
.param vthp= -0.57459

.alter
.param vthn= 0.58915       $ 3722
.param vthp= -0.59344

.alter
.param vthn= 0.60879       $ 3723
.param vthp= -0.58220

.alter
.param vthn= 0.60346       $ 3724
.param vthp= -0.56779

.alter
.param vthn= 0.57642       $ 3725
.param vthp= -0.57298

.alter
.param vthn= 0.61923       $ 3726
.param vthp= -0.59058

.alter
.param vthn= 0.60769       $ 3727
.param vthp= -0.57997

.alter
.param vthn= 0.58869       $ 3728
.param vthp= -0.56496

.alter
.param vthn= 0.61588       $ 3729
.param vthp= -0.57775

.alter
.param vthn= 0.59137       $ 3730
.param vthp= -0.57636

.alter
.param vthn= 0.58733       $ 3731
.param vthp= -0.58477

.alter
.param vthn= 0.61395       $ 3732
.param vthp= -0.56157

.alter
.param vthn= 0.55319       $ 3733
.param vthp= -0.57904

.alter
.param vthn= 0.59071       $ 3734
.param vthp= -0.57425

.alter
.param vthn= 0.59356       $ 3735
.param vthp= -0.57429

.alter
.param vthn= 0.61944       $ 3736
.param vthp= -0.57623

.alter
.param vthn= 0.61718       $ 3737
.param vthp= -0.57252

.alter
.param vthn= 0.61099       $ 3738
.param vthp= -0.57905

.alter
.param vthn= 0.63035       $ 3739
.param vthp= -0.57834

.alter
.param vthn= 0.59421       $ 3740
.param vthp= -0.57099

.alter
.param vthn= 0.61925       $ 3741
.param vthp= -0.56586

.alter
.param vthn= 0.57490       $ 3742
.param vthp= -0.59086

.alter
.param vthn= 0.61449       $ 3743
.param vthp= -0.57429

.alter
.param vthn= 0.59133       $ 3744
.param vthp= -0.58401

.alter
.param vthn= 0.59544       $ 3745
.param vthp= -0.57512

.alter
.param vthn= 0.57458       $ 3746
.param vthp= -0.57038

.alter
.param vthn= 0.58694       $ 3747
.param vthp= -0.57529

.alter
.param vthn= 0.62205       $ 3748
.param vthp= -0.57877

.alter
.param vthn= 0.61314       $ 3749
.param vthp= -0.58613

.alter
.param vthn= 0.59130       $ 3750
.param vthp= -0.57662

.alter
.param vthn= 0.58822       $ 3751
.param vthp= -0.58752

.alter
.param vthn= 0.58281       $ 3752
.param vthp= -0.58023

.alter
.param vthn= 0.61186       $ 3753
.param vthp= -0.57143

.alter
.param vthn= 0.61396       $ 3754
.param vthp= -0.56972

.alter
.param vthn= 0.60340       $ 3755
.param vthp= -0.56799

.alter
.param vthn= 0.59836       $ 3756
.param vthp= -0.57204

.alter
.param vthn= 0.60278       $ 3757
.param vthp= -0.57751

.alter
.param vthn= 0.59778       $ 3758
.param vthp= -0.59291

.alter
.param vthn= 0.60743       $ 3759
.param vthp= -0.56703

.alter
.param vthn= 0.59803       $ 3760
.param vthp= -0.58609

.alter
.param vthn= 0.59159       $ 3761
.param vthp= -0.57812

.alter
.param vthn= 0.56609       $ 3762
.param vthp= -0.57994

.alter
.param vthn= 0.60072       $ 3763
.param vthp= -0.58885

.alter
.param vthn= 0.60504       $ 3764
.param vthp= -0.57967

.alter
.param vthn= 0.58224       $ 3765
.param vthp= -0.57253

.alter
.param vthn= 0.62050       $ 3766
.param vthp= -0.57642

.alter
.param vthn= 0.61525       $ 3767
.param vthp= -0.57493

.alter
.param vthn= 0.58181       $ 3768
.param vthp= -0.58372

.alter
.param vthn= 0.58837       $ 3769
.param vthp= -0.57154

.alter
.param vthn= 0.59361       $ 3770
.param vthp= -0.58090

.alter
.param vthn= 0.60951       $ 3771
.param vthp= -0.57974

.alter
.param vthn= 0.62180       $ 3772
.param vthp= -0.57735

.alter
.param vthn= 0.62549       $ 3773
.param vthp= -0.58229

.alter
.param vthn= 0.58472       $ 3774
.param vthp= -0.57138

.alter
.param vthn= 0.58532       $ 3775
.param vthp= -0.57907

.alter
.param vthn= 0.57717       $ 3776
.param vthp= -0.57761

.alter
.param vthn= 0.57726       $ 3777
.param vthp= -0.58843

.alter
.param vthn= 0.60438       $ 3778
.param vthp= -0.57357

.alter
.param vthn= 0.61659       $ 3779
.param vthp= -0.58447

.alter
.param vthn= 0.60415       $ 3780
.param vthp= -0.59427

.alter
.param vthn= 0.58584       $ 3781
.param vthp= -0.57000

.alter
.param vthn= 0.60290       $ 3782
.param vthp= -0.58527

.alter
.param vthn= 0.60415       $ 3783
.param vthp= -0.57366

.alter
.param vthn= 0.59501       $ 3784
.param vthp= -0.57535

.alter
.param vthn= 0.60646       $ 3785
.param vthp= -0.57349

.alter
.param vthn= 0.60637       $ 3786
.param vthp= -0.57752

.alter
.param vthn= 0.58259       $ 3787
.param vthp= -0.58509

.alter
.param vthn= 0.59313       $ 3788
.param vthp= -0.57716

.alter
.param vthn= 0.55626       $ 3789
.param vthp= -0.58234

.alter
.param vthn= 0.59816       $ 3790
.param vthp= -0.58584

.alter
.param vthn= 0.58189       $ 3791
.param vthp= -0.58229

.alter
.param vthn= 0.59166       $ 3792
.param vthp= -0.57402

.alter
.param vthn= 0.60509       $ 3793
.param vthp= -0.57517

.alter
.param vthn= 0.60302       $ 3794
.param vthp= -0.57406

.alter
.param vthn= 0.61008       $ 3795
.param vthp= -0.58565

.alter
.param vthn= 0.61896       $ 3796
.param vthp= -0.57566

.alter
.param vthn= 0.57423       $ 3797
.param vthp= -0.58638

.alter
.param vthn= 0.59066       $ 3798
.param vthp= -0.58149

.alter
.param vthn= 0.59911       $ 3799
.param vthp= -0.58860

.alter
.param vthn= 0.61051       $ 3800
.param vthp= -0.57851

.alter
.param vthn= 0.61253       $ 3801
.param vthp= -0.59022

.alter
.param vthn= 0.58726       $ 3802
.param vthp= -0.57790

.alter
.param vthn= 0.62326       $ 3803
.param vthp= -0.59019

.alter
.param vthn= 0.61501       $ 3804
.param vthp= -0.57622

.alter
.param vthn= 0.58936       $ 3805
.param vthp= -0.57890

.alter
.param vthn= 0.59924       $ 3806
.param vthp= -0.59898

.alter
.param vthn= 0.61397       $ 3807
.param vthp= -0.59067

.alter
.param vthn= 0.62783       $ 3808
.param vthp= -0.58152

.alter
.param vthn= 0.60568       $ 3809
.param vthp= -0.57988

.alter
.param vthn= 0.61833       $ 3810
.param vthp= -0.58480

.alter
.param vthn= 0.63899       $ 3811
.param vthp= -0.58429

.alter
.param vthn= 0.59938       $ 3812
.param vthp= -0.58892

.alter
.param vthn= 0.60114       $ 3813
.param vthp= -0.57085

.alter
.param vthn= 0.59054       $ 3814
.param vthp= -0.57980

.alter
.param vthn= 0.59264       $ 3815
.param vthp= -0.58050

.alter
.param vthn= 0.63203       $ 3816
.param vthp= -0.58445

.alter
.param vthn= 0.63083       $ 3817
.param vthp= -0.59126

.alter
.param vthn= 0.62330       $ 3818
.param vthp= -0.59538

.alter
.param vthn= 0.61550       $ 3819
.param vthp= -0.58714

.alter
.param vthn= 0.61672       $ 3820
.param vthp= -0.58229

.alter
.param vthn= 0.59136       $ 3821
.param vthp= -0.57593

.alter
.param vthn= 0.59828       $ 3822
.param vthp= -0.57821

.alter
.param vthn= 0.60811       $ 3823
.param vthp= -0.58439

.alter
.param vthn= 0.61505       $ 3824
.param vthp= -0.58113

.alter
.param vthn= 0.58453       $ 3825
.param vthp= -0.58441

.alter
.param vthn= 0.61338       $ 3826
.param vthp= -0.56949

.alter
.param vthn= 0.61478       $ 3827
.param vthp= -0.58326

.alter
.param vthn= 0.60281       $ 3828
.param vthp= -0.58115

.alter
.param vthn= 0.59998       $ 3829
.param vthp= -0.57451

.alter
.param vthn= 0.60579       $ 3830
.param vthp= -0.58503

.alter
.param vthn= 0.61062       $ 3831
.param vthp= -0.58309

.alter
.param vthn= 0.61475       $ 3832
.param vthp= -0.58360

.alter
.param vthn= 0.59263       $ 3833
.param vthp= -0.57663

.alter
.param vthn= 0.59197       $ 3834
.param vthp= -0.58171

.alter
.param vthn= 0.59391       $ 3835
.param vthp= -0.57726

.alter
.param vthn= 0.60253       $ 3836
.param vthp= -0.57487

.alter
.param vthn= 0.61092       $ 3837
.param vthp= -0.58076

.alter
.param vthn= 0.60675       $ 3838
.param vthp= -0.58341

.alter
.param vthn= 0.63868       $ 3839
.param vthp= -0.57759

.alter
.param vthn= 0.61131       $ 3840
.param vthp= -0.57549

.alter
.param vthn= 0.60228       $ 3841
.param vthp= -0.58459

.alter
.param vthn= 0.62570       $ 3842
.param vthp= -0.59151

.alter
.param vthn= 0.63279       $ 3843
.param vthp= -0.57353

.alter
.param vthn= 0.57597       $ 3844
.param vthp= -0.57542

.alter
.param vthn= 0.63298       $ 3845
.param vthp= -0.58002

.alter
.param vthn= 0.61442       $ 3846
.param vthp= -0.58747

.alter
.param vthn= 0.60298       $ 3847
.param vthp= -0.58805

.alter
.param vthn= 0.57565       $ 3848
.param vthp= -0.57177

.alter
.param vthn= 0.62700       $ 3849
.param vthp= -0.57724

.alter
.param vthn= 0.60973       $ 3850
.param vthp= -0.59206

.alter
.param vthn= 0.61503       $ 3851
.param vthp= -0.57983

.alter
.param vthn= 0.62618       $ 3852
.param vthp= -0.57669

.alter
.param vthn= 0.61372       $ 3853
.param vthp= -0.57732

.alter
.param vthn= 0.60558       $ 3854
.param vthp= -0.57703

.alter
.param vthn= 0.61447       $ 3855
.param vthp= -0.58851

.alter
.param vthn= 0.58617       $ 3856
.param vthp= -0.59226

.alter
.param vthn= 0.59938       $ 3857
.param vthp= -0.59143

.alter
.param vthn= 0.60445       $ 3858
.param vthp= -0.58781

.alter
.param vthn= 0.58060       $ 3859
.param vthp= -0.57598

.alter
.param vthn= 0.58717       $ 3860
.param vthp= -0.57932

.alter
.param vthn= 0.61591       $ 3861
.param vthp= -0.59326

.alter
.param vthn= 0.57981       $ 3862
.param vthp= -0.58289

.alter
.param vthn= 0.61134       $ 3863
.param vthp= -0.57860

.alter
.param vthn= 0.62000       $ 3864
.param vthp= -0.57750

.alter
.param vthn= 0.58641       $ 3865
.param vthp= -0.57742

.alter
.param vthn= 0.59865       $ 3866
.param vthp= -0.59532

.alter
.param vthn= 0.56325       $ 3867
.param vthp= -0.57945

.alter
.param vthn= 0.60523       $ 3868
.param vthp= -0.58811

.alter
.param vthn= 0.59587       $ 3869
.param vthp= -0.58467

.alter
.param vthn= 0.62102       $ 3870
.param vthp= -0.58637

.alter
.param vthn= 0.61808       $ 3871
.param vthp= -0.59101

.alter
.param vthn= 0.58992       $ 3872
.param vthp= -0.57613

.alter
.param vthn= 0.59608       $ 3873
.param vthp= -0.58945

.alter
.param vthn= 0.59593       $ 3874
.param vthp= -0.58691

.alter
.param vthn= 0.61569       $ 3875
.param vthp= -0.58609

.alter
.param vthn= 0.62422       $ 3876
.param vthp= -0.58512

.alter
.param vthn= 0.62256       $ 3877
.param vthp= -0.58260

.alter
.param vthn= 0.61429       $ 3878
.param vthp= -0.58235

.alter
.param vthn= 0.63954       $ 3879
.param vthp= -0.58982

.alter
.param vthn= 0.60000       $ 3880
.param vthp= -0.57763

.alter
.param vthn= 0.60780       $ 3881
.param vthp= -0.58087

.alter
.param vthn= 0.58141       $ 3882
.param vthp= -0.58391

.alter
.param vthn= 0.62419       $ 3883
.param vthp= -0.58191

.alter
.param vthn= 0.60510       $ 3884
.param vthp= -0.56921

.alter
.param vthn= 0.63091       $ 3885
.param vthp= -0.57697

.alter
.param vthn= 0.62601       $ 3886
.param vthp= -0.58646

.alter
.param vthn= 0.60068       $ 3887
.param vthp= -0.59061

.alter
.param vthn= 0.60337       $ 3888
.param vthp= -0.57842

.alter
.param vthn= 0.63304       $ 3889
.param vthp= -0.59321

.alter
.param vthn= 0.59985       $ 3890
.param vthp= -0.58765

.alter
.param vthn= 0.61003       $ 3891
.param vthp= -0.58535

.alter
.param vthn= 0.61526       $ 3892
.param vthp= -0.57596

.alter
.param vthn= 0.57884       $ 3893
.param vthp= -0.57592

.alter
.param vthn= 0.60306       $ 3894
.param vthp= -0.58213

.alter
.param vthn= 0.64611       $ 3895
.param vthp= -0.58259

.alter
.param vthn= 0.61247       $ 3896
.param vthp= -0.57725

.alter
.param vthn= 0.61061       $ 3897
.param vthp= -0.58942

.alter
.param vthn= 0.62186       $ 3898
.param vthp= -0.58628

.alter
.param vthn= 0.60384       $ 3899
.param vthp= -0.58378

.alter
.param vthn= 0.60621       $ 3900
.param vthp= -0.59254

.alter
.param vthn= 0.58884       $ 3901
.param vthp= -0.56546

.alter
.param vthn= 0.58960       $ 3902
.param vthp= -0.57418

.alter
.param vthn= 0.62622       $ 3903
.param vthp= -0.58702

.alter
.param vthn= 0.61071       $ 3904
.param vthp= -0.58024

.alter
.param vthn= 0.56866       $ 3905
.param vthp= -0.58776

.alter
.param vthn= 0.61311       $ 3906
.param vthp= -0.58140

.alter
.param vthn= 0.60192       $ 3907
.param vthp= -0.58015

.alter
.param vthn= 0.60246       $ 3908
.param vthp= -0.57932

.alter
.param vthn= 0.58811       $ 3909
.param vthp= -0.59975

.alter
.param vthn= 0.61341       $ 3910
.param vthp= -0.58239

.alter
.param vthn= 0.59829       $ 3911
.param vthp= -0.58706

.alter
.param vthn= 0.62470       $ 3912
.param vthp= -0.58662

.alter
.param vthn= 0.61407       $ 3913
.param vthp= -0.57857

.alter
.param vthn= 0.60349       $ 3914
.param vthp= -0.58504

.alter
.param vthn= 0.61179       $ 3915
.param vthp= -0.58378

.alter
.param vthn= 0.60573       $ 3916
.param vthp= -0.58503

.alter
.param vthn= 0.59749       $ 3917
.param vthp= -0.58738

.alter
.param vthn= 0.61192       $ 3918
.param vthp= -0.58929

.alter
.param vthn= 0.58340       $ 3919
.param vthp= -0.58574

.alter
.param vthn= 0.63649       $ 3920
.param vthp= -0.58123

.alter
.param vthn= 0.60149       $ 3921
.param vthp= -0.57793

.alter
.param vthn= 0.59572       $ 3922
.param vthp= -0.59678

.alter
.param vthn= 0.61536       $ 3923
.param vthp= -0.58554

.alter
.param vthn= 0.61003       $ 3924
.param vthp= -0.57113

.alter
.param vthn= 0.58299       $ 3925
.param vthp= -0.57632

.alter
.param vthn= 0.62580       $ 3926
.param vthp= -0.59392

.alter
.param vthn= 0.61426       $ 3927
.param vthp= -0.58331

.alter
.param vthn= 0.59526       $ 3928
.param vthp= -0.56830

.alter
.param vthn= 0.62245       $ 3929
.param vthp= -0.58109

.alter
.param vthn= 0.59794       $ 3930
.param vthp= -0.57970

.alter
.param vthn= 0.59390       $ 3931
.param vthp= -0.58811

.alter
.param vthn= 0.62052       $ 3932
.param vthp= -0.56491

.alter
.param vthn= 0.55976       $ 3933
.param vthp= -0.58238

.alter
.param vthn= 0.59728       $ 3934
.param vthp= -0.57759

.alter
.param vthn= 0.60013       $ 3935
.param vthp= -0.57763

.alter
.param vthn= 0.62601       $ 3936
.param vthp= -0.57957

.alter
.param vthn= 0.62375       $ 3937
.param vthp= -0.57586

.alter
.param vthn= 0.61756       $ 3938
.param vthp= -0.58239

.alter
.param vthn= 0.63692       $ 3939
.param vthp= -0.58168

.alter
.param vthn= 0.60078       $ 3940
.param vthp= -0.57433

.alter
.param vthn= 0.62582       $ 3941
.param vthp= -0.56920

.alter
.param vthn= 0.58147       $ 3942
.param vthp= -0.59420

.alter
.param vthn= 0.62106       $ 3943
.param vthp= -0.57763

.alter
.param vthn= 0.59790       $ 3944
.param vthp= -0.58735

.alter
.param vthn= 0.60201       $ 3945
.param vthp= -0.57846

.alter
.param vthn= 0.58115       $ 3946
.param vthp= -0.57372

.alter
.param vthn= 0.59351       $ 3947
.param vthp= -0.57863

.alter
.param vthn= 0.62862       $ 3948
.param vthp= -0.58211

.alter
.param vthn= 0.61971       $ 3949
.param vthp= -0.58947

.alter
.param vthn= 0.59787       $ 3950
.param vthp= -0.57996

.alter
.param vthn= 0.59479       $ 3951
.param vthp= -0.59086

.alter
.param vthn= 0.58938       $ 3952
.param vthp= -0.58357

.alter
.param vthn= 0.61843       $ 3953
.param vthp= -0.57477

.alter
.param vthn= 0.62053       $ 3954
.param vthp= -0.57306

.alter
.param vthn= 0.60997       $ 3955
.param vthp= -0.57133

.alter
.param vthn= 0.60493       $ 3956
.param vthp= -0.57538

.alter
.param vthn= 0.60935       $ 3957
.param vthp= -0.58085

.alter
.param vthn= 0.60435       $ 3958
.param vthp= -0.59625

.alter
.param vthn= 0.61400       $ 3959
.param vthp= -0.57037

.alter
.param vthn= 0.60460       $ 3960
.param vthp= -0.58943

.alter
.param vthn= 0.59816       $ 3961
.param vthp= -0.58146

.alter
.param vthn= 0.57266       $ 3962
.param vthp= -0.58328

.alter
.param vthn= 0.60729       $ 3963
.param vthp= -0.59219

.alter
.param vthn= 0.61161       $ 3964
.param vthp= -0.58301

.alter
.param vthn= 0.58881       $ 3965
.param vthp= -0.57587

.alter
.param vthn= 0.62707       $ 3966
.param vthp= -0.57976

.alter
.param vthn= 0.62182       $ 3967
.param vthp= -0.57827

.alter
.param vthn= 0.58838       $ 3968
.param vthp= -0.58706

.alter
.param vthn= 0.59494       $ 3969
.param vthp= -0.57488

.alter
.param vthn= 0.60018       $ 3970
.param vthp= -0.58424

.alter
.param vthn= 0.61608       $ 3971
.param vthp= -0.58308

.alter
.param vthn= 0.62837       $ 3972
.param vthp= -0.58069

.alter
.param vthn= 0.63206       $ 3973
.param vthp= -0.58563

.alter
.param vthn= 0.59129       $ 3974
.param vthp= -0.57472

.alter
.param vthn= 0.59189       $ 3975
.param vthp= -0.58241

.alter
.param vthn= 0.58374       $ 3976
.param vthp= -0.58095

.alter
.param vthn= 0.58383       $ 3977
.param vthp= -0.59177

.alter
.param vthn= 0.61095       $ 3978
.param vthp= -0.57691

.alter
.param vthn= 0.62316       $ 3979
.param vthp= -0.58781

.alter
.param vthn= 0.61072       $ 3980
.param vthp= -0.59761

.alter
.param vthn= 0.59241       $ 3981
.param vthp= -0.57334

.alter
.param vthn= 0.60947       $ 3982
.param vthp= -0.58861

.alter
.param vthn= 0.61072       $ 3983
.param vthp= -0.57700

.alter
.param vthn= 0.60158       $ 3984
.param vthp= -0.57869

.alter
.param vthn= 0.61303       $ 3985
.param vthp= -0.57683

.alter
.param vthn= 0.61294       $ 3986
.param vthp= -0.58086

.alter
.param vthn= 0.58916       $ 3987
.param vthp= -0.58843

.alter
.param vthn= 0.59970       $ 3988
.param vthp= -0.58050

.alter
.param vthn= 0.56283       $ 3989
.param vthp= -0.58568

.alter
.param vthn= 0.60473       $ 3990
.param vthp= -0.58918

.alter
.param vthn= 0.58846       $ 3991
.param vthp= -0.58563

.alter
.param vthn= 0.59823       $ 3992
.param vthp= -0.57736

.alter
.param vthn= 0.61166       $ 3993
.param vthp= -0.57851

.alter
.param vthn= 0.60959       $ 3994
.param vthp= -0.57740

.alter
.param vthn= 0.61665       $ 3995
.param vthp= -0.58899

.alter
.param vthn= 0.62553       $ 3996
.param vthp= -0.57900

.alter
.param vthn= 0.58080       $ 3997
.param vthp= -0.58972

.alter
.param vthn= 0.59723       $ 3998
.param vthp= -0.58483

.alter
.param vthn= 0.60568       $ 3999
.param vthp= -0.59194

.alter
.param vthn= 0.61708       $ 4000
.param vthp= -0.58185










.end