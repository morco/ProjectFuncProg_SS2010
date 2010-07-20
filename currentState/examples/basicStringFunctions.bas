-- Test chr$
  5 print "Test chr$" 
 10 PRINT "Chr from 65 = ";CHR$(65)
 20 A$=CHR$(97)
 25 print "Chr from 97 = ";A$
 30 A=ASC(A$):A$=CHR$(A)
 40 print "The number for A$=Chr$(97) => ";A
 43 REM print "ErrorCase arg < 0 => "; chr$(-1)
 46 REM print "ErrorCase arg > 255 => "; chr$(256)
 50 print

-- Test str$
 60 print "Test str$" 
 70 PRINT "Str from 65 = ";str$(65)
 80 A$=str$(97)
 90 print "Strr from 97 = ";A$
100 print

-- Test left$
110 print "Test left$" 
120 PRINT "left from \"Blabli\" with len 3 = ";left$("Blabli",3)
130 A$=left$("blub",1)
140 print "left from \"blub\" with len 1 = ";A$
150 print "left from \"col\" with len 0 => "; left$("col",0)
160 print "left from \"col\" with len 234 => "; left$("col",234)
170 REM print "ErrorCase len < 0 => "; left$("error",-1)
180 print

-- Test rightt$
182 print "Test right$" 
184 PRINT "right from \"Blabli\" with len 3 = ";right$("Blabli",3)
186 A$=right$("blub",1)
188 print "right from \"blub\" with len 1 = ";A$
190 print "right from \"col\" with len 0 => "; right$("col",0)
192 print "right from \"col\" with len 234 => "; right$("col",234)
194 REM print "ErrorCase len < 0 => "; right$("error",-1)
196 print

-- Test mid$
198 print "Test mid$" 
200 PRINT "mif from \"Blabli\" with len 3 startpos 2 = ";mid$("Blabli",2,3)
210 A$=mid$("blub",3,1)
220 print "mid from \"blub\" with len 1 startpos 3 = ";A$
230 print "mid from \"col\" with len 0 startpos 2 => "; mid$("col",2,0)
240 print "mid from \"col\" with len 234 startpos 1 => "; mid$("col",1,234)
250 print "mid from \"col\" with len 2 startpos 123 => "; mid$("col",123,2)
260 REM print "ErrorCase len < 0 => "; mid$("error",3,-1)
270 REM print "ErrorCase startPos < 0 => "; mid$("error",-1,2)
280 REM print "ErrorCase startPos == 0 => "; mid$("error",0,2)
290 print

