{-# OPTIONS_GHC -fno-warn-overlapping-patterns #-}
--module BasicHap(getParseTree,SyntaxTree, Command, IOCommand, Vars) where
module BasicHap where

import BasicAlex
import Data.Char
import IO

-- parser produced by Happy Version 1.18.4

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14

action_0 (19) = happyShift action_4
action_0 (4) = happyGoto action_3
action_0 _ = happyFail

action_1 (19) = happyShift action_2
action_1 _ = happyFail

action_2 (15) = happyShift action_9
action_2 (16) = happyShift action_10
action_2 (22) = happyShift action_11
action_2 (5) = happyGoto action_12
action_2 (6) = happyGoto action_6
action_2 (7) = happyGoto action_7
action_2 (11) = happyGoto action_8
action_2 _ = happyFail

action_3 (31) = happyAccept
action_3 _ = happyFail

action_4 (15) = happyShift action_9
action_4 (16) = happyShift action_10
action_4 (22) = happyShift action_11
action_4 (5) = happyGoto action_5
action_4 (6) = happyGoto action_6
action_4 (7) = happyGoto action_7
action_4 (11) = happyGoto action_8
action_4 _ = happyFail

action_5 (19) = happyShift action_4
action_5 (4) = happyGoto action_25
action_5 _ = happyReduce_1

action_6 (21) = happyShift action_24
action_6 _ = happyReduce_3

action_7 _ = happyReduce_6

action_8 _ = happyReduce_5

action_9 (17) = happyShift action_23
action_9 (18) = happyShift action_16
action_9 (12) = happyGoto action_21
action_9 (14) = happyGoto action_22
action_9 _ = happyReduce_36

action_10 (17) = happyShift action_20
action_10 (18) = happyShift action_16
action_10 (13) = happyGoto action_18
action_10 (14) = happyGoto action_19
action_10 _ = happyFail

action_11 (18) = happyShift action_16
action_11 (24) = happyShift action_17
action_11 (9) = happyGoto action_13
action_11 (10) = happyGoto action_14
action_11 (14) = happyGoto action_15
action_11 _ = happyFail

action_12 _ = happyFail

action_13 (23) = happyShift action_43
action_13 _ = happyFail

action_14 (25) = happyShift action_37
action_14 (26) = happyShift action_38
action_14 (27) = happyShift action_39
action_14 (28) = happyShift action_40
action_14 (29) = happyShift action_41
action_14 (30) = happyShift action_42
action_14 _ = happyFail

action_15 (25) = happyShift action_31
action_15 (26) = happyShift action_32
action_15 (27) = happyShift action_33
action_15 (28) = happyShift action_34
action_15 (29) = happyShift action_35
action_15 (30) = happyShift action_36
action_15 _ = happyFail

action_16 _ = happyReduce_47

action_17 _ = happyReduce_34

action_18 _ = happyReduce_37

action_19 _ = happyReduce_46

action_20 (18) = happyShift action_16
action_20 (20) = happyShift action_30
action_20 (14) = happyGoto action_29
action_20 _ = happyFail

action_21 _ = happyReduce_35

action_22 (20) = happyShift action_28
action_22 _ = happyReduce_40

action_23 (20) = happyShift action_27
action_23 _ = happyReduce_38

action_24 (15) = happyShift action_9
action_24 (16) = happyShift action_10
action_24 (22) = happyShift action_11
action_24 (5) = happyGoto action_26
action_24 (6) = happyGoto action_6
action_24 (7) = happyGoto action_7
action_24 (11) = happyGoto action_8
action_24 _ = happyFail

action_25 _ = happyReduce_2

action_26 _ = happyReduce_4

action_27 (17) = happyShift action_23
action_27 (18) = happyShift action_16
action_27 (12) = happyGoto action_73
action_27 (14) = happyGoto action_22
action_27 _ = happyReduce_39

action_28 (17) = happyShift action_23
action_28 (18) = happyShift action_16
action_28 (12) = happyGoto action_72
action_28 (14) = happyGoto action_22
action_28 _ = happyReduce_41

action_29 _ = happyReduce_45

action_30 (18) = happyShift action_16
action_30 (14) = happyGoto action_71
action_30 _ = happyFail

action_31 (18) = happyShift action_16
action_31 (24) = happyShift action_17
action_31 (10) = happyGoto action_69
action_31 (14) = happyGoto action_70
action_31 _ = happyFail

action_32 (18) = happyShift action_16
action_32 (24) = happyShift action_17
action_32 (10) = happyGoto action_67
action_32 (14) = happyGoto action_68
action_32 _ = happyFail

action_33 (18) = happyShift action_16
action_33 (24) = happyShift action_17
action_33 (10) = happyGoto action_65
action_33 (14) = happyGoto action_66
action_33 _ = happyFail

action_34 (18) = happyShift action_16
action_34 (24) = happyShift action_17
action_34 (10) = happyGoto action_63
action_34 (14) = happyGoto action_64
action_34 _ = happyFail

action_35 (18) = happyShift action_16
action_35 (24) = happyShift action_17
action_35 (10) = happyGoto action_61
action_35 (14) = happyGoto action_62
action_35 _ = happyFail

action_36 (18) = happyShift action_16
action_36 (24) = happyShift action_17
action_36 (10) = happyGoto action_59
action_36 (14) = happyGoto action_60
action_36 _ = happyFail

action_37 (18) = happyShift action_16
action_37 (24) = happyShift action_17
action_37 (10) = happyGoto action_57
action_37 (14) = happyGoto action_58
action_37 _ = happyFail

action_38 (18) = happyShift action_16
action_38 (24) = happyShift action_17
action_38 (10) = happyGoto action_55
action_38 (14) = happyGoto action_56
action_38 _ = happyFail

action_39 (18) = happyShift action_16
action_39 (24) = happyShift action_17
action_39 (10) = happyGoto action_53
action_39 (14) = happyGoto action_54
action_39 _ = happyFail

action_40 (18) = happyShift action_16
action_40 (24) = happyShift action_17
action_40 (10) = happyGoto action_51
action_40 (14) = happyGoto action_52
action_40 _ = happyFail

action_41 (18) = happyShift action_16
action_41 (24) = happyShift action_17
action_41 (10) = happyGoto action_49
action_41 (14) = happyGoto action_50
action_41 _ = happyFail

action_42 (18) = happyShift action_16
action_42 (24) = happyShift action_17
action_42 (10) = happyGoto action_47
action_42 (14) = happyGoto action_48
action_42 _ = happyFail

action_43 (15) = happyShift action_9
action_43 (16) = happyShift action_10
action_43 (22) = happyShift action_11
action_43 (24) = happyShift action_46
action_43 (5) = happyGoto action_44
action_43 (6) = happyGoto action_6
action_43 (7) = happyGoto action_7
action_43 (8) = happyGoto action_45
action_43 (11) = happyGoto action_8
action_43 _ = happyFail

action_44 _ = happyReduce_8

action_45 _ = happyReduce_7

action_46 _ = happyReduce_9

action_47 _ = happyReduce_21

action_48 _ = happyReduce_27

action_49 _ = happyReduce_20

action_50 _ = happyReduce_26

action_51 _ = happyReduce_18

action_52 _ = happyReduce_24

action_53 _ = happyReduce_17

action_54 _ = happyReduce_23

action_55 _ = happyReduce_19

action_56 _ = happyReduce_25

action_57 _ = happyReduce_16

action_58 _ = happyReduce_22

action_59 _ = happyReduce_33

action_60 _ = happyReduce_15

action_61 _ = happyReduce_32

action_62 _ = happyReduce_14

action_63 _ = happyReduce_30

action_64 _ = happyReduce_12

action_65 _ = happyReduce_29

action_66 _ = happyReduce_11

action_67 _ = happyReduce_31

action_68 _ = happyReduce_13

action_69 _ = happyReduce_28

action_70 _ = happyReduce_10

action_71 _ = happyReduce_44

action_72 _ = happyReduce_43

action_73 _ = happyReduce_42

happyReduce_1 = happySpecReduce_2  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_2)
	(HappyTerminal (TkLineNumber happy_var_1))
	 =  HappyAbsSyn4
		 (Line happy_var_1 happy_var_2
	)
happyReduction_1 _ _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_3  4 happyReduction_2
happyReduction_2 (HappyAbsSyn4  happy_var_3)
	(HappyAbsSyn5  happy_var_2)
	(HappyTerminal (TkLineNumber happy_var_1))
	 =  HappyAbsSyn4
		 (Lines (Line happy_var_1 happy_var_2) happy_var_3
	)
happyReduction_2 _ _ _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_1  5 happyReduction_3
happyReduction_3 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 ([happy_var_1]
	)
happyReduction_3 _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_3  5 happyReduction_4
happyReduction_4 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1:happy_var_3
	)
happyReduction_4 _ _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_1  6 happyReduction_5
happyReduction_5 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn6
		 (Command happy_var_1
	)
happyReduction_5 _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_1  6 happyReduction_6
happyReduction_6 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (ControlStructure happy_var_1
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happyReduce 4 7 happyReduction_7
happyReduction_7 ((HappyAbsSyn8  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (IF happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_8 = happySpecReduce_1  8 happyReduction_8
happyReduction_8 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1
	)
happyReduction_8 _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_1  8 happyReduction_9
happyReduction_9 _
	 =  HappyAbsSyn8
		 ([NOOP]
	)

happyReduce_10 = happySpecReduce_3  9 happyReduction_10
happyReduction_10 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn9
		 (BoolExprVarVar {var1 = happy_var_1, infixBoolFunc = "==", var2 = happy_var_3}
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  9 happyReduction_11
happyReduction_11 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn9
		 (BoolExprVarVar {var1 = happy_var_1, infixBoolFunc = "<", var2 = happy_var_3}
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  9 happyReduction_12
happyReduction_12 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn9
		 (BoolExprVarVar {var1 = happy_var_1, infixBoolFunc = ">", var2 = happy_var_3}
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  9 happyReduction_13
happyReduction_13 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn9
		 (BoolExprVarVar {var1 = happy_var_1, infixBoolFunc = "/=", var2 = happy_var_3}
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  9 happyReduction_14
happyReduction_14 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn9
		 (BoolExprVarVar {var1 = happy_var_1, infixBoolFunc = "<=", var2 = happy_var_3}
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  9 happyReduction_15
happyReduction_15 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn9
		 (BoolExprVarVar {var1 = happy_var_1, infixBoolFunc = ">=", var2 = happy_var_3}
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  9 happyReduction_16
happyReduction_16 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (BoolExprConstConst {const1 = happy_var_1, infixBoolFunc = "==", const2 = happy_var_3}
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  9 happyReduction_17
happyReduction_17 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (BoolExprConstConst {const1 = happy_var_1, infixBoolFunc = "<", const2 = happy_var_3}
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  9 happyReduction_18
happyReduction_18 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (BoolExprConstConst {const1 = happy_var_1, infixBoolFunc = ">", const2 = happy_var_3}
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  9 happyReduction_19
happyReduction_19 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (BoolExprConstConst {const1 = happy_var_1, infixBoolFunc = "/=", const2 = happy_var_3}
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  9 happyReduction_20
happyReduction_20 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (BoolExprConstConst {const1 = happy_var_1, infixBoolFunc = "<=", const2 = happy_var_3}
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  9 happyReduction_21
happyReduction_21 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (BoolExprConstConst {const1 = happy_var_1, infixBoolFunc = ">=", const2 = happy_var_3}
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  9 happyReduction_22
happyReduction_22 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (BoolExprVarConst {const' = happy_var_1, infixBoolFunc = "==", var = happy_var_3}
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  9 happyReduction_23
happyReduction_23 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (BoolExprVarConst {const' = happy_var_1, infixBoolFunc = "<", var = happy_var_3}
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  9 happyReduction_24
happyReduction_24 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (BoolExprVarConst {const' = happy_var_1, infixBoolFunc = ">", var = happy_var_3}
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  9 happyReduction_25
happyReduction_25 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (BoolExprVarConst {const' = happy_var_1, infixBoolFunc = "/=", var = happy_var_3}
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  9 happyReduction_26
happyReduction_26 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (BoolExprVarConst {const' = happy_var_1, infixBoolFunc = "<=", var = happy_var_3}
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  9 happyReduction_27
happyReduction_27 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (BoolExprVarConst {const' = happy_var_1, infixBoolFunc = ">=", var = happy_var_3}
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  9 happyReduction_28
happyReduction_28 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn9
		 (BoolExprVarConst {var = happy_var_1, infixBoolFunc = "==", const' = happy_var_3}
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  9 happyReduction_29
happyReduction_29 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn9
		 (BoolExprVarConst {var = happy_var_1, infixBoolFunc = "<", const' = happy_var_3}
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  9 happyReduction_30
happyReduction_30 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn9
		 (BoolExprVarConst {var = happy_var_1, infixBoolFunc = ">", const' = happy_var_3}
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  9 happyReduction_31
happyReduction_31 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn9
		 (BoolExprVarConst {var = happy_var_1, infixBoolFunc = "/=", const' = happy_var_3}
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  9 happyReduction_32
happyReduction_32 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn9
		 (BoolExprVarConst {var = happy_var_1, infixBoolFunc = "<=", const' = happy_var_3}
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  9 happyReduction_33
happyReduction_33 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn9
		 (BoolExprVarConst {var = happy_var_1, infixBoolFunc = ">=", const' = happy_var_3}
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_1  10 happyReduction_34
happyReduction_34 (HappyTerminal (TkConst happy_var_1))
	 =  HappyAbsSyn10
		 (happy_var_1
	)
happyReduction_34 _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_2  11 happyReduction_35
happyReduction_35 (HappyAbsSyn12  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (Print happy_var_2
	)
happyReduction_35 _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_1  11 happyReduction_36
happyReduction_36 _
	 =  HappyAbsSyn11
		 (Print ([], True)
	)

happyReduce_37 = happySpecReduce_2  11 happyReduction_37
happyReduction_37 (HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (Input happy_var_2
	)
happyReduction_37 _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_1  12 happyReduction_38
happyReduction_38 (HappyTerminal (TkString happy_var_1))
	 =  HappyAbsSyn12
		 (([OutString happy_var_1], True)
	)
happyReduction_38 _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_2  12 happyReduction_39
happyReduction_39 _
	(HappyTerminal (TkString happy_var_1))
	 =  HappyAbsSyn12
		 (([OutString happy_var_1], False)
	)
happyReduction_39 _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_1  12 happyReduction_40
happyReduction_40 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn12
		 (([OutVar happy_var_1], True)
	)
happyReduction_40 _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_2  12 happyReduction_41
happyReduction_41 _
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn12
		 (([OutVar happy_var_1], False)
	)
happyReduction_41 _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_3  12 happyReduction_42
happyReduction_42 (HappyAbsSyn12  happy_var_3)
	_
	(HappyTerminal (TkString happy_var_1))
	 =  HappyAbsSyn12
		 (((OutString happy_var_1):(fst happy_var_3), snd (happy_var_3))
	)
happyReduction_42 _ _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_3  12 happyReduction_43
happyReduction_43 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn12
		 (((OutVar happy_var_1):(fst happy_var_3), snd (happy_var_3))
	)
happyReduction_43 _ _ _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_3  13 happyReduction_44
happyReduction_44 (HappyAbsSyn14  happy_var_3)
	_
	(HappyTerminal (TkString happy_var_1))
	 =  HappyAbsSyn13
		 ((InputStuff [happy_var_1] happy_var_3, False)
	)
happyReduction_44 _ _ _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_2  13 happyReduction_45
happyReduction_45 (HappyAbsSyn14  happy_var_2)
	(HappyTerminal (TkString happy_var_1))
	 =  HappyAbsSyn13
		 ((InputStuff [happy_var_1] happy_var_2, True)
	)
happyReduction_45 _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_1  13 happyReduction_46
happyReduction_46 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 ((InputStuff [] happy_var_1, False)
	)
happyReduction_46 _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_1  14 happyReduction_47
happyReduction_47 (HappyTerminal (TkVar happy_var_1))
	 =  HappyAbsSyn14
		 (happy_var_1
	)
happyReduction_47 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 31 31 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TkPrint -> cont 15;
	TkInput -> cont 16;
	TkString happy_dollar_dollar -> cont 17;
	TkVar happy_dollar_dollar -> cont 18;
	TkLineNumber happy_dollar_dollar -> cont 19;
	TkStringConcat -> cont 20;
	TkSingleLineCommandCombinator -> cont 21;
	TkIf -> cont 22;
	TkThen -> cont 23;
	TkConst happy_dollar_dollar -> cont 24;
	TkEqual -> cont 25;
	TkUnEqual -> cont 26;
	TkLt -> cont 27;
	TkGt -> cont 28;
	TkLE -> cont 29;
	TkGE -> cont 30;
	_ -> happyError' (tk:tks)
	}

happyError_ tk tks = happyError' (tk:tks)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Monad HappyIdentity where
    return = HappyIdentity
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => [(Token)] -> HappyIdentity a
happyError' = HappyIdentity . parseError

basicParse tks = happyRunIdentity happySomeParser where
  happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError ls = error ("Parse error on: " ++ (show ls))

data SyntaxTree  
      = Line Int [Command]
      | Lines SyntaxTree SyntaxTree
      deriving Show

data Command
      = Command IOCommand
      | ControlStructure ControlStruct
      | NOOP
      deriving Show


data ControlStruct
      = IF BoolExpr [Command]
--      | Empty
      deriving Show

{-
data BoolExpr
      = BoolExprVarConst   { var :: Var , infixBoolFunc :: (Ord a) => a -> a -> Bool , const' :: Constant }
      | BoolExprVarVar     { var1 :: Var , infixBoolFunc :: (Ord a) => a -> a -> Bool , var2 :: Var }
      | BoolExprConstConst { const1 :: Constant , infixBoolFunc :: (Ord a) => a -> a -> Bool , const2 :: Constant }
      deriving Show
-}

data BoolExpr
      = BoolExprVarConst   { var :: Var , infixBoolFunc :: String , const' :: Constant }
      | BoolExprVarVar     { var1 :: Var , infixBoolFunc :: String , var2 :: Var }
      | BoolExprConstConst { const1 :: Constant , infixBoolFunc :: String , const2 :: Constant }
      deriving Show

data IOCommand 
      = Print ([Output], Bool)
      | Input (InputStuff, Bool)
      deriving Show
{-
data PaConstant
      = IntConst Int
      | FloatConst Float
      deriving Show
-}

data Output
      = OutString String  
      | OutVar Var
      deriving Show

data InputStuff 
      = InputStuff [String] Var
      deriving Show


getParseTree = basicParse . alexScanTokens 
{-getParseTree = 
      do
       handle <- openFile "miniBasiProg3.bs" ReadMode
       contents <- hGetContents handle
       putStr contents
       --print (alexScanTokens contents)
       let parse =  (basicParse . alexScanTokens) contents
       hClose handle
       return parse-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 

{-# LINE 28 "templates/GenericTemplate.hs" #-}








{-# LINE 49 "templates/GenericTemplate.hs" #-}

{-# LINE 59 "templates/GenericTemplate.hs" #-}

{-# LINE 68 "templates/GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
	happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
	 (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 155 "templates/GenericTemplate.hs" #-}

-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
	 sts1@(((st1@(HappyState (action))):(_))) ->
        	let r = fn stk in  -- it doesn't hurt to always seq here...
       		happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
        happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))
       where sts1@(((st1@(HappyState (action))):(_))) = happyDrop k ((st):(sts))
             drop_stk = happyDropStk k stk

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
       happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))
       where sts1@(((st1@(HappyState (action))):(_))) = happyDrop k ((st):(sts))
             drop_stk = happyDropStk k stk





             new_state = action


happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 253 "templates/GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail  (1) tk old_st _ stk =
--	trace "failing" $ 
    	happyError_ tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts)) 
						(saved_tok `HappyStk` _ `HappyStk` stk) =
--	trace ("discarding state, depth " ++ show (length stk))  $
	action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail  i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
	action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--	happySeq = happyDoSeq
-- otherwise it emits
-- 	happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# LINE 317 "templates/GenericTemplate.hs" #-}
{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
