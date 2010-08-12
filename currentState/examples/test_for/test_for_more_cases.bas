 5 print "Test 1: Standard for with float step"
10 FOR NB = 1 TO 4 STEP .5
20 PRINT NB;"    ";
30 NEXT NB
40 Print "After"
45 print

47 print "Test 2: for with next in one line"
50 for i = 1 to 5 : Print "i = ";i : next
55 Print "After2"
57 print

58 print "Test 3: for and for commands in one line, but next in further line"
60 for i = 1 to 5 : Print "i2 = ";i 
70 next
80 Print "After3"
85 print

 90 print "Test 4: for and next in one line without commands"
110 for i = 1 to 5 : next
120 Print "After4"
125 print

130 print "Test 5: for not the first command in line"
140 print "bla" : for i = 1 to 5 : print "i = ";i
150 next
160 print

170 print "Test 6a: nested fors with a single next"
180 for i = 1 to 3 
182 for j = 4 to 6
184 for k = 7 to 9
186 print i;",";j;",";k
190 next k,j,i
200 print

210 print "Test 6b: nested fors with 3 nexts but without vars"
220 for i = 1 to 3 
232 for j = 4 to 6
244 for k = 7 to 9
256 print i;",";j;",";k
260 next : next : next
270 print
