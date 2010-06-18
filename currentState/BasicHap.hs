{-# OPTIONS_GHC -fno-warn-overlapping-patterns #-}
--module BasicHap(getParseTree,SyntaxTree, Command, IOCommand, Vars) where
module BasicHap where

import BasicAlex
import Data.Char

-- parser produced by Happy Version 1.18.4

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26 t27 t28
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
	| HappyAbsSyn25 t25
	| HappyAbsSyn26 t26
	| HappyAbsSyn27 t27
	| HappyAbsSyn28 t28

action_0 (35) = happyShift action_4
action_0 (4) = happyGoto action_3
action_0 _ = happyFail

action_1 (35) = happyShift action_2
action_1 _ = happyFail

action_2 (29) = happyShift action_11
action_2 (30) = happyShift action_12
action_2 (32) = happyShift action_13
action_2 (33) = happyShift action_14
action_2 (34) = happyShift action_15
action_2 (38) = happyShift action_16
action_2 (40) = happyShift action_17
action_2 (41) = happyShift action_18
action_2 (62) = happyShift action_23
action_2 (63) = happyShift action_21
action_2 (5) = happyGoto action_22
action_2 (6) = happyGoto action_6
action_2 (7) = happyGoto action_7
action_2 (17) = happyGoto action_8
action_2 (24) = happyGoto action_9
action_2 (28) = happyGoto action_10
action_2 _ = happyFail

action_3 (64) = happyAccept
action_3 _ = happyFail

action_4 (29) = happyShift action_11
action_4 (30) = happyShift action_12
action_4 (32) = happyShift action_13
action_4 (33) = happyShift action_14
action_4 (34) = happyShift action_15
action_4 (38) = happyShift action_16
action_4 (40) = happyShift action_17
action_4 (41) = happyShift action_18
action_4 (43) = happyShift action_19
action_4 (62) = happyShift action_20
action_4 (63) = happyShift action_21
action_4 (5) = happyGoto action_5
action_4 (6) = happyGoto action_6
action_4 (7) = happyGoto action_7
action_4 (17) = happyGoto action_8
action_4 (24) = happyGoto action_9
action_4 (28) = happyGoto action_10
action_4 _ = happyFail

action_5 (35) = happyShift action_4
action_5 (4) = happyGoto action_54
action_5 _ = happyReduce_1

action_6 (37) = happyShift action_53
action_6 _ = happyReduce_5

action_7 _ = happyReduce_10

action_8 _ = happyReduce_8

action_9 _ = happyReduce_7

action_10 (46) = happyShift action_52
action_10 _ = happyFail

action_11 (31) = happyShift action_51
action_11 (32) = happyShift action_48
action_11 (33) = happyShift action_14
action_11 (34) = happyShift action_15
action_11 (25) = happyGoto action_49
action_11 (27) = happyGoto action_50
action_11 (28) = happyGoto action_46
action_11 _ = happyReduce_55

action_12 (31) = happyShift action_47
action_12 (32) = happyShift action_48
action_12 (33) = happyShift action_14
action_12 (34) = happyShift action_15
action_12 (26) = happyGoto action_44
action_12 (27) = happyGoto action_45
action_12 (28) = happyGoto action_46
action_12 _ = happyFail

action_13 (46) = happyShift action_43
action_13 _ = happyFail

action_14 _ = happyReduce_68

action_15 _ = happyReduce_69

action_16 (31) = happyShift action_38
action_16 (32) = happyShift action_39
action_16 (33) = happyShift action_14
action_16 (34) = happyShift action_15
action_16 (45) = happyShift action_40
action_16 (56) = happyShift action_41
action_16 (57) = happyShift action_42
action_16 (8) = happyGoto action_28
action_16 (9) = happyGoto action_29
action_16 (10) = happyGoto action_30
action_16 (11) = happyGoto action_31
action_16 (14) = happyGoto action_32
action_16 (15) = happyGoto action_33
action_16 (16) = happyGoto action_34
action_16 (19) = happyGoto action_35
action_16 (21) = happyGoto action_36
action_16 (28) = happyGoto action_37
action_16 _ = happyFail

action_17 (45) = happyShift action_27
action_17 _ = happyFail

action_18 (33) = happyShift action_14
action_18 (34) = happyShift action_15
action_18 (28) = happyGoto action_26
action_18 _ = happyFail

action_19 (33) = happyShift action_14
action_19 (34) = happyShift action_15
action_19 (28) = happyGoto action_25
action_19 _ = happyFail

action_20 (35) = happyReduce_11
action_20 (37) = happyReduce_11
action_20 (64) = happyReduce_11
action_20 _ = happyReduce_11

action_21 (45) = happyShift action_24
action_21 _ = happyFail

action_22 _ = happyFail

action_23 _ = happyReduce_11

action_24 _ = happyReduce_37

action_25 _ = happyReduce_3

action_26 (46) = happyShift action_85
action_26 _ = happyFail

action_27 _ = happyReduce_9

action_28 (46) = happyShift action_75
action_28 (47) = happyShift action_76
action_28 (48) = happyShift action_77
action_28 (49) = happyShift action_78
action_28 (50) = happyShift action_79
action_28 (51) = happyShift action_80
action_28 (22) = happyGoto action_84
action_28 _ = happyFail

action_29 (52) = happyShift action_83
action_29 _ = happyReduce_14

action_30 _ = happyReduce_22

action_31 (46) = happyShift action_75
action_31 (47) = happyShift action_76
action_31 (48) = happyShift action_77
action_31 (49) = happyShift action_78
action_31 (50) = happyShift action_79
action_31 (51) = happyShift action_80
action_31 (52) = happyShift action_81
action_31 (53) = happyShift action_82
action_31 (12) = happyGoto action_73
action_31 (22) = happyGoto action_74
action_31 _ = happyFail

action_32 (54) = happyShift action_71
action_32 (55) = happyShift action_72
action_32 (13) = happyGoto action_70
action_32 _ = happyReduce_21

action_33 _ = happyReduce_28

action_34 _ = happyReduce_29

action_35 (29) = happyShift action_11
action_35 (30) = happyShift action_12
action_35 (32) = happyShift action_13
action_35 (33) = happyShift action_14
action_35 (34) = happyShift action_15
action_35 (38) = happyShift action_16
action_35 (39) = happyShift action_68
action_35 (40) = happyShift action_17
action_35 (41) = happyShift action_18
action_35 (45) = happyShift action_69
action_35 (62) = happyShift action_23
action_35 (63) = happyShift action_21
action_35 (5) = happyGoto action_66
action_35 (6) = happyGoto action_6
action_35 (7) = happyGoto action_7
action_35 (17) = happyGoto action_8
action_35 (18) = happyGoto action_67
action_35 (24) = happyGoto action_9
action_35 (28) = happyGoto action_10
action_35 _ = happyFail

action_36 _ = happyReduce_40

action_37 _ = happyReduce_31

action_38 _ = happyReduce_16

action_39 _ = happyReduce_17

action_40 _ = happyReduce_32

action_41 (57) = happyShift action_65
action_41 _ = happyFail

action_42 (31) = happyShift action_38
action_42 (32) = happyShift action_39
action_42 (33) = happyShift action_14
action_42 (34) = happyShift action_15
action_42 (45) = happyShift action_40
action_42 (56) = happyShift action_41
action_42 (57) = happyShift action_42
action_42 (8) = happyGoto action_28
action_42 (9) = happyGoto action_29
action_42 (10) = happyGoto action_30
action_42 (11) = happyGoto action_63
action_42 (14) = happyGoto action_32
action_42 (15) = happyGoto action_33
action_42 (16) = happyGoto action_34
action_42 (19) = happyGoto action_64
action_42 (21) = happyGoto action_36
action_42 (28) = happyGoto action_37
action_42 _ = happyFail

action_43 (31) = happyShift action_38
action_43 (32) = happyShift action_39
action_43 (8) = happyGoto action_62
action_43 (9) = happyGoto action_29
action_43 _ = happyFail

action_44 _ = happyReduce_56

action_45 _ = happyReduce_65

action_46 _ = happyReduce_67

action_47 (32) = happyShift action_48
action_47 (33) = happyShift action_14
action_47 (34) = happyShift action_15
action_47 (36) = happyShift action_61
action_47 (27) = happyGoto action_60
action_47 (28) = happyGoto action_46
action_47 _ = happyFail

action_48 _ = happyReduce_66

action_49 _ = happyReduce_54

action_50 (36) = happyShift action_59
action_50 _ = happyReduce_59

action_51 (36) = happyShift action_58
action_51 _ = happyReduce_57

action_52 (33) = happyShift action_14
action_52 (34) = happyShift action_15
action_52 (45) = happyShift action_40
action_52 (56) = happyShift action_41
action_52 (57) = happyShift action_57
action_52 (10) = happyGoto action_30
action_52 (11) = happyGoto action_56
action_52 (14) = happyGoto action_32
action_52 (15) = happyGoto action_33
action_52 (16) = happyGoto action_34
action_52 (28) = happyGoto action_37
action_52 _ = happyFail

action_53 (29) = happyShift action_11
action_53 (30) = happyShift action_12
action_53 (32) = happyShift action_13
action_53 (33) = happyShift action_14
action_53 (34) = happyShift action_15
action_53 (38) = happyShift action_16
action_53 (40) = happyShift action_17
action_53 (41) = happyShift action_18
action_53 (62) = happyShift action_23
action_53 (63) = happyShift action_21
action_53 (5) = happyGoto action_55
action_53 (6) = happyGoto action_6
action_53 (7) = happyGoto action_7
action_53 (17) = happyGoto action_8
action_53 (24) = happyGoto action_9
action_53 (28) = happyGoto action_10
action_53 _ = happyFail

action_54 _ = happyReduce_2

action_55 _ = happyReduce_6

action_56 (52) = happyShift action_81
action_56 (53) = happyShift action_82
action_56 (12) = happyGoto action_73
action_56 _ = happyReduce_12

action_57 (33) = happyShift action_14
action_57 (34) = happyShift action_15
action_57 (45) = happyShift action_40
action_57 (56) = happyShift action_41
action_57 (57) = happyShift action_57
action_57 (10) = happyGoto action_30
action_57 (11) = happyGoto action_100
action_57 (14) = happyGoto action_32
action_57 (15) = happyGoto action_33
action_57 (16) = happyGoto action_34
action_57 (28) = happyGoto action_37
action_57 _ = happyFail

action_58 (31) = happyShift action_51
action_58 (32) = happyShift action_48
action_58 (33) = happyShift action_14
action_58 (34) = happyShift action_15
action_58 (25) = happyGoto action_99
action_58 (27) = happyGoto action_50
action_58 (28) = happyGoto action_46
action_58 _ = happyReduce_58

action_59 (31) = happyShift action_51
action_59 (32) = happyShift action_48
action_59 (33) = happyShift action_14
action_59 (34) = happyShift action_15
action_59 (25) = happyGoto action_98
action_59 (27) = happyGoto action_50
action_59 (28) = happyGoto action_46
action_59 _ = happyReduce_60

action_60 _ = happyReduce_64

action_61 (32) = happyShift action_48
action_61 (33) = happyShift action_14
action_61 (34) = happyShift action_15
action_61 (27) = happyGoto action_97
action_61 (28) = happyGoto action_46
action_61 _ = happyFail

action_62 _ = happyReduce_13

action_63 (46) = happyShift action_75
action_63 (47) = happyShift action_76
action_63 (48) = happyShift action_77
action_63 (49) = happyShift action_78
action_63 (50) = happyShift action_79
action_63 (51) = happyShift action_80
action_63 (52) = happyShift action_81
action_63 (53) = happyShift action_82
action_63 (58) = happyShift action_96
action_63 (12) = happyGoto action_73
action_63 (22) = happyGoto action_74
action_63 _ = happyFail

action_64 (58) = happyShift action_95
action_64 _ = happyFail

action_65 (31) = happyShift action_93
action_65 (32) = happyShift action_94
action_65 _ = happyFail

action_66 _ = happyReduce_39

action_67 _ = happyReduce_34

action_68 (29) = happyShift action_11
action_68 (30) = happyShift action_12
action_68 (32) = happyShift action_13
action_68 (33) = happyShift action_14
action_68 (34) = happyShift action_15
action_68 (38) = happyShift action_16
action_68 (40) = happyShift action_17
action_68 (41) = happyShift action_18
action_68 (45) = happyShift action_69
action_68 (62) = happyShift action_23
action_68 (63) = happyShift action_21
action_68 (5) = happyGoto action_66
action_68 (6) = happyGoto action_6
action_68 (7) = happyGoto action_7
action_68 (17) = happyGoto action_8
action_68 (18) = happyGoto action_92
action_68 (24) = happyGoto action_9
action_68 (28) = happyGoto action_10
action_68 _ = happyFail

action_69 _ = happyReduce_38

action_70 (33) = happyShift action_14
action_70 (34) = happyShift action_15
action_70 (45) = happyShift action_40
action_70 (57) = happyShift action_57
action_70 (15) = happyGoto action_91
action_70 (16) = happyGoto action_34
action_70 (28) = happyGoto action_37
action_70 _ = happyFail

action_71 _ = happyReduce_25

action_72 _ = happyReduce_26

action_73 (33) = happyShift action_14
action_73 (34) = happyShift action_15
action_73 (45) = happyShift action_40
action_73 (57) = happyShift action_57
action_73 (14) = happyGoto action_90
action_73 (15) = happyGoto action_33
action_73 (16) = happyGoto action_34
action_73 (28) = happyGoto action_37
action_73 _ = happyFail

action_74 (33) = happyShift action_14
action_74 (34) = happyShift action_15
action_74 (45) = happyShift action_40
action_74 (56) = happyShift action_41
action_74 (57) = happyShift action_57
action_74 (10) = happyGoto action_30
action_74 (11) = happyGoto action_89
action_74 (14) = happyGoto action_32
action_74 (15) = happyGoto action_33
action_74 (16) = happyGoto action_34
action_74 (28) = happyGoto action_37
action_74 _ = happyFail

action_75 _ = happyReduce_47

action_76 _ = happyReduce_50

action_77 _ = happyReduce_48

action_78 _ = happyReduce_49

action_79 _ = happyReduce_51

action_80 _ = happyReduce_52

action_81 _ = happyReduce_23

action_82 _ = happyReduce_24

action_83 (31) = happyShift action_38
action_83 (32) = happyShift action_39
action_83 (9) = happyGoto action_88
action_83 _ = happyFail

action_84 (31) = happyShift action_38
action_84 (32) = happyShift action_39
action_84 (8) = happyGoto action_87
action_84 (9) = happyGoto action_29
action_84 _ = happyFail

action_85 (33) = happyShift action_14
action_85 (34) = happyShift action_15
action_85 (45) = happyShift action_40
action_85 (16) = happyGoto action_86
action_85 (28) = happyGoto action_37
action_85 _ = happyFail

action_86 (42) = happyShift action_107
action_86 _ = happyFail

action_87 _ = happyReduce_45

action_88 _ = happyReduce_15

action_89 (52) = happyShift action_81
action_89 (53) = happyShift action_82
action_89 (12) = happyGoto action_73
action_89 _ = happyReduce_46

action_90 (54) = happyShift action_71
action_90 (55) = happyShift action_72
action_90 (13) = happyGoto action_70
action_90 _ = happyReduce_20

action_91 _ = happyReduce_27

action_92 _ = happyReduce_33

action_93 (58) = happyShift action_106
action_93 _ = happyFail

action_94 (58) = happyShift action_105
action_94 _ = happyFail

action_95 (59) = happyShift action_102
action_95 (60) = happyShift action_103
action_95 (61) = happyShift action_104
action_95 (20) = happyGoto action_101
action_95 _ = happyFail

action_96 _ = happyReduce_30

action_97 _ = happyReduce_63

action_98 _ = happyReduce_62

action_99 _ = happyReduce_61

action_100 (52) = happyShift action_81
action_100 (53) = happyShift action_82
action_100 (58) = happyShift action_96
action_100 (12) = happyGoto action_73
action_100 _ = happyFail

action_101 (57) = happyShift action_109
action_101 _ = happyFail

action_102 _ = happyReduce_42

action_103 _ = happyReduce_43

action_104 _ = happyReduce_44

action_105 _ = happyReduce_19

action_106 _ = happyReduce_18

action_107 (33) = happyShift action_14
action_107 (34) = happyShift action_15
action_107 (45) = happyShift action_40
action_107 (16) = happyGoto action_108
action_107 (28) = happyGoto action_37
action_107 _ = happyFail

action_108 (35) = happyShift action_4
action_108 (44) = happyShift action_112
action_108 (4) = happyGoto action_111
action_108 _ = happyFail

action_109 (31) = happyShift action_38
action_109 (32) = happyShift action_39
action_109 (33) = happyShift action_14
action_109 (34) = happyShift action_15
action_109 (45) = happyShift action_40
action_109 (56) = happyShift action_41
action_109 (57) = happyShift action_42
action_109 (8) = happyGoto action_28
action_109 (9) = happyGoto action_29
action_109 (10) = happyGoto action_30
action_109 (11) = happyGoto action_31
action_109 (14) = happyGoto action_32
action_109 (15) = happyGoto action_33
action_109 (16) = happyGoto action_34
action_109 (19) = happyGoto action_110
action_109 (21) = happyGoto action_36
action_109 (28) = happyGoto action_37
action_109 _ = happyFail

action_110 (58) = happyShift action_114
action_110 _ = happyFail

action_111 _ = happyReduce_36

action_112 (33) = happyShift action_14
action_112 (34) = happyShift action_15
action_112 (45) = happyShift action_40
action_112 (16) = happyGoto action_113
action_112 (28) = happyGoto action_37
action_112 _ = happyFail

action_113 (35) = happyShift action_4
action_113 (4) = happyGoto action_115
action_113 _ = happyFail

action_114 _ = happyReduce_41

action_115 _ = happyReduce_35

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

happyReduce_4 = happySpecReduce_2  4 happyReduction_4
happyReduction_4 _
	(HappyTerminal (TkLineNumber happy_var_1))
	 =  HappyAbsSyn4
		 ([(happy_var_1, [Return])]
	)
happyReduction_4 _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_1  5 happyReduction_5
happyReduction_5 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 ([happy_var_1]
	)
happyReduction_5 _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_3  5 happyReduction_6
happyReduction_6 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1:happy_var_3
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_1  6 happyReduction_7
happyReduction_7 (HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn6
		 (Command happy_var_1
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_1  6 happyReduction_8
happyReduction_8 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn6
		 (ControlStructure happy_var_1
	)
happyReduction_8 _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_2  6 happyReduction_9
happyReduction_9 (HappyTerminal (TkConst happy_var_2))
	_
	 =  HappyAbsSyn6
		 (Goto ((\(TkIntConst x) -> x)happy_var_2)
	)
happyReduction_9 _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_1  6 happyReduction_10
happyReduction_10 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_10 _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_1  6 happyReduction_11
happyReduction_11 _
	 =  HappyAbsSyn6
		 (Return
	)

happyReduce_12 = happySpecReduce_3  7 happyReduction_12
happyReduction_12 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn7
		 (ArithAssignment happy_var_1 happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  7 happyReduction_13
happyReduction_13 (HappyAbsSyn8  happy_var_3)
	_
	(HappyTerminal (TkStringVar happy_var_1))
	 =  HappyAbsSyn7
		 (StringAssignment (StringVar happy_var_1) happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_1  8 happyReduction_14
happyReduction_14 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (StringOp happy_var_1
	)
happyReduction_14 _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  8 happyReduction_15
happyReduction_15 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (StringExpr (happy_var_1,happy_var_3) "+"
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_1  9 happyReduction_16
happyReduction_16 (HappyTerminal (TkString happy_var_1))
	 =  HappyAbsSyn9
		 (StringLiteral happy_var_1
	)
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_1  9 happyReduction_17
happyReduction_17 (HappyTerminal (TkStringVar happy_var_1))
	 =  HappyAbsSyn9
		 (StringVar_BString (StringVar happy_var_1)
	)
happyReduction_17 _  = notHappyAtAll 

happyReduce_18 = happyReduce 4 10 happyReduction_18
happyReduction_18 (_ `HappyStk`
	(HappyTerminal (TkString happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (Len happy_var_3
	) `HappyStk` happyRest

happyReduce_19 = happyReduce 4 10 happyReduction_19
happyReduction_19 (_ `HappyStk`
	(HappyTerminal (TkStringVar happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (LenVar (StringVar happy_var_3)
	) `HappyStk` happyRest

happyReduce_20 = happySpecReduce_3  11 happyReduction_20
happyReduction_20 (HappyAbsSyn14  happy_var_3)
	(HappyAbsSyn12  happy_var_2)
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (NumExpr (happy_var_1,happy_var_3) happy_var_2
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  11 happyReduction_21
happyReduction_21 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_1  11 happyReduction_22
happyReduction_22 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn11
		 (NumFunc happy_var_1
	)
happyReduction_22 _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_1  12 happyReduction_23
happyReduction_23 _
	 =  HappyAbsSyn12
		 ("+"
	)

happyReduce_24 = happySpecReduce_1  12 happyReduction_24
happyReduction_24 _
	 =  HappyAbsSyn12
		 ("-"
	)

happyReduce_25 = happySpecReduce_1  13 happyReduction_25
happyReduction_25 _
	 =  HappyAbsSyn13
		 ("*"
	)

happyReduce_26 = happySpecReduce_1  13 happyReduction_26
happyReduction_26 _
	 =  HappyAbsSyn13
		 ("/"
	)

happyReduce_27 = happySpecReduce_3  14 happyReduction_27
happyReduction_27 (HappyAbsSyn15  happy_var_3)
	(HappyAbsSyn13  happy_var_2)
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (NumExpr (happy_var_1,happy_var_3) happy_var_2
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_1  14 happyReduction_28
happyReduction_28 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn14
		 (happy_var_1
	)
happyReduction_28 _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_1  15 happyReduction_29
happyReduction_29 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn15
		 (NumOp happy_var_1
	)
happyReduction_29 _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  15 happyReduction_30
happyReduction_30 _
	(HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (happy_var_2
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_1  16 happyReduction_31
happyReduction_31 (HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn16
		 (OpVar happy_var_1
	)
happyReduction_31 _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_1  16 happyReduction_32
happyReduction_32 (HappyTerminal (TkConst happy_var_1))
	 =  HappyAbsSyn16
		 (makeArithOperandConstant happy_var_1
	)
happyReduction_32 _  = notHappyAtAll 

happyReduce_33 = happyReduce 4 17 happyReduction_33
happyReduction_33 ((HappyAbsSyn18  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn19  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (If happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_34 = happySpecReduce_3  17 happyReduction_34
happyReduction_34 (HappyAbsSyn18  happy_var_3)
	(HappyAbsSyn19  happy_var_2)
	_
	 =  HappyAbsSyn17
		 (If happy_var_2 happy_var_3
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happyReduce 9 17 happyReduction_35
happyReduction_35 ((HappyAbsSyn4  happy_var_9) `HappyStk`
	(HappyAbsSyn16  happy_var_8) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn28  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (For happy_var_2 (happy_var_4,happy_var_8,happy_var_6) happy_var_9
	) `HappyStk` happyRest

happyReduce_36 = happyReduce 7 17 happyReduction_36
happyReduction_36 ((HappyAbsSyn4  happy_var_7) `HappyStk`
	(HappyAbsSyn16  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn28  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (For happy_var_2 (happy_var_4,(makeArithOperandConstant (TkIntConst 1)),happy_var_6) happy_var_7
	) `HappyStk` happyRest

happyReduce_37 = happySpecReduce_2  17 happyReduction_37
happyReduction_37 (HappyTerminal (TkConst happy_var_2))
	_
	 =  HappyAbsSyn17
		 (GoSub ((\(TkIntConst x) -> x)happy_var_2)
	)
happyReduction_37 _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_1  18 happyReduction_38
happyReduction_38 (HappyTerminal (TkConst happy_var_1))
	 =  HappyAbsSyn18
		 ([Goto ((\(TkIntConst x) -> x)happy_var_1)]
	)
happyReduction_38 _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_1  18 happyReduction_39
happyReduction_39 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn18
		 (happy_var_1
	)
happyReduction_39 _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_1  19 happyReduction_40
happyReduction_40 (HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn19
		 (happy_var_1
	)
happyReduction_40 _  = notHappyAtAll 

happyReduce_41 = happyReduce 7 19 happyReduction_41
happyReduction_41 (_ `HappyStk`
	(HappyAbsSyn19  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn20  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn19  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn19
		 (BoolExprLog (happy_var_2,happy_var_6) happy_var_4
	) `HappyStk` happyRest

happyReduce_42 = happySpecReduce_1  20 happyReduction_42
happyReduction_42 _
	 =  HappyAbsSyn20
		 ("||"
	)

happyReduce_43 = happySpecReduce_1  20 happyReduction_43
happyReduction_43 _
	 =  HappyAbsSyn20
		 ("&&"
	)

happyReduce_44 = happySpecReduce_1  20 happyReduction_44
happyReduction_44 _
	 =  HappyAbsSyn20
		 ("neg"
	)

happyReduce_45 = happySpecReduce_3  21 happyReduction_45
happyReduction_45 (HappyAbsSyn8  happy_var_3)
	(HappyAbsSyn22  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn21
		 (BoolExprString (happy_var_1,happy_var_3) happy_var_2
	)
happyReduction_45 _ _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_3  21 happyReduction_46
happyReduction_46 (HappyAbsSyn11  happy_var_3)
	(HappyAbsSyn22  happy_var_2)
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn21
		 (BoolExprNum (happy_var_1,happy_var_3) happy_var_2
	)
happyReduction_46 _ _ _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_1  22 happyReduction_47
happyReduction_47 _
	 =  HappyAbsSyn22
		 ("=="
	)

happyReduce_48 = happySpecReduce_1  22 happyReduction_48
happyReduction_48 _
	 =  HappyAbsSyn22
		 ("<"
	)

happyReduce_49 = happySpecReduce_1  22 happyReduction_49
happyReduction_49 _
	 =  HappyAbsSyn22
		 (">"
	)

happyReduce_50 = happySpecReduce_1  22 happyReduction_50
happyReduction_50 _
	 =  HappyAbsSyn22
		 ("/="
	)

happyReduce_51 = happySpecReduce_1  22 happyReduction_51
happyReduction_51 _
	 =  HappyAbsSyn22
		 ("<="
	)

happyReduce_52 = happySpecReduce_1  22 happyReduction_52
happyReduction_52 _
	 =  HappyAbsSyn22
		 (">="
	)

happyReduce_53 = happySpecReduce_1  23 happyReduction_53
happyReduction_53 (HappyTerminal (TkConst happy_var_1))
	 =  HappyAbsSyn23
		 (happy_var_1
	)
happyReduction_53 _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_2  24 happyReduction_54
happyReduction_54 (HappyAbsSyn25  happy_var_2)
	_
	 =  HappyAbsSyn24
		 (Print happy_var_2
	)
happyReduction_54 _ _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_1  24 happyReduction_55
happyReduction_55 _
	 =  HappyAbsSyn24
		 (Print ([], True)
	)

happyReduce_56 = happySpecReduce_2  24 happyReduction_56
happyReduction_56 (HappyAbsSyn26  happy_var_2)
	_
	 =  HappyAbsSyn24
		 (Input happy_var_2
	)
happyReduction_56 _ _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_1  25 happyReduction_57
happyReduction_57 (HappyTerminal (TkString happy_var_1))
	 =  HappyAbsSyn25
		 (([OutString happy_var_1], True)
	)
happyReduction_57 _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_2  25 happyReduction_58
happyReduction_58 _
	(HappyTerminal (TkString happy_var_1))
	 =  HappyAbsSyn25
		 (([OutString happy_var_1], False)
	)
happyReduction_58 _ _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_1  25 happyReduction_59
happyReduction_59 (HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn25
		 (([OutVar happy_var_1], True)
	)
happyReduction_59 _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_2  25 happyReduction_60
happyReduction_60 _
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn25
		 (([OutVar happy_var_1], False)
	)
happyReduction_60 _ _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_3  25 happyReduction_61
happyReduction_61 (HappyAbsSyn25  happy_var_3)
	_
	(HappyTerminal (TkString happy_var_1))
	 =  HappyAbsSyn25
		 (((OutString happy_var_1):(fst happy_var_3), snd (happy_var_3))
	)
happyReduction_61 _ _ _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_3  25 happyReduction_62
happyReduction_62 (HappyAbsSyn25  happy_var_3)
	_
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn25
		 (((OutVar happy_var_1):(fst happy_var_3), snd (happy_var_3))
	)
happyReduction_62 _ _ _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_3  26 happyReduction_63
happyReduction_63 (HappyAbsSyn27  happy_var_3)
	_
	(HappyTerminal (TkString happy_var_1))
	 =  HappyAbsSyn26
		 ((InputStuff [happy_var_1] happy_var_3, False)
	)
happyReduction_63 _ _ _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_2  26 happyReduction_64
happyReduction_64 (HappyAbsSyn27  happy_var_2)
	(HappyTerminal (TkString happy_var_1))
	 =  HappyAbsSyn26
		 ((InputStuff [happy_var_1] happy_var_2, True)
	)
happyReduction_64 _ _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_1  26 happyReduction_65
happyReduction_65 (HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn26
		 ((InputStuff [] happy_var_1, False)
	)
happyReduction_65 _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_1  27 happyReduction_66
happyReduction_66 (HappyTerminal (TkStringVar happy_var_1))
	 =  HappyAbsSyn27
		 (StringVar_Var (StringVar happy_var_1)
	)
happyReduction_66 _  = notHappyAtAll 

happyReduce_67 = happySpecReduce_1  27 happyReduction_67
happyReduction_67 (HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn27
		 (NumVar_Var happy_var_1
	)
happyReduction_67 _  = notHappyAtAll 

happyReduce_68 = happySpecReduce_1  28 happyReduction_68
happyReduction_68 (HappyTerminal (TkIntVar happy_var_1))
	 =  HappyAbsSyn28
		 (IntVar happy_var_1
	)
happyReduction_68 _  = notHappyAtAll 

happyReduce_69 = happySpecReduce_1  28 happyReduction_69
happyReduction_69 (HappyTerminal (TkFloatVar happy_var_1))
	 =  HappyAbsSyn28
		 (FloatVar happy_var_1
	)
happyReduction_69 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 64 64 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TkPrint -> cont 29;
	TkInput -> cont 30;
	TkString happy_dollar_dollar -> cont 31;
	TkStringVar happy_dollar_dollar -> cont 32;
	TkIntVar happy_dollar_dollar -> cont 33;
	TkFloatVar happy_dollar_dollar -> cont 34;
	TkLineNumber happy_dollar_dollar -> cont 35;
	TkStringConcat -> cont 36;
	TkSingleLineCommandCombinator -> cont 37;
	TkIf -> cont 38;
	TkThen -> cont 39;
	TkGoto -> cont 40;
	TkFor -> cont 41;
	TkTo -> cont 42;
	TkNext -> cont 43;
	TkStep -> cont 44;
	TkConst happy_dollar_dollar -> cont 45;
	TkEqual -> cont 46;
	TkUnEqual -> cont 47;
	TkLt -> cont 48;
	TkGt -> cont 49;
	TkLE -> cont 50;
	TkGE -> cont 51;
	TkPlus -> cont 52;
	TkMinus -> cont 53;
	TkTimes -> cont 54;
	TkDiv -> cont 55;
	TkLen -> cont 56;
	TkBracketOpen -> cont 57;
	TkBracketClose -> cont 58;
	TkLogOr -> cont 59;
	TkLogAnd -> cont 60;
	TkLogNeg -> cont 61;
	TkReturn -> cont 62;
	TkGoSub -> cont 63;
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
      | Return
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
--    | GoSub Int [(Int,[Command])] 
      | GoSub Int 
-- Ruecksprungpunkt ist ja schon durch die ZeilenNr des gosub Befehls gegeben, und muss eigentlich nicht nochmal extra aufgeschrieben werden
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
     -- = NumExpr (Operand,Operand) String
      = NumExpr (NumExpr,NumExpr) String
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
