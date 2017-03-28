* SPICE3 file created from nor2_1x.ext - technology: scmos

.param SUPPLY = 5.0         * 5V
.temp 70
.option post
.include 'onsemi05.sp'      * device models
.include 'yzdetect_fast.spice'    * extracted netlist
.include 'inv_sub.sp'       * for buffers/loads

*----------------------------------------------------------------------
* Subcircuits
*----------------------------------------------------------------------
.global vdd gnd
.subckt driver a y
X1	a	b	inv
X2	b	y	inv
.ends

*----------Netlist------------------
Vdd   vdd   gnd   'SUPPLY'

Vin0	d0	gnd	PWL 0ps 0V 2000ps 0v 2040ps 'SUPPLY' 4000ps 'SUPPLY' 4040ps 0V 6000ps 0V 6040ps 'SUPPLY' 8000ps 'SUPPLY' 8040ps 0V 10000ps 0V 10040ps 0V 12000ps 0V 12040ps 0V 14000ps 0V
X0 d0 a_0_ driver

Vin1	d1	gnd	PWL 0ps 0V 2000ps 0v 2040ps 'SUPPLY' 4000ps 'SUPPLY' 4040ps 0V 6000ps 0V 6040ps 0V 8000ps 0V 8040ps 0V 10000ps 0V 10040ps 0V 12000ps 0V 12040ps 0V 14000ps 0V
X1	d1 a_1_ driver

Vin2	d2	gnd	PWL 0ps 0V 2000ps 0v 2040ps 'SUPPLY' 4000ps 'SUPPLY' 4040ps 0V 6000ps 0V 6040ps 0V 8000ps 0V 8040ps 0V 10000ps 0V 10040ps 0V 12000ps 0V 12040ps 0V 14000ps 0V
X2	d2 a_2_ driver

Vin3	d3	gnd	PWL 0ps 0V 2000ps 0v 2040ps 'SUPPLY' 4000ps 'SUPPLY' 4040ps 0V 6000ps 0V 6040ps 0V 8000ps 0V 8040ps 0V 10000ps 0V 10040ps 0V 12000ps 0V 12040ps 0V 14000ps 0V
X3	d3 a_3_ driver

Vin4	d4	gnd	PWL 0ps 0V 2000ps 0v 2040ps 'SUPPLY' 4000ps 'SUPPLY' 4040ps 0V 6000ps 0V 6040ps 0V 8000ps 0V 8040ps 0V 10000ps 0V 10040ps 0V 12000ps 0V 12040ps 0V 14000ps 0V
X4	d4 a_4_ driver

Vin5	d5	gnd	PWL 0ps 0V 2000ps 0v 2040ps 'SUPPLY' 4000ps 'SUPPLY' 4040ps 0V 6000ps 0V 6040ps 0V 8000ps 0V 8040ps 0V 10000ps 0V 10040ps 0V 12000ps 0V 12040ps 0V 14000ps 0V
X5	d5 a_5_ driver

Vin6	d6	gnd	PWL 0ps 0V 2000ps 0v 2040ps 'SUPPLY' 4000ps 'SUPPLY' 4040ps 0V 6000ps 0V 6040ps 0V 8000ps 0V 8040ps 0V 10000ps 0V 10040ps 0V 12000ps 0V 12040ps 0V 14000ps 0V
X6	d6 a_6_ driver

Vin7	d7	gnd	PWL 0ps 0V 2000ps 0v 2040ps 'SUPPLY' 4000ps 'SUPPLY' 4040ps 0V 6000ps 0V 6040ps 0V 8000ps 0V 8040ps 0V 10000ps 0V 10040ps 'SUPPLY' 12000ps 'SUPPLY' 12040ps 0V 14000ps 0V
X7	d7 a_7_ driver

C14 zero gnd 61fF

*----------------------------------------------------------------------
* Stimulus
*----------------------------------------------------------------------
.tran 1ps 40000ps
.measure tpdr_a_0                               * rising prop delay
+     TRIG v(a_0_)    VAL='SUPPLY/2' FALL=1 
+     TARG v(zero)    VAL='SUPPLY/2' RISE=1
.measure tpdf_a_0                               * falling prop delay
+     TRIG v(a_0_)    VAL='SUPPLY/2' RISE=1
+     TARG v(zero)    VAL='SUPPLY/2' FALL=1 
.measure tpd_a_0 param='(tpdr_a_0+tpdf_a_0)/2'          * average prop delay

.measure tpdr_a_7                             * rising prop delay
+     TRIG v(a_7_)    VAL='SUPPLY/2' FALL=1 
+     TARG v(zero)    VAL='SUPPLY/2' RISE=1
.measure tpdf_a_7                              * falling prop delay
+     TRIG v(a_7_)    VAL='SUPPLY/2' RISE=1
+     TARG v(zero)    VAL='SUPPLY/2' FALL=1 
.measure tpd_a_7 param='(tpdr_a_7+tpdf_a_7)/2'          * average prop delay

.measure trise                              * rise time
+     TRIG v(zero)    VAL='0.2*SUPPLY' RISE=1
+     TARG v(zero)    VAL='0.8*SUPPLY' RISE=1
.measure tfall                              * fall time
+     TRIG v(zero)    VAL='0.8*SUPPLY' FALL=1
+     TARG v(zero)    VAL='0.2*SUPPLY' FALL=1
.end
