 10 dim a(20)
 20 a(20) = 3
 30 print a(20)
 40 dim b(4),c$(15,15),d%(2,2,2)
 50 b(3) = 2.45 : c$(15,15) = "34" : d%(1,2,2) = 12
 70 print b(3) : print c$(15,15) : print d%(1,2,2)
 80 input "2 dim eingeben: "; x,y
 90 dim f(x,y)
100 f(x - 1, y - 1) = 3
110 print f(x - 1, y - 1)
