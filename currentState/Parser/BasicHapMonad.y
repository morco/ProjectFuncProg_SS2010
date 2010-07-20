{
module Parser.BasicHapMonad(getParseTree) where

import Parser.Lexer.BasicAlexMonad(getTokens)
import Parser.ParserTypes
import Parser.ParserErrors

import Data.List(delete)
import Control.Monad.State

import Debug.Trace


}

%name basicParse
%tokentype { TokenWrap }
%error { parseError }

%monad { State ParserState }


%token

-- Reserved words

  -- IO commands 
    input                         { TokenWrap _type pos TkInput            }
    print                         { TokenWrap _type pos TkPrint            }
    get                           { TokenWrap _type pos TkGet              }

  -- Control structures
    if                            { TokenWrap _type pos TkIf               }
    then                          { TokenWrap _type pos TkThen             }
    goto                          { TokenWrap _type pos TkGoto             }
    for                           { TokenWrap _type pos TkFor              }
    to                            { TokenWrap _type pos TkTo               }
    on                            { TokenWrap _type pos TkOn               }
    next                          { TokenWrap _type pos TkNext             }
    step                          { TokenWrap _type pos TkStep             }
    gosub                         { TokenWrap _type pos TkGoSub            }
    return                        { TokenWrap _type pos TkReturn           }
    end                           { TokenWrap _type pos TkEnd              }

  -- Numerical functions
    rand                          { TokenWrap _type pos TkRandom           }
    len                           { TokenWrap _type pos TkLen              }
    intfunc                       { TokenWrap _type pos TkIntFunc          }
    absfunc                       { TokenWrap _type pos TkAbsFunc          }
    ascfunc                       { TokenWrap _type pos TkAscFunc          }
    atnfunc                       { TokenWrap _type pos TkAtnFunc          }
    cosfunc                       { TokenWrap _type pos TkCosFunc          }
    expfunc                       { TokenWrap _type pos TkExpFunc          }
    logfunc                       { TokenWrap _type pos TkLogFunc          }
    valfunc                       { TokenWrap _type pos TkValFunc          }
    sgnfunc                       { TokenWrap _type pos TkSgnFunc          }
    sinfunc                       { TokenWrap _type pos TkSinFunc          }
    sqrfunc                       { TokenWrap _type pos TkSqrFunc          }
    tanfunc                       { TokenWrap _type pos TkTanFunc          }
    def                           { TokenWrap _type pos TkDef              }
    fnxx                          { TokenWrap _type pos (TkFnxx str)       }

  -- String functions
    chrfunc                       { TokenWrap _type pos TkChrFunc          }
    strfunc                       { TokenWrap _type pos TkStrFunc          }
    leftfunc                      { TokenWrap _type pos TkLeftFunc         }
    midfunc                       { TokenWrap _type pos TkMidFunc          }
    rightfunc                     { TokenWrap _type pos TkRightFunc        }

  -- Data commands
    read                          { TokenWrap _type pos TkRead             }
    data                          { TokenWrap _type pos TkData             }
    restore                       { TokenWrap _type pos TkRestore          }

  -- Others
    comment                       { TokenWrap _type pos TkComment          }


-- Numerical operators
    "+"                           { TokenWrap _type pos TkPlus             }
    "-"                           { TokenWrap _type pos TkMinus            }
    "*"                           { TokenWrap _type pos TkTimes            }
    "/"                           { TokenWrap _type pos TkDiv              }
 

-- Boolean operators
    or                            { TokenWrap _type pos TkLogOr            }
    and                           { TokenWrap _type pos TkLogAnd           } 
    neg                           { TokenWrap _type pos TkLogNeg           }

  -- Compare operators
    "="                           { TokenWrap _type pos TkEqual            }
    "<>"                          { TokenWrap _type pos TkUnEqual          }
    "<"                           { TokenWrap _type pos TkLt               }
    ">"                           { TokenWrap _type pos TkGt               }
    "<="                          { TokenWrap _type pos TkLE               }
    ">="                          { TokenWrap _type pos TkGE               }


-- Variables
    stringVar                     { TokenWrap _type pos (TkStringVar val)  }
    intVar                        { TokenWrap _type pos (TkIntVar val)     }
    floatVar_or_datastring { TokenWrap _t p (TkFloatVar_Or_DataString val) }

-- Constants
    stringLiteral                 { TokenWrap _type pos (TkString val)     }
    float               { TokenWrap _type pos (TkConst (TkFloatConst val)) }
    int                 { TokenWrap _type pos (TkConst (TkIntConst val))   }


-- Special symbols
    lineNr                        { TokenWrap _type pos (TkLineNumber val) }

    ";"                           { TokenWrap _type pos TkStringConcat     }
    ":"                { TokenWrap _type pos TkSingleLineCommandCombinator }
    ","         { TokenWrap _type pos TkKomma } -- <--- TODO!!! use bei print

    "("                           { TokenWrap _type pos TkBracketOpen      }
    ")"                           { TokenWrap _type pos TkBracketClose     }
      

    
%%



SyntaxTree          : Line                         { [$1]                   }
                    | Line SyntaxTree              { $1:$2                  }
                    | lineNr next NumVar           { let nr = getTkIntVal $1
                                                     in [(nr, [NOOP])]      }   
                                              -- muss aktuell so hier extra 
                                              --  stehen, sonst parst er das 
                                              --   ganze Programm als Inhalt 
                                              --    des 1. for

                    | lineNr next                  { let nr = getTkIntVal $1
                                                     in [(nr, [NOOP])]      }   
                    | lineNr return     { let nr = getTkIntVal $1
                                          in (nr, [ControlStructure Return])}


Line                : lineNr Commands        {% do 
                                                nr <- buildLineNumber $! $1
                                                return (nr,$2)              }

 
Commands            : Command                      { [$1]                   }
                    | Command ":" Commands         { $1:$3                  }


ForCommands         : Command ":" ForCommands      { $1:$3                  }
                    | Command ":" Next             { $1:$3                  }

Command             : IOCommand                    { IO_Com $1              }
                    | ControlStruct                { ControlStructure $1    }
                    | Assignment                   { $1                     }
                    | read Vars                    { Read $2                }
                    | data Data         {% do
                                           st <- get
                                           let old_con = data_temp st
                                           let newst = st { 
                                                 data_temp = old_con ++ $2
                                               }
                                           put newst
                                           return NOOP                      }
                    | restore                      { Restore                }
                    | comment                      { NOOP                   }
 | def fnxx "(" floatVar_or_datastring ")" "=" NumExpr 
         { Def (getTkStrVal $2) (NumVar_Var $ FloatVar $ getTkStrVal $4) $7 } 



Data                : DataContent                  { [$1]                   }
                    | DataContent "," Data         { $1:$3                  }


DataContent         : int                  {       DataInt $ getTkIntVal $1 }
                    | float                {     DataFloat $ getTkFltVal $1 } 
                    | "-" int              {   DataInt $ (- getTkIntVal $2) }
                    | "-" float            { DataFloat $ (- getTkFltVal $2) } 
                    | stringLiteral        { DataString $ getTkStrVal $1    }
              | floatVar_or_datastring     { DataString $ getTkStrVal $1    }


Assignment          : NumVar "=" NumExpr           { ArithAssignment $1 $3  }
                    | stringVar "=" StringExpr { let {
                                                      str = getTkStrVal $1;
                                                      str' = StringVar str
                                               } in StringAssignment str' $3}


StringExpr          : BasicString                  { $1                     }
                    | BasicString "+" BasicString  { StringExpr ($1,$3) "+" } 


StringFunction      : chrfunc "(" NumExpr ")"      { ChrFunc $3             }
                    | strfunc "(" NumExpr ")"      { StrFunc $3             }
    | leftfunc "(" StringExpr "," NumExpr ")"      { LeftFunc  $3 $5        }
 | midfunc "(" StringExpr "," NumExpr "," NumExpr ")"  { MidFunc $3 $5 $7   }
    | rightfunc "(" StringExpr "," NumExpr ")"     { RightFunc $3 $5        }


BasicString         : stringLiteral     { let str = getTkStrVal $1
                                          in StringOp $ StringLiteral str   }
--                  | StringOperation   { StringOp $ String_Operation $1    }
                    | stringVar       { let {
                                              str = getTkStrVal $1;
                                              str' = StringVar str
                                      } in StringOp $ StringVar_BString str'}
                    | StringFunction               { StringFunc $1          }


NumFunction         : len "(" stringLiteral ")"    { Len $ getTkStrVal $3   }
                    | len "(" stringVar ")"    { let str = getTkStrVal $3
                                                 in LenVar (StringVar $ str)}
                    | rand "(" int ")"            { Random $ getTkIntVal $3 } 
                                                         -- TODO: Argument
                    | intfunc "(" NumExpr ")"      { IntFunc $3             } 
                    | absfunc "(" NumExpr ")"      { AbsFunc $3             } 
                    | ascfunc "(" StringExpr ")"   { AscFunc $3             } 
                    | atnfunc "(" NumExpr ")"      { AtnFunc $3             } 
                    | cosfunc "(" NumExpr ")"      { CosFunc $3             } 
                    | expfunc "(" NumExpr ")"      { ExpFunc $3             } 
                    | logfunc "(" NumExpr ")"      { LogFunc $3             } 
                    | valfunc "(" StringExpr ")"   { ValFunc $3             } 
                    | sgnfunc "(" NumExpr ")"      { SgnFunc $3             } 
                    | sinfunc "(" NumExpr ")"      { SinFunc $3             } 
                    | sqrfunc "(" NumExpr ")"      { SqrFunc $3             } 
                    | tanfunc "(" NumExpr ")"      { TanFunc $3             } 
                    | fnxx "(" NumExpr ")"      { Fnxx (getTkStrVal $1)  $3 } 


NumExpr             : NumExpr NumOperationsLev2 Term   { NumExpr ($1,$3) $2 }
                    | Term                             { $1                 }
                    | NumFunction                      { NumFunc $1         }
                    | "-" NumExpr                      { NumMinus $2        }


NumOperationsLev2   : "+"                          { "+"                    }          
                    | "-"                          { "-"                    }


NumOperationsLev1   : "*"                          { "*"                    }
                    | "/"                          { "/"                    }


Term                : Term NumOperationsLev1 Factor   { NumExpr ($1,$3) $2  }
                    | Factor                          { $1                  }


Factor              : Operand                         { NumOp $1            }
                    | "(" NumExpr ")"                 { $2                  }
                    |  NumFunction                    { NumFunc $1          }


Operand             : NumVar                       { OpVar $1               }
                    | Constant                     { $1                     }



ControlStruct    --   : if BoolExpr then IfBody      { If $2 $4               }
                    : if BoolExpr IfBody           { If $2 $3               }
 -- | for NumVar "=" Operand to Operand step Operand SyntaxTree 
    --                                              {For $2 ($4,$8,$6) $9} 
      --                                                  -- step auch var??
-- | for NumVar "=" Operand to Operand SyntaxTree  
  --                                           {For $2 ($4,(IntConst 1),$6) $7} 
 | for floatVar_or_datastring "=" Operand to Operand step Operand ForBody 
                                             { let (a,b) = $9
                                              in For (FloatVar $ getTkStrVal $2) ($4,$8,$6) a b} 
                                                        -- step auch var??
 | for floatVar_or_datastring "=" Operand to Operand ForBody
                                       { let (a,b) = $7
                                         in For (FloatVar $ getTkStrVal $2) ($4,(IntConst 1),$6) a b} 
                    | gosub int                    { GoSub $ getTkIntVal $2 }
                    | goto int                     { Goto $ getTkIntVal $2  }
                    | end                          { End                    }
                    | return                       { Return                 }
                    | on NumExpr goto OnBody       { On_Goto  $2 $4         }
                    | on NumExpr gosub OnBody      { On_Gosub $2 $4         }


OnBody              : int                          { [getTkIntVal $1]       }
                    | int "," OnBody               { (getTkIntVal $1):$3    }

--ForBody             : SyntaxTree                {ForLines $1}
--                    | ":" Commands next         {ForSingleLine $2}
  --                  | ":" next                  {ForSingleline [NOOP]}
        --            | ":" Commands -- next bei commands 

--ForBody       : SyntaxTree lineNr Next              {([NOOP],$1++[(getTkIntVal $2,$3)])} 
  --            | ":" Commands SyntaxTree lineNr Next {($2,$3++[(getTkIntVal $4,$5)])}
ForBody       : SyntaxTree               {([NOOP],$1)} 
              | ":" Commands SyntaxTree  {($2,$3)}
              | ":" Next                            {([NOOP],[(-1,$2)])}
              | ":" ForCommands                    {($2,[(-1,[NOOP])])}
        --      : SyntaxTree {([NOOP],[(-1,[NOOP])])}

Next          : next                                {[NOOP]}
              | next NumVar           {[NOOP]}   -- plural!               


IfBody              : then int            { let nr  = getTkIntVal $2
                                            in [ControlStructure $ Goto nr] }
                    | then Commands   {$2} --  <--- verursacht shift/red conflicts
                    | goto int            { let nr  = getTkIntVal $2
                                            in [ControlStructure $ Goto nr] }


BoolExpr   : SimpleBoolExpr                           { $1                  }
 | "(" BoolExpr ")" LogicOperation "(" BoolExpr ")"  {BoolExprLog ($2,$6) $4}


LogicOperation      : or                {"||"} -- Kurzschlussauswertung ???
                    | and                          { "&&"                   }
                    | neg                          { "neg"                  }


SimpleBoolExpr   : StringExpr CompareOperator StringExpr   
                                                  {BoolExprString ($1,$3) $2}
          | NumExpr CompareOperator NumExpr        { BoolExprNum ($1,$3) $2 }
 

CompareOperator     : "="                          { "=="                   }
                    | "<"                          { "<"                    }
                    | ">"                          { ">"                    }
                    | "<>"                         { "/="                   }
                    | "<="                         { "<="                   }
                    | ">="                         { ">="                   }


Constant            : int                        { let int = getTkIntVal $1
                                                   in IntConst int          }
                    | float                      { let flt = getTkFltVal $1
                                                   in FloatConst flt        }

IOCommand           : print Output                 { Print $2               }
                    | print                        { Print ([], True)       }
                    | input Input                  { Input $2               }
                    | get Var                      { Get $2                 }


Output              : OutputAtom                   { ([$1], True)           }
                    | OutputAtom ";"               { ([$1], False)          }
                    | OutputAtom ";" Output        { ($1:(fst $3), snd $3)  }


OutputAtom          : StringExpr                   { OutStringExpr $1       }
                    | NumExpr                      { OutNumExpr $1          }


Input     : stringLiteral";" Vars   {(InputStuff [getTkStrVal $1] $3, False)}
          | stringLiteral Vars      {(InputStuff [getTkStrVal $1] $2, True) }
                    | Vars                      { (InputStuff [] $1, False) }


Vars                : Var                          { [$1]                   }
                    | Var "," Vars                 { $1:$3                  }


Var                 : stringVar  {StringVar_Var (StringVar $ getTkStrVal $1)} 
                    | NumVar                       { NumVar_Var $1          }


NumVar              : intVar                    {   IntVar $ getTkStrVal $1 }
                    | floatVar_or_datastring    { FloatVar $ getTkStrVal $1 }

StringVar       : stringVar
                | stringVar "(" ArrayIndex ")"

IntVar          : intVar
                | intVar "(" ArrayIndex ")"

FloatVar        : floatVar_or_datastring
                | floatVar_or_datastring "(" ArrayIndex ")"

ArrayIndex      : NumExpr
                : NumExpr "," ArrayIndex 

{




evalListStrict f [] nlList = nlList
evalListStrict f (x:xs) nlList = ((:) $! (f $! x)) $! (evalListStrict f xs (x : nlList))




getParseTree :: String -> ParseTree 
getParseTree str = 
    let tokens = getTokens str
        initstate =  ParserState { 
                          tokenList = tokens, 
                          lineNumbers = [], 
                          expectedLineNumbers = [],
                          data_temp = []
                     } 
        (a,s) = runState (basicParse $ tokens) initstate 

     {-   (a,s) = (runState $! ((\ tk -> do
                              psTree <- basicParse tk
                              checkAllExpectedLineNumbersGot
                              return psTree
                          )tokens)) initState -}
    -- in trace ("the end state: " ++ (intercalate "," s)) a
    -- in map (id $!) a
    -- in reverse $! (evalListStrict id a [] )
    in ParseTree { program = a, pdata = data_temp s}



}

ArrayIndex      : NumExpr
                : NumExpr "," ArrayIndex 

{




evalListStrict f [] nlList = nlList
evalListStrict f (x:xs) nlList = ((:) $! (f $! x)) $! (evalListStrict f xs (x : nlList))




getParseTree :: String -> ParseTree 
getParseTree str = 
    let tokens = getTokens str
        initstate =  ParserState { 
                          tokenList = tokens, 
                          lineNumbers = [], 
                          expectedLineNumbers = [],
                          data_temp = []
                     } 
        (a,s) = runState (basicParse $ tokens) initstate 

     {-   (a,s) = (runState $! ((\ tk -> do
                              psTree <- basicParse tk
                              checkAllExpectedLineNumbersGot
                              return psTree
                          )tokens)) initState -}
    -- in trace ("the end state: " ++ (intercalate "," s)) a
    -- in map (id $!) a
    -- in reverse $! (evalListStrict id a [] )
    in ParseTree { program = a, pdata = data_temp s}



}

ArrayIndex      : NumExpr
                : NumExpr "," ArrayIndex 

{




evalListStrict f [] nlList = nlList
evalListStrict f (x:xs) nlList = ((:) $! (f $! x)) $! (evalListStrict f xs (x : nlList))




getParseTree :: String -> ParseTree 
getParseTree str = 
    let tokens = getTokens str
        initstate =  ParserState { 
                          tokenList = tokens, 
                          lineNumbers = [], 
                          expectedLineNumbers = [],
                          data_temp = []
                     } 
        (a,s) = runState (basicParse $ tokens) initstate 

     {-   (a,s) = (runState $! ((\ tk -> do
                              psTree <- basicParse tk
                              checkAllExpectedLineNumbersGot
                              return psTree
                          )tokens)) initState -}
    -- in trace ("the end state: " ++ (intercalate "," s)) a
    -- in map (id $!) a
    -- in reverse $! (evalListStrict id a [] )
    in ParseTree { program = a, pdata = data_temp s}



}

