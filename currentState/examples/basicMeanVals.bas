5 T=0 : CT=0
10 READ X
20 IF X=-1 THEN 50 : REM TEST AUF FLAG
25 CT=CT+1
30 T=T+X : REM BERECHNUNG DER SUMME
40 GOTO 10
50 PRINT "ES WURDEN ";CT;" WERTE GELESEN"
60 PRINT "SUMME = ";T
70 PRINT "MITTELWERT = ";T/CT
80 DATA 75, 80,62,91,87,93,78, -1
