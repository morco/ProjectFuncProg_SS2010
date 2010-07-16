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
    next                          { TokenWrap _type pos TkNext             }
    step                          { TokenWrap _type pos TkStep             }
    gosub                         { TokenWrap _type pos TkGoSub            }
    return                        { TokenWrap _type pos TkReturn           }
    end                           { TokenWrap _type pos TkEnd              }

  -- Numerical functions
    rand                          { TokenWrap _type pos TkRandom           }
    len                           { TokenWrap _type pos TkLen              }
    intfunc                       { TokenWrap _type pos TkIntFunc          }

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


StringExpr          : BasicString                  { StringOp $1            }
                    | BasicString "+" BasicString  { StringExpr ($1,$3) "+" } 


BasicString         : stringLiteral                { let str = getTkStrVal $1
                                                     in StringLiteral str   }
--                  | StringOperation              { String_Operation $1    }
                    | stringVar                  { let {
                                                       str = getTkStrVal $1;
                                                       str' = StringVar str
                                                 } in StringVar_BString str'}


NumFunction         : len "(" stringLiteral ")"    { Len $ getTkStrVal $3   }
                    | len "(" stringVar ")"    { let str = getTkStrVal $3
                                                 in LenVar (StringVar $ str)}
                    | rand "(" int ")"            { Random $ getTkIntVal $3 } 
                                                         -- TODO: Argument
                    | intfunc "(" NumExpr ")"      { IntFunc $3             } 


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



ControlStruct       : if BoolExpr then IfBody      { If $2 $4               }
                    | if BoolExpr IfBody           { If $2 $3               }
 | for NumVar "=" Operand to Operand step Operand SyntaxTree 
                                                  {For $2 ($4,$8,$6) $9} 
                                                        -- step auch var??
 | for NumVar "=" Operand to Operand SyntaxTree  
                                             {For $2 ($4,(IntConst 1),$6) $7} 
                    | gosub int                    { GoSub $ getTkIntVal $2 }
                    | goto int                     { Goto $ getTkIntVal $2  }
                    | end                          { End                    }
                    | return                       { Return                 }



IfBody              : int                 { let nr  = getTkIntVal $1
                                            in [ControlStructure $ Goto nr] }
                    | Commands   {$1} --  <--- verursacht shift/red conflicts


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

