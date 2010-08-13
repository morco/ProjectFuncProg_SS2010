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


%left or
%left and
%left "<" ">" "<>" "=" "<=" ">="
%left "+" "-"
%left "*" "/"
%left NEG not

%token

-- Reserved words

  -- IO commands 
    input                         { TokenWrap _type pos TkInput            }
    "input#"                      { TokenWrap _type pos TkInputF           }
    print                         { TokenWrap _type pos TkPrint            }
    "print#"                      { TokenWrap _type pos TkPrintF           }
    get                           { TokenWrap _type pos TkGet              }
    "get#"                        { TokenWrap _type pos TkGetF             }
    open                          { TokenWrap _type pos TkOpen             }
    close                         { TokenWrap _type pos TkClose            }
    cmd                           { TokenWrap _type pos TkCmd              }

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
    not                           { TokenWrap _type pos TkLogNeg           }

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
    dim                           { TokenWrap _type pos TkDim              }

-- Constants
    stringLiteral                 { TokenWrap _type pos (TkString val)     }
    float               { TokenWrap _type pos (TkConst (TkFloatConst val)) }
    int                 { TokenWrap _type pos (TkConst (TkIntConst val))   }
    ti_reg              { TokenWrap _type pos TkTI_Reg                   }
    st_reg              { TokenWrap _type pos TkST_Reg                   }
    timestr_reg              { TokenWrap _type pos TkTimeStr_Reg                   }


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

                    | lineNr return     { let nr = getTkIntVal $1
                                          in (nr, [ControlStructure Return])}



Line                : lineNr Commands        {% do 
                                                st <- get
                                                nr <- buildLineNumber $! $1
                                                put $ st { cur_basline = nr }
                                                return (nr,$2)              }


Commands            : Command                      { [$1]                   }
                    | Command ":" Commands         { $1:$3                  }
               -- next stands here specially because it have to return a list
               --  of commands, because something like this "next i,j,k" is
               --   parsed as: "next i : next j : next k" for simple 
               --    interpreting
                    | Next                         { $1                     }
                    | Next ":" Commands            { $1 ++ $3               }



Next                : next NextBody                { reverse $2             }
                    | next          {% do
                                       st <- get
                                       let nx = [Next $ head $ last_for st]
                                       let rst = tail $ last_for st
                                       put $ st { last_for = rst }
                                       return nx                            }



NextBody            : NumVar                 {% do 
                                               st <- get
                                               -- TODO: CHeck if head differs from given var => failure!
                                               let myfor = head $ last_for st
                                               put $ st { last_for = tail $ last_for st }
                                               return [Next myfor] }
                    | NumVar "," NextBody    { %do
                                               st <- get
                                               -- TODO: CHeck if head differs from given var => failure!
                                               let myfor = head $ last_for st
                                               put $ st { last_for = tail $ last_for st }
                                               -- rst <- $3
                                               return $ (Next myfor) : $3 } 



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
                    | dim DimBody                  { Dim $2                 }
 | def fnxx "(" floatVar_or_datastring ")" "=" NumExpr 
         { Def (getTkStrVal $2) (FloatVar $ getTkStrVal $4) $7 } 



Data                : DataContent                  { [$1]                   }
                    | DataContent "," Data         { $1:$3                  }


DataContent         : int                  {       DataInt $ getTkIntVal $1 }
                    | float                {     DataFloat $ getTkFltVal $1 } 
                    | "-" int              {   DataInt $ (- getTkIntVal $2) }
                    | "-" float            { DataFloat $ (- getTkFltVal $2) } 
                    | stringLiteral        { DataString $ getTkStrVal $1    }
              | floatVar_or_datastring     { DataString $ getTkStrVal $1    }


DimBody             : DimVar "(" DimIndex ")" { [($1,$3)] }
                    | DimVar "(" DimIndex ")" "," DimBody { ($1,$3) : $6 }

DimIndex            : Operand                { [$1] }
                    | Operand "," DimIndex   { $1 : $3 }
                   


DimVar              : stringVar              { StringVar_Var $ StringVar $ getTkStrVal $1 }
                    | intVar                 { NumVar_Var $ NumVar_Int $ IntVar $ getTkStrVal $1 }
                    | floatVar_or_datastring { NumVar_Var $ NumVar_Float $ FloatVar $ getTkStrVal $1 }



Assignment          : NumVar "=" NumExpr           { ArithAssignment $1 $3  }
                    | StringVar "=" StringExpr { StringAssignment $1 $3 }


StringExpr          : BasicString                  { $1                     }
                    | StringExpr "+" StringExpr    { StringExpr ($1,$3) "+" } 


StringFunction      : chrfunc "(" NumExpr ")"      { ChrFunc $3             }
                    | strfunc "(" NumExpr ")"      { StrFunc $3             }
    | leftfunc "(" StringExpr "," NumExpr ")"      { LeftFunc  $3 $5        }
 | midfunc "(" StringExpr "," NumExpr "," NumExpr ")"  { MidFunc $3 $5 $7   }
    | rightfunc "(" StringExpr "," NumExpr ")"     { RightFunc $3 $5        }


BasicString         : stringLiteral     { let str = getTkStrVal $1
                                          in StringOp $ StringLiteral str   }
                    | StringVar         { StringOp $ StringVar_BString $1   }
                    | StringFunction               { StringFunc $1          }


-- Numerical Expressions

NumExpr             : BinaryNumExpr                { $1                     }
                    | "(" NumExpr ")"              { $2                     }
                    | "-" NumExpr %prec NEG        { NumMinus $2            }
                    | not NumExpr                  { NumNot $2              }
                    |  NumFunction                 { NumFunc $1             }
                    | Operand                      { NumOp $1               }


-- For precedence and associativity to work right, it seems that all this 
--  rules have to be on the same level, so further 
--   likeable(at least for me ;D) hierarchical structuring, something like
--    this: "NumExpr Operator NumExpr", seems not possible
BinaryNumExpr       : NumExpr "+" NumExpr          { NumExpr ($1,$3) "+"    }
                    | NumExpr "-" NumExpr          { NumExpr ($1,$3) "-"    }
                    | NumExpr "*" NumExpr          { NumExpr ($1,$3) "*"    }
                    | NumExpr "/" NumExpr          { NumExpr ($1,$3) "/"    }  
 -- binary operators
                    | NumExpr and NumExpr          { NumExpr ($1,$3) "&&"   }
                    | NumExpr or  NumExpr          { NumExpr ($1,$3) "||"   }
 -- string compare
       | StringExpr "="  StringExpr     { NumComp $ StrCompare ($1,$3) "==" }
       | StringExpr "<"  StringExpr     { NumComp $ StrCompare ($1,$3) "<"  }
       | StringExpr ">"  StringExpr     { NumComp $ StrCompare ($1,$3) ">"  }
       | StringExpr "<>" StringExpr     { NumComp $ StrCompare ($1,$3) "/=" }
       | StringExpr "<=" StringExpr     { NumComp $ StrCompare ($1,$3) "<=" }
       | StringExpr ">=" StringExpr     { NumComp $ StrCompare ($1,$3) ">=" }
 -- num compare
              | NumExpr "="  NumExpr    { NumComp $ NumCompare ($1,$3) "==" }
              | NumExpr "<"  NumExpr    { NumComp $ NumCompare ($1,$3) "<"  }
              | NumExpr ">"  NumExpr    { NumComp $ NumCompare ($1,$3) ">"  }
              | NumExpr "<>" NumExpr    { NumComp $ NumCompare ($1,$3) "/=" }
              | NumExpr "<=" NumExpr    { NumComp $ NumCompare ($1,$3) "<=" }
              | NumExpr ">=" NumExpr    { NumComp $ NumCompare ($1,$3) ">=" }


NumFunction         : len "(" StringExpr ")"       { Len $3                 }
                    | rand "(" NumExpr ")"         { Random $3              } 
                    | valfunc "(" StringExpr ")"   { ValFunc $3             } 
                    | ascfunc "(" StringExpr ")"   { AscFunc $3             } 
                    | intfunc "(" NumExpr ")"      { IntFunc $3             } 
                    | absfunc "(" NumExpr ")"      { AbsFunc $3             } 
                    | atnfunc "(" NumExpr ")"      { AtnFunc $3             } 
                    | cosfunc "(" NumExpr ")"      { CosFunc $3             } 
                    | expfunc "(" NumExpr ")"      { ExpFunc $3             } 
                    | logfunc "(" NumExpr ")"      { LogFunc $3             } 
                    | sgnfunc "(" NumExpr ")"      { SgnFunc $3             } 
                    | sinfunc "(" NumExpr ")"      { SinFunc $3             } 
                    | sqrfunc "(" NumExpr ")"      { SqrFunc $3             } 
                    | tanfunc "(" NumExpr ")"      { TanFunc $3             } 
                    | fnxx "(" NumExpr ")"      { Fnxx (getTkStrVal $1)  $3 } 


Operand             : NumVar                       { OpVar $1               }
                    | Constant                     { $1                     }




ControlStruct                   : if IfExpr IfBody           { If $2 $3               }
 
 | for FloatVar "=" Operand to Operand step Operand 
                                             {% do
                                    st <- get
                                    -- let myvar =  (FloatVar $ getTkStrVal $2)
                                    let com = For $2 ($4,$8,$6)
                                    put $ st { last_for = com : (last_for st) }
                                    return com } 

 | for FloatVar "=" Operand to Operand 
                                             {% do
                                    st <- get
                                    -- let myvar =  (FloatVar $ getTkStrVal $2)
                                    let com = For $2 ($4,(IntConst 1),$6)
                                 --   put $ st { last_for = trace ("myfors: " ++ show (com : (last_for st))) $ com : (last_for st) }
                                    put $ st { last_for = com : (last_for st) }
                                    return com }
 

                    | gosub int                    { GoSub $ getTkIntVal $2 }
                    | goto int                     { Goto $ getTkIntVal $2  }
                    | end                          { End                    }
                    | return                       { Return                 }
                    | on NumExpr goto OnBody       { On_Goto  $2 $4         }
                    | on NumExpr gosub OnBody      { On_Gosub $2 $4         }


OnBody              : int                          { [getTkIntVal $1]       }
                    | int "," OnBody               { (getTkIntVal $1):$3    }


IfExpr              : NumExpr                      { Expr_Num $1 }
                    | StringExpr                   { Expr_Str $1 }


IfBody              : then int            { let nr  = getTkIntVal $2
                                            in [ControlStructure $ Goto nr] }
                    | then Commands   {$2} --  <--- verursacht shift/red conflicts
                    | goto int            { let nr  = getTkIntVal $2
                                            in [ControlStructure $ Goto nr] }




IOCommand           : print Output                 { Print $2               }
                    | print                        { Print ([], True)       }
                    | input Input                  { Input $2               }
                    | "input#" int "," Vars    { InputF (getTkIntVal $2) $4 }
                    | get Vars                     { Get $2                 }
                    | "get#" int "," Vars            { GetF (getTkIntVal $2) $4 }
                    | open OpenBody  { let (fid,dev_id,sec_id,path_mode) = $2 
                                       in Open fid dev_id sec_id path_mode  }
                    | close int                    { Close $ getTkIntVal $2 }
                    | "print#" int "," Output  { PrintF (getTkIntVal $2) $4 }
                    | "print#" int      { PrintF (getTkIntVal $2) ([],True) }
                    | cmd CmdBody      { $2 }

CmdBody   : int                       { Cmd (getTkIntVal $1) Nothing }
          | int stringLiteral         { Cmd (getTkIntVal $1) $ Just $ getTkStrVal $2 }

OpenBody            : int                { (getTkIntVal $1,Nothing,Nothing,Nothing) }
                    | int "," int  { (getTkIntVal $1,Just $ getTkIntVal $3,Nothing,Nothing) }
                    | int "," int "," int { (getTkIntVal $1,Just $ getTkIntVal $3,Just $ getTkIntVal $5,Nothing) }
                    | int "," stringLiteral { (getTkIntVal $1,Nothing,Nothing,Just $ getTkStrVal $3) }
         | int "," int "," stringLiteral { (getTkIntVal $1,Just $ getTkIntVal $3,Nothing,Just $ getTkStrVal $5) }
| int "," int "," int "," stringLiteral { (getTkIntVal $1,Just $ getTkIntVal $3,Just $ getTkIntVal $5,Just $ getTkStrVal $7) }


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



NumVar              : IntVar                       { NumVar_Int   $1        }
                    | FloatVar                     { NumVar_Float $1        }



StringVar           : stringVar                 { StringVar $ getTkStrVal $1 }   
                    | stringVar "(" ArrayIndex ")"  { StringVar_Array (getTkStrVal $1) $3 }
                    | timestr_reg               { TimeStr_Reg          }

IntVar              : intVar                       { IntVar $ getTkStrVal $1 }
                    | intVar "(" ArrayIndex ")"  { IntVar_Array (getTkStrVal $1) $3 }


FloatVar            : floatVar_or_datastring     { FloatVar $ getTkStrVal $1 }
                    | floatVar_or_datastring "(" ArrayIndex ")" { FloatVar_Array (getTkStrVal $1) $3 }


ArrayIndex          : NumExpr                    { [$1] }
                    | NumExpr "," ArrayIndex     { $1 : $3 }


Constant            : int                        { let int = getTkIntVal $1
                                                   in IntConst int          }
                    | float                      { let flt = getTkFltVal $1
                                                   in FloatConst flt        }
                    | ti_reg                     { TI_Reg                   }
                    | st_reg                     { ST_Reg                   }


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
                          data_temp = [],
                          last_for = [],
                          cur_basline = -1
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

