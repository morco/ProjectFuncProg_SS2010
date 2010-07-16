{-# OPTIONS_GHC -fno-warn-overlapping-patterns #-}
module Parser.BasicHapMonad(getParseTree) where

import Parser.Lexer.BasicAlexMonad(getTokens)
import Parser.ParserTypes
import Parser.ParserErrors

import Data.List(delete)
import Control.Monad.State

import Debug.Trace

-- parser produced by Happy Version 1.18.4

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26 t27 t28 t29 t30 t31 t32 t33
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
	| HappyAbsSyn31 t31
	| HappyAbsSyn32 t32
	| HappyAbsSyn33 t33

action_0 (73) = happyShift action_6
action_0 (4) = happyGoto action_4
action_0 (5) = happyGoto action_5
action_0 _ = happyFail

action_1 (73) = happyShift action_3
action_1 (5) = happyGoto action_2
action_1 _ = happyFail

action_2 _ = happyFail

action_3 (34) = happyShift action_13
action_3 (35) = happyShift action_14
action_3 (36) = happyShift action_15
action_3 (37) = happyShift action_16
action_3 (39) = happyShift action_17
action_3 (40) = happyShift action_18
action_3 (44) = happyShift action_20
action_3 (45) = happyShift action_31
action_3 (46) = happyShift action_22
action_3 (50) = happyShift action_23
action_3 (51) = happyShift action_24
action_3 (52) = happyShift action_25
action_3 (53) = happyShift action_26
action_3 (67) = happyShift action_27
action_3 (68) = happyShift action_28
action_3 (69) = happyShift action_29
action_3 (6) = happyGoto action_7
action_3 (7) = happyGoto action_8
action_3 (10) = happyGoto action_9
action_3 (20) = happyGoto action_10
action_3 (27) = happyGoto action_11
action_3 (33) = happyGoto action_12
action_3 _ = happyFail

action_4 (79) = happyAccept
action_4 _ = happyFail

action_5 (73) = happyShift action_6
action_5 (4) = happyGoto action_30
action_5 (5) = happyGoto action_5
action_5 _ = happyReduce_1

action_6 (34) = happyShift action_13
action_6 (35) = happyShift action_14
action_6 (36) = happyShift action_15
action_6 (37) = happyShift action_16
action_6 (39) = happyShift action_17
action_6 (40) = happyShift action_18
action_6 (42) = happyShift action_19
action_6 (44) = happyShift action_20
action_6 (45) = happyShift action_21
action_6 (46) = happyShift action_22
action_6 (50) = happyShift action_23
action_6 (51) = happyShift action_24
action_6 (52) = happyShift action_25
action_6 (53) = happyShift action_26
action_6 (67) = happyShift action_27
action_6 (68) = happyShift action_28
action_6 (69) = happyShift action_29
action_6 (6) = happyGoto action_7
action_6 (7) = happyGoto action_8
action_6 (10) = happyGoto action_9
action_6 (20) = happyGoto action_10
action_6 (27) = happyGoto action_11
action_6 (33) = happyGoto action_12
action_6 _ = happyFail

action_7 _ = happyReduce_6

action_8 (75) = happyShift action_78
action_8 _ = happyReduce_7

action_9 _ = happyReduce_11

action_10 _ = happyReduce_10

action_11 _ = happyReduce_9

action_12 (61) = happyShift action_77
action_12 _ = happyFail

action_13 (67) = happyShift action_43
action_13 (68) = happyShift action_28
action_13 (69) = happyShift action_29
action_13 (70) = happyShift action_76
action_13 (30) = happyGoto action_74
action_13 (31) = happyGoto action_75
action_13 (32) = happyGoto action_41
action_13 (33) = happyGoto action_42
action_13 _ = happyFail

action_14 (47) = happyShift action_59
action_14 (48) = happyShift action_60
action_14 (49) = happyShift action_61
action_14 (55) = happyShift action_62
action_14 (67) = happyShift action_63
action_14 (68) = happyShift action_28
action_14 (69) = happyShift action_29
action_14 (70) = happyShift action_64
action_14 (71) = happyShift action_65
action_14 (72) = happyShift action_66
action_14 (77) = happyShift action_73
action_14 (11) = happyGoto action_69
action_14 (12) = happyGoto action_49
action_14 (13) = happyGoto action_50
action_14 (14) = happyGoto action_70
action_14 (17) = happyGoto action_52
action_14 (18) = happyGoto action_53
action_14 (19) = happyGoto action_54
action_14 (26) = happyGoto action_57
action_14 (28) = happyGoto action_71
action_14 (29) = happyGoto action_72
action_14 (33) = happyGoto action_58
action_14 _ = happyReduce_75

action_15 (67) = happyShift action_43
action_15 (68) = happyShift action_28
action_15 (69) = happyShift action_29
action_15 (32) = happyGoto action_68
action_15 (33) = happyGoto action_42
action_15 _ = happyFail

action_16 (47) = happyShift action_59
action_16 (48) = happyShift action_60
action_16 (49) = happyShift action_61
action_16 (55) = happyShift action_62
action_16 (67) = happyShift action_63
action_16 (68) = happyShift action_28
action_16 (69) = happyShift action_29
action_16 (70) = happyShift action_64
action_16 (71) = happyShift action_65
action_16 (72) = happyShift action_66
action_16 (77) = happyShift action_67
action_16 (11) = happyGoto action_48
action_16 (12) = happyGoto action_49
action_16 (13) = happyGoto action_50
action_16 (14) = happyGoto action_51
action_16 (17) = happyGoto action_52
action_16 (18) = happyGoto action_53
action_16 (19) = happyGoto action_54
action_16 (22) = happyGoto action_55
action_16 (24) = happyGoto action_56
action_16 (26) = happyGoto action_57
action_16 (33) = happyGoto action_58
action_16 _ = happyFail

action_17 (72) = happyShift action_47
action_17 _ = happyFail

action_18 (68) = happyShift action_28
action_18 (69) = happyShift action_29
action_18 (33) = happyGoto action_46
action_18 _ = happyFail

action_19 (68) = happyShift action_28
action_19 (69) = happyShift action_29
action_19 (33) = happyGoto action_45
action_19 _ = happyReduce_4

action_20 (72) = happyShift action_44
action_20 _ = happyFail

action_21 (73) = happyReduce_56
action_21 (75) = happyReduce_56
action_21 (79) = happyReduce_56
action_21 _ = happyReduce_56

action_22 _ = happyReduce_55

action_23 (67) = happyShift action_43
action_23 (68) = happyShift action_28
action_23 (69) = happyShift action_29
action_23 (31) = happyGoto action_40
action_23 (32) = happyGoto action_41
action_23 (33) = happyGoto action_42
action_23 _ = happyFail

action_24 (55) = happyShift action_35
action_24 (69) = happyShift action_36
action_24 (70) = happyShift action_37
action_24 (71) = happyShift action_38
action_24 (72) = happyShift action_39
action_24 (8) = happyGoto action_33
action_24 (9) = happyGoto action_34
action_24 _ = happyFail

action_25 _ = happyReduce_14

action_26 _ = happyReduce_15

action_27 (61) = happyShift action_32
action_27 _ = happyFail

action_28 _ = happyReduce_90

action_29 _ = happyReduce_91

action_30 _ = happyReduce_2

action_31 _ = happyReduce_56

action_32 (67) = happyShift action_63
action_32 (70) = happyShift action_64
action_32 (11) = happyGoto action_115
action_32 (12) = happyGoto action_49
action_32 _ = happyFail

action_33 _ = happyReduce_13

action_34 (76) = happyShift action_114
action_34 _ = happyReduce_16

action_35 (71) = happyShift action_112
action_35 (72) = happyShift action_113
action_35 _ = happyFail

action_36 _ = happyReduce_23

action_37 _ = happyReduce_22

action_38 _ = happyReduce_19

action_39 _ = happyReduce_18

action_40 _ = happyReduce_12

action_41 (76) = happyShift action_111
action_41 _ = happyReduce_86

action_42 _ = happyReduce_89

action_43 _ = happyReduce_88

action_44 _ = happyReduce_53

action_45 _ = happyReduce_3

action_46 (61) = happyShift action_110
action_46 _ = happyFail

action_47 _ = happyReduce_54

action_48 (61) = happyShift action_102
action_48 (62) = happyShift action_103
action_48 (63) = happyShift action_104
action_48 (64) = happyShift action_105
action_48 (65) = happyShift action_106
action_48 (66) = happyShift action_107
action_48 (25) = happyGoto action_109
action_48 _ = happyFail

action_49 (54) = happyShift action_108
action_49 _ = happyReduce_26

action_50 (34) = happyReduce_46
action_50 (35) = happyReduce_46
action_50 (36) = happyReduce_46
action_50 (37) = happyReduce_46
action_50 (38) = happyReduce_46
action_50 (39) = happyReduce_46
action_50 (40) = happyReduce_46
action_50 (44) = happyReduce_46
action_50 (45) = happyReduce_46
action_50 (46) = happyReduce_46
action_50 (50) = happyReduce_46
action_50 (51) = happyReduce_46
action_50 (52) = happyReduce_46
action_50 (53) = happyReduce_46
action_50 (54) = happyReduce_46
action_50 (55) = happyReduce_46
action_50 (61) = happyReduce_46
action_50 (62) = happyReduce_46
action_50 (63) = happyReduce_46
action_50 (64) = happyReduce_46
action_50 (65) = happyReduce_46
action_50 (66) = happyReduce_46
action_50 (67) = happyReduce_46
action_50 (68) = happyReduce_46
action_50 (69) = happyReduce_46
action_50 (72) = happyReduce_46
action_50 (73) = happyReduce_46
action_50 (74) = happyReduce_46
action_50 (75) = happyReduce_46
action_50 (78) = happyReduce_46
action_50 (79) = happyReduce_46
action_50 _ = happyReduce_46

action_51 (54) = happyShift action_86
action_51 (55) = happyShift action_87
action_51 (61) = happyShift action_102
action_51 (62) = happyShift action_103
action_51 (63) = happyShift action_104
action_51 (64) = happyShift action_105
action_51 (65) = happyShift action_106
action_51 (66) = happyShift action_107
action_51 (15) = happyGoto action_85
action_51 (25) = happyGoto action_101
action_51 _ = happyFail

action_52 (56) = happyShift action_99
action_52 (57) = happyShift action_100
action_52 (16) = happyGoto action_98
action_52 _ = happyReduce_35

action_53 _ = happyReduce_43

action_54 _ = happyReduce_44

action_55 (34) = happyShift action_13
action_55 (35) = happyShift action_14
action_55 (36) = happyShift action_15
action_55 (37) = happyShift action_16
action_55 (38) = happyShift action_96
action_55 (39) = happyShift action_17
action_55 (40) = happyShift action_18
action_55 (44) = happyShift action_20
action_55 (45) = happyShift action_31
action_55 (46) = happyShift action_22
action_55 (50) = happyShift action_23
action_55 (51) = happyShift action_24
action_55 (52) = happyShift action_25
action_55 (53) = happyShift action_26
action_55 (67) = happyShift action_27
action_55 (68) = happyShift action_28
action_55 (69) = happyShift action_29
action_55 (72) = happyShift action_97
action_55 (6) = happyGoto action_94
action_55 (7) = happyGoto action_8
action_55 (10) = happyGoto action_9
action_55 (20) = happyGoto action_10
action_55 (21) = happyGoto action_95
action_55 (27) = happyGoto action_11
action_55 (33) = happyGoto action_12
action_55 _ = happyFail

action_56 _ = happyReduce_59

action_57 _ = happyReduce_48

action_58 _ = happyReduce_47

action_59 (77) = happyShift action_93
action_59 _ = happyFail

action_60 (77) = happyShift action_92
action_60 _ = happyFail

action_61 (77) = happyShift action_91
action_61 _ = happyFail

action_62 (47) = happyShift action_59
action_62 (48) = happyShift action_60
action_62 (49) = happyShift action_61
action_62 (55) = happyShift action_62
action_62 (68) = happyShift action_28
action_62 (69) = happyShift action_29
action_62 (71) = happyShift action_65
action_62 (72) = happyShift action_66
action_62 (77) = happyShift action_73
action_62 (13) = happyGoto action_50
action_62 (14) = happyGoto action_90
action_62 (17) = happyGoto action_52
action_62 (18) = happyGoto action_53
action_62 (19) = happyGoto action_54
action_62 (26) = happyGoto action_57
action_62 (33) = happyGoto action_58
action_62 _ = happyFail

action_63 _ = happyReduce_29

action_64 _ = happyReduce_28

action_65 _ = happyReduce_73

action_66 _ = happyReduce_72

action_67 (47) = happyShift action_59
action_67 (48) = happyShift action_60
action_67 (49) = happyShift action_61
action_67 (55) = happyShift action_62
action_67 (67) = happyShift action_63
action_67 (68) = happyShift action_28
action_67 (69) = happyShift action_29
action_67 (70) = happyShift action_64
action_67 (71) = happyShift action_65
action_67 (72) = happyShift action_66
action_67 (77) = happyShift action_67
action_67 (11) = happyGoto action_48
action_67 (12) = happyGoto action_49
action_67 (13) = happyGoto action_50
action_67 (14) = happyGoto action_88
action_67 (17) = happyGoto action_52
action_67 (18) = happyGoto action_53
action_67 (19) = happyGoto action_54
action_67 (22) = happyGoto action_89
action_67 (24) = happyGoto action_56
action_67 (26) = happyGoto action_57
action_67 (33) = happyGoto action_58
action_67 _ = happyFail

action_68 _ = happyReduce_77

action_69 _ = happyReduce_81

action_70 (54) = happyShift action_86
action_70 (55) = happyShift action_87
action_70 (15) = happyGoto action_85
action_70 _ = happyReduce_82

action_71 _ = happyReduce_74

action_72 (74) = happyShift action_84
action_72 _ = happyReduce_78

action_73 (47) = happyShift action_59
action_73 (48) = happyShift action_60
action_73 (49) = happyShift action_61
action_73 (55) = happyShift action_62
action_73 (68) = happyShift action_28
action_73 (69) = happyShift action_29
action_73 (71) = happyShift action_65
action_73 (72) = happyShift action_66
action_73 (77) = happyShift action_73
action_73 (13) = happyGoto action_50
action_73 (14) = happyGoto action_83
action_73 (17) = happyGoto action_52
action_73 (18) = happyGoto action_53
action_73 (19) = happyGoto action_54
action_73 (26) = happyGoto action_57
action_73 (33) = happyGoto action_58
action_73 _ = happyFail

action_74 _ = happyReduce_76

action_75 _ = happyReduce_85

action_76 (67) = happyShift action_43
action_76 (68) = happyShift action_28
action_76 (69) = happyShift action_29
action_76 (74) = happyShift action_82
action_76 (31) = happyGoto action_81
action_76 (32) = happyGoto action_41
action_76 (33) = happyGoto action_42
action_76 _ = happyFail

action_77 (47) = happyShift action_59
action_77 (48) = happyShift action_60
action_77 (49) = happyShift action_61
action_77 (55) = happyShift action_62
action_77 (68) = happyShift action_28
action_77 (69) = happyShift action_29
action_77 (71) = happyShift action_65
action_77 (72) = happyShift action_66
action_77 (77) = happyShift action_73
action_77 (13) = happyGoto action_50
action_77 (14) = happyGoto action_80
action_77 (17) = happyGoto action_52
action_77 (18) = happyGoto action_53
action_77 (19) = happyGoto action_54
action_77 (26) = happyGoto action_57
action_77 (33) = happyGoto action_58
action_77 _ = happyFail

action_78 (34) = happyShift action_13
action_78 (35) = happyShift action_14
action_78 (36) = happyShift action_15
action_78 (37) = happyShift action_16
action_78 (39) = happyShift action_17
action_78 (40) = happyShift action_18
action_78 (44) = happyShift action_20
action_78 (45) = happyShift action_31
action_78 (46) = happyShift action_22
action_78 (50) = happyShift action_23
action_78 (51) = happyShift action_24
action_78 (52) = happyShift action_25
action_78 (53) = happyShift action_26
action_78 (67) = happyShift action_27
action_78 (68) = happyShift action_28
action_78 (69) = happyShift action_29
action_78 (6) = happyGoto action_79
action_78 (7) = happyGoto action_8
action_78 (10) = happyGoto action_9
action_78 (20) = happyGoto action_10
action_78 (27) = happyGoto action_11
action_78 (33) = happyGoto action_12
action_78 _ = happyFail

action_79 _ = happyReduce_8

action_80 (54) = happyShift action_86
action_80 (55) = happyShift action_87
action_80 (15) = happyGoto action_85
action_80 _ = happyReduce_24

action_81 _ = happyReduce_84

action_82 (67) = happyShift action_43
action_82 (68) = happyShift action_28
action_82 (69) = happyShift action_29
action_82 (31) = happyGoto action_133
action_82 (32) = happyGoto action_41
action_82 (33) = happyGoto action_42
action_82 _ = happyFail

action_83 (54) = happyShift action_86
action_83 (55) = happyShift action_87
action_83 (78) = happyShift action_130
action_83 (15) = happyGoto action_85
action_83 _ = happyFail

action_84 (47) = happyShift action_59
action_84 (48) = happyShift action_60
action_84 (49) = happyShift action_61
action_84 (55) = happyShift action_62
action_84 (67) = happyShift action_63
action_84 (68) = happyShift action_28
action_84 (69) = happyShift action_29
action_84 (70) = happyShift action_64
action_84 (71) = happyShift action_65
action_84 (72) = happyShift action_66
action_84 (77) = happyShift action_73
action_84 (11) = happyGoto action_69
action_84 (12) = happyGoto action_49
action_84 (13) = happyGoto action_50
action_84 (14) = happyGoto action_70
action_84 (17) = happyGoto action_52
action_84 (18) = happyGoto action_53
action_84 (19) = happyGoto action_54
action_84 (26) = happyGoto action_57
action_84 (28) = happyGoto action_132
action_84 (29) = happyGoto action_72
action_84 (33) = happyGoto action_58
action_84 _ = happyReduce_79

action_85 (47) = happyShift action_59
action_85 (48) = happyShift action_60
action_85 (49) = happyShift action_61
action_85 (68) = happyShift action_28
action_85 (69) = happyShift action_29
action_85 (71) = happyShift action_65
action_85 (72) = happyShift action_66
action_85 (77) = happyShift action_73
action_85 (13) = happyGoto action_122
action_85 (17) = happyGoto action_131
action_85 (18) = happyGoto action_53
action_85 (19) = happyGoto action_54
action_85 (26) = happyGoto action_57
action_85 (33) = happyGoto action_58
action_85 _ = happyFail

action_86 _ = happyReduce_38

action_87 _ = happyReduce_39

action_88 (54) = happyShift action_86
action_88 (55) = happyShift action_87
action_88 (61) = happyShift action_102
action_88 (62) = happyShift action_103
action_88 (63) = happyShift action_104
action_88 (64) = happyShift action_105
action_88 (65) = happyShift action_106
action_88 (66) = happyShift action_107
action_88 (78) = happyShift action_130
action_88 (15) = happyGoto action_85
action_88 (25) = happyGoto action_101
action_88 _ = happyFail

action_89 (78) = happyShift action_129
action_89 _ = happyFail

action_90 (54) = happyShift action_86
action_90 (55) = happyShift action_87
action_90 (15) = happyGoto action_85
action_90 _ = happyReduce_37

action_91 (47) = happyShift action_59
action_91 (48) = happyShift action_60
action_91 (49) = happyShift action_61
action_91 (55) = happyShift action_62
action_91 (68) = happyShift action_28
action_91 (69) = happyShift action_29
action_91 (71) = happyShift action_65
action_91 (72) = happyShift action_66
action_91 (77) = happyShift action_73
action_91 (13) = happyGoto action_50
action_91 (14) = happyGoto action_128
action_91 (17) = happyGoto action_52
action_91 (18) = happyGoto action_53
action_91 (19) = happyGoto action_54
action_91 (26) = happyGoto action_57
action_91 (33) = happyGoto action_58
action_91 _ = happyFail

action_92 (67) = happyShift action_126
action_92 (70) = happyShift action_127
action_92 _ = happyFail

action_93 (72) = happyShift action_125
action_93 _ = happyFail

action_94 _ = happyReduce_58

action_95 _ = happyReduce_50

action_96 (34) = happyShift action_13
action_96 (35) = happyShift action_14
action_96 (36) = happyShift action_15
action_96 (37) = happyShift action_16
action_96 (39) = happyShift action_17
action_96 (40) = happyShift action_18
action_96 (44) = happyShift action_20
action_96 (45) = happyShift action_31
action_96 (46) = happyShift action_22
action_96 (50) = happyShift action_23
action_96 (51) = happyShift action_24
action_96 (52) = happyShift action_25
action_96 (53) = happyShift action_26
action_96 (67) = happyShift action_27
action_96 (68) = happyShift action_28
action_96 (69) = happyShift action_29
action_96 (72) = happyShift action_97
action_96 (6) = happyGoto action_94
action_96 (7) = happyGoto action_8
action_96 (10) = happyGoto action_9
action_96 (20) = happyGoto action_10
action_96 (21) = happyGoto action_124
action_96 (27) = happyGoto action_11
action_96 (33) = happyGoto action_12
action_96 _ = happyFail

action_97 _ = happyReduce_57

action_98 (47) = happyShift action_59
action_98 (48) = happyShift action_60
action_98 (49) = happyShift action_61
action_98 (68) = happyShift action_28
action_98 (69) = happyShift action_29
action_98 (71) = happyShift action_65
action_98 (72) = happyShift action_66
action_98 (77) = happyShift action_73
action_98 (13) = happyGoto action_122
action_98 (18) = happyGoto action_123
action_98 (19) = happyGoto action_54
action_98 (26) = happyGoto action_57
action_98 (33) = happyGoto action_58
action_98 _ = happyFail

action_99 _ = happyReduce_40

action_100 _ = happyReduce_41

action_101 (47) = happyShift action_59
action_101 (48) = happyShift action_60
action_101 (49) = happyShift action_61
action_101 (55) = happyShift action_62
action_101 (68) = happyShift action_28
action_101 (69) = happyShift action_29
action_101 (71) = happyShift action_65
action_101 (72) = happyShift action_66
action_101 (77) = happyShift action_73
action_101 (13) = happyGoto action_50
action_101 (14) = happyGoto action_121
action_101 (17) = happyGoto action_52
action_101 (18) = happyGoto action_53
action_101 (19) = happyGoto action_54
action_101 (26) = happyGoto action_57
action_101 (33) = happyGoto action_58
action_101 _ = happyFail

action_102 _ = happyReduce_66

action_103 _ = happyReduce_69

action_104 _ = happyReduce_67

action_105 _ = happyReduce_68

action_106 _ = happyReduce_70

action_107 _ = happyReduce_71

action_108 (67) = happyShift action_63
action_108 (70) = happyShift action_64
action_108 (12) = happyGoto action_120
action_108 _ = happyFail

action_109 (67) = happyShift action_63
action_109 (70) = happyShift action_64
action_109 (11) = happyGoto action_119
action_109 (12) = happyGoto action_49
action_109 _ = happyFail

action_110 (68) = happyShift action_28
action_110 (69) = happyShift action_29
action_110 (71) = happyShift action_65
action_110 (72) = happyShift action_66
action_110 (19) = happyGoto action_118
action_110 (26) = happyGoto action_57
action_110 (33) = happyGoto action_58
action_110 _ = happyFail

action_111 (67) = happyShift action_43
action_111 (68) = happyShift action_28
action_111 (69) = happyShift action_29
action_111 (31) = happyGoto action_117
action_111 (32) = happyGoto action_41
action_111 (33) = happyGoto action_42
action_111 _ = happyFail

action_112 _ = happyReduce_21

action_113 _ = happyReduce_20

action_114 (55) = happyShift action_35
action_114 (69) = happyShift action_36
action_114 (70) = happyShift action_37
action_114 (71) = happyShift action_38
action_114 (72) = happyShift action_39
action_114 (8) = happyGoto action_116
action_114 (9) = happyGoto action_34
action_114 _ = happyFail

action_115 _ = happyReduce_25

action_116 _ = happyReduce_17

action_117 _ = happyReduce_87

action_118 (41) = happyShift action_142
action_118 _ = happyFail

action_119 _ = happyReduce_64

action_120 _ = happyReduce_27

action_121 (54) = happyShift action_86
action_121 (55) = happyShift action_87
action_121 (15) = happyGoto action_85
action_121 _ = happyReduce_65

action_122 _ = happyReduce_46

action_123 _ = happyReduce_42

action_124 _ = happyReduce_49

action_125 (78) = happyShift action_141
action_125 _ = happyFail

action_126 (78) = happyShift action_140
action_126 _ = happyFail

action_127 (78) = happyShift action_139
action_127 _ = happyFail

action_128 (54) = happyShift action_86
action_128 (55) = happyShift action_87
action_128 (78) = happyShift action_138
action_128 (15) = happyGoto action_85
action_128 _ = happyFail

action_129 (58) = happyShift action_135
action_129 (59) = happyShift action_136
action_129 (60) = happyShift action_137
action_129 (23) = happyGoto action_134
action_129 _ = happyFail

action_130 _ = happyReduce_45

action_131 (56) = happyShift action_99
action_131 (57) = happyShift action_100
action_131 (16) = happyGoto action_98
action_131 _ = happyReduce_34

action_132 _ = happyReduce_80

action_133 _ = happyReduce_83

action_134 (77) = happyShift action_144
action_134 _ = happyFail

action_135 _ = happyReduce_61

action_136 _ = happyReduce_62

action_137 _ = happyReduce_63

action_138 _ = happyReduce_33

action_139 _ = happyReduce_30

action_140 _ = happyReduce_31

action_141 _ = happyReduce_32

action_142 (68) = happyShift action_28
action_142 (69) = happyShift action_29
action_142 (71) = happyShift action_65
action_142 (72) = happyShift action_66
action_142 (19) = happyGoto action_143
action_142 (26) = happyGoto action_57
action_142 (33) = happyGoto action_58
action_142 _ = happyFail

action_143 (43) = happyShift action_147
action_143 (73) = happyShift action_6
action_143 (4) = happyGoto action_146
action_143 (5) = happyGoto action_5
action_143 _ = happyFail

action_144 (47) = happyShift action_59
action_144 (48) = happyShift action_60
action_144 (49) = happyShift action_61
action_144 (55) = happyShift action_62
action_144 (67) = happyShift action_63
action_144 (68) = happyShift action_28
action_144 (69) = happyShift action_29
action_144 (70) = happyShift action_64
action_144 (71) = happyShift action_65
action_144 (72) = happyShift action_66
action_144 (77) = happyShift action_67
action_144 (11) = happyGoto action_48
action_144 (12) = happyGoto action_49
action_144 (13) = happyGoto action_50
action_144 (14) = happyGoto action_51
action_144 (17) = happyGoto action_52
action_144 (18) = happyGoto action_53
action_144 (19) = happyGoto action_54
action_144 (22) = happyGoto action_145
action_144 (24) = happyGoto action_56
action_144 (26) = happyGoto action_57
action_144 (33) = happyGoto action_58
action_144 _ = happyFail

action_145 (78) = happyShift action_149
action_145 _ = happyFail

action_146 _ = happyReduce_52

action_147 (68) = happyShift action_28
action_147 (69) = happyShift action_29
action_147 (71) = happyShift action_65
action_147 (72) = happyShift action_66
action_147 (19) = happyGoto action_148
action_147 (26) = happyGoto action_57
action_147 (33) = happyGoto action_58
action_147 _ = happyFail

action_148 (73) = happyShift action_6
action_148 (4) = happyGoto action_150
action_148 (5) = happyGoto action_5
action_148 _ = happyFail

action_149 _ = happyReduce_60

action_150 _ = happyReduce_51

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
		 (let nr = getTkIntVal happy_var_1
                                                     in [(nr, [NOOP])]
	)
happyReduction_3 _ _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_2  4 happyReduction_4
happyReduction_4 _
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn4
		 (let nr = getTkIntVal happy_var_1
                                                     in [(nr, [NOOP])]
	)
happyReduction_4 _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_2  4 happyReduction_5
happyReduction_5 _
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn4
		 (let nr = getTkIntVal happy_var_1
                                          in (nr, [ControlStructure Return])
	)
happyReduction_5 _ _  = notHappyAtAll 

happyReduce_6 = happyMonadReduce 2 5 happyReduction_6
happyReduction_6 ((HappyAbsSyn6  happy_var_2) `HappyStk`
	(HappyTerminal happy_var_1) `HappyStk`
	happyRest) tk
	 = happyThen (( do 
                                                nr <- buildLineNumber $! happy_var_1
                                                return (nr,happy_var_2))
	) (\r -> happyReturn (HappyAbsSyn5 r))

happyReduce_7 = happySpecReduce_1  6 happyReduction_7
happyReduction_7 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 ([happy_var_1]
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  6 happyReduction_8
happyReduction_8 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1:happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_1  7 happyReduction_9
happyReduction_9 (HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn7
		 (IO_Com happy_var_1
	)
happyReduction_9 _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_1  7 happyReduction_10
happyReduction_10 (HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn7
		 (ControlStructure happy_var_1
	)
happyReduction_10 _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_1  7 happyReduction_11
happyReduction_11 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1
	)
happyReduction_11 _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_2  7 happyReduction_12
happyReduction_12 (HappyAbsSyn31  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (Read happy_var_2
	)
happyReduction_12 _ _  = notHappyAtAll 

happyReduce_13 = happyMonadReduce 2 7 happyReduction_13
happyReduction_13 ((HappyAbsSyn8  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest) tk
	 = happyThen (( do
                                           st <- get
                                           let old_con = data_temp st
                                           let newst = st { 
                                                 data_temp = old_con ++ happy_var_2
                                               }
                                           put newst
                                           return NOOP)
	) (\r -> happyReturn (HappyAbsSyn7 r))

happyReduce_14 = happySpecReduce_1  7 happyReduction_14
happyReduction_14 _
	 =  HappyAbsSyn7
		 (Restore
	)

happyReduce_15 = happySpecReduce_1  7 happyReduction_15
happyReduction_15 _
	 =  HappyAbsSyn7
		 (NOOP
	)

happyReduce_16 = happySpecReduce_1  8 happyReduction_16
happyReduction_16 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 ([happy_var_1]
	)
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  8 happyReduction_17
happyReduction_17 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1:happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  9 happyReduction_18
happyReduction_18 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn9
		 (DataInt $ getTkIntVal happy_var_1
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_1  9 happyReduction_19
happyReduction_19 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn9
		 (DataFloat $ getTkFltVal happy_var_1
	)
happyReduction_19 _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_2  9 happyReduction_20
happyReduction_20 (HappyTerminal happy_var_2)
	_
	 =  HappyAbsSyn9
		 (DataInt $ (- getTkIntVal happy_var_2)
	)
happyReduction_20 _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_2  9 happyReduction_21
happyReduction_21 (HappyTerminal happy_var_2)
	_
	 =  HappyAbsSyn9
		 (DataFloat $ (- getTkFltVal happy_var_2)
	)
happyReduction_21 _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_1  9 happyReduction_22
happyReduction_22 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn9
		 (DataString $ getTkStrVal happy_var_1
	)
happyReduction_22 _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_1  9 happyReduction_23
happyReduction_23 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn9
		 (DataString $ getTkStrVal happy_var_1
	)
happyReduction_23 _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  10 happyReduction_24
happyReduction_24 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn33  happy_var_1)
	 =  HappyAbsSyn10
		 (ArithAssignment happy_var_1 happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  10 happyReduction_25
happyReduction_25 (HappyAbsSyn11  happy_var_3)
	_
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (let {
                                                      str = getTkStrVal happy_var_1;
                                                      str' = StringVar str
                                               } in StringAssignment str' happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_1  11 happyReduction_26
happyReduction_26 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 (StringOp happy_var_1
	)
happyReduction_26 _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  11 happyReduction_27
happyReduction_27 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 (StringExpr (happy_var_1,happy_var_3) "+"
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_1  12 happyReduction_28
happyReduction_28 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn12
		 (let str = getTkStrVal happy_var_1
                                                     in StringLiteral str
	)
happyReduction_28 _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_1  12 happyReduction_29
happyReduction_29 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn12
		 (let {
                                                       str = getTkStrVal happy_var_1;
                                                       str' = StringVar str
                                                 } in StringVar_BString str'
	)
happyReduction_29 _  = notHappyAtAll 

happyReduce_30 = happyReduce 4 13 happyReduction_30
happyReduction_30 (_ `HappyStk`
	(HappyTerminal happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (Len $ getTkStrVal happy_var_3
	) `HappyStk` happyRest

happyReduce_31 = happyReduce 4 13 happyReduction_31
happyReduction_31 (_ `HappyStk`
	(HappyTerminal happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (let str = getTkStrVal happy_var_3
                                                 in LenVar (StringVar $ str)
	) `HappyStk` happyRest

happyReduce_32 = happyReduce 4 13 happyReduction_32
happyReduction_32 (_ `HappyStk`
	(HappyTerminal happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (Random $ getTkIntVal happy_var_3
	) `HappyStk` happyRest

happyReduce_33 = happyReduce 4 13 happyReduction_33
happyReduction_33 (_ `HappyStk`
	(HappyAbsSyn14  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (IntFunc happy_var_3
	) `HappyStk` happyRest

happyReduce_34 = happySpecReduce_3  14 happyReduction_34
happyReduction_34 (HappyAbsSyn17  happy_var_3)
	(HappyAbsSyn15  happy_var_2)
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (NumExpr (happy_var_1,happy_var_3) happy_var_2
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_1  14 happyReduction_35
happyReduction_35 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn14
		 (happy_var_1
	)
happyReduction_35 _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_1  14 happyReduction_36
happyReduction_36 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn14
		 (NumFunc happy_var_1
	)
happyReduction_36 _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_2  14 happyReduction_37
happyReduction_37 (HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (NumMinus happy_var_2
	)
happyReduction_37 _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_1  15 happyReduction_38
happyReduction_38 _
	 =  HappyAbsSyn15
		 ("+"
	)

happyReduce_39 = happySpecReduce_1  15 happyReduction_39
happyReduction_39 _
	 =  HappyAbsSyn15
		 ("-"
	)

happyReduce_40 = happySpecReduce_1  16 happyReduction_40
happyReduction_40 _
	 =  HappyAbsSyn16
		 ("*"
	)

happyReduce_41 = happySpecReduce_1  16 happyReduction_41
happyReduction_41 _
	 =  HappyAbsSyn16
		 ("/"
	)

happyReduce_42 = happySpecReduce_3  17 happyReduction_42
happyReduction_42 (HappyAbsSyn18  happy_var_3)
	(HappyAbsSyn16  happy_var_2)
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (NumExpr (happy_var_1,happy_var_3) happy_var_2
	)
happyReduction_42 _ _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_1  17 happyReduction_43
happyReduction_43 (HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1
	)
happyReduction_43 _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_1  18 happyReduction_44
happyReduction_44 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn18
		 (NumOp happy_var_1
	)
happyReduction_44 _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_3  18 happyReduction_45
happyReduction_45 _
	(HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn18
		 (happy_var_2
	)
happyReduction_45 _ _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_1  18 happyReduction_46
happyReduction_46 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn18
		 (NumFunc happy_var_1
	)
happyReduction_46 _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_1  19 happyReduction_47
happyReduction_47 (HappyAbsSyn33  happy_var_1)
	 =  HappyAbsSyn19
		 (OpVar happy_var_1
	)
happyReduction_47 _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_1  19 happyReduction_48
happyReduction_48 (HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn19
		 (happy_var_1
	)
happyReduction_48 _  = notHappyAtAll 

happyReduce_49 = happyReduce 4 20 happyReduction_49
happyReduction_49 ((HappyAbsSyn21  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn22  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 (If happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_50 = happySpecReduce_3  20 happyReduction_50
happyReduction_50 (HappyAbsSyn21  happy_var_3)
	(HappyAbsSyn22  happy_var_2)
	_
	 =  HappyAbsSyn20
		 (If happy_var_2 happy_var_3
	)
happyReduction_50 _ _ _  = notHappyAtAll 

happyReduce_51 = happyReduce 9 20 happyReduction_51
happyReduction_51 ((HappyAbsSyn4  happy_var_9) `HappyStk`
	(HappyAbsSyn19  happy_var_8) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn19  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn19  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn33  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 (For happy_var_2 (happy_var_4,happy_var_8,happy_var_6) happy_var_9
	) `HappyStk` happyRest

happyReduce_52 = happyReduce 7 20 happyReduction_52
happyReduction_52 ((HappyAbsSyn4  happy_var_7) `HappyStk`
	(HappyAbsSyn19  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn19  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn33  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 (For happy_var_2 (happy_var_4,(IntConst 1),happy_var_6) happy_var_7
	) `HappyStk` happyRest

happyReduce_53 = happySpecReduce_2  20 happyReduction_53
happyReduction_53 (HappyTerminal happy_var_2)
	_
	 =  HappyAbsSyn20
		 (GoSub $ getTkIntVal happy_var_2
	)
happyReduction_53 _ _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_2  20 happyReduction_54
happyReduction_54 (HappyTerminal happy_var_2)
	_
	 =  HappyAbsSyn20
		 (Goto $ getTkIntVal happy_var_2
	)
happyReduction_54 _ _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_1  20 happyReduction_55
happyReduction_55 _
	 =  HappyAbsSyn20
		 (End
	)

happyReduce_56 = happySpecReduce_1  20 happyReduction_56
happyReduction_56 _
	 =  HappyAbsSyn20
		 (Return
	)

happyReduce_57 = happySpecReduce_1  21 happyReduction_57
happyReduction_57 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn21
		 (let nr  = getTkIntVal happy_var_1
                                            in [ControlStructure $ Goto nr]
	)
happyReduction_57 _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_1  21 happyReduction_58
happyReduction_58 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn21
		 (happy_var_1
	)
happyReduction_58 _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_1  22 happyReduction_59
happyReduction_59 (HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn22
		 (happy_var_1
	)
happyReduction_59 _  = notHappyAtAll 

happyReduce_60 = happyReduce 7 22 happyReduction_60
happyReduction_60 (_ `HappyStk`
	(HappyAbsSyn22  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn23  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn22  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn22
		 (BoolExprLog (happy_var_2,happy_var_6) happy_var_4
	) `HappyStk` happyRest

happyReduce_61 = happySpecReduce_1  23 happyReduction_61
happyReduction_61 _
	 =  HappyAbsSyn23
		 ("||"
	)

happyReduce_62 = happySpecReduce_1  23 happyReduction_62
happyReduction_62 _
	 =  HappyAbsSyn23
		 ("&&"
	)

happyReduce_63 = happySpecReduce_1  23 happyReduction_63
happyReduction_63 _
	 =  HappyAbsSyn23
		 ("neg"
	)

happyReduce_64 = happySpecReduce_3  24 happyReduction_64
happyReduction_64 (HappyAbsSyn11  happy_var_3)
	(HappyAbsSyn25  happy_var_2)
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn24
		 (BoolExprString (happy_var_1,happy_var_3) happy_var_2
	)
happyReduction_64 _ _ _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_3  24 happyReduction_65
happyReduction_65 (HappyAbsSyn14  happy_var_3)
	(HappyAbsSyn25  happy_var_2)
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn24
		 (BoolExprNum (happy_var_1,happy_var_3) happy_var_2
	)
happyReduction_65 _ _ _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_1  25 happyReduction_66
happyReduction_66 _
	 =  HappyAbsSyn25
		 ("=="
	)

happyReduce_67 = happySpecReduce_1  25 happyReduction_67
happyReduction_67 _
	 =  HappyAbsSyn25
		 ("<"
	)

happyReduce_68 = happySpecReduce_1  25 happyReduction_68
happyReduction_68 _
	 =  HappyAbsSyn25
		 (">"
	)

happyReduce_69 = happySpecReduce_1  25 happyReduction_69
happyReduction_69 _
	 =  HappyAbsSyn25
		 ("/="
	)

happyReduce_70 = happySpecReduce_1  25 happyReduction_70
happyReduction_70 _
	 =  HappyAbsSyn25
		 ("<="
	)

happyReduce_71 = happySpecReduce_1  25 happyReduction_71
happyReduction_71 _
	 =  HappyAbsSyn25
		 (">="
	)

happyReduce_72 = happySpecReduce_1  26 happyReduction_72
happyReduction_72 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn26
		 (let int = getTkIntVal happy_var_1
                                                   in IntConst int
	)
happyReduction_72 _  = notHappyAtAll 

happyReduce_73 = happySpecReduce_1  26 happyReduction_73
happyReduction_73 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn26
		 (let flt = getTkFltVal happy_var_1
                                                   in FloatConst flt
	)
happyReduction_73 _  = notHappyAtAll 

happyReduce_74 = happySpecReduce_2  27 happyReduction_74
happyReduction_74 (HappyAbsSyn28  happy_var_2)
	_
	 =  HappyAbsSyn27
		 (Print happy_var_2
	)
happyReduction_74 _ _  = notHappyAtAll 

happyReduce_75 = happySpecReduce_1  27 happyReduction_75
happyReduction_75 _
	 =  HappyAbsSyn27
		 (Print ([], True)
	)

happyReduce_76 = happySpecReduce_2  27 happyReduction_76
happyReduction_76 (HappyAbsSyn30  happy_var_2)
	_
	 =  HappyAbsSyn27
		 (Input happy_var_2
	)
happyReduction_76 _ _  = notHappyAtAll 

happyReduce_77 = happySpecReduce_2  27 happyReduction_77
happyReduction_77 (HappyAbsSyn32  happy_var_2)
	_
	 =  HappyAbsSyn27
		 (Get happy_var_2
	)
happyReduction_77 _ _  = notHappyAtAll 

happyReduce_78 = happySpecReduce_1  28 happyReduction_78
happyReduction_78 (HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn28
		 (([happy_var_1], True)
	)
happyReduction_78 _  = notHappyAtAll 

happyReduce_79 = happySpecReduce_2  28 happyReduction_79
happyReduction_79 _
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn28
		 (([happy_var_1], False)
	)
happyReduction_79 _ _  = notHappyAtAll 

happyReduce_80 = happySpecReduce_3  28 happyReduction_80
happyReduction_80 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn28
		 ((happy_var_1:(fst happy_var_3), snd happy_var_3)
	)
happyReduction_80 _ _ _  = notHappyAtAll 

happyReduce_81 = happySpecReduce_1  29 happyReduction_81
happyReduction_81 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn29
		 (OutStringExpr happy_var_1
	)
happyReduction_81 _  = notHappyAtAll 

happyReduce_82 = happySpecReduce_1  29 happyReduction_82
happyReduction_82 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn29
		 (OutNumExpr happy_var_1
	)
happyReduction_82 _  = notHappyAtAll 

happyReduce_83 = happySpecReduce_3  30 happyReduction_83
happyReduction_83 (HappyAbsSyn31  happy_var_3)
	_
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn30
		 ((InputStuff [getTkStrVal happy_var_1] happy_var_3, False)
	)
happyReduction_83 _ _ _  = notHappyAtAll 

happyReduce_84 = happySpecReduce_2  30 happyReduction_84
happyReduction_84 (HappyAbsSyn31  happy_var_2)
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn30
		 ((InputStuff [getTkStrVal happy_var_1] happy_var_2, True)
	)
happyReduction_84 _ _  = notHappyAtAll 

happyReduce_85 = happySpecReduce_1  30 happyReduction_85
happyReduction_85 (HappyAbsSyn31  happy_var_1)
	 =  HappyAbsSyn30
		 ((InputStuff [] happy_var_1, False)
	)
happyReduction_85 _  = notHappyAtAll 

happyReduce_86 = happySpecReduce_1  31 happyReduction_86
happyReduction_86 (HappyAbsSyn32  happy_var_1)
	 =  HappyAbsSyn31
		 ([happy_var_1]
	)
happyReduction_86 _  = notHappyAtAll 

happyReduce_87 = happySpecReduce_3  31 happyReduction_87
happyReduction_87 (HappyAbsSyn31  happy_var_3)
	_
	(HappyAbsSyn32  happy_var_1)
	 =  HappyAbsSyn31
		 (happy_var_1:happy_var_3
	)
happyReduction_87 _ _ _  = notHappyAtAll 

happyReduce_88 = happySpecReduce_1  32 happyReduction_88
happyReduction_88 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn32
		 (StringVar_Var (StringVar $ getTkStrVal happy_var_1)
	)
happyReduction_88 _  = notHappyAtAll 

happyReduce_89 = happySpecReduce_1  32 happyReduction_89
happyReduction_89 (HappyAbsSyn33  happy_var_1)
	 =  HappyAbsSyn32
		 (NumVar_Var happy_var_1
	)
happyReduction_89 _  = notHappyAtAll 

happyReduce_90 = happySpecReduce_1  33 happyReduction_90
happyReduction_90 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn33
		 (IntVar $ getTkStrVal happy_var_1
	)
happyReduction_90 _  = notHappyAtAll 

happyReduce_91 = happySpecReduce_1  33 happyReduction_91
happyReduction_91 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn33
		 (FloatVar $ getTkStrVal happy_var_1
	)
happyReduction_91 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 79 79 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenWrap _type pos TkInput -> cont 34;
	TokenWrap _type pos TkPrint -> cont 35;
	TokenWrap _type pos TkGet -> cont 36;
	TokenWrap _type pos TkIf -> cont 37;
	TokenWrap _type pos TkThen -> cont 38;
	TokenWrap _type pos TkGoto -> cont 39;
	TokenWrap _type pos TkFor -> cont 40;
	TokenWrap _type pos TkTo -> cont 41;
	TokenWrap _type pos TkNext -> cont 42;
	TokenWrap _type pos TkStep -> cont 43;
	TokenWrap _type pos TkGoSub -> cont 44;
	TokenWrap _type pos TkReturn -> cont 45;
	TokenWrap _type pos TkEnd -> cont 46;
	TokenWrap _type pos TkRandom -> cont 47;
	TokenWrap _type pos TkLen -> cont 48;
	TokenWrap _type pos TkIntFunc -> cont 49;
	TokenWrap _type pos TkRead -> cont 50;
	TokenWrap _type pos TkData -> cont 51;
	TokenWrap _type pos TkRestore -> cont 52;
	TokenWrap _type pos TkComment -> cont 53;
	TokenWrap _type pos TkPlus -> cont 54;
	TokenWrap _type pos TkMinus -> cont 55;
	TokenWrap _type pos TkTimes -> cont 56;
	TokenWrap _type pos TkDiv -> cont 57;
	TokenWrap _type pos TkLogOr -> cont 58;
	TokenWrap _type pos TkLogAnd -> cont 59;
	TokenWrap _type pos TkLogNeg -> cont 60;
	TokenWrap _type pos TkEqual -> cont 61;
	TokenWrap _type pos TkUnEqual -> cont 62;
	TokenWrap _type pos TkLt -> cont 63;
	TokenWrap _type pos TkGt -> cont 64;
	TokenWrap _type pos TkLE -> cont 65;
	TokenWrap _type pos TkGE -> cont 66;
	TokenWrap _type pos (TkStringVar val) -> cont 67;
	TokenWrap _type pos (TkIntVar val) -> cont 68;
	TokenWrap _t p (TkFloatVar_Or_DataString val) -> cont 69;
	TokenWrap _type pos (TkString val) -> cont 70;
	TokenWrap _type pos (TkConst (TkFloatConst val)) -> cont 71;
	TokenWrap _type pos (TkConst (TkIntConst val)) -> cont 72;
	TokenWrap _type pos (TkLineNumber val) -> cont 73;
	TokenWrap _type pos TkStringConcat -> cont 74;
	TokenWrap _type pos TkSingleLineCommandCombinator -> cont 75;
	TokenWrap _type pos TkKomma -> cont 76;
	TokenWrap _type pos TkBracketOpen -> cont 77;
	TokenWrap _type pos TkBracketClose -> cont 78;
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
