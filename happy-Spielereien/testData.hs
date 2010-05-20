-- Boese!
{-data Test 
      = Testa Int
      | Testa String
    deriving (Show)
-}

--data (Eq => k) Map k v
data Map k v
       = Empty 
       | Map [(k,v)] 
     deriving Show


insert key val Empty = Map ([(key,val)])
insert key val (Map xs) = Map (xs++[(key,val)])

m1 = Map [("a$","da string")]
