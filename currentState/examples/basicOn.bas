10 for I = 1 to 3
15 print "i = ";I
20 ON I GOSUB 40,50,60
25 next
30 END
40 PRINT "SUBROUTINE 1":RETURN
50 PRINT "SUBROUTINE 2":RETURN
60 PRINT "SUBROUTINE 3":RETURN

