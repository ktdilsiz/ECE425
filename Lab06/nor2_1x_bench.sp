* SPICE3 file created from nor2_1x.ext - technology: scmos

.param SUPPLY = 5.0         * 5V
.temp 70
.option post
.include 'onsemi05.sp'      * device models
.include 'nor2_1x.spice'    * extracted netlist
.include 'inv_sub.sp'       * for buffers/loads

*----------Netlist------------------
Vdd   vdd   gnd   'SUPPLY'

Va1	x1	gnd	PWL 0ps 0V 2000ps 0v 2040ps 0V 4000ps 0V 4040ps 0V 6000ps 0V 6040ps 'SUPPLY' 8000ps 'SUPPLY' 8040ps 0V 10000ps 0V 10040ps 'SUPPLY' 12000ps 'SUPPLY' 12040ps 0V 14000ps 0V
X1	x1	x2	inv
X2	x2	a	inv

Vb1	x3	gnd 	PWL 0ps 0V 2000ps 0v 2040ps 'SUPPLY' 4000ps 'SUPPLY' 4040ps 0V 6000ps 0V 6040ps 0V 8000ps 0V 8040ps 0V 10000ps 0V 10040ps 'SUPPLY' 12000ps 'SUPPLY' 12040ps 0V 14000ps 0V
X3	x3	x4	inv
X4	x4	b	inv


X5	y	out	inv

.tran 1ps 14000ps
.measure tpdr_a                              * rising prop delay
+     TRIG v(a)    VAL='SUPPLY/2' FALL=1 
+     TARG v(y)    VAL='SUPPLY/2' RISE=1
.measure tpdf_a                               * falling prop delay
+     TRIG v(a)    VAL='SUPPLY/2' RISE=1
+     TARG v(y)    VAL='SUPPLY/2' FALL=1 
.measure tpd_a param='(tpdr_a+tpdf_a)/2'          * average prop delay

.measure tpdr_b                              * rising prop delay
+     TRIG v(b)    VAL='SUPPLY/2' FALL=1 
+     TARG v(y)    VAL='SUPPLY/2' RISE=1
.measure tpdf_b                               * falling prop delay
+     TRIG v(b)    VAL='SUPPLY/2' RISE=1
+     TARG v(y)    VAL='SUPPLY/2' FALL=1 
.measure tpd_b param='(tpdr_b+tpdf_b)/2'          * average prop delay

.measure trise                              * rise time
+     TRIG v(y)    VAL='0.2*SUPPLY' RISE=1
+     TARG v(y)    VAL='0.8*SUPPLY' RISE=1
.measure tfall                              * fall time
+     TRIG v(y)    VAL='0.8*SUPPLY' FALL=1
+     TARG v(y)    VAL='0.2*SUPPLY' FALL=1
.end
