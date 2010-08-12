 1 REM This program has one sub routine (line 10 - 40)
 2 REM  This subroutine runs in dependency to the 
 3 REM   var n% through 1 or 2 prints
 4 REM  The main prog simply go to the sub prog one time, 
 5 REM   increments the var and go there again
 8 goto 50 : REM Jumpt to main

10 print "inGoSub"
20 if n% = 0 then return
30 print "inGoSub2"
40 return

50 print "preGoSub 1"
60 n% = 0
70 gosub 10
80 print "postGoSub 1"

100 print "preGoSub 2"
110 n% = 1
120 gosub 10
130 print "postGoSub 2"
