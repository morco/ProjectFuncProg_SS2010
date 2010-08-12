 10 REM Test Standard IO with device Numbers
 20 open 1,0 : REM Dev 0 == Keyboard == stdin
 30 open 2,3 : REM Dev 3 == Monitor == stdout
 40 print# 2,"Dies sollte ueber stdout gehen!"
 50 print# 2,"Teste get#:"
 60 get# 1,a$
 65 print# 2
 70 print# 2,"Dies wuerde ueber stdin gegettet ;D = ";a$
 80 print# 2,"Teste input#:"
 90 input# 1,a$
100 print# 2,"Dies wuerde über stdout geinputtet = " ;a$
110 print# 2,"End test"
