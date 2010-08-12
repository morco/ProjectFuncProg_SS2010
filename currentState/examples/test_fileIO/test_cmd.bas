10 OPEN 1,1,1,"examples/test_fileIO/test_files/test_cmd.txt,S,W"
20 CMD 1
30 FOR I=1 TO 500
40 PRINT "In Datei: ";I
50 NEXT I
60 PRINT#1
70 CLOSE 1
80 print "Sollt wieder auf std out gehen!"
