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
    print           { TokenWrap _type pos TkPrint }
    input           { TokenWrap _type pos TkInput }
    stringLiteral          { TokenWrap _type pos (TkString val) }
    stringVar             { TokenWrap _type pos (TkStringVar val) }
    intVar             { TokenWrap _type posTk (TkIntVar val) }
    floatVar             { TokenWrap _type pos (TkFloatVar val) }
    lineNr          { TokenWrap _type pos (TkLineNumber val) }
    ";"             { TokenWrap _type pos TkStringConcat }
    ":"             { TokenWrap _type pos TkSingleLineCommandCombinator }
    ","             { TokenWrap _type pos TkKomma } -- <--- TODO!!! use bei print
    if              { TokenWrap _type pos TkIf }
    then            { TokenWrap _type pos TkThen }
    goto            { TokenWrap _type pos TkGoto }
    for             { TokenWrap _type pos TkFor }
    to              { TokenWrap _type pos TkTo }
    next            { TokenWrap _type pos TkNext }
    step            { TokenWrap _type pos TkStep }
--      float           { TokenWrap _type pos TkConst (TkFloatConst $$) }
--      int             { TokenWrap _type pos TkConst (TkIntConst $$) }
    int             { TokenWrap _type pos (TkConst val) }
--      float           { TokenWrap _type pos TkConst $$ }
    "="             { TokenWrap _type pos TkEqual }
    "<>"            { TokenWrap _type pos TkUnEqual }
    "<"             { TokenWrap _type pos TkLt }
    ">"             { TokenWrap _type pos TkGt }
    "<="            { TokenWrap _type pos TkLE }
    ">="            { TokenWrap _type pos TkGE }

    "+"             { TokenWrap _type pos TkPlus }
    "-"             { TokenWrap _type pos TkMinus }
    "*"             { TokenWrap _type pos TkTimes }
    "/"             { TokenWrap _type pos TkDiv }

    len             { TokenWrap _type pos TkLen }
    "("             { TokenWrap _type pos TkBracketOpen }
    ")"             { TokenWrap _type pos TkBracketClose }

    or              { TokenWrap _type pos TkLogOr }
    and             { TokenWrap _type pos TkLogAnd }
    neg             { TokenWrap _type pos TkLogNeg }

    return          { TokenWrap _type pos TkReturn }
    gosub           { TokenWrap _type pos TkGoSub }

    end             { TokenWrap _type pos TkEnd }
      
    rand             { TokenWrap _type pos TkRandom }
    get             { TokenWrap _type pos TkGet }
    intfunc             { TokenWrap _type pos TkIntFunc }
%%


SyntaxTree         : Line                                      {[$1]}
                   | Line SyntaxTree                           {$1:$2}
                   | lineNr next NumVar           {[(getTokenIntValue $1, [NOOP])]} -- muss aktuell so hier extra 
                                                                                 --  stehen, sonst parst er das 
                                                                                 --   ganze Programm als Inhalt 
                                                                                 --    des 1. for
                    | lineNr return                             {(getTokenIntValue $1, [Return])}

-- Line                : lineNr Commands          {% wrapStateMonadic "RegelLine" (getTokenIntValue $1,$2)}
-- Line                : lineNr Commands          {(getTokenIntValue $1,$2)}
Line                : lineNr Commands          {% do 
                                                  nr <- buildLineNumber $! $1
                                                  return (nr,$2)}

 
Commands            : Command                                        {[$1]}
                    | Command ":" Commands                           {$1:$3}

-- Command             : IOCommand             {% wrapStateMonadic "ComRegel_IO" (Command $1)}
--                    | ControlStruct         {% wrapStateMonadic "ComRegel_ControlStruct" (ControlStructure $1)}
 --                   | goto int    {% wrapStateMonadic "ComRegel_GOTO" (Goto ((\(TokenWrap _ _ (TkConst (TkIntConst x))) -> x)$2))}
--               | next Var                       {% wrapStateMonadic "ComRegel_ControlStruct" NOOP}
  --                  | Assignment                          {% wrapStateMonadic "ComRegel_ASSIGN" $1}
   --                 | return                              {% wrapStateMonadic "ComRegel_RETURN" Return}
    --                | end                                 {% wrapStateMonadic "ComRegel_END" End}

Command             : IOCommand             {Command $1}
                    | ControlStruct         {ControlStructure $1}
                    | goto int    {Goto ((\(TokenWrap _ _ (TkConst (TkIntConst x))) -> x)$2)}
--               | next Var                       {% wrapStateMonadic "ComRegel_ControlStruct" NOOP}
                    | Assignment                          {$1}
                    | return                              {Return}
                    | end                                 {End}


-- Assignment          : NumVar "=" NumExpr          {% wrapStateMonadic "Regel_NUM-Assign" (ArithAssignment $1 $3)}
--                     | stringVar "=" StringExpr {% wrapStateMonadic "Regel_STR-Assign" (StringAssignment (StringVar $ getTokenStringValue $1) $3)}
Assignment          : NumVar "=" NumExpr          {ArithAssignment $1 $3}
                    | stringVar "=" StringExpr {StringAssignment (StringVar $ getTokenStringValue $1) $3}

StringExpr          : BasicString                                    {StringOp $1}
                    | BasicString "+" BasicString                    {StringExpr ($1,$3) "+"} 

BasicString         : stringLiteral                 {StringLiteral $ getTokenStringValue $1}
--                  | StringOperation                                {String_Operation $1}
                    | stringVar                    {StringVar_BString (StringVar $ getTokenStringValue $1)}

NumFunction         : len "(" stringLiteral ")"                      {Len $ getTokenStringValue $3}
                    | len "(" stringVar ")"                          {LenVar (StringVar $ getTokenStringValue $3)}
                    | rand "(" int ")"           {Random ((\(TokenWrap _ _ (TkConst (TkIntConst x))) -> x)$3)} 
                                                                        -- TODO: Argument
                    | intfunc "(" NumExpr ")"                        {IntFunc $3} 


NumExpr             : NumExpr NumOperationsLev2 Term                 {NumExpr ($1,$3) $2}
                    | Term                                           {$1}
                    | NumFunction                                    {NumFunc $1}


NumOperationsLev2   : "+"               {"+"}          
                    | "-"               {"-"}


NumOperationsLev1   : "*"               {"*"}
                    | "/"               {"/"}


Term                : Term NumOperationsLev1 Factor          {NumExpr ($1,$3) $2}
                    | Factor                           {$1}

Factor              : Operand                    {NumOp $1}
                    | "(" NumExpr ")"            {$2}
                    |  NumFunction               {NumFunc $1}

Operand             : NumVar                                         {OpVar $1}
                    | int             {makeArithOperandConstant $ ((\(TokenWrap _ _ (TkConst x)) -> x)$1)}

ControlStruct       : if BoolExpr then IfBody                        {If $2 $4}
                    | if BoolExpr IfBody                             {If $2 $3}
                    | for NumVar "=" Operand to Operand step Operand SyntaxTree {For $2 ($4,$8,$6) $9} -- step auch var??
                    | for NumVar "=" Operand to Operand SyntaxTree   {For $2 ($4,(makeArithOperandConstant (TkIntConst 1)),$6) $7} 
                    | gosub int           {GoSub ((\(TokenWrap _ _(TkConst (TkIntConst x))) -> x)$2)}

IfBody              : int                          {[Goto ((\(TokenWrap _ _(TkConst (TkIntConst x))) -> x)$1)]}
--IfBody              : Commands                                       {$1} --  <--- verursacht shift/red conflicts
                    | Commands                                       {$1} --  <--- verursacht shift/red conflicts


BoolExpr            : SimpleBoolExpr                                     {$1}
                    | "(" BoolExpr ")" LogicOperation "(" BoolExpr ")"   {BoolExprLog ($2,$6) $4}

LogicOperation      : or                                             {"||"} -- Kurzschlussauswertung ???
                    | and                                            {"&&"}
                    | neg                                            {"neg"}

SimpleBoolExpr      : StringExpr CompareOperator StringExpr          {BoolExprString ($1,$3) $2}
                    | NumExpr CompareOperator NumExpr                {BoolExprNum ($1,$3) $2}
 
CompareOperator     : "="                                            {"=="}
                    | "<"                                            {"<"}
                    | ">"                                            {">"}
                    | "<>"                                           {"/="}
                    | "<="                                           {"<="}
                    | ">="                                           {">="}

Constant            : int                                            {getTokenIntValue $1}
--               | float                          {$1}

IOCommand           : print Output                                   {Print $2}
                    | print                                          {Print ([], True)}
              --      | input Input                     {% wrapStateMonadic "IOComRegel Inp" (Input $2)}
                    | input Input                     {Input $2}
                    | get Var                                  {Get $2}


Output              : stringLiteral                            {([OutString $ getTokenStringValue $1], True)}
                    | stringLiteral";"                         {([OutString $ getTokenStringValue $1], False)}
                    | Var                                            {([OutVar $1], True)}
                    | Var ";"                                        {([OutVar $1], False)}
                    | stringLiteral";" Output       {((OutString $ getTokenStringValue $1):(fst $3), snd ($3))}
                    | Var ";" Output                                 {((OutVar $1):(fst $3), snd ($3))}

-- Input               : stringLiteral";" Vars   {% wrapStateMonadic "InpRegel1" (InputStuff [getTokenStringValue $1] $3, False)}
Input               : stringLiteral";" Vars   {(InputStuff [getTokenStringValue $1] $3, False)}
                    | stringLiteral Vars      {(InputStuff [getTokenStringValue $1] $2, True)}
                    | Vars                                            {(InputStuff [] $1, False)}

Vars                : Var                                            {[$1]}
                    | Var "," Vars                                   {$1:$3}

Var                 : stringVar                         {StringVar_Var (StringVar $ getTokenStringValue $1)} 
                    | NumVar                           {NumVar_Var $1}

NumVar              : intVar                             {IntVar $ getTokenStringValue $1}
                 --   | floatVar         {% wrapStateMonadic "Regel_FloatVar" (FloatVar $ getTokenStringValue $1)}
                    | floatVar         {FloatVar $ getTokenStringValue $1}

{




wrapStateMonadic state val = get >>= (\s -> put (s ++ [state])) >> return val


-- TODO: FLoat COnstants
makeArithOperandConstant (TkIntConst x) = IntConst x
makeiArithOperandConstant _ = error "invalid makeOperandConstant call"



evalListStrict f [] nlList = nlList
evalListStrict f (x:xs) nlList = ((:) $! (f $! x)) $! (evalListStrict f xs (x : nlList))




getParseTree str = 
    let tokens = getTokens str 
        (a,s) = runState (basicParse $ tokens) ParserState { tokenList = tokens, 
                                                             lineNumbers = [], 
                                                             expectedLineNumbers = []} 
       {- initState = ParserState { tokenList = tokens, 
                                  lineNumbers = [], 
                                  expectedLineNumbers = []}
        (a,s) = (runState $! ((\ tk -> do
                              psTree <- basicParse tk
                              checkAllExpectedLineNumbersGot
                              return psTree
                          )tokens)) initState -}
    -- in trace ("the end state: " ++ (intercalate "," s)) a
    -- in map (id $!) a
    -- in reverse $! (evalListStrict id a [] )
    in a



}

