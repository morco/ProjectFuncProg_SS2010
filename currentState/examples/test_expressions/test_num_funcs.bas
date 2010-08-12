-- Test abs
  2 print "Test abs"
  5 Input "Put number "; N 
 10 PRINT ABS(N)
 15 PRINT "ABS(N * 5 - 3 + N/4 - N * 20) = ";ABS(N * 5 - 3 + N/4 - N * 20)
 20 IF ABS(N)=N THEN PRINT "POSITIVE ZAHL ODER NULL" : Goto 40
 30 PrinT "Negative Zahl" 
 40 print

-- Test asc
 45 print "Test asc"
 50 PRINT "The Ascii Val of A = ";ASC("A")
 52 print "give a char: ";
 55 get  A$ 
 60 A=ASC(A$)
 65 print
 70 print "Now given through var = ";A
 75 print

-- Test atn
 78 print "Test atn"
 80 PRINT "Atan von 0 = ";ATN(0)
 90 PI=3.14:X=ATN(N)*180/PI
100 print "PI=3.14:X=ATN(N)*180/PI => "; X
105 print 

-- Test chr$
110 PRINT "Chr from 65 = ";CHR$(65)
120 A$=CHR$(13)
125 print "Chr from 13 = ";A$
130 A=ASC(A$):A$=CHR$(A)
140 print "The number for A$=Chr$(13) =>";A

-- Test cos
145 print "Test cos"
150 PRINT "Cos von 0 = ";COS(0)
160 PI=3.14:X=COS(90*PI/180)
170 print "PI=3.14:X=COS(90*PI/180) => "; X
172 print

-- Test exp
175 print "Test exp"
180 PRINT "Euler num = ";EXP(1)
190 X=30*EXP(11)+20
200 print "X=30*EXP(11)+20 => "; X
210 print

-- Test log
220 print "Test log"
230 PRINT "Log(1) = ";LOG(1)
240 PRINT "LOG(e) = ";LOG(exp(1))
250 PRINT "Log(13) = ";LOG(13)
260 PRINT "LOG(15*16) = ";LOG(15*16)
263 REM PRINT "ErrorCase arg == 0 => ";LOG(0)
266 REM PRINT "ErrorCase arg < 0 => ";LOG(-2)
270 N=LOG(100)/LOG(10)
280 print "N=LOG(100)/LOG(10) => ";N
290 print


-- Test val
300 print "Test val"
310 PRINT "val(\"1\") = ";val("1")
320 PRINT "val(\"2.3\") = ";val("2.3")
330 PRINT "val(\"1\"+\"2\") = ";val("1"+"2")
340 N=val("10")
350 print "N=val(\"10\") => ";N
370 X = VAL ("123.456")
375 print "X = VAL (\"123.456\") => ";X
380 X = VAL ("12A13B")
385 print "X = VAL (\"12A13B\") => ";X
390 X = VAL ("RIU017")
395 print "X = VAL (\"RIU017\") => ";X
400 X = VAL ("- 1.23.15.67")
405 print "X = VAL (\"- 1.23.15.67\") => ";X
410 print


-- Test sin
420 print "Test sin"
430 PRINT "Sin von 0 = ";sin(0)
440 PI=3.14:X=sin(90*PI/180)
450 print "PI=3.14:X=sin(90*PI/180) => "; X
460 print


-- Test sqr
470 print "Test sqr"
480 PRINT "sqr(1) = ";sqr(1)
490 PRINT "sqr((2*2-3+7)/2) = ";sqr((2*2-3+7)/2)
500 PRINT "sqr(2) = ";sqr(2)
510 REM PRINT "ErrorCase arg < 0 => ";sqr(-1)
520 N=sqr(16)/sqr(4)
530 print "N=sqr(16)/sqr(4) => ";N
540 print


-- Test tan
550 print "Test tan"
560 PRINT "tan von 0 = ";tan(0)
570 PI=3.14:X=tan(90*PI/180)
580 print "PI=3.14:X=tan(90*PI/180) => "; X
590 print
