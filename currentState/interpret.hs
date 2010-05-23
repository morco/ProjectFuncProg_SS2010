import BasicHap
import IO
import System( getArgs )

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
        args <- getArgs
        handle <- openFile (head args) ReadMode
        contents <- hGetContents handle
        interpret (getParseTree contents) Empty
        hClose handle

interpret (Start (Command x)) map = evalCommand x map >> return ()
interpret (StartRek (Command x) otherCommands) map = 
            do
              map <- evalCommand x map
              interpret otherCommands map


evalCommand (Input str (Vars vars)) map = 
                   do
                     putStrLn str
                     listInsert vars getLine map
             where
                listInsert [] _ map = return map
                listInsert (x:xs) ioAct map = 
                          do
                            val <- ioAct
                            listInsert xs ioAct (insert x val map)


evalCommand (Print str (Vars vars)) map = 
                    do 
                      let vals = foldr (\x y -> x ++ " " ++ y) "" (buildHitList vars map)
                      putStrLn (str ++ vals)
                      return map
              where
                 buildHitList [] _ = []
                 buildHitList (x:xs) map = (getValue x map) : buildHitList xs map
