10 INPUT "WIEVIELE ZAHLEN :";X
20 FOR A=1 TO X
30 PRINT "WERT #";A;:INPUT B(A)
40 NEXT
50 SU=0
60 FOR A=1 TO X
70 SU=SU+B(A)
80 NEXT
90 PRINT : PRINT "MITTELWERT = "; SU/X

