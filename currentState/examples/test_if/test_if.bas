 1 REM This program tests the if command by a simple compare,
 2 REM  an "and", and an "or" constrain 
 3 REM   (all constrains are so chosen that every print 
 4 REM    will be executed 2 times)
 5 REM  More examples are given in test_bool_expr.bas 
10 ZR% = 0
20 ?"COMMODORE 64"
35 ZR% = ZR% + 1
40 IF ZR% < 2 THEN 20

45 b = 0
50 print "Zurück in die Zukunft!!"
60 b = b + 1                                    
70 if ZR% = 2 and (b < 2) then goto 50

80 print "Zurück in die Zukunft2!!"
90 b = b + 1                                    
100 if ZR% <> 2 or b < 4 then goto 80

