{-# OPTIONS_GHC -fno-warn-overlapping-patterns #-}
--module BasicHap(getParseTree,SyntaxTree, Command, IOCommand, Vars) where
module BasicHap where

import BasicAlex
import Data.Char
--import qualified Data.Map as M

-- parser produced by Happy Version 1.18.4

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17
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
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16
	| HappyAbsSyn17 t17

action_0 (22) = happyShift action_4
action_0 (4) = happyGoto action_3
action_0 _ = happyFail

action_1 (22) = happyShift action_2
action_1 _ = happyFail

action_2 (18) = happyShift action_11
action_2 (19) = happyShift action_12
action_2 (21) = happyShift action_13
action_2 (25) = happyShift action_14
action_2 (27) = happyShift action_15
action_2 (28) = happyShift action_16
action_2 (5) = happyGoto action_18
action_2 (6) = happyGoto action_6
action_2 (7) = happyGoto action_7
action_2 (10) = happyGoto action_8
action_2 (14) = happyGoto action_9
action_2 (17) = happyGoto action_10
action_2 _ = happyFail

action_3 (40) = happyAccept
action_3 _ = happyFail

action_4 (18) = happyShift action_11
action_4 (19) = happyShift action_12
action_4 (21) = happyShift action_13
action_4 (25) = happyShift action_14
action_4 (27) = happyShift action_15
action_4 (28) = happyShift action_16
action_4 (30) = happyShift action_17
action_4 (5) = happyGoto action_5
action_4 (6) = happyGoto action_6
action_4 (7) = happyGoto action_7
action_4 (10) = happyGoto action_8
action_4 (14) = happyGoto action_9
action_4 (17) = happyGoto action_10
action_4 _ = happyFail

action_5 (22) = happyShift action_4
action_5 (4) = happyGoto action_34
action_5 _ = happyReduce_1

action_6 (24) = happyShift action_33
action_6 _ = happyReduce_4

action_7 _ = happyReduce_9

action_8 _ = happyReduce_7

action_9 _ = happyReduce_6

action_10 (33) = happyShift action_32
action_10 _ = happyFail

action_11 (20) = happyShift action_31
action_11 (21) = happyShift action_13
action_11 (15) = happyGoto action_29
action_11 (17) = happyGoto action_30
action_11 _ = happyReduce_45

action_12 (20) = happyShift action_28
action_12 (21) = happyShift action_13
action_12 (16) = happyGoto action_26
action_12 (17) = happyGoto action_27
action_12 _ = happyFail

action_13 _ = happyReduce_56

action_14 (21) = happyShift action_13
action_14 (32) = happyShift action_25
action_14 (12) = happyGoto action_22
action_14 (13) = happyGoto action_23
action_14 (17) = happyGoto action_24
action_14 _ = happyFail

action_15 (32) = happyShift action_21
action_15 _ = happyFail

action_16 (21) = happyShift action_13
action_16 (17) = happyGoto action_20
action_16 _ = happyFail

action_17 (21) = happyShift action_13
action_17 (17) = happyGoto action_19
action_17 _ = happyFail

action_18 _ = happyFail

action_19 _ = happyReduce_3

action_20 (33) = happyShift action_57
action_20 _ = happyFail

action_21 _ = happyReduce_8

action_22 (26) = happyShift action_56
action_22 _ = happyFail

action_23 (33) = happyShift action_50
action_23 (34) = happyShift action_51
action_23 (35) = happyShift action_52
action_23 (36) = happyShift action_53
action_23 (37) = happyShift action_54
action_23 (38) = happyShift action_55
action_23 _ = happyFail

action_24 (33) = happyShift action_44
action_24 (34) = happyShift action_45
action_24 (35) = happyShift action_46
action_24 (36) = happyShift action_47
action_24 (37) = happyShift action_48
action_24 (38) = happyShift action_49
action_24 _ = happyFail

action_25 _ = happyReduce_43

action_26 _ = happyReduce_46

action_27 _ = happyReduce_55

action_28 (21) = happyShift action_13
action_28 (23) = happyShift action_43
action_28 (17) = happyGoto action_42
action_28 _ = happyFail

action_29 _ = happyReduce_44

action_30 (23) = happyShift action_41
action_30 _ = happyReduce_49

action_31 (23) = happyShift action_40
action_31 _ = happyReduce_47

action_32 (21) = happyShift action_38
action_32 (32) = happyShift action_39
action_32 (8) = happyGoto action_36
action_32 (9) = happyGoto action_37
action_32 _ = happyFail

action_33 (18) = happyShift action_11
action_33 (19) = happyShift action_12
action_33 (21) = happyShift action_13
action_33 (25) = happyShift action_14
action_33 (27) = happyShift action_15
action_33 (28) = happyShift action_16
action_33 (5) = happyGoto action_35
action_33 (6) = happyGoto action_6
action_33 (7) = happyGoto action_7
action_33 (10) = happyGoto action_8
action_33 (14) = happyGoto action_9
action_33 (17) = happyGoto action_10
action_33 _ = happyFail

action_34 _ = happyReduce_2

action_35 _ = happyReduce_5

action_36 _ = happyReduce_10

action_37 (39) = happyShift action_89
action_37 _ = happyReduce_12

action_38 _ = happyReduce_13

action_39 _ = happyReduce_14

action_40 (20) = happyShift action_31
action_40 (21) = happyShift action_13
action_40 (15) = happyGoto action_88
action_40 (17) = happyGoto action_30
action_40 _ = happyReduce_48

action_41 (20) = happyShift action_31
action_41 (21) = happyShift action_13
action_41 (15) = happyGoto action_87
action_41 (17) = happyGoto action_30
action_41 _ = happyReduce_50

action_42 _ = happyReduce_54

action_43 (21) = happyShift action_13
action_43 (17) = happyGoto action_86
action_43 _ = happyFail

action_44 (21) = happyShift action_13
action_44 (32) = happyShift action_25
action_44 (13) = happyGoto action_84
action_44 (17) = happyGoto action_85
action_44 _ = happyFail

action_45 (21) = happyShift action_13
action_45 (32) = happyShift action_25
action_45 (13) = happyGoto action_82
action_45 (17) = happyGoto action_83
action_45 _ = happyFail

action_46 (21) = happyShift action_13
action_46 (32) = happyShift action_25
action_46 (13) = happyGoto action_80
action_46 (17) = happyGoto action_81
action_46 _ = happyFail

action_47 (21) = happyShift action_13
action_47 (32) = happyShift action_25
action_47 (13) = happyGoto action_78
action_47 (17) = happyGoto action_79
action_47 _ = happyFail

action_48 (21) = happyShift action_13
action_48 (32) = happyShift action_25
action_48 (13) = happyGoto action_76
action_48 (17) = happyGoto action_77
action_48 _ = happyFail

action_49 (21) = happyShift action_13
action_49 (32) = happyShift action_25
action_49 (13) = happyGoto action_74
action_49 (17) = happyGoto action_75
action_49 _ = happyFail

action_50 (21) = happyShift action_13
action_50 (32) = happyShift action_25
action_50 (13) = happyGoto action_72
action_50 (17) = happyGoto action_73
action_50 _ = happyFail

action_51 (21) = happyShift action_13
action_51 (32) = happyShift action_25
action_51 (13) = happyGoto action_70
action_51 (17) = happyGoto action_71
action_51 _ = happyFail

action_52 (21) = happyShift action_13
action_52 (32) = happyShift action_25
action_52 (13) = happyGoto action_68
action_52 (17) = happyGoto action_69
action_52 _ = happyFail

action_53 (21) = happyShift action_13
action_53 (32) = happyShift action_25
action_53 (13) = happyGoto action_66
action_53 (17) = happyGoto action_67
action_53 _ = happyFail

action_54 (21) = happyShift action_13
action_54 (32) = happyShift action_25
action_54 (13) = happyGoto action_64
action_54 (17) = happyGoto action_65
action_54 _ = happyFail

action_55 (21) = happyShift action_13
action_55 (32) = happyShift action_25
action_55 (13) = happyGoto action_62
action_55 (17) = happyGoto action_63
action_55 _ = happyFail

action_56 (18) = happyShift action_11
action_56 (19) = happyShift action_12
action_56 (21) = happyShift action_13
action_56 (25) = happyShift action_14
action_56 (27) = happyShift action_15
action_56 (28) = happyShift action_16
action_56 (32) = happyShift action_61
action_56 (5) = happyGoto action_59
action_56 (6) = happyGoto action_6
action_56 (7) = happyGoto action_7
action_56 (10) = happyGoto action_8
action_56 (11) = happyGoto action_60
action_56 (14) = happyGoto action_9
action_56 (17) = happyGoto action_10
action_56 _ = happyFail

action_57 (32) = happyShift action_58
action_57 _ = happyFail

action_58 (29) = happyShift action_91
action_58 _ = happyFail

action_59 _ = happyReduce_17

action_60 _ = happyReduce_15

action_61 _ = happyReduce_18

action_62 _ = happyReduce_30

action_63 _ = happyReduce_36

action_64 _ = happyReduce_29

action_65 _ = happyReduce_35

action_66 _ = happyReduce_27

action_67 _ = happyReduce_33

action_68 _ = happyReduce_26

action_69 _ = happyReduce_32

action_70 _ = happyReduce_28

action_71 _ = happyReduce_34

action_72 _ = happyReduce_25

action_73 _ = happyReduce_31

action_74 _ = happyReduce_42

action_75 _ = happyReduce_24

action_76 _ = happyReduce_41

action_77 _ = happyReduce_23

action_78 _ = happyReduce_39

action_79 _ = happyReduce_21

action_80 _ = happyReduce_38

action_81 _ = happyReduce_20

action_82 _ = happyReduce_40

action_83 _ = happyReduce_22

action_84 _ = happyReduce_37

action_85 _ = happyReduce_19

action_86 _ = happyReduce_53

action_87 _ = happyReduce_52

action_88 _ = happyReduce_51

action_89 (21) = happyShift action_38
action_89 (32) = happyShift action_39
action_89 (9) = happyGoto action_90
action_89 _ = happyFail

action_90 _ = happyReduce_11

action_91 (32) = happyShift action_92
action_91 _ = happyFail

action_92 (31) = happyShift action_93
action_92 _ = happyFail

action_93 (32) = happyShift action_94
action_93 _ = happyFail

action_94 (22) = happyShift action_4
action_94 (4) = happyGoto action_95
action_94 _ = happyFail

action_95 _ = happyReduce_16

happyReduce_1 = happySpecReduce_2  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_2)
	(HappyTerminal (TkLineNumber happy_var_1))
	 =  HappyAbsSyn4
		 ([(happy_var_1,happy_var_2)]
	)
happyReduction_1 _ _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_3  4 happyReduction_2
happyReduction_2 (HappyAbsSyn4  happy_var_3)
	(HappyAbsSyn5  happy_var_2)
	(HappyTerminal (TkLineNumber happy_var_1))
	 =  HappyAbsSyn4
		 ((happy_var_1,happy_var_2):happy_var_3
	)
happyReduction_2 _ _ _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_3  4 happyReduction_3
happyReduction_3 _
	_
	(HappyTerminal (TkLineNumber happy_var_1))
	 =  HappyAbsSyn4
		 ([(happy_var_1, [NOOP])]
	)
happyReduction_3 _ _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_1  5 happyReduction_4
happyReduction_4 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 ([happy_var_1]
	)
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_3  5 happyReduction_5
happyReduction_5 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1:happy_var_3
	)
happyReduction_5 _ _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_1  6 happyReduction_6
happyReduction_6 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn6
		 (Command happy_var_1
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_1  6 happyReduction_7
happyReduction_7 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn6
		 (ControlStructure happy_var_1
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_2  6 happyReduction_8
happyReduction_8 (HappyTerminal (TkConst happy_var_2))
	_
	 =  HappyAbsSyn6
		 (Goto ((\(TkIntConst x) -> x)happy_var_2)
	)
happyReduction_8 _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_1  6 happyReduction_9
happyReduction_9 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_9 _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  7 happyReduction_10
happyReduction_10 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn7
		 (Assignment happy_var_1 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  8 happyReduction_11
happyReduction_11 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (NumExpr (happy_var_1,happy_var_3) "+"
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_1  8 happyReduction_12
happyReduction_12 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (NumOp happy_var_1
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_1  9 happyReduction_13
happyReduction_13 (HappyTerminal (TkVar happy_var_1))
	 =  HappyAbsSyn9
		 (makeOperandVar happy_var_1
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_1  9 happyReduction_14
happyReduction_14 (HappyTerminal (TkConst happy_var_1))
	 =  HappyAbsSyn9
		 (makeOperandConstant happy_var_1
	)
happyReduction_14 _  = notHappyAtAll 

happyReduce_15 = happyReduce 4 10 happyReduction_15
happyReduction_15 ((HappyAbsSyn11  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (If happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_16 = happyReduce 9 10 happyReduction_16
happyReduction_16 ((HappyAbsSyn4  happy_var_9) `HappyStk`
	(HappyTerminal (TkConst happy_var_8)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TkConst happy_var_6)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TkConst happy_var_4)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (For happy_var_2 (happy_var_4,happy_var_8,happy_var_6) happy_var_9
	) `HappyStk` happyRest

happyReduce_17 = happySpecReduce_1  11 happyReduction_17
happyReduction_17 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1
	)
happyReduction_17 _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  11 happyReduction_18
happyReduction_18 _
	 =  HappyAbsSyn11
		 ([NOOP]
	)

happyReduce_19 = happySpecReduce_3  12 happyReduction_19
happyReduction_19 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn12
		 (BoolExprVarVar {var1 = happy_var_1, infixBoolFunc = "==", var2 = happy_var_3}
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  12 happyReduction_20
happyReduction_20 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn12
		 (BoolExprVarVar {var1 = happy_var_1, infixBoolFunc = "<", var2 = happy_var_3}
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  12 happyReduction_21
happyReduction_21 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn12
		 (BoolExprVarVar {var1 = happy_var_1, infixBoolFunc = ">", var2 = happy_var_3}
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  12 happyReduction_22
happyReduction_22 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn12
		 (BoolExprVarVar {var1 = happy_var_1, infixBoolFunc = "/=", var2 = happy_var_3}
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  12 happyReduction_23
happyReduction_23 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn12
		 (BoolExprVarVar {var1 = happy_var_1, infixBoolFunc = "<=", var2 = happy_var_3}
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  12 happyReduction_24
happyReduction_24 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn12
		 (BoolExprVarVar {var1 = happy_var_1, infixBoolFunc = ">=", var2 = happy_var_3}
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  12 happyReduction_25
happyReduction_25 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 (BoolExprConstConst {const1 = happy_var_1, infixBoolFunc = "==", const2 = happy_var_3}
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  12 happyReduction_26
happyReduction_26 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 (BoolExprConstConst {const1 = happy_var_1, infixBoolFunc = "<", const2 = happy_var_3}
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  12 happyReduction_27
happyReduction_27 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 (BoolExprConstConst {const1 = happy_var_1, infixBoolFunc = ">", const2 = happy_var_3}
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  12 happyReduction_28
happyReduction_28 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 (BoolExprConstConst {const1 = happy_var_1, infixBoolFunc = "/=", const2 = happy_var_3}
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  12 happyReduction_29
happyReduction_29 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 (BoolExprConstConst {const1 = happy_var_1, infixBoolFunc = "<=", const2 = happy_var_3}
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  12 happyReduction_30
happyReduction_30 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 (BoolExprConstConst {const1 = happy_var_1, infixBoolFunc = ">=", const2 = happy_var_3}
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  12 happyReduction_31
happyReduction_31 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 (BoolExprVarConst {const' = happy_var_1, infixBoolFunc = "==", var = happy_var_3}
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  12 happyReduction_32
happyReduction_32 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 (BoolExprVarConst {const' = happy_var_1, infixBoolFunc = "<", var = happy_var_3}
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  12 happyReduction_33
happyReduction_33 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 (BoolExprVarConst {const' = happy_var_1, infixBoolFunc = ">", var = happy_var_3}
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  12 happyReduction_34
happyReduction_34 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 (BoolExprVarConst {const' = happy_var_1, infixBoolFunc = "/=", var = happy_var_3}
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_3  12 happyReduction_35
happyReduction_35 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 (BoolExprVarConst {const' = happy_var_1, infixBoolFunc = "<=", var = happy_var_3}
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_3  12 happyReduction_36
happyReduction_36 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 (BoolExprVarConst {const' = happy_var_1, infixBoolFunc = ">=", var = happy_var_3}
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_3  12 happyReduction_37
happyReduction_37 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn12
		 (BoolExprVarConst {var = happy_var_1, infixBoolFunc = "==", const' = happy_var_3}
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_3  12 happyReduction_38
happyReduction_38 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn12
		 (BoolExprVarConst {var = happy_var_1, infixBoolFunc = "<", const' = happy_var_3}
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_3  12 happyReduction_39
happyReduction_39 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn12
		 (BoolExprVarConst {var = happy_var_1, infixBoolFunc = ">", const' = happy_var_3}
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_3  12 happyReduction_40
happyReduction_40 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn12
		 (BoolExprVarConst {var = happy_var_1, infixBoolFunc = "/=", const' = happy_var_3}
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_3  12 happyReduction_41
happyReduction_41 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn12
		 (BoolExprVarConst {var = happy_var_1, infixBoolFunc = "<=", const' = happy_var_3}
	)
happyReduction_41 _ _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_3  12 happyReduction_42
happyReduction_42 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn12
		 (BoolExprVarConst {var = happy_var_1, infixBoolFunc = ">=", const' = happy_var_3}
	)
happyReduction_42 _ _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_1  13 happyReduction_43
happyReduction_43 (HappyTerminal (TkConst happy_var_1))
	 =  HappyAbsSyn13
		 (happy_var_1
	)
happyReduction_43 _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_2  14 happyReduction_44
happyReduction_44 (HappyAbsSyn15  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (Print happy_var_2
	)
happyReduction_44 _ _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_1  14 happyReduction_45
happyReduction_45 _
	 =  HappyAbsSyn14
		 (Print ([], True)
	)

happyReduce_46 = happySpecReduce_2  14 happyReduction_46
happyReduction_46 (HappyAbsSyn16  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (Input happy_var_2
	)
happyReduction_46 _ _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_1  15 happyReduction_47
happyReduction_47 (HappyTerminal (TkString happy_var_1))
	 =  HappyAbsSyn15
		 (([OutString happy_var_1], True)
	)
happyReduction_47 _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_2  15 happyReduction_48
happyReduction_48 _
	(HappyTerminal (TkString happy_var_1))
	 =  HappyAbsSyn15
		 (([OutString happy_var_1], False)
	)
happyReduction_48 _ _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_1  15 happyReduction_49
happyReduction_49 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn15
		 (([OutVar happy_var_1], True)
	)
happyReduction_49 _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_2  15 happyReduction_50
happyReduction_50 _
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn15
		 (([OutVar happy_var_1], False)
	)
happyReduction_50 _ _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_3  15 happyReduction_51
happyReduction_51 (HappyAbsSyn15  happy_var_3)
	_
	(HappyTerminal (TkString happy_var_1))
	 =  HappyAbsSyn15
		 (((OutString happy_var_1):(fst happy_var_3), snd (happy_var_3))
	)
happyReduction_51 _ _ _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_3  15 happyReduction_52
happyReduction_52 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn15
		 (((OutVar happy_var_1):(fst happy_var_3), snd (happy_var_3))
	)
happyReduction_52 _ _ _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_3  16 happyReduction_53
happyReduction_53 (HappyAbsSyn17  happy_var_3)
	_
	(HappyTerminal (TkString happy_var_1))
	 =  HappyAbsSyn16
		 ((InputStuff [happy_var_1] happy_var_3, False)
	)
happyReduction_53 _ _ _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_2  16 happyReduction_54
happyReduction_54 (HappyAbsSyn17  happy_var_2)
	(HappyTerminal (TkString happy_var_1))
	 =  HappyAbsSyn16
		 ((InputStuff [happy_var_1] happy_var_2, True)
	)
happyReduction_54 _ _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_1  16 happyReduction_55
happyReduction_55 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn16
		 ((InputStuff [] happy_var_1, False)
	)
happyReduction_55 _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_1  17 happyReduction_56
happyReduction_56 (HappyTerminal (TkVar happy_var_1))
	 =  HappyAbsSyn17
		 (happy_var_1
	)
happyReduction_56 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 40 40 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TkPrint -> cont 18;
	TkInput -> cont 19;
	TkString happy_dollar_dollar -> cont 20;
	TkVar happy_dollar_dollar -> cont 21;
	TkLineNumber happy_dollar_dollar -> cont 22;
	TkStringConcat -> cont 23;
	TkSingleLineCommandCombinator -> cont 24;
	TkIf -> cont 25;
	TkThen -> cont 26;
	TkGoto -> cont 27;
	TkFor -> cont 28;
	TkTo -> cont 29;
	TkNext -> cont 30;
	TkStep -> cont 31;
	TkConst happy_dollar_dollar -> cont 32;
	TkEqual -> cont 33;
	TkUnEqual -> cont 34;
	TkLt -> cont 35;
	TkGt -> cont 36;
	TkLE -> cont 37;
	TkGE -> cont 38;
	TkPlus -> cont 39;
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


makeOperandVar (TkIntVar x) = IntVar x
makeOperandVar (TkFloatVar x) = FloatVar x
makeOperandVar _ = error "String vars not allowed!"

makeOperandConstant (TkIntConst x) = IntConst x
makeOperandConstant _ = error "invalid makeOperandConstant call"

parseError :: [Token] -> a
parseError ls = error ("Parse error on: " ++ (show ls))

data SyntaxTree  
      = Line Int [Command]
      | Lines SyntaxTree SyntaxTree
--      | []
      deriving Show

data Command
      = Command IOCommand
      | ControlStructure ControlStruct
      | Goto Int
      | NOOP
      | Assignment Var NumExpr
      deriving Show


data ControlStruct
      = If BoolExpr [Command]
      | For Var (Constant,Constant,Constant) [(Int,[Command])]
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

data Output
      = OutString String  
      | OutVar Var
      deriving Show

data InputStuff 
      = InputStuff [String] Var
      deriving Show

data NumExpr
      = NumExpr (Operand,Operand) String
      | NumOp Operand
      deriving Show

data Operand
      = IntVar String
      | FloatVar String
      | IntConst Int
      | FloatConst Float
      deriving Show

getParseTree = basicParse . alexScanTokens
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
