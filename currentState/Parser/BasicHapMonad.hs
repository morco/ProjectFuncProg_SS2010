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

action_0 (40) = happyShift action_6
action_0 (4) = happyGoto action_4
action_0 (5) = happyGoto action_5
action_0 _ = happyFail

action_1 (40) = happyShift action_3
action_1 (5) = happyGoto action_2
action_1 _ = happyFail

action_2 _ = happyFail

action_3 (34) = happyShift action_13
action_3 (35) = happyShift action_14
action_3 (37) = happyShift action_15
action_3 (38) = happyShift action_16
action_3 (39) = happyShift action_17
action_3 (44) = happyShift action_18
action_3 (46) = happyShift action_19
action_3 (47) = happyShift action_20
action_3 (69) = happyShift action_31
action_3 (70) = happyShift action_23
action_3 (71) = happyShift action_24
action_3 (73) = happyShift action_25
action_3 (75) = happyShift action_26
action_3 (76) = happyShift action_27
action_3 (77) = happyShift action_28
action_3 (78) = happyShift action_29
action_3 (6) = happyGoto action_7
action_3 (7) = happyGoto action_8
action_3 (10) = happyGoto action_9
action_3 (20) = happyGoto action_10
action_3 (27) = happyGoto action_11
action_3 (33) = happyGoto action_12
action_3 _ = happyFail

action_4 (79) = happyAccept
action_4 _ = happyFail

action_5 (40) = happyShift action_6
action_5 (4) = happyGoto action_30
action_5 (5) = happyGoto action_5
action_5 _ = happyReduce_1

action_6 (34) = happyShift action_13
action_6 (35) = happyShift action_14
action_6 (37) = happyShift action_15
action_6 (38) = happyShift action_16
action_6 (39) = happyShift action_17
action_6 (44) = happyShift action_18
action_6 (46) = happyShift action_19
action_6 (47) = happyShift action_20
action_6 (49) = happyShift action_21
action_6 (69) = happyShift action_22
action_6 (70) = happyShift action_23
action_6 (71) = happyShift action_24
action_6 (73) = happyShift action_25
action_6 (75) = happyShift action_26
action_6 (76) = happyShift action_27
action_6 (77) = happyShift action_28
action_6 (78) = happyShift action_29
action_6 (6) = happyGoto action_7
action_6 (7) = happyGoto action_8
action_6 (10) = happyGoto action_9
action_6 (20) = happyGoto action_10
action_6 (27) = happyGoto action_11
action_6 (33) = happyGoto action_12
action_6 _ = happyFail

action_7 _ = happyReduce_6

action_8 (42) = happyShift action_78
action_8 _ = happyReduce_7

action_9 _ = happyReduce_11

action_10 _ = happyReduce_10

action_11 _ = happyReduce_9

action_12 (53) = happyShift action_77
action_12 _ = happyFail

action_13 (36) = happyShift action_59
action_13 (37) = happyShift action_60
action_13 (38) = happyShift action_16
action_13 (39) = happyShift action_17
action_13 (51) = happyShift action_61
action_13 (52) = happyShift action_62
action_13 (60) = happyShift action_63
action_13 (63) = happyShift action_64
action_13 (64) = happyShift action_76
action_13 (72) = happyShift action_66
action_13 (74) = happyShift action_67
action_13 (11) = happyGoto action_72
action_13 (12) = happyGoto action_49
action_13 (13) = happyGoto action_50
action_13 (14) = happyGoto action_73
action_13 (17) = happyGoto action_52
action_13 (18) = happyGoto action_53
action_13 (19) = happyGoto action_54
action_13 (26) = happyGoto action_57
action_13 (28) = happyGoto action_74
action_13 (29) = happyGoto action_75
action_13 (33) = happyGoto action_58
action_13 _ = happyReduce_75

action_14 (36) = happyShift action_71
action_14 (37) = happyShift action_42
action_14 (38) = happyShift action_16
action_14 (39) = happyShift action_17
action_14 (30) = happyGoto action_69
action_14 (31) = happyGoto action_70
action_14 (32) = happyGoto action_40
action_14 (33) = happyGoto action_41
action_14 _ = happyFail

action_15 (53) = happyShift action_68
action_15 _ = happyFail

action_16 _ = happyReduce_90

action_17 _ = happyReduce_91

action_18 (36) = happyShift action_59
action_18 (37) = happyShift action_60
action_18 (38) = happyShift action_16
action_18 (39) = happyShift action_17
action_18 (51) = happyShift action_61
action_18 (52) = happyShift action_62
action_18 (60) = happyShift action_63
action_18 (63) = happyShift action_64
action_18 (64) = happyShift action_65
action_18 (72) = happyShift action_66
action_18 (74) = happyShift action_67
action_18 (11) = happyGoto action_48
action_18 (12) = happyGoto action_49
action_18 (13) = happyGoto action_50
action_18 (14) = happyGoto action_51
action_18 (17) = happyGoto action_52
action_18 (18) = happyGoto action_53
action_18 (19) = happyGoto action_54
action_18 (22) = happyGoto action_55
action_18 (24) = happyGoto action_56
action_18 (26) = happyGoto action_57
action_18 (33) = happyGoto action_58
action_18 _ = happyFail

action_19 (52) = happyShift action_47
action_19 _ = happyFail

action_20 (38) = happyShift action_16
action_20 (39) = happyShift action_17
action_20 (33) = happyGoto action_46
action_20 _ = happyFail

action_21 (38) = happyShift action_16
action_21 (39) = happyShift action_17
action_21 (33) = happyGoto action_45
action_21 _ = happyReduce_4

action_22 (40) = happyReduce_56
action_22 (42) = happyReduce_56
action_22 (79) = happyReduce_56
action_22 _ = happyReduce_56

action_23 (52) = happyShift action_44
action_23 _ = happyFail

action_24 _ = happyReduce_55

action_25 (37) = happyShift action_42
action_25 (38) = happyShift action_16
action_25 (39) = happyShift action_17
action_25 (32) = happyGoto action_43
action_25 (33) = happyGoto action_41
action_25 _ = happyFail

action_26 (37) = happyShift action_42
action_26 (38) = happyShift action_16
action_26 (39) = happyShift action_17
action_26 (31) = happyGoto action_39
action_26 (32) = happyGoto action_40
action_26 (33) = happyGoto action_41
action_26 _ = happyFail

action_27 (36) = happyShift action_34
action_27 (39) = happyShift action_35
action_27 (51) = happyShift action_36
action_27 (52) = happyShift action_37
action_27 (60) = happyShift action_38
action_27 (8) = happyGoto action_32
action_27 (9) = happyGoto action_33
action_27 _ = happyFail

action_28 _ = happyReduce_14

action_29 _ = happyReduce_15

action_30 _ = happyReduce_2

action_31 _ = happyReduce_56

action_32 _ = happyReduce_13

action_33 (43) = happyShift action_115
action_33 _ = happyReduce_16

action_34 _ = happyReduce_22

action_35 _ = happyReduce_23

action_36 _ = happyReduce_19

action_37 _ = happyReduce_18

action_38 (51) = happyShift action_113
action_38 (52) = happyShift action_114
action_38 _ = happyFail

action_39 _ = happyReduce_12

action_40 (43) = happyShift action_112
action_40 _ = happyReduce_86

action_41 _ = happyReduce_89

action_42 _ = happyReduce_88

action_43 _ = happyReduce_77

action_44 _ = happyReduce_53

action_45 _ = happyReduce_3

action_46 (53) = happyShift action_111
action_46 _ = happyFail

action_47 _ = happyReduce_54

action_48 (53) = happyShift action_103
action_48 (54) = happyShift action_104
action_48 (55) = happyShift action_105
action_48 (56) = happyShift action_106
action_48 (57) = happyShift action_107
action_48 (58) = happyShift action_108
action_48 (25) = happyGoto action_110
action_48 _ = happyFail

action_49 (59) = happyShift action_109
action_49 _ = happyReduce_26

action_50 (34) = happyReduce_46
action_50 (35) = happyReduce_46
action_50 (37) = happyReduce_46
action_50 (38) = happyReduce_46
action_50 (39) = happyReduce_46
action_50 (40) = happyReduce_46
action_50 (41) = happyReduce_46
action_50 (42) = happyReduce_46
action_50 (44) = happyReduce_46
action_50 (45) = happyReduce_46
action_50 (46) = happyReduce_46
action_50 (47) = happyReduce_46
action_50 (52) = happyReduce_46
action_50 (53) = happyReduce_46
action_50 (54) = happyReduce_46
action_50 (55) = happyReduce_46
action_50 (56) = happyReduce_46
action_50 (57) = happyReduce_46
action_50 (58) = happyReduce_46
action_50 (59) = happyReduce_46
action_50 (60) = happyReduce_46
action_50 (65) = happyReduce_46
action_50 (69) = happyReduce_46
action_50 (70) = happyReduce_46
action_50 (71) = happyReduce_46
action_50 (73) = happyReduce_46
action_50 (75) = happyReduce_46
action_50 (76) = happyReduce_46
action_50 (77) = happyReduce_46
action_50 (78) = happyReduce_46
action_50 (79) = happyReduce_46
action_50 _ = happyReduce_46

action_51 (53) = happyShift action_103
action_51 (54) = happyShift action_104
action_51 (55) = happyShift action_105
action_51 (56) = happyShift action_106
action_51 (57) = happyShift action_107
action_51 (58) = happyShift action_108
action_51 (59) = happyShift action_84
action_51 (60) = happyShift action_85
action_51 (15) = happyGoto action_83
action_51 (25) = happyGoto action_102
action_51 _ = happyFail

action_52 (61) = happyShift action_100
action_52 (62) = happyShift action_101
action_52 (16) = happyGoto action_99
action_52 _ = happyReduce_35

action_53 _ = happyReduce_43

action_54 _ = happyReduce_44

action_55 (34) = happyShift action_13
action_55 (35) = happyShift action_14
action_55 (37) = happyShift action_15
action_55 (38) = happyShift action_16
action_55 (39) = happyShift action_17
action_55 (44) = happyShift action_18
action_55 (45) = happyShift action_97
action_55 (46) = happyShift action_19
action_55 (47) = happyShift action_20
action_55 (52) = happyShift action_98
action_55 (69) = happyShift action_31
action_55 (70) = happyShift action_23
action_55 (71) = happyShift action_24
action_55 (73) = happyShift action_25
action_55 (75) = happyShift action_26
action_55 (76) = happyShift action_27
action_55 (77) = happyShift action_28
action_55 (78) = happyShift action_29
action_55 (6) = happyGoto action_95
action_55 (7) = happyGoto action_8
action_55 (10) = happyGoto action_9
action_55 (20) = happyGoto action_10
action_55 (21) = happyGoto action_96
action_55 (27) = happyGoto action_11
action_55 (33) = happyGoto action_12
action_55 _ = happyFail

action_56 _ = happyReduce_59

action_57 _ = happyReduce_48

action_58 _ = happyReduce_47

action_59 _ = happyReduce_28

action_60 _ = happyReduce_29

action_61 _ = happyReduce_73

action_62 _ = happyReduce_72

action_63 (38) = happyShift action_16
action_63 (39) = happyShift action_17
action_63 (51) = happyShift action_61
action_63 (52) = happyShift action_62
action_63 (60) = happyShift action_63
action_63 (63) = happyShift action_64
action_63 (64) = happyShift action_76
action_63 (72) = happyShift action_66
action_63 (74) = happyShift action_67
action_63 (13) = happyGoto action_50
action_63 (14) = happyGoto action_94
action_63 (17) = happyGoto action_52
action_63 (18) = happyGoto action_53
action_63 (19) = happyGoto action_54
action_63 (26) = happyGoto action_57
action_63 (33) = happyGoto action_58
action_63 _ = happyFail

action_64 (64) = happyShift action_93
action_64 _ = happyFail

action_65 (36) = happyShift action_59
action_65 (37) = happyShift action_60
action_65 (38) = happyShift action_16
action_65 (39) = happyShift action_17
action_65 (51) = happyShift action_61
action_65 (52) = happyShift action_62
action_65 (60) = happyShift action_63
action_65 (63) = happyShift action_64
action_65 (64) = happyShift action_65
action_65 (72) = happyShift action_66
action_65 (74) = happyShift action_67
action_65 (11) = happyGoto action_48
action_65 (12) = happyGoto action_49
action_65 (13) = happyGoto action_50
action_65 (14) = happyGoto action_91
action_65 (17) = happyGoto action_52
action_65 (18) = happyGoto action_53
action_65 (19) = happyGoto action_54
action_65 (22) = happyGoto action_92
action_65 (24) = happyGoto action_56
action_65 (26) = happyGoto action_57
action_65 (33) = happyGoto action_58
action_65 _ = happyFail

action_66 (64) = happyShift action_90
action_66 _ = happyFail

action_67 (64) = happyShift action_89
action_67 _ = happyFail

action_68 (36) = happyShift action_59
action_68 (37) = happyShift action_60
action_68 (11) = happyGoto action_88
action_68 (12) = happyGoto action_49
action_68 _ = happyFail

action_69 _ = happyReduce_76

action_70 _ = happyReduce_85

action_71 (37) = happyShift action_42
action_71 (38) = happyShift action_16
action_71 (39) = happyShift action_17
action_71 (41) = happyShift action_87
action_71 (31) = happyGoto action_86
action_71 (32) = happyGoto action_40
action_71 (33) = happyGoto action_41
action_71 _ = happyFail

action_72 _ = happyReduce_81

action_73 (59) = happyShift action_84
action_73 (60) = happyShift action_85
action_73 (15) = happyGoto action_83
action_73 _ = happyReduce_82

action_74 _ = happyReduce_74

action_75 (41) = happyShift action_82
action_75 _ = happyReduce_78

action_76 (38) = happyShift action_16
action_76 (39) = happyShift action_17
action_76 (51) = happyShift action_61
action_76 (52) = happyShift action_62
action_76 (60) = happyShift action_63
action_76 (63) = happyShift action_64
action_76 (64) = happyShift action_76
action_76 (72) = happyShift action_66
action_76 (74) = happyShift action_67
action_76 (13) = happyGoto action_50
action_76 (14) = happyGoto action_81
action_76 (17) = happyGoto action_52
action_76 (18) = happyGoto action_53
action_76 (19) = happyGoto action_54
action_76 (26) = happyGoto action_57
action_76 (33) = happyGoto action_58
action_76 _ = happyFail

action_77 (38) = happyShift action_16
action_77 (39) = happyShift action_17
action_77 (51) = happyShift action_61
action_77 (52) = happyShift action_62
action_77 (60) = happyShift action_63
action_77 (63) = happyShift action_64
action_77 (64) = happyShift action_76
action_77 (72) = happyShift action_66
action_77 (74) = happyShift action_67
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
action_78 (37) = happyShift action_15
action_78 (38) = happyShift action_16
action_78 (39) = happyShift action_17
action_78 (44) = happyShift action_18
action_78 (46) = happyShift action_19
action_78 (47) = happyShift action_20
action_78 (69) = happyShift action_31
action_78 (70) = happyShift action_23
action_78 (71) = happyShift action_24
action_78 (73) = happyShift action_25
action_78 (75) = happyShift action_26
action_78 (76) = happyShift action_27
action_78 (77) = happyShift action_28
action_78 (78) = happyShift action_29
action_78 (6) = happyGoto action_79
action_78 (7) = happyGoto action_8
action_78 (10) = happyGoto action_9
action_78 (20) = happyGoto action_10
action_78 (27) = happyGoto action_11
action_78 (33) = happyGoto action_12
action_78 _ = happyFail

action_79 _ = happyReduce_8

action_80 (59) = happyShift action_84
action_80 (60) = happyShift action_85
action_80 (15) = happyGoto action_83
action_80 _ = happyReduce_24

action_81 (59) = happyShift action_84
action_81 (60) = happyShift action_85
action_81 (65) = happyShift action_128
action_81 (15) = happyGoto action_83
action_81 _ = happyFail

action_82 (36) = happyShift action_59
action_82 (37) = happyShift action_60
action_82 (38) = happyShift action_16
action_82 (39) = happyShift action_17
action_82 (51) = happyShift action_61
action_82 (52) = happyShift action_62
action_82 (60) = happyShift action_63
action_82 (63) = happyShift action_64
action_82 (64) = happyShift action_76
action_82 (72) = happyShift action_66
action_82 (74) = happyShift action_67
action_82 (11) = happyGoto action_72
action_82 (12) = happyGoto action_49
action_82 (13) = happyGoto action_50
action_82 (14) = happyGoto action_73
action_82 (17) = happyGoto action_52
action_82 (18) = happyGoto action_53
action_82 (19) = happyGoto action_54
action_82 (26) = happyGoto action_57
action_82 (28) = happyGoto action_133
action_82 (29) = happyGoto action_75
action_82 (33) = happyGoto action_58
action_82 _ = happyReduce_79

action_83 (38) = happyShift action_16
action_83 (39) = happyShift action_17
action_83 (51) = happyShift action_61
action_83 (52) = happyShift action_62
action_83 (63) = happyShift action_64
action_83 (64) = happyShift action_76
action_83 (72) = happyShift action_66
action_83 (74) = happyShift action_67
action_83 (13) = happyGoto action_122
action_83 (17) = happyGoto action_132
action_83 (18) = happyGoto action_53
action_83 (19) = happyGoto action_54
action_83 (26) = happyGoto action_57
action_83 (33) = happyGoto action_58
action_83 _ = happyFail

action_84 _ = happyReduce_38

action_85 _ = happyReduce_39

action_86 _ = happyReduce_84

action_87 (37) = happyShift action_42
action_87 (38) = happyShift action_16
action_87 (39) = happyShift action_17
action_87 (31) = happyGoto action_131
action_87 (32) = happyGoto action_40
action_87 (33) = happyGoto action_41
action_87 _ = happyFail

action_88 _ = happyReduce_25

action_89 (38) = happyShift action_16
action_89 (39) = happyShift action_17
action_89 (51) = happyShift action_61
action_89 (52) = happyShift action_62
action_89 (60) = happyShift action_63
action_89 (63) = happyShift action_64
action_89 (64) = happyShift action_76
action_89 (72) = happyShift action_66
action_89 (74) = happyShift action_67
action_89 (13) = happyGoto action_50
action_89 (14) = happyGoto action_130
action_89 (17) = happyGoto action_52
action_89 (18) = happyGoto action_53
action_89 (19) = happyGoto action_54
action_89 (26) = happyGoto action_57
action_89 (33) = happyGoto action_58
action_89 _ = happyFail

action_90 (52) = happyShift action_129
action_90 _ = happyFail

action_91 (53) = happyShift action_103
action_91 (54) = happyShift action_104
action_91 (55) = happyShift action_105
action_91 (56) = happyShift action_106
action_91 (57) = happyShift action_107
action_91 (58) = happyShift action_108
action_91 (59) = happyShift action_84
action_91 (60) = happyShift action_85
action_91 (65) = happyShift action_128
action_91 (15) = happyGoto action_83
action_91 (25) = happyGoto action_102
action_91 _ = happyFail

action_92 (65) = happyShift action_127
action_92 _ = happyFail

action_93 (36) = happyShift action_125
action_93 (37) = happyShift action_126
action_93 _ = happyFail

action_94 (59) = happyShift action_84
action_94 (60) = happyShift action_85
action_94 (15) = happyGoto action_83
action_94 _ = happyReduce_37

action_95 _ = happyReduce_58

action_96 _ = happyReduce_50

action_97 (34) = happyShift action_13
action_97 (35) = happyShift action_14
action_97 (37) = happyShift action_15
action_97 (38) = happyShift action_16
action_97 (39) = happyShift action_17
action_97 (44) = happyShift action_18
action_97 (46) = happyShift action_19
action_97 (47) = happyShift action_20
action_97 (52) = happyShift action_98
action_97 (69) = happyShift action_31
action_97 (70) = happyShift action_23
action_97 (71) = happyShift action_24
action_97 (73) = happyShift action_25
action_97 (75) = happyShift action_26
action_97 (76) = happyShift action_27
action_97 (77) = happyShift action_28
action_97 (78) = happyShift action_29
action_97 (6) = happyGoto action_95
action_97 (7) = happyGoto action_8
action_97 (10) = happyGoto action_9
action_97 (20) = happyGoto action_10
action_97 (21) = happyGoto action_124
action_97 (27) = happyGoto action_11
action_97 (33) = happyGoto action_12
action_97 _ = happyFail

action_98 _ = happyReduce_57

action_99 (38) = happyShift action_16
action_99 (39) = happyShift action_17
action_99 (51) = happyShift action_61
action_99 (52) = happyShift action_62
action_99 (63) = happyShift action_64
action_99 (64) = happyShift action_76
action_99 (72) = happyShift action_66
action_99 (74) = happyShift action_67
action_99 (13) = happyGoto action_122
action_99 (18) = happyGoto action_123
action_99 (19) = happyGoto action_54
action_99 (26) = happyGoto action_57
action_99 (33) = happyGoto action_58
action_99 _ = happyFail

action_100 _ = happyReduce_40

action_101 _ = happyReduce_41

action_102 (38) = happyShift action_16
action_102 (39) = happyShift action_17
action_102 (51) = happyShift action_61
action_102 (52) = happyShift action_62
action_102 (60) = happyShift action_63
action_102 (63) = happyShift action_64
action_102 (64) = happyShift action_76
action_102 (72) = happyShift action_66
action_102 (74) = happyShift action_67
action_102 (13) = happyGoto action_50
action_102 (14) = happyGoto action_121
action_102 (17) = happyGoto action_52
action_102 (18) = happyGoto action_53
action_102 (19) = happyGoto action_54
action_102 (26) = happyGoto action_57
action_102 (33) = happyGoto action_58
action_102 _ = happyFail

action_103 _ = happyReduce_66

action_104 _ = happyReduce_69

action_105 _ = happyReduce_67

action_106 _ = happyReduce_68

action_107 _ = happyReduce_70

action_108 _ = happyReduce_71

action_109 (36) = happyShift action_59
action_109 (37) = happyShift action_60
action_109 (12) = happyGoto action_120
action_109 _ = happyFail

action_110 (36) = happyShift action_59
action_110 (37) = happyShift action_60
action_110 (11) = happyGoto action_119
action_110 (12) = happyGoto action_49
action_110 _ = happyFail

action_111 (38) = happyShift action_16
action_111 (39) = happyShift action_17
action_111 (51) = happyShift action_61
action_111 (52) = happyShift action_62
action_111 (19) = happyGoto action_118
action_111 (26) = happyGoto action_57
action_111 (33) = happyGoto action_58
action_111 _ = happyFail

action_112 (37) = happyShift action_42
action_112 (38) = happyShift action_16
action_112 (39) = happyShift action_17
action_112 (31) = happyGoto action_117
action_112 (32) = happyGoto action_40
action_112 (33) = happyGoto action_41
action_112 _ = happyFail

action_113 _ = happyReduce_21

action_114 _ = happyReduce_20

action_115 (36) = happyShift action_34
action_115 (39) = happyShift action_35
action_115 (51) = happyShift action_36
action_115 (52) = happyShift action_37
action_115 (60) = happyShift action_38
action_115 (8) = happyGoto action_116
action_115 (9) = happyGoto action_33
action_115 _ = happyFail

action_116 _ = happyReduce_17

action_117 _ = happyReduce_87

action_118 (48) = happyShift action_142
action_118 _ = happyFail

action_119 _ = happyReduce_64

action_120 _ = happyReduce_27

action_121 (59) = happyShift action_84
action_121 (60) = happyShift action_85
action_121 (15) = happyGoto action_83
action_121 _ = happyReduce_65

action_122 _ = happyReduce_46

action_123 _ = happyReduce_42

action_124 _ = happyReduce_49

action_125 (65) = happyShift action_141
action_125 _ = happyFail

action_126 (65) = happyShift action_140
action_126 _ = happyFail

action_127 (66) = happyShift action_137
action_127 (67) = happyShift action_138
action_127 (68) = happyShift action_139
action_127 (23) = happyGoto action_136
action_127 _ = happyFail

action_128 _ = happyReduce_45

action_129 (65) = happyShift action_135
action_129 _ = happyFail

action_130 (59) = happyShift action_84
action_130 (60) = happyShift action_85
action_130 (65) = happyShift action_134
action_130 (15) = happyGoto action_83
action_130 _ = happyFail

action_131 _ = happyReduce_83

action_132 (61) = happyShift action_100
action_132 (62) = happyShift action_101
action_132 (16) = happyGoto action_99
action_132 _ = happyReduce_34

action_133 _ = happyReduce_80

action_134 _ = happyReduce_33

action_135 _ = happyReduce_32

action_136 (64) = happyShift action_144
action_136 _ = happyFail

action_137 _ = happyReduce_61

action_138 _ = happyReduce_62

action_139 _ = happyReduce_63

action_140 _ = happyReduce_31

action_141 _ = happyReduce_30

action_142 (38) = happyShift action_16
action_142 (39) = happyShift action_17
action_142 (51) = happyShift action_61
action_142 (52) = happyShift action_62
action_142 (19) = happyGoto action_143
action_142 (26) = happyGoto action_57
action_142 (33) = happyGoto action_58
action_142 _ = happyFail

action_143 (40) = happyShift action_6
action_143 (50) = happyShift action_147
action_143 (4) = happyGoto action_146
action_143 (5) = happyGoto action_5
action_143 _ = happyFail

action_144 (36) = happyShift action_59
action_144 (37) = happyShift action_60
action_144 (38) = happyShift action_16
action_144 (39) = happyShift action_17
action_144 (51) = happyShift action_61
action_144 (52) = happyShift action_62
action_144 (60) = happyShift action_63
action_144 (63) = happyShift action_64
action_144 (64) = happyShift action_65
action_144 (72) = happyShift action_66
action_144 (74) = happyShift action_67
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

action_145 (65) = happyShift action_149
action_145 _ = happyFail

action_146 _ = happyReduce_52

action_147 (38) = happyShift action_16
action_147 (39) = happyShift action_17
action_147 (51) = happyShift action_61
action_147 (52) = happyShift action_62
action_147 (19) = happyGoto action_148
action_147 (26) = happyGoto action_57
action_147 (33) = happyGoto action_58
action_147 _ = happyFail

action_148 (40) = happyShift action_6
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
		 ([(getTokenIntValue happy_var_1, [NOOP])]
	)
happyReduction_3 _ _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_2  4 happyReduction_4
happyReduction_4 _
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn4
		 ([(getTokenIntValue happy_var_1, [NOOP])]
	)
happyReduction_4 _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_2  4 happyReduction_5
happyReduction_5 _
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn4
		 ((getTokenIntValue happy_var_1, [ControlStructure $ Return])
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
                                                 state <- get
                                                 let old_con = data_temp state
                                                 put $ state { data_temp = old_con ++ happy_var_2}
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
		 (DataInt $ getTokenIntValue happy_var_1
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_1  9 happyReduction_19
happyReduction_19 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn9
		 (DataFloat $ getTokenFloatValue happy_var_1
	)
happyReduction_19 _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_2  9 happyReduction_20
happyReduction_20 (HappyTerminal happy_var_2)
	_
	 =  HappyAbsSyn9
		 (DataInt $ (- getTokenIntValue happy_var_2)
	)
happyReduction_20 _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_2  9 happyReduction_21
happyReduction_21 (HappyTerminal happy_var_2)
	_
	 =  HappyAbsSyn9
		 (DataFloat $ (- getTokenFloatValue happy_var_2)
	)
happyReduction_21 _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_1  9 happyReduction_22
happyReduction_22 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn9
		 (DataString $ getTokenStringValue happy_var_1
	)
happyReduction_22 _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_1  9 happyReduction_23
happyReduction_23 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn9
		 (DataString $ getTokenStringValue happy_var_1
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
		 (StringAssignment (StringVar $ getTokenStringValue happy_var_1) happy_var_3
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
		 (StringLiteral $ getTokenStringValue happy_var_1
	)
happyReduction_28 _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_1  12 happyReduction_29
happyReduction_29 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn12
		 (StringVar_BString (StringVar $ getTokenStringValue happy_var_1)
	)
happyReduction_29 _  = notHappyAtAll 

happyReduce_30 = happyReduce 4 13 happyReduction_30
happyReduction_30 (_ `HappyStk`
	(HappyTerminal happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (Len $ getTokenStringValue happy_var_3
	) `HappyStk` happyRest

happyReduce_31 = happyReduce 4 13 happyReduction_31
happyReduction_31 (_ `HappyStk`
	(HappyTerminal happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (LenVar (StringVar $ getTokenStringValue happy_var_3)
	) `HappyStk` happyRest

happyReduce_32 = happyReduce 4 13 happyReduction_32
happyReduction_32 (_ `HappyStk`
	(HappyTerminal happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (Random ((\(TokenWrap _ _ (TkConst (TkIntConst x))) -> x)happy_var_3)
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
		 (GoSub $ getTokenIntValue happy_var_2
	)
happyReduction_53 _ _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_2  20 happyReduction_54
happyReduction_54 (HappyTerminal happy_var_2)
	_
	 =  HappyAbsSyn20
		 (Goto $ getTokenIntValue happy_var_2
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
		 ([ControlStructure $ Goto $ getTokenIntValue happy_var_1]
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
		 (IntConst $ getTokenIntValue happy_var_1
	)
happyReduction_72 _  = notHappyAtAll 

happyReduce_73 = happySpecReduce_1  26 happyReduction_73
happyReduction_73 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn26
		 (FloatConst $ getTokenFloatValue happy_var_1
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
		 ((InputStuff [getTokenStringValue happy_var_1] happy_var_3, False)
	)
happyReduction_83 _ _ _  = notHappyAtAll 

happyReduce_84 = happySpecReduce_2  30 happyReduction_84
happyReduction_84 (HappyAbsSyn31  happy_var_2)
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn30
		 ((InputStuff [getTokenStringValue happy_var_1] happy_var_2, True)
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
		 (StringVar_Var (StringVar $ getTokenStringValue happy_var_1)
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
		 (IntVar $ getTokenStringValue happy_var_1
	)
happyReduction_90 _  = notHappyAtAll 

happyReduce_91 = happySpecReduce_1  33 happyReduction_91
happyReduction_91 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn33
		 (FloatVar $ getTokenStringValue happy_var_1
	)
happyReduction_91 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 79 79 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenWrap _type pos TkPrint -> cont 34;
	TokenWrap _type pos TkInput -> cont 35;
	TokenWrap _type pos (TkString val) -> cont 36;
	TokenWrap _type pos (TkStringVar val) -> cont 37;
	TokenWrap _type posTk (TkIntVar val) -> cont 38;
	TokenWrap _type pos (TkFloatVar_Or_DataString val) -> cont 39;
	TokenWrap _type pos (TkLineNumber val) -> cont 40;
	TokenWrap _type pos TkStringConcat -> cont 41;
	TokenWrap _type pos TkSingleLineCommandCombinator -> cont 42;
	TokenWrap _type pos TkKomma -> cont 43;
	TokenWrap _type pos TkIf -> cont 44;
	TokenWrap _type pos TkThen -> cont 45;
	TokenWrap _type pos TkGoto -> cont 46;
	TokenWrap _type pos TkFor -> cont 47;
	TokenWrap _type pos TkTo -> cont 48;
	TokenWrap _type pos TkNext -> cont 49;
	TokenWrap _type pos TkStep -> cont 50;
	TokenWrap _type pos (TkConst (TkFloatConst val)) -> cont 51;
	TokenWrap _type pos (TkConst (TkIntConst val)) -> cont 52;
	TokenWrap _type pos TkEqual -> cont 53;
	TokenWrap _type pos TkUnEqual -> cont 54;
	TokenWrap _type pos TkLt -> cont 55;
	TokenWrap _type pos TkGt -> cont 56;
	TokenWrap _type pos TkLE -> cont 57;
	TokenWrap _type pos TkGE -> cont 58;
	TokenWrap _type pos TkPlus -> cont 59;
	TokenWrap _type pos TkMinus -> cont 60;
	TokenWrap _type pos TkTimes -> cont 61;
	TokenWrap _type pos TkDiv -> cont 62;
	TokenWrap _type pos TkLen -> cont 63;
	TokenWrap _type pos TkBracketOpen -> cont 64;
	TokenWrap _type pos TkBracketClose -> cont 65;
	TokenWrap _type pos TkLogOr -> cont 66;
	TokenWrap _type pos TkLogAnd -> cont 67;
	TokenWrap _type pos TkLogNeg -> cont 68;
	TokenWrap _type pos TkReturn -> cont 69;
	TokenWrap _type pos TkGoSub -> cont 70;
	TokenWrap _type pos TkEnd -> cont 71;
	TokenWrap _type pos TkRandom -> cont 72;
	TokenWrap _type pos TkGet -> cont 73;
	TokenWrap _type pos TkIntFunc -> cont 74;
	TokenWrap _type pos TkRead -> cont 75;
	TokenWrap _type pos TkData -> cont 76;
	TokenWrap _type pos TkRestore -> cont 77;
	TokenWrap _type pos TkComment -> cont 78;
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


wrapStateMonadic state val = get >>= (\s -> put (s ++ [state])) >> return val


-- TODO: FLoat COnstants
--makeArithOperandConstant (TkIntConst x) = IntConst x
--makeiArithOperandConstant _ = error "invalid makeOperandConstant call"



evalListStrict f [] nlList = nlList
evalListStrict f (x:xs) nlList = ((:) $! (f $! x)) $! (evalListStrict f xs (x : nlList))




getParseTree str = 
    let tokens = getTokens str 
        (a,s) = runState (basicParse $ tokens) ParserState { tokenList = tokens, 
                                                             lineNumbers = [], 
                                                             expectedLineNumbers = [],
                                                             data_temp = []} 
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
