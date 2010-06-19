{-# OPTIONS_GHC -fno-warn-overlapping-patterns #-}
--module BasicHap(getParseTree,SyntaxTree, Command, IOCommand, Vars) where
module BasicHap where

import BasicAlex
import Data.Char

-- parser produced by Happy Version 1.18.4

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26 t27 t28 t29
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
	| HappyAbsSyn29 t29

action_0 (36) = happyShift action_4
action_0 (4) = happyGoto action_3
action_0 _ = happyFail

action_1 (36) = happyShift action_2
action_1 _ = happyFail

action_2 (30) = happyShift action_11
action_2 (31) = happyShift action_12
action_2 (33) = happyShift action_13
action_2 (34) = happyShift action_14
action_2 (35) = happyShift action_15
action_2 (40) = happyShift action_16
action_2 (42) = happyShift action_17
action_2 (43) = happyShift action_18
action_2 (64) = happyShift action_25
action_2 (65) = happyShift action_21
action_2 (66) = happyShift action_22
action_2 (68) = happyShift action_23
action_2 (5) = happyGoto action_24
action_2 (6) = happyGoto action_6
action_2 (7) = happyGoto action_7
action_2 (17) = happyGoto action_8
action_2 (24) = happyGoto action_9
action_2 (29) = happyGoto action_10
action_2 _ = happyFail

action_3 (70) = happyAccept
action_3 _ = happyFail

action_4 (30) = happyShift action_11
action_4 (31) = happyShift action_12
action_4 (33) = happyShift action_13
action_4 (34) = happyShift action_14
action_4 (35) = happyShift action_15
action_4 (40) = happyShift action_16
action_4 (42) = happyShift action_17
action_4 (43) = happyShift action_18
action_4 (45) = happyShift action_19
action_4 (64) = happyShift action_20
action_4 (65) = happyShift action_21
action_4 (66) = happyShift action_22
action_4 (68) = happyShift action_23
action_4 (5) = happyGoto action_5
action_4 (6) = happyGoto action_6
action_4 (7) = happyGoto action_7
action_4 (17) = happyGoto action_8
action_4 (24) = happyGoto action_9
action_4 (29) = happyGoto action_10
action_4 _ = happyFail

action_5 (36) = happyShift action_4
action_5 (4) = happyGoto action_60
action_5 _ = happyReduce_1

action_6 (38) = happyShift action_59
action_6 _ = happyReduce_5

action_7 _ = happyReduce_10

action_8 _ = happyReduce_8

action_9 _ = happyReduce_7

action_10 (48) = happyShift action_58
action_10 _ = happyFail

action_11 (32) = happyShift action_57
action_11 (33) = happyShift action_28
action_11 (34) = happyShift action_14
action_11 (35) = happyShift action_15
action_11 (25) = happyGoto action_55
action_11 (28) = happyGoto action_56
action_11 (29) = happyGoto action_27
action_11 _ = happyReduce_59

action_12 (32) = happyShift action_54
action_12 (33) = happyShift action_28
action_12 (34) = happyShift action_14
action_12 (35) = happyShift action_15
action_12 (26) = happyGoto action_51
action_12 (27) = happyGoto action_52
action_12 (28) = happyGoto action_53
action_12 (29) = happyGoto action_27
action_12 _ = happyFail

action_13 (48) = happyShift action_50
action_13 _ = happyFail

action_14 _ = happyReduce_75

action_15 _ = happyReduce_76

action_16 (32) = happyShift action_43
action_16 (33) = happyShift action_44
action_16 (34) = happyShift action_14
action_16 (35) = happyShift action_15
action_16 (47) = happyShift action_45
action_16 (58) = happyShift action_46
action_16 (59) = happyShift action_47
action_16 (67) = happyShift action_48
action_16 (69) = happyShift action_49
action_16 (8) = happyGoto action_33
action_16 (9) = happyGoto action_34
action_16 (10) = happyGoto action_35
action_16 (11) = happyGoto action_36
action_16 (14) = happyGoto action_37
action_16 (15) = happyGoto action_38
action_16 (16) = happyGoto action_39
action_16 (19) = happyGoto action_40
action_16 (21) = happyGoto action_41
action_16 (29) = happyGoto action_42
action_16 _ = happyFail

action_17 (47) = happyShift action_32
action_17 _ = happyFail

action_18 (34) = happyShift action_14
action_18 (35) = happyShift action_15
action_18 (29) = happyGoto action_31
action_18 _ = happyFail

action_19 (34) = happyShift action_14
action_19 (35) = happyShift action_15
action_19 (29) = happyGoto action_30
action_19 _ = happyFail

action_20 (36) = happyReduce_11
action_20 (38) = happyReduce_11
action_20 (70) = happyReduce_11
action_20 _ = happyReduce_11

action_21 (47) = happyShift action_29
action_21 _ = happyFail

action_22 _ = happyReduce_12

action_23 (33) = happyShift action_28
action_23 (34) = happyShift action_14
action_23 (35) = happyShift action_15
action_23 (28) = happyGoto action_26
action_23 (29) = happyGoto action_27
action_23 _ = happyFail

action_24 _ = happyFail

action_25 _ = happyReduce_11

action_26 _ = happyReduce_61

action_27 _ = happyReduce_74

action_28 _ = happyReduce_73

action_29 _ = happyReduce_41

action_30 _ = happyReduce_3

action_31 (48) = happyShift action_94
action_31 _ = happyFail

action_32 _ = happyReduce_9

action_33 (48) = happyShift action_84
action_33 (49) = happyShift action_85
action_33 (50) = happyShift action_86
action_33 (51) = happyShift action_87
action_33 (52) = happyShift action_88
action_33 (53) = happyShift action_89
action_33 (22) = happyGoto action_93
action_33 _ = happyFail

action_34 (54) = happyShift action_92
action_34 _ = happyReduce_15

action_35 (30) = happyReduce_34
action_35 (31) = happyReduce_34
action_35 (33) = happyReduce_34
action_35 (34) = happyReduce_34
action_35 (35) = happyReduce_34
action_35 (36) = happyReduce_34
action_35 (38) = happyReduce_34
action_35 (40) = happyReduce_34
action_35 (41) = happyReduce_34
action_35 (42) = happyReduce_34
action_35 (43) = happyReduce_34
action_35 (47) = happyReduce_34
action_35 (48) = happyReduce_34
action_35 (49) = happyReduce_34
action_35 (50) = happyReduce_34
action_35 (51) = happyReduce_34
action_35 (52) = happyReduce_34
action_35 (53) = happyReduce_34
action_35 (54) = happyReduce_34
action_35 (55) = happyReduce_34
action_35 (60) = happyReduce_34
action_35 (64) = happyReduce_34
action_35 (65) = happyReduce_34
action_35 (66) = happyReduce_34
action_35 (68) = happyReduce_34
action_35 (70) = happyReduce_34
action_35 _ = happyReduce_34

action_36 (48) = happyShift action_84
action_36 (49) = happyShift action_85
action_36 (50) = happyShift action_86
action_36 (51) = happyShift action_87
action_36 (52) = happyShift action_88
action_36 (53) = happyShift action_89
action_36 (54) = happyShift action_90
action_36 (55) = happyShift action_91
action_36 (12) = happyGoto action_82
action_36 (22) = happyGoto action_83
action_36 _ = happyFail

action_37 (56) = happyShift action_80
action_37 (57) = happyShift action_81
action_37 (13) = happyGoto action_79
action_37 _ = happyReduce_24

action_38 _ = happyReduce_31

action_39 _ = happyReduce_32

action_40 (30) = happyShift action_11
action_40 (31) = happyShift action_12
action_40 (33) = happyShift action_13
action_40 (34) = happyShift action_14
action_40 (35) = happyShift action_15
action_40 (40) = happyShift action_16
action_40 (41) = happyShift action_77
action_40 (42) = happyShift action_17
action_40 (43) = happyShift action_18
action_40 (47) = happyShift action_78
action_40 (64) = happyShift action_25
action_40 (65) = happyShift action_21
action_40 (66) = happyShift action_22
action_40 (68) = happyShift action_23
action_40 (5) = happyGoto action_75
action_40 (6) = happyGoto action_6
action_40 (7) = happyGoto action_7
action_40 (17) = happyGoto action_8
action_40 (18) = happyGoto action_76
action_40 (24) = happyGoto action_9
action_40 (29) = happyGoto action_10
action_40 _ = happyFail

action_41 _ = happyReduce_44

action_42 _ = happyReduce_35

action_43 _ = happyReduce_17

action_44 _ = happyReduce_18

action_45 _ = happyReduce_36

action_46 (59) = happyShift action_74
action_46 _ = happyFail

action_47 (32) = happyShift action_43
action_47 (33) = happyShift action_44
action_47 (34) = happyShift action_14
action_47 (35) = happyShift action_15
action_47 (47) = happyShift action_45
action_47 (58) = happyShift action_46
action_47 (59) = happyShift action_47
action_47 (67) = happyShift action_48
action_47 (69) = happyShift action_49
action_47 (8) = happyGoto action_33
action_47 (9) = happyGoto action_34
action_47 (10) = happyGoto action_35
action_47 (11) = happyGoto action_72
action_47 (14) = happyGoto action_37
action_47 (15) = happyGoto action_38
action_47 (16) = happyGoto action_39
action_47 (19) = happyGoto action_73
action_47 (21) = happyGoto action_41
action_47 (29) = happyGoto action_42
action_47 _ = happyFail

action_48 (59) = happyShift action_71
action_48 _ = happyFail

action_49 (59) = happyShift action_70
action_49 _ = happyFail

action_50 (32) = happyShift action_43
action_50 (33) = happyShift action_44
action_50 (8) = happyGoto action_69
action_50 (9) = happyGoto action_34
action_50 _ = happyFail

action_51 _ = happyReduce_60

action_52 _ = happyReduce_70

action_53 (39) = happyShift action_68
action_53 _ = happyReduce_71

action_54 (33) = happyShift action_28
action_54 (34) = happyShift action_14
action_54 (35) = happyShift action_15
action_54 (37) = happyShift action_67
action_54 (27) = happyGoto action_66
action_54 (28) = happyGoto action_53
action_54 (29) = happyGoto action_27
action_54 _ = happyFail

action_55 _ = happyReduce_58

action_56 (37) = happyShift action_65
action_56 _ = happyReduce_64

action_57 (37) = happyShift action_64
action_57 _ = happyReduce_62

action_58 (34) = happyShift action_14
action_58 (35) = happyShift action_15
action_58 (47) = happyShift action_45
action_58 (58) = happyShift action_46
action_58 (59) = happyShift action_63
action_58 (67) = happyShift action_48
action_58 (69) = happyShift action_49
action_58 (10) = happyGoto action_35
action_58 (11) = happyGoto action_62
action_58 (14) = happyGoto action_37
action_58 (15) = happyGoto action_38
action_58 (16) = happyGoto action_39
action_58 (29) = happyGoto action_42
action_58 _ = happyFail

action_59 (30) = happyShift action_11
action_59 (31) = happyShift action_12
action_59 (33) = happyShift action_13
action_59 (34) = happyShift action_14
action_59 (35) = happyShift action_15
action_59 (40) = happyShift action_16
action_59 (42) = happyShift action_17
action_59 (43) = happyShift action_18
action_59 (64) = happyShift action_25
action_59 (65) = happyShift action_21
action_59 (66) = happyShift action_22
action_59 (68) = happyShift action_23
action_59 (5) = happyGoto action_61
action_59 (6) = happyGoto action_6
action_59 (7) = happyGoto action_7
action_59 (17) = happyGoto action_8
action_59 (24) = happyGoto action_9
action_59 (29) = happyGoto action_10
action_59 _ = happyFail

action_60 _ = happyReduce_2

action_61 _ = happyReduce_6

action_62 (54) = happyShift action_90
action_62 (55) = happyShift action_91
action_62 (12) = happyGoto action_82
action_62 _ = happyReduce_13

action_63 (34) = happyShift action_14
action_63 (35) = happyShift action_15
action_63 (47) = happyShift action_45
action_63 (58) = happyShift action_46
action_63 (59) = happyShift action_63
action_63 (67) = happyShift action_48
action_63 (69) = happyShift action_49
action_63 (10) = happyGoto action_35
action_63 (11) = happyGoto action_113
action_63 (14) = happyGoto action_37
action_63 (15) = happyGoto action_38
action_63 (16) = happyGoto action_39
action_63 (29) = happyGoto action_42
action_63 _ = happyFail

action_64 (32) = happyShift action_57
action_64 (33) = happyShift action_28
action_64 (34) = happyShift action_14
action_64 (35) = happyShift action_15
action_64 (25) = happyGoto action_112
action_64 (28) = happyGoto action_56
action_64 (29) = happyGoto action_27
action_64 _ = happyReduce_63

action_65 (32) = happyShift action_57
action_65 (33) = happyShift action_28
action_65 (34) = happyShift action_14
action_65 (35) = happyShift action_15
action_65 (25) = happyGoto action_111
action_65 (28) = happyGoto action_56
action_65 (29) = happyGoto action_27
action_65 _ = happyReduce_65

action_66 _ = happyReduce_69

action_67 (33) = happyShift action_28
action_67 (34) = happyShift action_14
action_67 (35) = happyShift action_15
action_67 (27) = happyGoto action_110
action_67 (28) = happyGoto action_53
action_67 (29) = happyGoto action_27
action_67 _ = happyFail

action_68 (33) = happyShift action_28
action_68 (34) = happyShift action_14
action_68 (35) = happyShift action_15
action_68 (27) = happyGoto action_109
action_68 (28) = happyGoto action_53
action_68 (29) = happyGoto action_27
action_68 _ = happyFail

action_69 _ = happyReduce_14

action_70 (34) = happyShift action_14
action_70 (35) = happyShift action_15
action_70 (47) = happyShift action_45
action_70 (58) = happyShift action_46
action_70 (59) = happyShift action_63
action_70 (67) = happyShift action_48
action_70 (69) = happyShift action_49
action_70 (10) = happyGoto action_35
action_70 (11) = happyGoto action_108
action_70 (14) = happyGoto action_37
action_70 (15) = happyGoto action_38
action_70 (16) = happyGoto action_39
action_70 (29) = happyGoto action_42
action_70 _ = happyFail

action_71 (47) = happyShift action_107
action_71 _ = happyFail

action_72 (48) = happyShift action_84
action_72 (49) = happyShift action_85
action_72 (50) = happyShift action_86
action_72 (51) = happyShift action_87
action_72 (52) = happyShift action_88
action_72 (53) = happyShift action_89
action_72 (54) = happyShift action_90
action_72 (55) = happyShift action_91
action_72 (60) = happyShift action_106
action_72 (12) = happyGoto action_82
action_72 (22) = happyGoto action_83
action_72 _ = happyFail

action_73 (60) = happyShift action_105
action_73 _ = happyFail

action_74 (32) = happyShift action_103
action_74 (33) = happyShift action_104
action_74 _ = happyFail

action_75 _ = happyReduce_43

action_76 _ = happyReduce_38

action_77 (30) = happyShift action_11
action_77 (31) = happyShift action_12
action_77 (33) = happyShift action_13
action_77 (34) = happyShift action_14
action_77 (35) = happyShift action_15
action_77 (40) = happyShift action_16
action_77 (42) = happyShift action_17
action_77 (43) = happyShift action_18
action_77 (47) = happyShift action_78
action_77 (64) = happyShift action_25
action_77 (65) = happyShift action_21
action_77 (66) = happyShift action_22
action_77 (68) = happyShift action_23
action_77 (5) = happyGoto action_75
action_77 (6) = happyGoto action_6
action_77 (7) = happyGoto action_7
action_77 (17) = happyGoto action_8
action_77 (18) = happyGoto action_102
action_77 (24) = happyGoto action_9
action_77 (29) = happyGoto action_10
action_77 _ = happyFail

action_78 _ = happyReduce_42

action_79 (34) = happyShift action_14
action_79 (35) = happyShift action_15
action_79 (47) = happyShift action_45
action_79 (58) = happyShift action_46
action_79 (59) = happyShift action_63
action_79 (67) = happyShift action_48
action_79 (69) = happyShift action_49
action_79 (10) = happyGoto action_99
action_79 (15) = happyGoto action_101
action_79 (16) = happyGoto action_39
action_79 (29) = happyGoto action_42
action_79 _ = happyFail

action_80 _ = happyReduce_28

action_81 _ = happyReduce_29

action_82 (34) = happyShift action_14
action_82 (35) = happyShift action_15
action_82 (47) = happyShift action_45
action_82 (58) = happyShift action_46
action_82 (59) = happyShift action_63
action_82 (67) = happyShift action_48
action_82 (69) = happyShift action_49
action_82 (10) = happyGoto action_99
action_82 (14) = happyGoto action_100
action_82 (15) = happyGoto action_38
action_82 (16) = happyGoto action_39
action_82 (29) = happyGoto action_42
action_82 _ = happyFail

action_83 (34) = happyShift action_14
action_83 (35) = happyShift action_15
action_83 (47) = happyShift action_45
action_83 (58) = happyShift action_46
action_83 (59) = happyShift action_63
action_83 (67) = happyShift action_48
action_83 (69) = happyShift action_49
action_83 (10) = happyGoto action_35
action_83 (11) = happyGoto action_98
action_83 (14) = happyGoto action_37
action_83 (15) = happyGoto action_38
action_83 (16) = happyGoto action_39
action_83 (29) = happyGoto action_42
action_83 _ = happyFail

action_84 _ = happyReduce_51

action_85 _ = happyReduce_54

action_86 _ = happyReduce_52

action_87 _ = happyReduce_53

action_88 _ = happyReduce_55

action_89 _ = happyReduce_56

action_90 _ = happyReduce_26

action_91 _ = happyReduce_27

action_92 (32) = happyShift action_43
action_92 (33) = happyShift action_44
action_92 (9) = happyGoto action_97
action_92 _ = happyFail

action_93 (32) = happyShift action_43
action_93 (33) = happyShift action_44
action_93 (8) = happyGoto action_96
action_93 (9) = happyGoto action_34
action_93 _ = happyFail

action_94 (34) = happyShift action_14
action_94 (35) = happyShift action_15
action_94 (47) = happyShift action_45
action_94 (16) = happyGoto action_95
action_94 (29) = happyGoto action_42
action_94 _ = happyFail

action_95 (44) = happyShift action_122
action_95 _ = happyFail

action_96 _ = happyReduce_49

action_97 _ = happyReduce_16

action_98 (54) = happyShift action_90
action_98 (55) = happyShift action_91
action_98 (12) = happyGoto action_82
action_98 _ = happyReduce_50

action_99 _ = happyReduce_34

action_100 (56) = happyShift action_80
action_100 (57) = happyShift action_81
action_100 (13) = happyGoto action_79
action_100 _ = happyReduce_23

action_101 _ = happyReduce_30

action_102 _ = happyReduce_37

action_103 (60) = happyShift action_121
action_103 _ = happyFail

action_104 (60) = happyShift action_120
action_104 _ = happyFail

action_105 (61) = happyShift action_117
action_105 (62) = happyShift action_118
action_105 (63) = happyShift action_119
action_105 (20) = happyGoto action_116
action_105 _ = happyFail

action_106 _ = happyReduce_33

action_107 (60) = happyShift action_115
action_107 _ = happyFail

action_108 (54) = happyShift action_90
action_108 (55) = happyShift action_91
action_108 (60) = happyShift action_114
action_108 (12) = happyGoto action_82
action_108 _ = happyFail

action_109 _ = happyReduce_72

action_110 _ = happyReduce_68

action_111 _ = happyReduce_67

action_112 _ = happyReduce_66

action_113 (54) = happyShift action_90
action_113 (55) = happyShift action_91
action_113 (60) = happyShift action_106
action_113 (12) = happyGoto action_82
action_113 _ = happyFail

action_114 _ = happyReduce_22

action_115 _ = happyReduce_21

action_116 (59) = happyShift action_124
action_116 _ = happyFail

action_117 _ = happyReduce_46

action_118 _ = happyReduce_47

action_119 _ = happyReduce_48

action_120 _ = happyReduce_20

action_121 _ = happyReduce_19

action_122 (34) = happyShift action_14
action_122 (35) = happyShift action_15
action_122 (47) = happyShift action_45
action_122 (16) = happyGoto action_123
action_122 (29) = happyGoto action_42
action_122 _ = happyFail

action_123 (36) = happyShift action_4
action_123 (46) = happyShift action_127
action_123 (4) = happyGoto action_126
action_123 _ = happyFail

action_124 (32) = happyShift action_43
action_124 (33) = happyShift action_44
action_124 (34) = happyShift action_14
action_124 (35) = happyShift action_15
action_124 (47) = happyShift action_45
action_124 (58) = happyShift action_46
action_124 (59) = happyShift action_47
action_124 (67) = happyShift action_48
action_124 (69) = happyShift action_49
action_124 (8) = happyGoto action_33
action_124 (9) = happyGoto action_34
action_124 (10) = happyGoto action_35
action_124 (11) = happyGoto action_36
action_124 (14) = happyGoto action_37
action_124 (15) = happyGoto action_38
action_124 (16) = happyGoto action_39
action_124 (19) = happyGoto action_125
action_124 (21) = happyGoto action_41
action_124 (29) = happyGoto action_42
action_124 _ = happyFail

action_125 (60) = happyShift action_129
action_125 _ = happyFail

action_126 _ = happyReduce_40

action_127 (34) = happyShift action_14
action_127 (35) = happyShift action_15
action_127 (47) = happyShift action_45
action_127 (16) = happyGoto action_128
action_127 (29) = happyGoto action_42
action_127 _ = happyFail

action_128 (36) = happyShift action_4
action_128 (4) = happyGoto action_130
action_128 _ = happyFail

action_129 _ = happyReduce_45

action_130 _ = happyReduce_39

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

happyReduce_12 = happySpecReduce_1  6 happyReduction_12
happyReduction_12 _
	 =  HappyAbsSyn6
		 (End
	)

happyReduce_13 = happySpecReduce_3  7 happyReduction_13
happyReduction_13 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn7
		 (ArithAssignment happy_var_1 happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  7 happyReduction_14
happyReduction_14 (HappyAbsSyn8  happy_var_3)
	_
	(HappyTerminal (TkStringVar happy_var_1))
	 =  HappyAbsSyn7
		 (StringAssignment (StringVar happy_var_1) happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_1  8 happyReduction_15
happyReduction_15 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (StringOp happy_var_1
	)
happyReduction_15 _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  8 happyReduction_16
happyReduction_16 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (StringExpr (happy_var_1,happy_var_3) "+"
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_1  9 happyReduction_17
happyReduction_17 (HappyTerminal (TkString happy_var_1))
	 =  HappyAbsSyn9
		 (StringLiteral happy_var_1
	)
happyReduction_17 _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  9 happyReduction_18
happyReduction_18 (HappyTerminal (TkStringVar happy_var_1))
	 =  HappyAbsSyn9
		 (StringVar_BString (StringVar happy_var_1)
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happyReduce 4 10 happyReduction_19
happyReduction_19 (_ `HappyStk`
	(HappyTerminal (TkString happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (Len happy_var_3
	) `HappyStk` happyRest

happyReduce_20 = happyReduce 4 10 happyReduction_20
happyReduction_20 (_ `HappyStk`
	(HappyTerminal (TkStringVar happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (LenVar (StringVar happy_var_3)
	) `HappyStk` happyRest

happyReduce_21 = happyReduce 4 10 happyReduction_21
happyReduction_21 (_ `HappyStk`
	(HappyTerminal (TkConst happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (Random ((\(TkIntConst x) -> x)happy_var_3)
	) `HappyStk` happyRest

happyReduce_22 = happyReduce 4 10 happyReduction_22
happyReduction_22 (_ `HappyStk`
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (IntFunc happy_var_3
	) `HappyStk` happyRest

happyReduce_23 = happySpecReduce_3  11 happyReduction_23
happyReduction_23 (HappyAbsSyn14  happy_var_3)
	(HappyAbsSyn12  happy_var_2)
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (NumExpr (happy_var_1,happy_var_3) happy_var_2
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_1  11 happyReduction_24
happyReduction_24 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1
	)
happyReduction_24 _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_1  11 happyReduction_25
happyReduction_25 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn11
		 (NumFunc happy_var_1
	)
happyReduction_25 _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_1  12 happyReduction_26
happyReduction_26 _
	 =  HappyAbsSyn12
		 ("+"
	)

happyReduce_27 = happySpecReduce_1  12 happyReduction_27
happyReduction_27 _
	 =  HappyAbsSyn12
		 ("-"
	)

happyReduce_28 = happySpecReduce_1  13 happyReduction_28
happyReduction_28 _
	 =  HappyAbsSyn13
		 ("*"
	)

happyReduce_29 = happySpecReduce_1  13 happyReduction_29
happyReduction_29 _
	 =  HappyAbsSyn13
		 ("/"
	)

happyReduce_30 = happySpecReduce_3  14 happyReduction_30
happyReduction_30 (HappyAbsSyn15  happy_var_3)
	(HappyAbsSyn13  happy_var_2)
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (NumExpr (happy_var_1,happy_var_3) happy_var_2
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_1  14 happyReduction_31
happyReduction_31 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn14
		 (happy_var_1
	)
happyReduction_31 _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_1  15 happyReduction_32
happyReduction_32 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn15
		 (NumOp happy_var_1
	)
happyReduction_32 _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  15 happyReduction_33
happyReduction_33 _
	(HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (happy_var_2
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_1  15 happyReduction_34
happyReduction_34 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn15
		 (NumFunc happy_var_1
	)
happyReduction_34 _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_1  16 happyReduction_35
happyReduction_35 (HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn16
		 (OpVar happy_var_1
	)
happyReduction_35 _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_1  16 happyReduction_36
happyReduction_36 (HappyTerminal (TkConst happy_var_1))
	 =  HappyAbsSyn16
		 (makeArithOperandConstant happy_var_1
	)
happyReduction_36 _  = notHappyAtAll 

happyReduce_37 = happyReduce 4 17 happyReduction_37
happyReduction_37 ((HappyAbsSyn18  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn19  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (If happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_38 = happySpecReduce_3  17 happyReduction_38
happyReduction_38 (HappyAbsSyn18  happy_var_3)
	(HappyAbsSyn19  happy_var_2)
	_
	 =  HappyAbsSyn17
		 (If happy_var_2 happy_var_3
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happyReduce 9 17 happyReduction_39
happyReduction_39 ((HappyAbsSyn4  happy_var_9) `HappyStk`
	(HappyAbsSyn16  happy_var_8) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn29  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (For happy_var_2 (happy_var_4,happy_var_8,happy_var_6) happy_var_9
	) `HappyStk` happyRest

happyReduce_40 = happyReduce 7 17 happyReduction_40
happyReduction_40 ((HappyAbsSyn4  happy_var_7) `HappyStk`
	(HappyAbsSyn16  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn29  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (For happy_var_2 (happy_var_4,(makeArithOperandConstant (TkIntConst 1)),happy_var_6) happy_var_7
	) `HappyStk` happyRest

happyReduce_41 = happySpecReduce_2  17 happyReduction_41
happyReduction_41 (HappyTerminal (TkConst happy_var_2))
	_
	 =  HappyAbsSyn17
		 (GoSub ((\(TkIntConst x) -> x)happy_var_2)
	)
happyReduction_41 _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_1  18 happyReduction_42
happyReduction_42 (HappyTerminal (TkConst happy_var_1))
	 =  HappyAbsSyn18
		 ([Goto ((\(TkIntConst x) -> x)happy_var_1)]
	)
happyReduction_42 _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_1  18 happyReduction_43
happyReduction_43 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn18
		 (happy_var_1
	)
happyReduction_43 _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_1  19 happyReduction_44
happyReduction_44 (HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn19
		 (happy_var_1
	)
happyReduction_44 _  = notHappyAtAll 

happyReduce_45 = happyReduce 7 19 happyReduction_45
happyReduction_45 (_ `HappyStk`
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

happyReduce_46 = happySpecReduce_1  20 happyReduction_46
happyReduction_46 _
	 =  HappyAbsSyn20
		 ("||"
	)

happyReduce_47 = happySpecReduce_1  20 happyReduction_47
happyReduction_47 _
	 =  HappyAbsSyn20
		 ("&&"
	)

happyReduce_48 = happySpecReduce_1  20 happyReduction_48
happyReduction_48 _
	 =  HappyAbsSyn20
		 ("neg"
	)

happyReduce_49 = happySpecReduce_3  21 happyReduction_49
happyReduction_49 (HappyAbsSyn8  happy_var_3)
	(HappyAbsSyn22  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn21
		 (BoolExprString (happy_var_1,happy_var_3) happy_var_2
	)
happyReduction_49 _ _ _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_3  21 happyReduction_50
happyReduction_50 (HappyAbsSyn11  happy_var_3)
	(HappyAbsSyn22  happy_var_2)
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn21
		 (BoolExprNum (happy_var_1,happy_var_3) happy_var_2
	)
happyReduction_50 _ _ _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_1  22 happyReduction_51
happyReduction_51 _
	 =  HappyAbsSyn22
		 ("=="
	)

happyReduce_52 = happySpecReduce_1  22 happyReduction_52
happyReduction_52 _
	 =  HappyAbsSyn22
		 ("<"
	)

happyReduce_53 = happySpecReduce_1  22 happyReduction_53
happyReduction_53 _
	 =  HappyAbsSyn22
		 (">"
	)

happyReduce_54 = happySpecReduce_1  22 happyReduction_54
happyReduction_54 _
	 =  HappyAbsSyn22
		 ("/="
	)

happyReduce_55 = happySpecReduce_1  22 happyReduction_55
happyReduction_55 _
	 =  HappyAbsSyn22
		 ("<="
	)

happyReduce_56 = happySpecReduce_1  22 happyReduction_56
happyReduction_56 _
	 =  HappyAbsSyn22
		 (">="
	)

happyReduce_57 = happySpecReduce_1  23 happyReduction_57
happyReduction_57 (HappyTerminal (TkConst happy_var_1))
	 =  HappyAbsSyn23
		 (happy_var_1
	)
happyReduction_57 _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_2  24 happyReduction_58
happyReduction_58 (HappyAbsSyn25  happy_var_2)
	_
	 =  HappyAbsSyn24
		 (Print happy_var_2
	)
happyReduction_58 _ _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_1  24 happyReduction_59
happyReduction_59 _
	 =  HappyAbsSyn24
		 (Print ([], True)
	)

happyReduce_60 = happySpecReduce_2  24 happyReduction_60
happyReduction_60 (HappyAbsSyn26  happy_var_2)
	_
	 =  HappyAbsSyn24
		 (Input happy_var_2
	)
happyReduction_60 _ _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_2  24 happyReduction_61
happyReduction_61 (HappyAbsSyn28  happy_var_2)
	_
	 =  HappyAbsSyn24
		 (Get happy_var_2
	)
happyReduction_61 _ _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_1  25 happyReduction_62
happyReduction_62 (HappyTerminal (TkString happy_var_1))
	 =  HappyAbsSyn25
		 (([OutString happy_var_1], True)
	)
happyReduction_62 _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_2  25 happyReduction_63
happyReduction_63 _
	(HappyTerminal (TkString happy_var_1))
	 =  HappyAbsSyn25
		 (([OutString happy_var_1], False)
	)
happyReduction_63 _ _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_1  25 happyReduction_64
happyReduction_64 (HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn25
		 (([OutVar happy_var_1], True)
	)
happyReduction_64 _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_2  25 happyReduction_65
happyReduction_65 _
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn25
		 (([OutVar happy_var_1], False)
	)
happyReduction_65 _ _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_3  25 happyReduction_66
happyReduction_66 (HappyAbsSyn25  happy_var_3)
	_
	(HappyTerminal (TkString happy_var_1))
	 =  HappyAbsSyn25
		 (((OutString happy_var_1):(fst happy_var_3), snd (happy_var_3))
	)
happyReduction_66 _ _ _  = notHappyAtAll 

happyReduce_67 = happySpecReduce_3  25 happyReduction_67
happyReduction_67 (HappyAbsSyn25  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn25
		 (((OutVar happy_var_1):(fst happy_var_3), snd (happy_var_3))
	)
happyReduction_67 _ _ _  = notHappyAtAll 

happyReduce_68 = happySpecReduce_3  26 happyReduction_68
happyReduction_68 (HappyAbsSyn27  happy_var_3)
	_
	(HappyTerminal (TkString happy_var_1))
	 =  HappyAbsSyn26
		 ((InputStuff [happy_var_1] happy_var_3, False)
	)
happyReduction_68 _ _ _  = notHappyAtAll 

happyReduce_69 = happySpecReduce_2  26 happyReduction_69
happyReduction_69 (HappyAbsSyn27  happy_var_2)
	(HappyTerminal (TkString happy_var_1))
	 =  HappyAbsSyn26
		 ((InputStuff [happy_var_1] happy_var_2, True)
	)
happyReduction_69 _ _  = notHappyAtAll 

happyReduce_70 = happySpecReduce_1  26 happyReduction_70
happyReduction_70 (HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn26
		 ((InputStuff [] happy_var_1, False)
	)
happyReduction_70 _  = notHappyAtAll 

happyReduce_71 = happySpecReduce_1  27 happyReduction_71
happyReduction_71 (HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn27
		 ([happy_var_1]
	)
happyReduction_71 _  = notHappyAtAll 

happyReduce_72 = happySpecReduce_3  27 happyReduction_72
happyReduction_72 (HappyAbsSyn27  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn27
		 (happy_var_1:happy_var_3
	)
happyReduction_72 _ _ _  = notHappyAtAll 

happyReduce_73 = happySpecReduce_1  28 happyReduction_73
happyReduction_73 (HappyTerminal (TkStringVar happy_var_1))
	 =  HappyAbsSyn28
		 (StringVar_Var (StringVar happy_var_1)
	)
happyReduction_73 _  = notHappyAtAll 

happyReduce_74 = happySpecReduce_1  28 happyReduction_74
happyReduction_74 (HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn28
		 (NumVar_Var happy_var_1
	)
happyReduction_74 _  = notHappyAtAll 

happyReduce_75 = happySpecReduce_1  29 happyReduction_75
happyReduction_75 (HappyTerminal (TkIntVar happy_var_1))
	 =  HappyAbsSyn29
		 (IntVar happy_var_1
	)
happyReduction_75 _  = notHappyAtAll 

happyReduce_76 = happySpecReduce_1  29 happyReduction_76
happyReduction_76 (HappyTerminal (TkFloatVar happy_var_1))
	 =  HappyAbsSyn29
		 (FloatVar happy_var_1
	)
happyReduction_76 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 70 70 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TkPrint -> cont 30;
	TkInput -> cont 31;
	TkString happy_dollar_dollar -> cont 32;
	TkStringVar happy_dollar_dollar -> cont 33;
	TkIntVar happy_dollar_dollar -> cont 34;
	TkFloatVar happy_dollar_dollar -> cont 35;
	TkLineNumber happy_dollar_dollar -> cont 36;
	TkStringConcat -> cont 37;
	TkSingleLineCommandCombinator -> cont 38;
	TkKomma -> cont 39;
	TkIf -> cont 40;
	TkThen -> cont 41;
	TkGoto -> cont 42;
	TkFor -> cont 43;
	TkTo -> cont 44;
	TkNext -> cont 45;
	TkStep -> cont 46;
	TkConst happy_dollar_dollar -> cont 47;
	TkEqual -> cont 48;
	TkUnEqual -> cont 49;
	TkLt -> cont 50;
	TkGt -> cont 51;
	TkLE -> cont 52;
	TkGE -> cont 53;
	TkPlus -> cont 54;
	TkMinus -> cont 55;
	TkTimes -> cont 56;
	TkDiv -> cont 57;
	TkLen -> cont 58;
	TkBracketOpen -> cont 59;
	TkBracketClose -> cont 60;
	TkLogOr -> cont 61;
	TkLogAnd -> cont 62;
	TkLogNeg -> cont 63;
	TkReturn -> cont 64;
	TkGoSub -> cont 65;
	TkEnd -> cont 66;
	TkRandom -> cont 67;
	TkGet -> cont 68;
	TkIntFunc -> cont 69;
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
      | End
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
      | Random Int
      | IntFunc NumExpr
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
      | Get Var
      deriving Show

data Output
      = OutString String  
      | OutVar Var
      deriving Show

data InputStuff 
      -- = InputStuff [String] Var
      = InputStuff [String] [Var]
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
