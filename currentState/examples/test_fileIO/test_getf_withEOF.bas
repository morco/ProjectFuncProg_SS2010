10 open 1,"examples/test_fileIO/test_files/test_getf.txt,s,r"
12 if ST and 32 then 25 : REM Should check if ST register bit 6 is set to 1 (== EOF)
13 print "ST is = ";ST
15 get# 1,a$
20 print "Gelesen: "; a$
23 goto 12
25 close 1
