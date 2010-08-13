{

module Parser.Lexer.BasicParseStringToVal(getNumberParseablePart) where 

import Data.Char( isSpace )

}


%wrapper "monad"

$digit = 0-9			-- digits

@unsignedfloat = $digit* \.? $digit+ ([Ee] \-? $digit+)?


tokens :-

  $white+ ;
   
  @unsignedfloat  {\(_,_,inp) len -> return $ read $ "0" ++ (take len inp)}
  \- $white* @unsignedfloat                                {\(_,_,inp) len -> do 
                                                                 let str = take len inp
                                                                     sb  = [head str] 
                                                                     nr  = dropWhile isSpace $ tail str
                                                                 return $ read $ (sb ++ "0" ++ nr)}

  ~$digit  {\_ _ -> return 0}


{




-- In this version scanner returns a list of all read tokens
scanner :: String -> Either String Float
scanner str = runAlex str alexMonadScan


alexEOF :: Alex Float
alexEOF = return 0




uneither :: Either String b -> b 
uneither (Right x) = x
uneither (Left x) = error x



getNumberParseablePart :: String -> Float
getNumberParseablePart str = uneither $ scanner str

}

