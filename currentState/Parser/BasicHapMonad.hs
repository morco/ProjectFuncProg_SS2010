{-# OPTIONS_GHC -fno-warn-overlapping-patterns #-}
module Parser.BasicHapMonad(getParseTree) where

import Parser.Lexer.BasicAlexMonad(getTokens)
import Parser.ParserTypes

-- import Data.Char
import Data.List(delete)

import Control.Monad.State

import Debug.Trace

import Parser.ParserErrors

-- parser produced by Happy Version 1.18.4

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26 t27 t28 t29 t30
	= HappyTerminal (TokenWrap)
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
	| HappyAbsSyn30 t30

action_0 (37) = happyShift action_6
action_0 (4) = happyGoto action_4
action_0 (5) = happyGoto action_5
action_0 _ = happyFail

action_1 (37) = happyShift action_3
action_1 (5) = happyGoto action_2
action_1 _ = happyFail

action_2 _ = happyFail

action_3 (31) = happyShift action_13
action_3 (32) = happyShift action_14
action_3 (34) = happyShift action_15
action_3 (35) = happyShift action_16
action_3 (36) = happyShift action_17
action_3 (41) = happyShift action_18
action_3 (43) = happyShift action_19
action_3 (44) = happyShift action_20
action_3 (65) = happyShift action_27
action_3 (66) = happyShift action_23
action_3 (67) = happyShift action_24
action_3 (69) = happyShift action_25
action_3 (6) = happyGoto action_7
action_3 (7) = happyGoto action_8
action_3 (8) = happyGoto action_9
action_3 (18) = happyGoto action_10
action_3 (25) = happyGoto action_11
action_3 (30) = happyGoto action_12
action_3 _ = happyFail

action_4 (71) = happyAccept
action_4 _ = happyFail

action_5 (37) = happyShift action_6
action_5 (4) = happyGoto action_26
action_5 (5) = happyGoto action_5
action_5 _ = happyReduce_1

action_6 (31) = happyShift action_13
action_6 (32) = happyShift action_14
action_6 (34) = happyShift action_15
action_6 (35) = happyShift action_16
action_6 (36) = happyShift action_17
action_6 (41) = happyShift action_18
action_6 (43) = happyShift action_19
action_6 (44) = happyShift action_20
action_6 (46) = happyShift action_21
action_6 (65) = happyShift action_22
action_6 (66) = happyShift action_23
action_6 (67) = happyShift action_24
action_6 (69) = happyShift action_25
action_6 (6) = happyGoto action_7
action_6 (7) = happyGoto action_8
action_6 (8) = happyGoto action_9
action_6 (18) = happyGoto action_10
action_6 (25) = happyGoto action_11
action_6 (30) = happyGoto action_12
action_6 _ = happyFail

action_7 _ = happyReduce_5

action_8 (39) = happyShift action_61
action_8 _ = happyReduce_6

action_9 _ = happyReduce_11

action_10 _ = happyReduce_9

action_11 _ = happyReduce_8

action_12 (49) = happyShift action_60
action_12 _ = happyFail

action_13 (33) = happyShift action_59
action_13 (34) = happyShift action_30
action_13 (35) = happyShift action_16
action_13 (36) = happyShift action_17
action_13 (26) = happyGoto action_57
action_13 (29) = happyGoto action_58
action_13 (30) = happyGoto action_29
action_13 _ = happyReduce_60

action_14 (33) = happyShift action_56
action_14 (34) = happyShift action_30
action_14 (35) = happyShift action_16
action_14 (36) = happyShift action_17
action_14 (27) = happyGoto action_53
action_14 (28) = happyGoto action_54
action_14 (29) = happyGoto action_55
action_14 (30) = happyGoto action_29
action_14 _ = happyFail

action_15 (49) = happyShift action_52
action_15 _ = happyFail

action_16 _ = happyReduce_76

action_17 _ = happyReduce_77

action_18 (33) = happyShift action_45
action_18 (34) = happyShift action_46
action_18 (35) = happyShift action_16
action_18 (36) = happyShift action_17
action_18 (48) = happyShift action_47
action_18 (59) = happyShift action_48
action_18 (60) = happyShift action_49
action_18 (68) = happyShift action_50
action_18 (70) = happyShift action_51
action_18 (9) = happyGoto action_35
action_18 (10) = happyGoto action_36
action_18 (11) = happyGoto action_37
action_18 (12) = happyGoto action_38
action_18 (15) = happyGoto action_39
action_18 (16) = happyGoto action_40
action_18 (17) = happyGoto action_41
action_18 (20) = happyGoto action_42
action_18 (22) = happyGoto action_43
action_18 (30) = happyGoto action_44
action_18 _ = happyFail

action_19 (48) = happyShift action_34
action_19 _ = happyFail

action_20 (35) = happyShift action_16
action_20 (36) = happyShift action_17
action_20 (30) = happyGoto action_33
action_20 _ = happyFail

action_21 (35) = happyShift action_16
action_21 (36) = happyShift action_17
action_21 (30) = happyGoto action_32
action_21 _ = happyFail

action_22 (37) = happyReduce_12
action_22 (39) = happyReduce_12
action_22 (71) = happyReduce_12
action_22 _ = happyReduce_12

action_23 (48) = happyShift action_31
action_23 _ = happyFail

action_24 _ = happyReduce_13

action_25 (34) = happyShift action_30
action_25 (35) = happyShift action_16
action_25 (36) = happyShift action_17
action_25 (29) = happyGoto action_28
action_25 (30) = happyGoto action_29
action_25 _ = happyFail

action_26 _ = happyReduce_2

action_27 _ = happyReduce_12

action_28 _ = happyReduce_62

action_29 _ = happyReduce_75

action_30 _ = happyReduce_74

action_31 _ = happyReduce_42

action_32 _ = happyReduce_3

action_33 (49) = happyShift action_95
action_33 _ = happyFail

action_34 _ = happyReduce_10

action_35 (49) = happyShift action_85
action_35 (50) = happyShift action_86
action_35 (51) = happyShift action_87
action_35 (52) = happyShift action_88
action_35 (53) = happyShift action_89
action_35 (54) = happyShift action_90
action_35 (23) = happyGoto action_94
action_35 _ = happyFail

action_36 (55) = happyShift action_93
action_36 _ = happyReduce_16

action_37 (31) = happyReduce_35
action_37 (32) = happyReduce_35
action_37 (34) = happyReduce_35
action_37 (35) = happyReduce_35
action_37 (36) = happyReduce_35
action_37 (37) = happyReduce_35
action_37 (39) = happyReduce_35
action_37 (41) = happyReduce_35
action_37 (42) = happyReduce_35
action_37 (43) = happyReduce_35
action_37 (44) = happyReduce_35
action_37 (48) = happyReduce_35
action_37 (49) = happyReduce_35
action_37 (50) = happyReduce_35
action_37 (51) = happyReduce_35
action_37 (52) = happyReduce_35
action_37 (53) = happyReduce_35
action_37 (54) = happyReduce_35
action_37 (55) = happyReduce_35
action_37 (56) = happyReduce_35
action_37 (61) = happyReduce_35
action_37 (65) = happyReduce_35
action_37 (66) = happyReduce_35
action_37 (67) = happyReduce_35
action_37 (69) = happyReduce_35
action_37 (71) = happyReduce_35
action_37 _ = happyReduce_35

action_38 (49) = happyShift action_85
action_38 (50) = happyShift action_86
action_38 (51) = happyShift action_87
action_38 (52) = happyShift action_88
action_38 (53) = happyShift action_89
action_38 (54) = happyShift action_90
action_38 (55) = happyShift action_91
action_38 (56) = happyShift action_92
action_38 (13) = happyGoto action_83
action_38 (23) = happyGoto action_84
action_38 _ = happyFail

action_39 (57) = happyShift action_81
action_39 (58) = happyShift action_82
action_39 (14) = happyGoto action_80
action_39 _ = happyReduce_25

action_40 _ = happyReduce_32

action_41 _ = happyReduce_33

action_42 (31) = happyShift action_13
action_42 (32) = happyShift action_14
action_42 (34) = happyShift action_15
action_42 (35) = happyShift action_16
action_42 (36) = happyShift action_17
action_42 (41) = happyShift action_18
action_42 (42) = happyShift action_78
action_42 (43) = happyShift action_19
action_42 (44) = happyShift action_20
action_42 (48) = happyShift action_79
action_42 (65) = happyShift action_27
action_42 (66) = happyShift action_23
action_42 (67) = happyShift action_24
action_42 (69) = happyShift action_25
action_42 (6) = happyGoto action_76
action_42 (7) = happyGoto action_8
action_42 (8) = happyGoto action_9
action_42 (18) = happyGoto action_10
action_42 (19) = happyGoto action_77
action_42 (25) = happyGoto action_11
action_42 (30) = happyGoto action_12
action_42 _ = happyFail

action_43 _ = happyReduce_45

action_44 _ = happyReduce_36

action_45 _ = happyReduce_18

action_46 _ = happyReduce_19

action_47 _ = happyReduce_37

action_48 (60) = happyShift action_75
action_48 _ = happyFail

action_49 (33) = happyShift action_45
action_49 (34) = happyShift action_46
action_49 (35) = happyShift action_16
action_49 (36) = happyShift action_17
action_49 (48) = happyShift action_47
action_49 (59) = happyShift action_48
action_49 (60) = happyShift action_49
action_49 (68) = happyShift action_50
action_49 (70) = happyShift action_51
action_49 (9) = happyGoto action_35
action_49 (10) = happyGoto action_36
action_49 (11) = happyGoto action_37
action_49 (12) = happyGoto action_73
action_49 (15) = happyGoto action_39
action_49 (16) = happyGoto action_40
action_49 (17) = happyGoto action_41
action_49 (20) = happyGoto action_74
action_49 (22) = happyGoto action_43
action_49 (30) = happyGoto action_44
action_49 _ = happyFail

action_50 (60) = happyShift action_72
action_50 _ = happyFail

action_51 (60) = happyShift action_71
action_51 _ = happyFail

action_52 (33) = happyShift action_45
action_52 (34) = happyShift action_46
action_52 (9) = happyGoto action_70
action_52 (10) = happyGoto action_36
action_52 _ = happyFail

action_53 _ = happyReduce_61

action_54 _ = happyReduce_71

action_55 (40) = happyShift action_69
action_55 _ = happyReduce_72

action_56 (34) = happyShift action_30
action_56 (35) = happyShift action_16
action_56 (36) = happyShift action_17
action_56 (38) = happyShift action_68
action_56 (28) = happyGoto action_67
action_56 (29) = happyGoto action_55
action_56 (30) = happyGoto action_29
action_56 _ = happyFail

action_57 _ = happyReduce_59

action_58 (38) = happyShift action_66
action_58 _ = happyReduce_65

action_59 (38) = happyShift action_65
action_59 _ = happyReduce_63

action_60 (35) = happyShift action_16
action_60 (36) = happyShift action_17
action_60 (48) = happyShift action_47
action_60 (59) = happyShift action_48
action_60 (60) = happyShift action_64
action_60 (68) = happyShift action_50
action_60 (70) = happyShift action_51
action_60 (11) = happyGoto action_37
action_60 (12) = happyGoto action_63
action_60 (15) = happyGoto action_39
action_60 (16) = happyGoto action_40
action_60 (17) = happyGoto action_41
action_60 (30) = happyGoto action_44
action_60 _ = happyFail

action_61 (31) = happyShift action_13
action_61 (32) = happyShift action_14
action_61 (34) = happyShift action_15
action_61 (35) = happyShift action_16
action_61 (36) = happyShift action_17
action_61 (41) = happyShift action_18
action_61 (43) = happyShift action_19
action_61 (44) = happyShift action_20
action_61 (65) = happyShift action_27
action_61 (66) = happyShift action_23
action_61 (67) = happyShift action_24
action_61 (69) = happyShift action_25
action_61 (6) = happyGoto action_62
action_61 (7) = happyGoto action_8
action_61 (8) = happyGoto action_9
action_61 (18) = happyGoto action_10
action_61 (25) = happyGoto action_11
action_61 (30) = happyGoto action_12
action_61 _ = happyFail

action_62 _ = happyReduce_7

action_63 (55) = happyShift action_91
action_63 (56) = happyShift action_92
action_63 (13) = happyGoto action_83
action_63 _ = happyReduce_14

action_64 (35) = happyShift action_16
action_64 (36) = happyShift action_17
action_64 (48) = happyShift action_47
action_64 (59) = happyShift action_48
action_64 (60) = happyShift action_64
action_64 (68) = happyShift action_50
action_64 (70) = happyShift action_51
action_64 (11) = happyGoto action_37
action_64 (12) = happyGoto action_114
action_64 (15) = happyGoto action_39
action_64 (16) = happyGoto action_40
action_64 (17) = happyGoto action_41
action_64 (30) = happyGoto action_44
action_64 _ = happyFail

action_65 (33) = happyShift action_59
action_65 (34) = happyShift action_30
action_65 (35) = happyShift action_16
action_65 (36) = happyShift action_17
action_65 (26) = happyGoto action_113
action_65 (29) = happyGoto action_58
action_65 (30) = happyGoto action_29
action_65 _ = happyReduce_64

action_66 (33) = happyShift action_59
action_66 (34) = happyShift action_30
action_66 (35) = happyShift action_16
action_66 (36) = happyShift action_17
action_66 (26) = happyGoto action_112
action_66 (29) = happyGoto action_58
action_66 (30) = happyGoto action_29
action_66 _ = happyReduce_66

action_67 _ = happyReduce_70

action_68 (34) = happyShift action_30
action_68 (35) = happyShift action_16
action_68 (36) = happyShift action_17
action_68 (28) = happyGoto action_111
action_68 (29) = happyGoto action_55
action_68 (30) = happyGoto action_29
action_68 _ = happyFail

action_69 (34) = happyShift action_30
action_69 (35) = happyShift action_16
action_69 (36) = happyShift action_17
action_69 (28) = happyGoto action_110
action_69 (29) = happyGoto action_55
action_69 (30) = happyGoto action_29
action_69 _ = happyFail

action_70 _ = happyReduce_15

action_71 (35) = happyShift action_16
action_71 (36) = happyShift action_17
action_71 (48) = happyShift action_47
action_71 (59) = happyShift action_48
action_71 (60) = happyShift action_64
action_71 (68) = happyShift action_50
action_71 (70) = happyShift action_51
action_71 (11) = happyGoto action_37
action_71 (12) = happyGoto action_109
action_71 (15) = happyGoto action_39
action_71 (16) = happyGoto action_40
action_71 (17) = happyGoto action_41
action_71 (30) = happyGoto action_44
action_71 _ = happyFail

action_72 (48) = happyShift action_108
action_72 _ = happyFail

action_73 (49) = happyShift action_85
action_73 (50) = happyShift action_86
action_73 (51) = happyShift action_87
action_73 (52) = happyShift action_88
action_73 (53) = happyShift action_89
action_73 (54) = happyShift action_90
action_73 (55) = happyShift action_91
action_73 (56) = happyShift action_92
action_73 (61) = happyShift action_107
action_73 (13) = happyGoto action_83
action_73 (23) = happyGoto action_84
action_73 _ = happyFail

action_74 (61) = happyShift action_106
action_74 _ = happyFail

action_75 (33) = happyShift action_104
action_75 (34) = happyShift action_105
action_75 _ = happyFail

action_76 _ = happyReduce_44

action_77 _ = happyReduce_39

action_78 (31) = happyShift action_13
action_78 (32) = happyShift action_14
action_78 (34) = happyShift action_15
action_78 (35) = happyShift action_16
action_78 (36) = happyShift action_17
action_78 (41) = happyShift action_18
action_78 (43) = happyShift action_19
action_78 (44) = happyShift action_20
action_78 (48) = happyShift action_79
action_78 (65) = happyShift action_27
action_78 (66) = happyShift action_23
action_78 (67) = happyShift action_24
action_78 (69) = happyShift action_25
action_78 (6) = happyGoto action_76
action_78 (7) = happyGoto action_8
action_78 (8) = happyGoto action_9
action_78 (18) = happyGoto action_10
action_78 (19) = happyGoto action_103
action_78 (25) = happyGoto action_11
action_78 (30) = happyGoto action_12
action_78 _ = happyFail

action_79 _ = happyReduce_43

action_80 (35) = happyShift action_16
action_80 (36) = happyShift action_17
action_80 (48) = happyShift action_47
action_80 (59) = happyShift action_48
action_80 (60) = happyShift action_64
action_80 (68) = happyShift action_50
action_80 (70) = happyShift action_51
action_80 (11) = happyGoto action_100
action_80 (16) = happyGoto action_102
action_80 (17) = happyGoto action_41
action_80 (30) = happyGoto action_44
action_80 _ = happyFail

action_81 _ = happyReduce_29

action_82 _ = happyReduce_30

action_83 (35) = happyShift action_16
action_83 (36) = happyShift action_17
action_83 (48) = happyShift action_47
action_83 (59) = happyShift action_48
action_83 (60) = happyShift action_64
action_83 (68) = happyShift action_50
action_83 (70) = happyShift action_51
action_83 (11) = happyGoto action_100
action_83 (15) = happyGoto action_101
action_83 (16) = happyGoto action_40
action_83 (17) = happyGoto action_41
action_83 (30) = happyGoto action_44
action_83 _ = happyFail

action_84 (35) = happyShift action_16
action_84 (36) = happyShift action_17
action_84 (48) = happyShift action_47
action_84 (59) = happyShift action_48
action_84 (60) = happyShift action_64
action_84 (68) = happyShift action_50
action_84 (70) = happyShift action_51
action_84 (11) = happyGoto action_37
action_84 (12) = happyGoto action_99
action_84 (15) = happyGoto action_39
action_84 (16) = happyGoto action_40
action_84 (17) = happyGoto action_41
action_84 (30) = happyGoto action_44
action_84 _ = happyFail

action_85 _ = happyReduce_52

action_86 _ = happyReduce_55

action_87 _ = happyReduce_53

action_88 _ = happyReduce_54

action_89 _ = happyReduce_56

action_90 _ = happyReduce_57

action_91 _ = happyReduce_27

action_92 _ = happyReduce_28

action_93 (33) = happyShift action_45
action_93 (34) = happyShift action_46
action_93 (10) = happyGoto action_98
action_93 _ = happyFail

action_94 (33) = happyShift action_45
action_94 (34) = happyShift action_46
action_94 (9) = happyGoto action_97
action_94 (10) = happyGoto action_36
action_94 _ = happyFail

action_95 (35) = happyShift action_16
action_95 (36) = happyShift action_17
action_95 (48) = happyShift action_47
action_95 (17) = happyGoto action_96
action_95 (30) = happyGoto action_44
action_95 _ = happyFail

action_96 (45) = happyShift action_123
action_96 _ = happyFail

action_97 _ = happyReduce_50

action_98 _ = happyReduce_17

action_99 (55) = happyShift action_91
action_99 (56) = happyShift action_92
action_99 (13) = happyGoto action_83
action_99 _ = happyReduce_51

action_100 _ = happyReduce_35

action_101 (57) = happyShift action_81
action_101 (58) = happyShift action_82
action_101 (14) = happyGoto action_80
action_101 _ = happyReduce_24

action_102 _ = happyReduce_31

action_103 _ = happyReduce_38

action_104 (61) = happyShift action_122
action_104 _ = happyFail

action_105 (61) = happyShift action_121
action_105 _ = happyFail

action_106 (62) = happyShift action_118
action_106 (63) = happyShift action_119
action_106 (64) = happyShift action_120
action_106 (21) = happyGoto action_117
action_106 _ = happyFail

action_107 _ = happyReduce_34

action_108 (61) = happyShift action_116
action_108 _ = happyFail

action_109 (55) = happyShift action_91
action_109 (56) = happyShift action_92
action_109 (61) = happyShift action_115
action_109 (13) = happyGoto action_83
action_109 _ = happyFail

action_110 _ = happyReduce_73

action_111 _ = happyReduce_69

action_112 _ = happyReduce_68

action_113 _ = happyReduce_67

action_114 (55) = happyShift action_91
action_114 (56) = happyShift action_92
action_114 (61) = happyShift action_107
action_114 (13) = happyGoto action_83
action_114 _ = happyFail

action_115 _ = happyReduce_23

action_116 _ = happyReduce_22

action_117 (60) = happyShift action_125
action_117 _ = happyFail

action_118 _ = happyReduce_47

action_119 _ = happyReduce_48

action_120 _ = happyReduce_49

action_121 _ = happyReduce_21

action_122 _ = happyReduce_20

action_123 (35) = happyShift action_16
action_123 (36) = happyShift action_17
action_123 (48) = happyShift action_47
action_123 (17) = happyGoto action_124
action_123 (30) = happyGoto action_44
action_123 _ = happyFail

action_124 (37) = happyShift action_6
action_124 (47) = happyShift action_128
action_124 (4) = happyGoto action_127
action_124 (5) = happyGoto action_5
action_124 _ = happyFail

action_125 (33) = happyShift action_45
action_125 (34) = happyShift action_46
action_125 (35) = happyShift action_16
action_125 (36) = happyShift action_17
action_125 (48) = happyShift action_47
action_125 (59) = happyShift action_48
action_125 (60) = happyShift action_49
action_125 (68) = happyShift action_50
action_125 (70) = happyShift action_51
action_125 (9) = happyGoto action_35
action_125 (10) = happyGoto action_36
action_125 (11) = happyGoto action_37
action_125 (12) = happyGoto action_38
action_125 (15) = happyGoto action_39
action_125 (16) = happyGoto action_40
action_125 (17) = happyGoto action_41
action_125 (20) = happyGoto action_126
action_125 (22) = happyGoto action_43
action_125 (30) = happyGoto action_44
action_125 _ = happyFail

action_126 (61) = happyShift action_130
action_126 _ = happyFail

action_127 _ = happyReduce_41

action_128 (35) = happyShift action_16
action_128 (36) = happyShift action_17
action_128 (48) = happyShift action_47
action_128 (17) = happyGoto action_129
action_128 (30) = happyGoto action_44
action_128 _ = happyFail

action_129 (37) = happyShift action_6
action_129 (4) = happyGoto action_131
action_129 (5) = happyGoto action_5
action_129 _ = happyFail

action_130 _ = happyReduce_46

action_131 _ = happyReduce_40

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 ([happy_var_1]
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_2  4 happyReduction_2
happyReduction_2 (HappyAbsSyn4  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (happy_var_1:happy_var_2
	)
happyReduction_2 _ _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_3  4 happyReduction_3
happyReduction_3 _
	_
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn4
		 ([(getTokenIntValue happy_var_1, [NOOP])]
	)
happyReduction_3 _ _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_2  4 happyReduction_4
happyReduction_4 _
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn4
		 ((getTokenIntValue happy_var_1, [Return])
	)
happyReduction_4 _ _  = notHappyAtAll 

happyReduce_5 = happyMonadReduce 2 5 happyReduction_5
happyReduction_5 ((HappyAbsSyn6  happy_var_2) `HappyStk`
	(HappyTerminal happy_var_1) `HappyStk`
	happyRest) tk
	 = happyThen (( do 
                                                  nr <- buildLineNumber $! happy_var_1
                                                  return (nr,happy_var_2))
	) (\r -> happyReturn (HappyAbsSyn5 r))

happyReduce_6 = happySpecReduce_1  6 happyReduction_6
happyReduction_6 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 ([happy_var_1]
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  6 happyReduction_7
happyReduction_7 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1:happy_var_3
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_1  7 happyReduction_8
happyReduction_8 (HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn7
		 (Command happy_var_1
	)
happyReduction_8 _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_1  7 happyReduction_9
happyReduction_9 (HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn7
		 (ControlStructure happy_var_1
	)
happyReduction_9 _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_2  7 happyReduction_10
happyReduction_10 (HappyTerminal happy_var_2)
	_
	 =  HappyAbsSyn7
		 (Goto ((\(TokenWrap _ _ (TkConst (TkIntConst x))) -> x)happy_var_2)
	)
happyReduction_10 _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_1  7 happyReduction_11
happyReduction_11 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1
	)
happyReduction_11 _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_1  7 happyReduction_12
happyReduction_12 _
	 =  HappyAbsSyn7
		 (Return
	)

happyReduce_13 = happySpecReduce_1  7 happyReduction_13
happyReduction_13 _
	 =  HappyAbsSyn7
		 (End
	)

happyReduce_14 = happySpecReduce_3  8 happyReduction_14
happyReduction_14 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn30  happy_var_1)
	 =  HappyAbsSyn8
		 (ArithAssignment happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  8 happyReduction_15
happyReduction_15 (HappyAbsSyn9  happy_var_3)
	_
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn8
		 (StringAssignment (StringVar $ getTokenStringValue happy_var_1) happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_1  9 happyReduction_16
happyReduction_16 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (StringOp happy_var_1
	)
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  9 happyReduction_17
happyReduction_17 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (StringExpr (happy_var_1,happy_var_3) "+"
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  10 happyReduction_18
happyReduction_18 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (StringLiteral $ getTokenStringValue happy_var_1
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_1  10 happyReduction_19
happyReduction_19 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (StringVar_BString (StringVar $ getTokenStringValue happy_var_1)
	)
happyReduction_19 _  = notHappyAtAll 

happyReduce_20 = happyReduce 4 11 happyReduction_20
happyReduction_20 (_ `HappyStk`
	(HappyTerminal happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (Len $ getTokenStringValue happy_var_3
	) `HappyStk` happyRest

happyReduce_21 = happyReduce 4 11 happyReduction_21
happyReduction_21 (_ `HappyStk`
	(HappyTerminal happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (LenVar (StringVar $ getTokenStringValue happy_var_3)
	) `HappyStk` happyRest

happyReduce_22 = happyReduce 4 11 happyReduction_22
happyReduction_22 (_ `HappyStk`
	(HappyTerminal happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (Random ((\(TokenWrap _ _ (TkConst (TkIntConst x))) -> x)happy_var_3)
	) `HappyStk` happyRest

happyReduce_23 = happyReduce 4 11 happyReduction_23
happyReduction_23 (_ `HappyStk`
	(HappyAbsSyn12  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (IntFunc happy_var_3
	) `HappyStk` happyRest

happyReduce_24 = happySpecReduce_3  12 happyReduction_24
happyReduction_24 (HappyAbsSyn15  happy_var_3)
	(HappyAbsSyn13  happy_var_2)
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (NumExpr (happy_var_1,happy_var_3) happy_var_2
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_1  12 happyReduction_25
happyReduction_25 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_1
	)
happyReduction_25 _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_1  12 happyReduction_26
happyReduction_26 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn12
		 (NumFunc happy_var_1
	)
happyReduction_26 _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_1  13 happyReduction_27
happyReduction_27 _
	 =  HappyAbsSyn13
		 ("+"
	)

happyReduce_28 = happySpecReduce_1  13 happyReduction_28
happyReduction_28 _
	 =  HappyAbsSyn13
		 ("-"
	)

happyReduce_29 = happySpecReduce_1  14 happyReduction_29
happyReduction_29 _
	 =  HappyAbsSyn14
		 ("*"
	)

happyReduce_30 = happySpecReduce_1  14 happyReduction_30
happyReduction_30 _
	 =  HappyAbsSyn14
		 ("/"
	)

happyReduce_31 = happySpecReduce_3  15 happyReduction_31
happyReduction_31 (HappyAbsSyn16  happy_var_3)
	(HappyAbsSyn14  happy_var_2)
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (NumExpr (happy_var_1,happy_var_3) happy_var_2
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_1  15 happyReduction_32
happyReduction_32 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1
	)
happyReduction_32 _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_1  16 happyReduction_33
happyReduction_33 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn16
		 (NumOp happy_var_1
	)
happyReduction_33 _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  16 happyReduction_34
happyReduction_34 _
	(HappyAbsSyn12  happy_var_2)
	_
	 =  HappyAbsSyn16
		 (happy_var_2
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_1  16 happyReduction_35
happyReduction_35 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn16
		 (NumFunc happy_var_1
	)
happyReduction_35 _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_1  17 happyReduction_36
happyReduction_36 (HappyAbsSyn30  happy_var_1)
	 =  HappyAbsSyn17
		 (OpVar happy_var_1
	)
happyReduction_36 _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_1  17 happyReduction_37
happyReduction_37 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn17
		 (makeArithOperandConstant $ ((\(TokenWrap _ _ (TkConst x)) -> x)happy_var_1)
	)
happyReduction_37 _  = notHappyAtAll 

happyReduce_38 = happyReduce 4 18 happyReduction_38
happyReduction_38 ((HappyAbsSyn19  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn20  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 (If happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_39 = happySpecReduce_3  18 happyReduction_39
happyReduction_39 (HappyAbsSyn19  happy_var_3)
	(HappyAbsSyn20  happy_var_2)
	_
	 =  HappyAbsSyn18
		 (If happy_var_2 happy_var_3
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happyReduce 9 18 happyReduction_40
happyReduction_40 ((HappyAbsSyn4  happy_var_9) `HappyStk`
	(HappyAbsSyn17  happy_var_8) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn30  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 (For happy_var_2 (happy_var_4,happy_var_8,happy_var_6) happy_var_9
	) `HappyStk` happyRest

happyReduce_41 = happyReduce 7 18 happyReduction_41
happyReduction_41 ((HappyAbsSyn4  happy_var_7) `HappyStk`
	(HappyAbsSyn17  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn30  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 (For happy_var_2 (happy_var_4,(makeArithOperandConstant (TkIntConst 1)),happy_var_6) happy_var_7
	) `HappyStk` happyRest

happyReduce_42 = happySpecReduce_2  18 happyReduction_42
happyReduction_42 (HappyTerminal happy_var_2)
	_
	 =  HappyAbsSyn18
		 (GoSub ((\(TokenWrap _ _(TkConst (TkIntConst x))) -> x)happy_var_2)
	)
happyReduction_42 _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_1  19 happyReduction_43
happyReduction_43 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn19
		 ([Goto ((\(TokenWrap _ _(TkConst (TkIntConst x))) -> x)happy_var_1)]
	)
happyReduction_43 _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_1  19 happyReduction_44
happyReduction_44 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn19
		 (happy_var_1
	)
happyReduction_44 _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_1  20 happyReduction_45
happyReduction_45 (HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn20
		 (happy_var_1
	)
happyReduction_45 _  = notHappyAtAll 

happyReduce_46 = happyReduce 7 20 happyReduction_46
happyReduction_46 (_ `HappyStk`
	(HappyAbsSyn20  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn21  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn20  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 (BoolExprLog (happy_var_2,happy_var_6) happy_var_4
	) `HappyStk` happyRest

happyReduce_47 = happySpecReduce_1  21 happyReduction_47
happyReduction_47 _
	 =  HappyAbsSyn21
		 ("||"
	)

happyReduce_48 = happySpecReduce_1  21 happyReduction_48
happyReduction_48 _
	 =  HappyAbsSyn21
		 ("&&"
	)

happyReduce_49 = happySpecReduce_1  21 happyReduction_49
happyReduction_49 _
	 =  HappyAbsSyn21
		 ("neg"
	)

happyReduce_50 = happySpecReduce_3  22 happyReduction_50
happyReduction_50 (HappyAbsSyn9  happy_var_3)
	(HappyAbsSyn23  happy_var_2)
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn22
		 (BoolExprString (happy_var_1,happy_var_3) happy_var_2
	)
happyReduction_50 _ _ _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_3  22 happyReduction_51
happyReduction_51 (HappyAbsSyn12  happy_var_3)
	(HappyAbsSyn23  happy_var_2)
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn22
		 (BoolExprNum (happy_var_1,happy_var_3) happy_var_2
	)
happyReduction_51 _ _ _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_1  23 happyReduction_52
happyReduction_52 _
	 =  HappyAbsSyn23
		 ("=="
	)

happyReduce_53 = happySpecReduce_1  23 happyReduction_53
happyReduction_53 _
	 =  HappyAbsSyn23
		 ("<"
	)

happyReduce_54 = happySpecReduce_1  23 happyReduction_54
happyReduction_54 _
	 =  HappyAbsSyn23
		 (">"
	)

happyReduce_55 = happySpecReduce_1  23 happyReduction_55
happyReduction_55 _
	 =  HappyAbsSyn23
		 ("/="
	)

happyReduce_56 = happySpecReduce_1  23 happyReduction_56
happyReduction_56 _
	 =  HappyAbsSyn23
		 ("<="
	)

happyReduce_57 = happySpecReduce_1  23 happyReduction_57
happyReduction_57 _
	 =  HappyAbsSyn23
		 (">="
	)

happyReduce_58 = happySpecReduce_1  24 happyReduction_58
happyReduction_58 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn24
		 (getTokenIntValue happy_var_1
	)
happyReduction_58 _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_2  25 happyReduction_59
happyReduction_59 (HappyAbsSyn26  happy_var_2)
	_
	 =  HappyAbsSyn25
		 (Print happy_var_2
	)
happyReduction_59 _ _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_1  25 happyReduction_60
happyReduction_60 _
	 =  HappyAbsSyn25
		 (Print ([], True)
	)

happyReduce_61 = happySpecReduce_2  25 happyReduction_61
happyReduction_61 (HappyAbsSyn27  happy_var_2)
	_
	 =  HappyAbsSyn25
		 (Input happy_var_2
	)
happyReduction_61 _ _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_2  25 happyReduction_62
happyReduction_62 (HappyAbsSyn29  happy_var_2)
	_
	 =  HappyAbsSyn25
		 (Get happy_var_2
	)
happyReduction_62 _ _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_1  26 happyReduction_63
happyReduction_63 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn26
		 (([OutString $ getTokenStringValue happy_var_1], True)
	)
happyReduction_63 _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_2  26 happyReduction_64
happyReduction_64 _
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn26
		 (([OutString $ getTokenStringValue happy_var_1], False)
	)
happyReduction_64 _ _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_1  26 happyReduction_65
happyReduction_65 (HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn26
		 (([OutVar happy_var_1], True)
	)
happyReduction_65 _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_2  26 happyReduction_66
happyReduction_66 _
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn26
		 (([OutVar happy_var_1], False)
	)
happyReduction_66 _ _  = notHappyAtAll 

happyReduce_67 = happySpecReduce_3  26 happyReduction_67
happyReduction_67 (HappyAbsSyn26  happy_var_3)
	_
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn26
		 (((OutString $ getTokenStringValue happy_var_1):(fst happy_var_3), snd (happy_var_3))
	)
happyReduction_67 _ _ _  = notHappyAtAll 

happyReduce_68 = happySpecReduce_3  26 happyReduction_68
happyReduction_68 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn26
		 (((OutVar happy_var_1):(fst happy_var_3), snd (happy_var_3))
	)
happyReduction_68 _ _ _  = notHappyAtAll 

happyReduce_69 = happySpecReduce_3  27 happyReduction_69
happyReduction_69 (HappyAbsSyn28  happy_var_3)
	_
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn27
		 ((InputStuff [getTokenStringValue happy_var_1] happy_var_3, False)
	)
happyReduction_69 _ _ _  = notHappyAtAll 

happyReduce_70 = happySpecReduce_2  27 happyReduction_70
happyReduction_70 (HappyAbsSyn28  happy_var_2)
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn27
		 ((InputStuff [getTokenStringValue happy_var_1] happy_var_2, True)
	)
happyReduction_70 _ _  = notHappyAtAll 

happyReduce_71 = happySpecReduce_1  27 happyReduction_71
happyReduction_71 (HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn27
		 ((InputStuff [] happy_var_1, False)
	)
happyReduction_71 _  = notHappyAtAll 

happyReduce_72 = happySpecReduce_1  28 happyReduction_72
happyReduction_72 (HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn28
		 ([happy_var_1]
	)
happyReduction_72 _  = notHappyAtAll 

happyReduce_73 = happySpecReduce_3  28 happyReduction_73
happyReduction_73 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn28
		 (happy_var_1:happy_var_3
	)
happyReduction_73 _ _ _  = notHappyAtAll 

happyReduce_74 = happySpecReduce_1  29 happyReduction_74
happyReduction_74 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn29
		 (StringVar_Var (StringVar $ getTokenStringValue happy_var_1)
	)
happyReduction_74 _  = notHappyAtAll 

happyReduce_75 = happySpecReduce_1  29 happyReduction_75
happyReduction_75 (HappyAbsSyn30  happy_var_1)
	 =  HappyAbsSyn29
		 (NumVar_Var happy_var_1
	)
happyReduction_75 _  = notHappyAtAll 

happyReduce_76 = happySpecReduce_1  30 happyReduction_76
happyReduction_76 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn30
		 (IntVar $ getTokenStringValue happy_var_1
	)
happyReduction_76 _  = notHappyAtAll 

happyReduce_77 = happySpecReduce_1  30 happyReduction_77
happyReduction_77 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn30
		 (FloatVar $ getTokenStringValue happy_var_1
	)
happyReduction_77 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 71 71 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenWrap _type pos TkPrint -> cont 31;
	TokenWrap _type pos TkInput -> cont 32;
	TokenWrap _type pos (TkString val) -> cont 33;
	TokenWrap _type pos (TkStringVar val) -> cont 34;
	TokenWrap _type posTk (TkIntVar val) -> cont 35;
	TokenWrap _type pos (TkFloatVar val) -> cont 36;
	TokenWrap _type pos (TkLineNumber val) -> cont 37;
	TokenWrap _type pos TkStringConcat -> cont 38;
	TokenWrap _type pos TkSingleLineCommandCombinator -> cont 39;
	TokenWrap _type pos TkKomma -> cont 40;
	TokenWrap _type pos TkIf -> cont 41;
	TokenWrap _type pos TkThen -> cont 42;
	TokenWrap _type pos TkGoto -> cont 43;
	TokenWrap _type pos TkFor -> cont 44;
	TokenWrap _type pos TkTo -> cont 45;
	TokenWrap _type pos TkNext -> cont 46;
	TokenWrap _type pos TkStep -> cont 47;
	TokenWrap _type pos (TkConst val) -> cont 48;
	TokenWrap _type pos TkEqual -> cont 49;
	TokenWrap _type pos TkUnEqual -> cont 50;
	TokenWrap _type pos TkLt -> cont 51;
	TokenWrap _type pos TkGt -> cont 52;
	TokenWrap _type pos TkLE -> cont 53;
	TokenWrap _type pos TkGE -> cont 54;
	TokenWrap _type pos TkPlus -> cont 55;
	TokenWrap _type pos TkMinus -> cont 56;
	TokenWrap _type pos TkTimes -> cont 57;
	TokenWrap _type pos TkDiv -> cont 58;
	TokenWrap _type pos TkLen -> cont 59;
	TokenWrap _type pos TkBracketOpen -> cont 60;
	TokenWrap _type pos TkBracketClose -> cont 61;
	TokenWrap _type pos TkLogOr -> cont 62;
	TokenWrap _type pos TkLogAnd -> cont 63;
	TokenWrap _type pos TkLogNeg -> cont 64;
	TokenWrap _type pos TkReturn -> cont 65;
	TokenWrap _type pos TkGoSub -> cont 66;
	TokenWrap _type pos TkEnd -> cont 67;
	TokenWrap _type pos TkRandom -> cont 68;
	TokenWrap _type pos TkGet -> cont 69;
	TokenWrap _type pos TkIntFunc -> cont 70;
	_ -> happyError' (tk:tks)
	}

happyError_ tk tks = happyError' (tk:tks)

happyThen :: () => State ParserState a -> (a -> State ParserState b) -> State ParserState b
happyThen = (>>=)
happyReturn :: () => a -> State ParserState a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> State ParserState a
happyReturn1 = \a tks -> (return) a
happyError' :: () => [(TokenWrap)] -> State ParserState a
happyError' = parseError

basicParse tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


getTokenIntValue (TokenWrap _ _ (TkLineNumber x)) = x
getTokenIntValue _ = error "Unallowed Token here!"

getTokenStringValue (TokenWrap _ _ (TkString str)) = str
getTokenStringValue (TokenWrap _ _ (TkStringVar str)) = str
getTokenStringValue (TokenWrap _ _ (TkIntVar str)) = str
getTokenStringValue (TokenWrap _ _ (TkFloatVar str)) = str
getTokenStringValue _ = error "Unallowed Token here!"

wrapStateMonadic state val = get >>= (\s -> put (s ++ [state])) >> return val


buildLineNumber :: TokenWrap -> State ParserState Int
buildLineNumber tkWrap = do
    state <- get
    let lnNrs = lineNumbers state
    -- let nr = (trace $! (show $ getTokenIntValue tkWrap)) $! (getTokenIntValue tkWrap)
    let nr = getTokenIntValue tkWrap
    if elem nr lnNrs
      then do
        let (ln,col) = pos tkWrap
        let posText = "Line " ++ (show ln) ++ "," ++ "Column " ++ (show col) ++ ": "
        error (posText ++ "Duplicate LINE_NUMBER " ++ show nr)
      else do
        put $ state { lineNumbers = nr : lnNrs, expectedLineNumbers = delete nr $ expectedLineNumbers state }
        return nr



-- checkAllExpectedLineNumbersGot :: a -> State ParserState a
{-checkAllExpectedLineNumbersGot = do
    state <- get
    if (null $ expectedLineNumbers state)
      then
        return ()
      else
        error ("Missing lines: " ++ (show $ expectedLineNumbers state))
-}

-- TODO: FLoat COnstants
makeArithOperandConstant (TkIntConst x) = IntConst x
makeiArithOperandConstant _ = error "invalid makeOperandConstant call"

--parseError :: [Token] -> a
parseError ls = do
    (exp,context) <- getExpectingMessage (head ls)
    -- error ("Parse error on: " ++ (show ls))
    let (ln,col) = pos $ head ls
    let posText = "Line " ++ (show ln) ++ "," ++ "Column " ++ (show col) ++ ": "
    let erTk = (", but was: " ++ (show $ tokenToRuleType $ _token $ head ls))
    -- error ("Used rules(" ++ (show $ length readStr) ++ "): " ++ (foldl (\s y -> s ++ " " ++ y) "" readStr) ++ erTk) 
    let cxt = "\n        Context seems to be: " ++ context
    error (posText ++ exp ++ erTk ++ cxt)




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
