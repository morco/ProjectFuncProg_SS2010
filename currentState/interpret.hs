import BasicHap


data Map a b 
      = Empty
      | Map [(a,b)]


insert key val Empty = Map [(key,val)]
insert key val (Map xs) = Map (xs ++ [(key,val)])


getValue key Empty = error "Map is empty!"
getValue key (Map []) = error ("key not found " ++ show key)
getValue key (Map ((k,v):xs)) = 
         if key == k
             then v
             else getValue key (Map xs)
                                   


main = do
        synTree <- getParseTree 
        interpret synTree Empty

interpret (Start (Command x)) map = evalCommand x map >> return ()
--interpret (StartRek (Command x) otherCommands) = evalCommand x >>= (interpret otherCommands)
interpret (StartRek (Command x) otherCommands) map = 
            do
              map <- evalCommand x map
              interpret otherCommands map


evalCommand (Input str (Var var)) map = 
                   do
                     putStrLn str
                     inp <- getLine
                     return (insert var inp map)


evalCommand (Print str (Var var)) map = 
                   do
                     let val = getValue var map
                     putStrLn (str ++ val)
                     return map