 1 REM Nearly the same as "test_if.bas" with the thens missing
10 ZR% = 0
20 ?"COMMODORE 64"
35 ZR% = ZR% + 1
40 IF ZR% < 2 goto 20

45 b = 0
50 print "Zurück in die Zukunft!!"
60 b = b + 1                                    
70 if ZR% = 2 and (b < 2) goto 50

80 print "Zurück in die Zukunft2!!"
90 b = b + 1                                    
100 if ZR% <> 2 or b < 4 goto 80

