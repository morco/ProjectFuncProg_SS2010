  5 REM Read file contents
 10 open 1,"examples/test_append.txt,s,r"
 30 gosub 310
 50 close 1
 55 print "File was read!"
 60 REM AppendFileContent
 65 open 1,"examples/test_append.txt,s,a"
 70 b$(0) = "Diese Zeile soll angehangen werden"
 80 b$(1) = "Und hier gleich noch eine"
 90 b$(2) = "Und weils so schoen ist, gleich die dritte!"
100 d$    = ""
110 for i = 0 to 2 
120   print# 1,b$(i)
130   d$ = d$ + b$(i) + "\n"
140 next
150 close 1
155 print "File was appended!"
160 REM Read file again and compare
162 a = len(s$)
164 s$ = left$(s$,a-1) : REM Ignore the last "\n" == EOF
170 d$ = s$ + d$ + "\n" : REM Set the last "\n" == EOF at back
180 open 1,"examples/test_append.txt,s,r"
190 gosub 310
200 close 1
205 print "File was read again!"
210 if d$ = s$ then print "Append successful!" : end
220 print "Something went wrong!"
230 print "Computed contents:" : print d$
240 print "Read again contents:" : print s$
250 print "End prog": end




300 REM Subroutine readFile
310 s$ = ""
320 if ST and 32 then return
330 get# 1 c$
340 s$ = s$ + c$
350 goto 320

