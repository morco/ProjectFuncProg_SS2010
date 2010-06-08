{-# OPTIONS_GHC -fno-warn-overlapping-patterns #-}
--module BasicHap(getParseTree,SyntaxTree, Command, IOCommand, Vars) where
module BasicHap where

import BasicAlex
import Data.Char

-- parser produced by Happy Version 1.18.4

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24
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
	| HappyAbsSyn18 t18
	| HappyAbsSyn19 t19
	| HappyAbsSyn20 t20
	| HappyAbsSyn21 t21
	| HappyAbsSyn22 t22
	| HappyAbsSyn23 t23
	| HappyAbsSyn24 t24

action_0 (31) = happyShift action_4
action_0 (4) = happyGoto action_3
action_0 _ = happyFail

action_1 (31) = happyShift action_2
action_1 _ = happyFail

action_2 (25) = happyShift action_11
action_2 (26) = happyShift action_12
action_2 (28) = happyShift action_13
action_2 (29) = happyShift action_14
action_2 (30) = happyShift action_15
action_2 (34) = happyShift action_16
action_2 (36) = happyShift action_17
action_2 (37) = happyShift action_18
action_2 (5) = happyGoto action_20
action_2 (6) = happyGoto action_6
action_2 (7) = happyGoto action_7
action_2 (13) = happyGoto action_8
action_2 (20) = happyGoto action_9
action_2 (24) = happyGoto action_10
action_2 _ = happyFail

action_3 (55) = happyAccept
action_3 _ = happyFail

action_4 (25) = happyShift action_11
action_4 (26) = happyShift action_12
action_4 (28) = happyShift action_13
action_4 (29) = happyShift action_14
action_4 (30) = happyShift action_15
action_4 (34) = happyShift action_16
action_4 (36) = happyShift action_17
action_4 (37) = happyShift action_18
action_4 (39) = happyShift action_19
action_4 (5) = happyGoto action_5
action_4 (6) = happyGoto action_6
action_4 (7) = happyGoto action_7
action_4 (13) = happyGoto action_8
action_4 (20) = happyGoto action_9
action_4 (24) = happyGoto action_10
action_4 _ = happyFail

action_5 (31) = happyShift action_4
action_5 (4) = happyGoto action_48
action_5 _ = happyReduce_1

action_6 (33) = happyShift action_47
action_6 _ = happyReduce_4

action_7 _ = happyReduce_9

action_8 _ = happyReduce_7

action_9 _ = happyReduce_6

action_10 (42) = happyShift action_46
action_10 _ = happyFail

action_11 (27) = happyShift action_45
action_11 (28) = happyShift action_42
action_11 (29) = happyShift action_14
action_11 (30) = happyShift action_15
action_11 (21) = happyGoto action_43
action_11 (23) = happyGoto action_44
action_11 (24) = happyGoto action_40
action_11 _ = happyReduce_44

action_12 (27) = happyShift action_41
action_12 (28) = happyShift action_42
action_12 (29) = happyShift action_14
action_12 (30) = happyShift action_15
action_12 (22) = happyGoto action_38
action_12 (23) = happyGoto action_39
action_12 (24) = happyGoto action_40
action_12 _ = happyFail

action_13 (42) = happyShift action_37
action_13 _ = happyFail

action_14 _ = happyReduce_57

action_15 _ = happyReduce_58

action_16 (27) = happyShift action_32
action_16 (28) = happyShift action_33
action_16 (29) = happyShift action_14
action_16 (30) = happyShift action_15
action_16 (41) = happyShift action_34
action_16 (49) = happyShift action_35
action_16 (50) = happyShift action_36
action_16 (8) = happyGoto action_24
action_16 (9) = happyGoto action_25
action_16 (10) = happyGoto action_26
action_16 (11) = happyGoto action_27
action_16 (12) = happyGoto action_28
action_16 (15) = happyGoto action_29
action_16 (17) = happyGoto action_30
action_16 (24) = happyGoto action_31
action_16 _ = happyFail

action_17 (41) = happyShift action_23
action_17 _ = happyFail

action_18 (29) = happyShift action_14
action_18 (30) = happyShift action_15
action_18 (24) = happyGoto action_22
action_18 _ = happyFail

action_19 (29) = happyShift action_14
action_19 (30) = happyShift action_15
action_19 (24) = happyGoto action_21
action_19 _ = happyFail

action_20 _ = happyFail

action_21 _ = happyReduce_3

action_22 (42) = happyShift action_72
action_22 _ = happyFail

action_23 _ = happyReduce_8

action_24 (42) = happyShift action_64
action_24 (43) = happyShift action_65
action_24 (44) = happyShift action_66
action_24 (45) = happyShift action_67
action_24 (46) = happyShift action_68
action_24 (47) = happyShift action_69
action_24 (18) = happyGoto action_71
action_24 _ = happyFail

action_25 (48) = happyShift action_70
action_25 _ = happyReduce_12

action_26 _ = happyReduce_20

action_27 (42) = happyShift action_64
action_27 (43) = happyShift action_65
action_27 (44) = happyShift action_66
action_27 (45) = happyShift action_67
action_27 (46) = happyShift action_68
action_27 (47) = happyShift action_69
action_27 (18) = happyGoto action_63
action_27 _ = happyFail

action_28 (48) = happyShift action_62
action_28 _ = happyReduce_19

action_29 (25) = happyShift action_11
action_29 (26) = happyShift action_12
action_29 (28) = happyShift action_13
action_29 (29) = happyShift action_14
action_29 (30) = happyShift action_15
action_29 (34) = happyShift action_16
action_29 (35) = happyShift action_60
action_29 (36) = happyShift action_17
action_29 (37) = happyShift action_18
action_29 (41) = happyShift action_61
action_29 (5) = happyGoto action_58
action_29 (6) = happyGoto action_6
action_29 (7) = happyGoto action_7
action_29 (13) = happyGoto action_8
action_29 (14) = happyGoto action_59
action_29 (20) = happyGoto action_9
action_29 (24) = happyGoto action_10
action_29 _ = happyFail

action_30 _ = happyReduce_29

action_31 _ = happyReduce_21

action_32 _ = happyReduce_14

action_33 _ = happyReduce_15

action_34 _ = happyReduce_22

action_35 (50) = happyShift action_57
action_35 _ = happyFail

action_36 (27) = happyShift action_32
action_36 (28) = happyShift action_33
action_36 (29) = happyShift action_14
action_36 (30) = happyShift action_15
action_36 (41) = happyShift action_34
action_36 (49) = happyShift action_35
action_36 (50) = happyShift action_36
action_36 (8) = happyGoto action_24
action_36 (9) = happyGoto action_25
action_36 (10) = happyGoto action_26
action_36 (11) = happyGoto action_27
action_36 (12) = happyGoto action_28
action_36 (15) = happyGoto action_56
action_36 (17) = happyGoto action_30
action_36 (24) = happyGoto action_31
action_36 _ = happyFail

action_37 (27) = happyShift action_32
action_37 (28) = happyShift action_33
action_37 (8) = happyGoto action_55
action_37 (9) = happyGoto action_25
action_37 _ = happyFail

action_38 _ = happyReduce_45

action_39 _ = happyReduce_54

action_40 _ = happyReduce_56

action_41 (28) = happyShift action_42
action_41 (29) = happyShift action_14
action_41 (30) = happyShift action_15
action_41 (32) = happyShift action_54
action_41 (23) = happyGoto action_53
action_41 (24) = happyGoto action_40
action_41 _ = happyFail

action_42 _ = happyReduce_55

action_43 _ = happyReduce_43

action_44 (32) = happyShift action_52
action_44 _ = happyReduce_48

action_45 (32) = happyShift action_51
action_45 _ = happyReduce_46

action_46 (29) = happyShift action_14
action_46 (30) = happyShift action_15
action_46 (41) = happyShift action_34
action_46 (49) = happyShift action_35
action_46 (10) = happyGoto action_26
action_46 (11) = happyGoto action_50
action_46 (12) = happyGoto action_28
action_46 (24) = happyGoto action_31
action_46 _ = happyFail

action_47 (25) = happyShift action_11
action_47 (26) = happyShift action_12
action_47 (28) = happyShift action_13
action_47 (29) = happyShift action_14
action_47 (30) = happyShift action_15
action_47 (34) = happyShift action_16
action_47 (36) = happyShift action_17
action_47 (37) = happyShift action_18
action_47 (5) = happyGoto action_49
action_47 (6) = happyGoto action_6
action_47 (7) = happyGoto action_7
action_47 (13) = happyGoto action_8
action_47 (20) = happyGoto action_9
action_47 (24) = happyGoto action_10
action_47 _ = happyFail

action_48 _ = happyReduce_2

action_49 _ = happyReduce_5

action_50 _ = happyReduce_10

action_51 (27) = happyShift action_45
action_51 (28) = happyShift action_42
action_51 (29) = happyShift action_14
action_51 (30) = happyShift action_15
action_51 (21) = happyGoto action_84
action_51 (23) = happyGoto action_44
action_51 (24) = happyGoto action_40
action_51 _ = happyReduce_47

action_52 (27) = happyShift action_45
action_52 (28) = happyShift action_42
action_52 (29) = happyShift action_14
action_52 (30) = happyShift action_15
action_52 (21) = happyGoto action_83
action_52 (23) = happyGoto action_44
action_52 (24) = happyGoto action_40
action_52 _ = happyReduce_49

action_53 _ = happyReduce_53

action_54 (28) = happyShift action_42
action_54 (29) = happyShift action_14
action_54 (30) = happyShift action_15
action_54 (23) = happyGoto action_82
action_54 (24) = happyGoto action_40
action_54 _ = happyFail

action_55 _ = happyReduce_11

action_56 (51) = happyShift action_81
action_56 _ = happyFail

action_57 (27) = happyShift action_79
action_57 (28) = happyShift action_80
action_57 _ = happyFail

action_58 _ = happyReduce_28

action_59 _ = happyReduce_24

action_60 (25) = happyShift action_11
action_60 (26) = happyShift action_12
action_60 (28) = happyShift action_13
action_60 (29) = happyShift action_14
action_60 (30) = happyShift action_15
action_60 (34) = happyShift action_16
action_60 (36) = happyShift action_17
action_60 (37) = happyShift action_18
action_60 (41) = happyShift action_61
action_60 (5) = happyGoto action_58
action_60 (6) = happyGoto action_6
action_60 (7) = happyGoto action_7
action_60 (13) = happyGoto action_8
action_60 (14) = happyGoto action_78
action_60 (20) = happyGoto action_9
action_60 (24) = happyGoto action_10
action_60 _ = happyFail

action_61 _ = happyReduce_27

action_62 (29) = happyShift action_14
action_62 (30) = happyShift action_15
action_62 (41) = happyShift action_34
action_62 (12) = happyGoto action_77
action_62 (24) = happyGoto action_31
action_62 _ = happyFail

action_63 (29) = happyShift action_14
action_63 (30) = happyShift action_15
action_63 (41) = happyShift action_34
action_63 (49) = happyShift action_35
action_63 (10) = happyGoto action_26
action_63 (11) = happyGoto action_76
action_63 (12) = happyGoto action_28
action_63 (24) = happyGoto action_31
action_63 _ = happyFail

action_64 _ = happyReduce_36

action_65 _ = happyReduce_39

action_66 _ = happyReduce_37

action_67 _ = happyReduce_38

action_68 _ = happyReduce_40

action_69 _ = happyReduce_41

action_70 (27) = happyShift action_32
action_70 (28) = happyShift action_33
action_70 (9) = happyGoto action_75
action_70 _ = happyFail

action_71 (27) = happyShift action_32
action_71 (28) = happyShift action_33
action_71 (8) = happyGoto action_74
action_71 (9) = happyGoto action_25
action_71 _ = happyFail

action_72 (29) = happyShift action_14
action_72 (30) = happyShift action_15
action_72 (41) = happyShift action_34
action_72 (12) = happyGoto action_73
action_72 (24) = happyGoto action_31
action_72 _ = happyFail

action_73 (38) = happyShift action_91
action_73 _ = happyFail

action_74 _ = happyReduce_34

action_75 _ = happyReduce_13

action_76 _ = happyReduce_35

action_77 _ = happyReduce_18

action_78 _ = happyReduce_23

action_79 (51) = happyShift action_90
action_79 _ = happyFail

action_80 (51) = happyShift action_89
action_80 _ = happyFail

action_81 (52) = happyShift action_86
action_81 (53) = happyShift action_87
action_81 (54) = happyShift action_88
action_81 (16) = happyGoto action_85
action_81 _ = happyFail

action_82 _ = happyReduce_52

action_83 _ = happyReduce_51

action_84 _ = happyReduce_50

action_85 (50) = happyShift action_93
action_85 _ = happyFail

action_86 _ = happyReduce_31

action_87 _ = happyReduce_32

action_88 _ = happyReduce_33

action_89 _ = happyReduce_17

action_90 _ = happyReduce_16

action_91 (29) = happyShift action_14
action_91 (30) = happyShift action_15
action_91 (41) = happyShift action_34
action_91 (12) = happyGoto action_92
action_91 (24) = happyGoto action_31
action_91 _ = happyFail

action_92 (31) = happyShift action_4
action_92 (40) = happyShift action_96
action_92 (4) = happyGoto action_95
action_92 _ = happyFail

action_93 (27) = happyShift action_32
action_93 (28) = happyShift action_33
action_93 (29) = happyShift action_14
action_93 (30) = happyShift action_15
action_93 (41) = happyShift action_34
action_93 (49) = happyShift action_35
action_93 (50) = happyShift action_36
action_93 (8) = happyGoto action_24
action_93 (9) = happyGoto action_25
action_93 (10) = happyGoto action_26
action_93 (11) = happyGoto action_27
action_93 (12) = happyGoto action_28
action_93 (15) = happyGoto action_94
action_93 (17) = happyGoto action_30
action_93 (24) = happyGoto action_31
action_93 _ = happyFail

action_94 (51) = happyShift action_98
action_94 _ = happyFail

action_95 _ = happyReduce_26

action_96 (29) = happyShift action_14
action_96 (30) = happyShift action_15
action_96 (41) = happyShift action_34
action_96 (12) = happyGoto action_97
action_96 (24) = happyGoto action_31
action_96 _ = happyFail

action_97 (31) = happyShift action_4
action_97 (4) = happyGoto action_99
action_97 _ = happyFail

action_98 _ = happyReduce_30

action_99 _ = happyReduce_25

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
happyReduction_6 (HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn6
		 (Command happy_var_1
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_1  6 happyReduction_7
happyReduction_7 (HappyAbsSyn13  happy_var_1)
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
happyReduction_10 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn7
		 (ArithAssignment happy_var_1 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  7 happyReduction_11
happyReduction_11 (HappyAbsSyn8  happy_var_3)
	_
	(HappyTerminal (TkStringVar happy_var_1))
	 =  HappyAbsSyn7
		 (StringAssignment (StringVar happy_var_1) happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_1  8 happyReduction_12
happyReduction_12 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (StringOp happy_var_1
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  8 happyReduction_13
happyReduction_13 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (StringExpr (happy_var_1,happy_var_3) "+"
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_1  9 happyReduction_14
happyReduction_14 (HappyTerminal (TkString happy_var_1))
	 =  HappyAbsSyn9
		 (StringLiteral happy_var_1
	)
happyReduction_14 _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_1  9 happyReduction_15
happyReduction_15 (HappyTerminal (TkStringVar happy_var_1))
	 =  HappyAbsSyn9
		 (StringVar_BString (StringVar happy_var_1)
	)
happyReduction_15 _  = notHappyAtAll 

happyReduce_16 = happyReduce 4 10 happyReduction_16
happyReduction_16 (_ `HappyStk`
	(HappyTerminal (TkString happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (Len happy_var_3
	) `HappyStk` happyRest

happyReduce_17 = happyReduce 4 10 happyReduction_17
happyReduction_17 (_ `HappyStk`
	(HappyTerminal (TkStringVar happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (LenVar (StringVar happy_var_3)
	) `HappyStk` happyRest

happyReduce_18 = happySpecReduce_3  11 happyReduction_18
happyReduction_18 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 (NumExpr (happy_var_1,happy_var_3) "+"
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_1  11 happyReduction_19
happyReduction_19 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 (NumOp happy_var_1
	)
happyReduction_19 _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_1  11 happyReduction_20
happyReduction_20 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn11
		 (NumFunc happy_var_1
	)
happyReduction_20 _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  12 happyReduction_21
happyReduction_21 (HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn12
		 (OpVar happy_var_1
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_1  12 happyReduction_22
happyReduction_22 (HappyTerminal (TkConst happy_var_1))
	 =  HappyAbsSyn12
		 (makeArithOperandConstant happy_var_1
	)
happyReduction_22 _  = notHappyAtAll 

happyReduce_23 = happyReduce 4 13 happyReduction_23
happyReduction_23 ((HappyAbsSyn14  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (If happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_24 = happySpecReduce_3  13 happyReduction_24
happyReduction_24 (HappyAbsSyn14  happy_var_3)
	(HappyAbsSyn15  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (If happy_var_2 happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happyReduce 9 13 happyReduction_25
happyReduction_25 ((HappyAbsSyn4  happy_var_9) `HappyStk`
	(HappyAbsSyn12  happy_var_8) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn24  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (For happy_var_2 (happy_var_4,happy_var_8,happy_var_6) happy_var_9
	) `HappyStk` happyRest

happyReduce_26 = happyReduce 7 13 happyReduction_26
happyReduction_26 ((HappyAbsSyn4  happy_var_7) `HappyStk`
	(HappyAbsSyn12  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn24  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (For happy_var_2 (happy_var_4,(makeArithOperandConstant (TkIntConst 1)),happy_var_6) happy_var_7
	) `HappyStk` happyRest

happyReduce_27 = happySpecReduce_1  14 happyReduction_27
happyReduction_27 (HappyTerminal (TkConst happy_var_1))
	 =  HappyAbsSyn14
		 ([Goto ((\(TkIntConst x) -> x)happy_var_1)]
	)
happyReduction_27 _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_1  14 happyReduction_28
happyReduction_28 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn14
		 (happy_var_1
	)
happyReduction_28 _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_1  15 happyReduction_29
happyReduction_29 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1
	)
happyReduction_29 _  = notHappyAtAll 

happyReduce_30 = happyReduce 7 15 happyReduction_30
happyReduction_30 (_ `HappyStk`
	(HappyAbsSyn15  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (BoolExprLog (happy_var_2,happy_var_6) happy_var_4
	) `HappyStk` happyRest

happyReduce_31 = happySpecReduce_1  16 happyReduction_31
happyReduction_31 _
	 =  HappyAbsSyn16
		 ("||"
	)

happyReduce_32 = happySpecReduce_1  16 happyReduction_32
happyReduction_32 _
	 =  HappyAbsSyn16
		 ("&&"
	)

happyReduce_33 = happySpecReduce_1  16 happyReduction_33
happyReduction_33 _
	 =  HappyAbsSyn16
		 ("neg"
	)

happyReduce_34 = happySpecReduce_3  17 happyReduction_34
happyReduction_34 (HappyAbsSyn8  happy_var_3)
	(HappyAbsSyn18  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn17
		 (BoolExprString (happy_var_1,happy_var_3) happy_var_2
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_3  17 happyReduction_35
happyReduction_35 (HappyAbsSyn11  happy_var_3)
	(HappyAbsSyn18  happy_var_2)
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn17
		 (BoolExprNum (happy_var_1,happy_var_3) happy_var_2
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_1  18 happyReduction_36
happyReduction_36 _
	 =  HappyAbsSyn18
		 ("=="
	)

happyReduce_37 = happySpecReduce_1  18 happyReduction_37
happyReduction_37 _
	 =  HappyAbsSyn18
		 ("<"
	)

happyReduce_38 = happySpecReduce_1  18 happyReduction_38
happyReduction_38 _
	 =  HappyAbsSyn18
		 (">"
	)

happyReduce_39 = happySpecReduce_1  18 happyReduction_39
happyReduction_39 _
	 =  HappyAbsSyn18
		 ("/="
	)

happyReduce_40 = happySpecReduce_1  18 happyReduction_40
happyReduction_40 _
	 =  HappyAbsSyn18
		 ("<="
	)

happyReduce_41 = happySpecReduce_1  18 happyReduction_41
happyReduction_41 _
	 =  HappyAbsSyn18
		 (">="
	)

happyReduce_42 = happySpecReduce_1  19 happyReduction_42
happyReduction_42 (HappyTerminal (TkConst happy_var_1))
	 =  HappyAbsSyn19
		 (happy_var_1
	)
happyReduction_42 _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_2  20 happyReduction_43
happyReduction_43 (HappyAbsSyn21  happy_var_2)
	_
	 =  HappyAbsSyn20
		 (Print happy_var_2
	)
happyReduction_43 _ _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_1  20 happyReduction_44
happyReduction_44 _
	 =  HappyAbsSyn20
		 (Print ([], True)
	)

happyReduce_45 = happySpecReduce_2  20 happyReduction_45
happyReduction_45 (HappyAbsSyn22  happy_var_2)
	_
	 =  HappyAbsSyn20
		 (Input happy_var_2
	)
happyReduction_45 _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_1  21 happyReduction_46
happyReduction_46 (HappyTerminal (TkString happy_var_1))
	 =  HappyAbsSyn21
		 (([OutString happy_var_1], True)
	)
happyReduction_46 _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_2  21 happyReduction_47
happyReduction_47 _
	(HappyTerminal (TkString happy_var_1))
	 =  HappyAbsSyn21
		 (([OutString happy_var_1], False)
	)
happyReduction_47 _ _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_1  21 happyReduction_48
happyReduction_48 (HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn21
		 (([OutVar happy_var_1], True)
	)
happyReduction_48 _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_2  21 happyReduction_49
happyReduction_49 _
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn21
		 (([OutVar happy_var_1], False)
	)
happyReduction_49 _ _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_3  21 happyReduction_50
happyReduction_50 (HappyAbsSyn21  happy_var_3)
	_
	(HappyTerminal (TkString happy_var_1))
	 =  HappyAbsSyn21
		 (((OutString happy_var_1):(fst happy_var_3), snd (happy_var_3))
	)
happyReduction_50 _ _ _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_3  21 happyReduction_51
happyReduction_51 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn21
		 (((OutVar happy_var_1):(fst happy_var_3), snd (happy_var_3))
	)
happyReduction_51 _ _ _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_3  22 happyReduction_52
happyReduction_52 (HappyAbsSyn23  happy_var_3)
	_
	(HappyTerminal (TkString happy_var_1))
	 =  HappyAbsSyn22
		 ((InputStuff [happy_var_1] happy_var_3, False)
	)
happyReduction_52 _ _ _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_2  22 happyReduction_53
happyReduction_53 (HappyAbsSyn23  happy_var_2)
	(HappyTerminal (TkString happy_var_1))
	 =  HappyAbsSyn22
		 ((InputStuff [happy_var_1] happy_var_2, True)
	)
happyReduction_53 _ _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_1  22 happyReduction_54
happyReduction_54 (HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn22
		 ((InputStuff [] happy_var_1, False)
	)
happyReduction_54 _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_1  23 happyReduction_55
happyReduction_55 (HappyTerminal (TkStringVar happy_var_1))
	 =  HappyAbsSyn23
		 (StringVar_Var (StringVar happy_var_1)
	)
happyReduction_55 _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_1  23 happyReduction_56
happyReduction_56 (HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn23
		 (NumVar_Var happy_var_1
	)
happyReduction_56 _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_1  24 happyReduction_57
happyReduction_57 (HappyTerminal (TkIntVar happy_var_1))
	 =  HappyAbsSyn24
		 (IntVar happy_var_1
	)
happyReduction_57 _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_1  24 happyReduction_58
happyReduction_58 (HappyTerminal (TkFloatVar happy_var_1))
	 =  HappyAbsSyn24
		 (FloatVar happy_var_1
	)
happyReduction_58 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 55 55 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TkPrint -> cont 25;
	TkInput -> cont 26;
	TkString happy_dollar_dollar -> cont 27;
	TkStringVar happy_dollar_dollar -> cont 28;
	TkIntVar happy_dollar_dollar -> cont 29;
	TkFloatVar happy_dollar_dollar -> cont 30;
	TkLineNumber happy_dollar_dollar -> cont 31;
	TkStringConcat -> cont 32;
	TkSingleLineCommandCombinator -> cont 33;
	TkIf -> cont 34;
	TkThen -> cont 35;
	TkGoto -> cont 36;
	TkFor -> cont 37;
	TkTo -> cont 38;
	TkNext -> cont 39;
	TkStep -> cont 40;
	TkConst happy_dollar_dollar -> cont 41;
	TkEqual -> cont 42;
	TkUnEqual -> cont 43;
	TkLt -> cont 44;
	TkGt -> cont 45;
	TkLE -> cont 46;
	TkGE -> cont 47;
	TkPlus -> cont 48;
	TkLen -> cont 49;
	TkBracketOpen -> cont 50;
	TkBracketClose -> cont 51;
	TkLogOr -> cont 52;
	TkLogAnd -> cont 53;
	TkLogNeg -> cont 54;
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


-- TODO: FLoat COnstants
makeArithOperandConstant (TkIntConst x) = IntConst x
makeiArithOperandConstant _ = error "invalid makeOperandConstant call"

parseError :: [Token] -> a
parseError ls = error ("Parse error on: " ++ (show ls))

data SyntaxTree  
      = Line Int [Command]
      | Lines SyntaxTree SyntaxTree
      deriving Show

data Command
      = Command IOCommand
      | ControlStructure ControlStruct
      | Goto Int
      | NOOP
      | ArithAssignment NumVar NumExpr
      | StringAssignment StringVar StringExpr
      deriving Show

data StringExpr
      = StringOp BasicString
      | StringExpr (BasicString,BasicString) String
      deriving Show

data BasicString
      = StringVar_BString StringVar
      | StringLiteral String
--      | String_Operation StringOperation
      deriving Show

data NumFunction
      = Len String
      | LenVar StringVar
      deriving Show


data ControlStruct
      = If BoolExpr [Command]
      | For NumVar (Operand,Operand,Operand) [(Int,[Command])]
      deriving Show


data BoolExpr
      = BoolExprString (StringExpr,StringExpr) String
      | BoolExprNum (NumExpr,NumExpr) String
      | BoolExprLog (BoolExpr,BoolExpr) String
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
      | NumFunc NumFunction
      deriving Show

data Operand
      = OpVar NumVar
      | IntConst Int
      | FloatConst Float
      deriving Show

data NumVar
      = IntVar String
      | FloatVar String
      deriving (Eq, Show, Ord)

data Var
      = StringVar_Var StringVar
      | NumVar_Var NumVar
      deriving (Eq, Show, Ord)

data StringVar
      = StringVar String
      deriving (Eq, Show, Ord)

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
