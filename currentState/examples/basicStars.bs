 10 input "Geben Sie bitte Ihren Namen ein"; a$
 20 print "Guten Tag "; a$
 30 input "Wieviele Sterne möchten Sie?"; s
 35 s$ = "" : REM Auto-Init!
 40 for i = 1 to s                                       
 50 s$ = s$ + "*"
 55 next i
 60 print s$
 70 input "Möchten Sie noch mehr Sterne?"; q$
 80 if len(q$) = 0 goto 70                          
 90 l$ = left$(q$, 1)                                    
100 if (l$ = "J") or (l$ = "j") then goto 30
110 print "Auf Wiedersehen";
120 for i = 1 to 200
130 print a$; " ";
140 next i
150 print

