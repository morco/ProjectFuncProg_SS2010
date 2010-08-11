10 open 5,1,"examples/test_write.txt,p,w"
20 print# 5,"Meine erste Zeile in einer fremden Datei!"
30 input "Gib mal was ein hier: " a$
40 print# 5,"Jetzt mit Variable: "; a$
50 print# 5,"Diesmal nl unterdrueckt! ";
60 print# 5,"--> Sollte in der gleichen Zeile stehen!"
70 close 5
