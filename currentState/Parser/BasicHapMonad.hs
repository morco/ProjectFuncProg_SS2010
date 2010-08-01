{-# OPTIONS_GHC -fno-warn-overlapping-patterns #-}
module Parser.BasicHapMonad(getParseTree) where

import Parser.Lexer.BasicAlexMonad(getTokens)
import Parser.ParserTypes
import Parser.ParserErrors

import Data.List(delete)
import Control.Monad.State

import Debug.Trace

-- parser produced by Happy Version 1.18.4

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26 t27 t28 t29 t30 t31 t32 t33 t34 t35 t36 t37
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
	| HappyAbsSyn34 t34
	| HappyAbsSyn35 t35
	| HappyAbsSyn36 t36
	| HappyAbsSyn37 t37

action_0 (96) = happyShift action_6
action_0 (4) = happyGoto action_4
action_0 (5) = happyGoto action_5
action_0 _ = happyFail

action_1 (96) = happyShift action_3
action_1 (5) = happyGoto action_2
action_1 _ = happyFail

action_2 _ = happyFail

action_3 (38) = happyShift action_14
action_3 (39) = happyShift action_15
action_3 (40) = happyShift action_16
action_3 (41) = happyShift action_17
action_3 (43) = happyShift action_18
action_3 (44) = happyShift action_19
action_3 (46) = happyShift action_20
action_3 (47) = happyShift action_21
action_3 (49) = happyShift action_22
action_3 (50) = happyShift action_34
action_3 (51) = happyShift action_24
action_3 (66) = happyShift action_25
action_3 (73) = happyShift action_26
action_3 (74) = happyShift action_27
action_3 (75) = happyShift action_28
action_3 (76) = happyShift action_29
action_3 (90) = happyShift action_30
action_3 (91) = happyShift action_31
action_3 (92) = happyShift action_32
action_3 (6) = happyGoto action_7
action_3 (7) = happyGoto action_8
action_3 (9) = happyGoto action_9
action_3 (12) = happyGoto action_10
action_3 (23) = happyGoto action_11
action_3 (31) = happyGoto action_12
action_3 (37) = happyGoto action_13
action_3 _ = happyFail

action_4 (102) = happyAccept
action_4 _ = happyFail

action_5 (96) = happyShift action_6
action_5 (4) = happyGoto action_33
action_5 (5) = happyGoto action_5
action_5 _ = happyReduce_1

action_6 (38) = happyShift action_14
action_6 (39) = happyShift action_15
action_6 (40) = happyShift action_16
action_6 (41) = happyShift action_17
action_6 (43) = happyShift action_18
action_6 (44) = happyShift action_19
action_6 (46) = happyShift action_20
action_6 (47) = happyShift action_21
action_6 (49) = happyShift action_22
action_6 (50) = happyShift action_23
action_6 (51) = happyShift action_24
action_6 (66) = happyShift action_25
action_6 (73) = happyShift action_26
action_6 (74) = happyShift action_27
action_6 (75) = happyShift action_28
action_6 (76) = happyShift action_29
action_6 (90) = happyShift action_30
action_6 (91) = happyShift action_31
action_6 (92) = happyShift action_32
action_6 (6) = happyGoto action_7
action_6 (7) = happyGoto action_8
action_6 (9) = happyGoto action_9
action_6 (12) = happyGoto action_10
action_6 (23) = happyGoto action_11
action_6 (31) = happyGoto action_12
action_6 (37) = happyGoto action_13
action_6 _ = happyFail

action_7 _ = happyReduce_4

action_8 (98) = happyShift action_103
action_8 _ = happyReduce_7

action_9 (98) = happyShift action_102
action_9 _ = happyReduce_5

action_10 _ = happyReduce_15

action_11 _ = happyReduce_14

action_12 _ = happyReduce_13

action_13 (84) = happyShift action_101
action_13 _ = happyFail

action_14 (90) = happyShift action_46
action_14 (91) = happyShift action_31
action_14 (92) = happyShift action_32
action_14 (93) = happyShift action_100
action_14 (34) = happyGoto action_98
action_14 (35) = happyGoto action_99
action_14 (36) = happyGoto action_44
action_14 (37) = happyGoto action_45
action_14 _ = happyFail

action_15 (52) = happyShift action_58
action_15 (53) = happyShift action_59
action_15 (54) = happyShift action_60
action_15 (55) = happyShift action_61
action_15 (56) = happyShift action_62
action_15 (57) = happyShift action_63
action_15 (58) = happyShift action_64
action_15 (59) = happyShift action_65
action_15 (60) = happyShift action_66
action_15 (61) = happyShift action_67
action_15 (62) = happyShift action_68
action_15 (63) = happyShift action_69
action_15 (64) = happyShift action_70
action_15 (65) = happyShift action_71
action_15 (67) = happyShift action_72
action_15 (68) = happyShift action_85
action_15 (69) = happyShift action_86
action_15 (70) = happyShift action_87
action_15 (71) = happyShift action_88
action_15 (72) = happyShift action_89
action_15 (78) = happyShift action_73
action_15 (90) = happyShift action_90
action_15 (91) = happyShift action_31
action_15 (92) = happyShift action_32
action_15 (93) = happyShift action_91
action_15 (94) = happyShift action_74
action_15 (95) = happyShift action_75
action_15 (100) = happyShift action_76
action_15 (13) = happyGoto action_94
action_15 (14) = happyGoto action_80
action_15 (15) = happyGoto action_81
action_15 (16) = happyGoto action_51
action_15 (17) = happyGoto action_95
action_15 (20) = happyGoto action_53
action_15 (21) = happyGoto action_54
action_15 (22) = happyGoto action_55
action_15 (30) = happyGoto action_56
action_15 (32) = happyGoto action_96
action_15 (33) = happyGoto action_97
action_15 (37) = happyGoto action_57
action_15 _ = happyReduce_102

action_16 (90) = happyShift action_46
action_16 (91) = happyShift action_31
action_16 (92) = happyShift action_32
action_16 (36) = happyGoto action_93
action_16 (37) = happyGoto action_45
action_16 _ = happyFail

action_17 (52) = happyShift action_58
action_17 (53) = happyShift action_59
action_17 (54) = happyShift action_60
action_17 (55) = happyShift action_61
action_17 (56) = happyShift action_62
action_17 (57) = happyShift action_63
action_17 (58) = happyShift action_64
action_17 (59) = happyShift action_65
action_17 (60) = happyShift action_66
action_17 (61) = happyShift action_67
action_17 (62) = happyShift action_68
action_17 (63) = happyShift action_69
action_17 (64) = happyShift action_70
action_17 (65) = happyShift action_71
action_17 (67) = happyShift action_72
action_17 (68) = happyShift action_85
action_17 (69) = happyShift action_86
action_17 (70) = happyShift action_87
action_17 (71) = happyShift action_88
action_17 (72) = happyShift action_89
action_17 (78) = happyShift action_73
action_17 (90) = happyShift action_90
action_17 (91) = happyShift action_31
action_17 (92) = happyShift action_32
action_17 (93) = happyShift action_91
action_17 (94) = happyShift action_74
action_17 (95) = happyShift action_75
action_17 (100) = happyShift action_92
action_17 (13) = happyGoto action_79
action_17 (14) = happyGoto action_80
action_17 (15) = happyGoto action_81
action_17 (16) = happyGoto action_51
action_17 (17) = happyGoto action_82
action_17 (20) = happyGoto action_53
action_17 (21) = happyGoto action_54
action_17 (22) = happyGoto action_55
action_17 (26) = happyGoto action_83
action_17 (28) = happyGoto action_84
action_17 (30) = happyGoto action_56
action_17 (37) = happyGoto action_57
action_17 _ = happyFail

action_18 (95) = happyShift action_78
action_18 _ = happyFail

action_19 (92) = happyShift action_77
action_19 _ = happyFail

action_20 (52) = happyShift action_58
action_20 (53) = happyShift action_59
action_20 (54) = happyShift action_60
action_20 (55) = happyShift action_61
action_20 (56) = happyShift action_62
action_20 (57) = happyShift action_63
action_20 (58) = happyShift action_64
action_20 (59) = happyShift action_65
action_20 (60) = happyShift action_66
action_20 (61) = happyShift action_67
action_20 (62) = happyShift action_68
action_20 (63) = happyShift action_69
action_20 (64) = happyShift action_70
action_20 (65) = happyShift action_71
action_20 (67) = happyShift action_72
action_20 (78) = happyShift action_73
action_20 (91) = happyShift action_31
action_20 (92) = happyShift action_32
action_20 (94) = happyShift action_74
action_20 (95) = happyShift action_75
action_20 (100) = happyShift action_76
action_20 (16) = happyGoto action_51
action_20 (17) = happyGoto action_52
action_20 (20) = happyGoto action_53
action_20 (21) = happyGoto action_54
action_20 (22) = happyGoto action_55
action_20 (30) = happyGoto action_56
action_20 (37) = happyGoto action_57
action_20 _ = happyFail

action_21 (91) = happyShift action_31
action_21 (92) = happyShift action_32
action_21 (8) = happyGoto action_49
action_21 (37) = happyGoto action_50
action_21 _ = happyReduce_10

action_22 (95) = happyShift action_48
action_22 _ = happyFail

action_23 (102) = happyReduce_78
action_23 _ = happyReduce_78

action_24 _ = happyReduce_77

action_25 (67) = happyShift action_47
action_25 _ = happyFail

action_26 (90) = happyShift action_46
action_26 (91) = happyShift action_31
action_26 (92) = happyShift action_32
action_26 (35) = happyGoto action_43
action_26 (36) = happyGoto action_44
action_26 (37) = happyGoto action_45
action_26 _ = happyFail

action_27 (78) = happyShift action_38
action_27 (92) = happyShift action_39
action_27 (93) = happyShift action_40
action_27 (94) = happyShift action_41
action_27 (95) = happyShift action_42
action_27 (10) = happyGoto action_36
action_27 (11) = happyGoto action_37
action_27 _ = happyFail

action_28 _ = happyReduce_18

action_29 _ = happyReduce_19

action_30 (84) = happyShift action_35
action_30 _ = happyFail

action_31 _ = happyReduce_117

action_32 _ = happyReduce_118

action_33 _ = happyReduce_2

action_34 _ = happyReduce_78

action_35 (68) = happyShift action_85
action_35 (69) = happyShift action_86
action_35 (70) = happyShift action_87
action_35 (71) = happyShift action_88
action_35 (72) = happyShift action_89
action_35 (90) = happyShift action_90
action_35 (93) = happyShift action_91
action_35 (13) = happyGoto action_161
action_35 (14) = happyGoto action_80
action_35 (15) = happyGoto action_81
action_35 _ = happyFail

action_36 _ = happyReduce_17

action_37 (99) = happyShift action_160
action_37 _ = happyReduce_21

action_38 (94) = happyShift action_158
action_38 (95) = happyShift action_159
action_38 _ = happyFail

action_39 _ = happyReduce_28

action_40 _ = happyReduce_27

action_41 _ = happyReduce_24

action_42 _ = happyReduce_23

action_43 _ = happyReduce_16

action_44 (99) = happyShift action_157
action_44 _ = happyReduce_113

action_45 _ = happyReduce_116

action_46 _ = happyReduce_115

action_47 (100) = happyShift action_156
action_47 _ = happyFail

action_48 _ = happyReduce_75

action_49 _ = happyReduce_9

action_50 (99) = happyShift action_155
action_50 _ = happyReduce_11

action_51 (42) = happyReduce_69
action_51 (43) = happyReduce_69
action_51 (49) = happyReduce_69
action_51 (77) = happyReduce_69
action_51 (78) = happyReduce_69
action_51 (84) = happyReduce_69
action_51 (85) = happyReduce_69
action_51 (86) = happyReduce_69
action_51 (87) = happyReduce_69
action_51 (88) = happyReduce_69
action_51 (89) = happyReduce_69
action_51 (96) = happyReduce_69
action_51 (97) = happyReduce_69
action_51 (98) = happyReduce_69
action_51 (99) = happyReduce_69
action_51 (101) = happyReduce_69
action_51 (102) = happyReduce_69
action_51 _ = happyReduce_69

action_52 (43) = happyShift action_153
action_52 (49) = happyShift action_154
action_52 (77) = happyShift action_111
action_52 (78) = happyShift action_112
action_52 (18) = happyGoto action_110
action_52 _ = happyFail

action_53 (79) = happyShift action_151
action_53 (80) = happyShift action_152
action_53 (19) = happyGoto action_150
action_53 _ = happyReduce_58

action_54 _ = happyReduce_66

action_55 _ = happyReduce_67

action_56 _ = happyReduce_71

action_57 _ = happyReduce_70

action_58 (100) = happyShift action_149
action_58 _ = happyFail

action_59 (100) = happyShift action_148
action_59 _ = happyFail

action_60 (100) = happyShift action_147
action_60 _ = happyFail

action_61 (100) = happyShift action_146
action_61 _ = happyFail

action_62 (100) = happyShift action_145
action_62 _ = happyFail

action_63 (100) = happyShift action_144
action_63 _ = happyFail

action_64 (100) = happyShift action_143
action_64 _ = happyFail

action_65 (100) = happyShift action_142
action_65 _ = happyFail

action_66 (100) = happyShift action_141
action_66 _ = happyFail

action_67 (100) = happyShift action_140
action_67 _ = happyFail

action_68 (100) = happyShift action_139
action_68 _ = happyFail

action_69 (100) = happyShift action_138
action_69 _ = happyFail

action_70 (100) = happyShift action_137
action_70 _ = happyFail

action_71 (100) = happyShift action_136
action_71 _ = happyFail

action_72 (100) = happyShift action_135
action_72 _ = happyFail

action_73 (52) = happyShift action_58
action_73 (53) = happyShift action_59
action_73 (54) = happyShift action_60
action_73 (55) = happyShift action_61
action_73 (56) = happyShift action_62
action_73 (57) = happyShift action_63
action_73 (58) = happyShift action_64
action_73 (59) = happyShift action_65
action_73 (60) = happyShift action_66
action_73 (61) = happyShift action_67
action_73 (62) = happyShift action_68
action_73 (63) = happyShift action_69
action_73 (64) = happyShift action_70
action_73 (65) = happyShift action_71
action_73 (67) = happyShift action_72
action_73 (78) = happyShift action_73
action_73 (91) = happyShift action_31
action_73 (92) = happyShift action_32
action_73 (94) = happyShift action_74
action_73 (95) = happyShift action_75
action_73 (100) = happyShift action_76
action_73 (16) = happyGoto action_51
action_73 (17) = happyGoto action_134
action_73 (20) = happyGoto action_53
action_73 (21) = happyGoto action_54
action_73 (22) = happyGoto action_55
action_73 (30) = happyGoto action_56
action_73 (37) = happyGoto action_57
action_73 _ = happyFail

action_74 _ = happyReduce_100

action_75 _ = happyReduce_99

action_76 (52) = happyShift action_58
action_76 (53) = happyShift action_59
action_76 (54) = happyShift action_60
action_76 (55) = happyShift action_61
action_76 (56) = happyShift action_62
action_76 (57) = happyShift action_63
action_76 (58) = happyShift action_64
action_76 (59) = happyShift action_65
action_76 (60) = happyShift action_66
action_76 (61) = happyShift action_67
action_76 (62) = happyShift action_68
action_76 (63) = happyShift action_69
action_76 (64) = happyShift action_70
action_76 (65) = happyShift action_71
action_76 (67) = happyShift action_72
action_76 (78) = happyShift action_73
action_76 (91) = happyShift action_31
action_76 (92) = happyShift action_32
action_76 (94) = happyShift action_74
action_76 (95) = happyShift action_75
action_76 (100) = happyShift action_76
action_76 (16) = happyGoto action_51
action_76 (17) = happyGoto action_133
action_76 (20) = happyGoto action_53
action_76 (21) = happyGoto action_54
action_76 (22) = happyGoto action_55
action_76 (30) = happyGoto action_56
action_76 (37) = happyGoto action_57
action_76 _ = happyFail

action_77 (84) = happyShift action_132
action_77 _ = happyFail

action_78 _ = happyReduce_76

action_79 (84) = happyShift action_124
action_79 (85) = happyShift action_125
action_79 (86) = happyShift action_126
action_79 (87) = happyShift action_127
action_79 (88) = happyShift action_128
action_79 (89) = happyShift action_129
action_79 (29) = happyGoto action_131
action_79 _ = happyFail

action_80 _ = happyReduce_40

action_81 (77) = happyShift action_130
action_81 _ = happyReduce_31

action_82 (77) = happyShift action_111
action_82 (78) = happyShift action_112
action_82 (84) = happyShift action_124
action_82 (85) = happyShift action_125
action_82 (86) = happyShift action_126
action_82 (87) = happyShift action_127
action_82 (88) = happyShift action_128
action_82 (89) = happyShift action_129
action_82 (18) = happyGoto action_110
action_82 (29) = happyGoto action_123
action_82 _ = happyFail

action_83 (42) = happyShift action_121
action_83 (43) = happyShift action_122
action_83 (25) = happyGoto action_120
action_83 _ = happyFail

action_84 _ = happyReduce_86

action_85 (100) = happyShift action_119
action_85 _ = happyFail

action_86 (100) = happyShift action_118
action_86 _ = happyFail

action_87 (100) = happyShift action_117
action_87 _ = happyFail

action_88 (100) = happyShift action_116
action_88 _ = happyFail

action_89 (100) = happyShift action_115
action_89 _ = happyFail

action_90 _ = happyReduce_39

action_91 _ = happyReduce_38

action_92 (52) = happyShift action_58
action_92 (53) = happyShift action_59
action_92 (54) = happyShift action_60
action_92 (55) = happyShift action_61
action_92 (56) = happyShift action_62
action_92 (57) = happyShift action_63
action_92 (58) = happyShift action_64
action_92 (59) = happyShift action_65
action_92 (60) = happyShift action_66
action_92 (61) = happyShift action_67
action_92 (62) = happyShift action_68
action_92 (63) = happyShift action_69
action_92 (64) = happyShift action_70
action_92 (65) = happyShift action_71
action_92 (67) = happyShift action_72
action_92 (68) = happyShift action_85
action_92 (69) = happyShift action_86
action_92 (70) = happyShift action_87
action_92 (71) = happyShift action_88
action_92 (72) = happyShift action_89
action_92 (78) = happyShift action_73
action_92 (90) = happyShift action_90
action_92 (91) = happyShift action_31
action_92 (92) = happyShift action_32
action_92 (93) = happyShift action_91
action_92 (94) = happyShift action_74
action_92 (95) = happyShift action_75
action_92 (100) = happyShift action_92
action_92 (13) = happyGoto action_79
action_92 (14) = happyGoto action_80
action_92 (15) = happyGoto action_81
action_92 (16) = happyGoto action_51
action_92 (17) = happyGoto action_113
action_92 (20) = happyGoto action_53
action_92 (21) = happyGoto action_54
action_92 (22) = happyGoto action_55
action_92 (26) = happyGoto action_114
action_92 (28) = happyGoto action_84
action_92 (30) = happyGoto action_56
action_92 (37) = happyGoto action_57
action_92 _ = happyFail

action_93 _ = happyReduce_104

action_94 _ = happyReduce_108

action_95 (77) = happyShift action_111
action_95 (78) = happyShift action_112
action_95 (18) = happyGoto action_110
action_95 _ = happyReduce_109

action_96 _ = happyReduce_101

action_97 (97) = happyShift action_109
action_97 _ = happyReduce_105

action_98 _ = happyReduce_103

action_99 _ = happyReduce_112

action_100 (90) = happyShift action_46
action_100 (91) = happyShift action_31
action_100 (92) = happyShift action_32
action_100 (97) = happyShift action_108
action_100 (35) = happyGoto action_107
action_100 (36) = happyGoto action_44
action_100 (37) = happyGoto action_45
action_100 _ = happyFail

action_101 (52) = happyShift action_58
action_101 (53) = happyShift action_59
action_101 (54) = happyShift action_60
action_101 (55) = happyShift action_61
action_101 (56) = happyShift action_62
action_101 (57) = happyShift action_63
action_101 (58) = happyShift action_64
action_101 (59) = happyShift action_65
action_101 (60) = happyShift action_66
action_101 (61) = happyShift action_67
action_101 (62) = happyShift action_68
action_101 (63) = happyShift action_69
action_101 (64) = happyShift action_70
action_101 (65) = happyShift action_71
action_101 (67) = happyShift action_72
action_101 (78) = happyShift action_73
action_101 (91) = happyShift action_31
action_101 (92) = happyShift action_32
action_101 (94) = happyShift action_74
action_101 (95) = happyShift action_75
action_101 (100) = happyShift action_76
action_101 (16) = happyGoto action_51
action_101 (17) = happyGoto action_106
action_101 (20) = happyGoto action_53
action_101 (21) = happyGoto action_54
action_101 (22) = happyGoto action_55
action_101 (30) = happyGoto action_56
action_101 (37) = happyGoto action_57
action_101 _ = happyFail

action_102 (38) = happyShift action_14
action_102 (39) = happyShift action_15
action_102 (40) = happyShift action_16
action_102 (41) = happyShift action_17
action_102 (43) = happyShift action_18
action_102 (44) = happyShift action_19
action_102 (46) = happyShift action_20
action_102 (47) = happyShift action_21
action_102 (49) = happyShift action_22
action_102 (50) = happyShift action_34
action_102 (51) = happyShift action_24
action_102 (66) = happyShift action_25
action_102 (73) = happyShift action_26
action_102 (74) = happyShift action_27
action_102 (75) = happyShift action_28
action_102 (76) = happyShift action_29
action_102 (90) = happyShift action_30
action_102 (91) = happyShift action_31
action_102 (92) = happyShift action_32
action_102 (6) = happyGoto action_105
action_102 (7) = happyGoto action_8
action_102 (9) = happyGoto action_9
action_102 (12) = happyGoto action_10
action_102 (23) = happyGoto action_11
action_102 (31) = happyGoto action_12
action_102 (37) = happyGoto action_13
action_102 _ = happyFail

action_103 (38) = happyShift action_14
action_103 (39) = happyShift action_15
action_103 (40) = happyShift action_16
action_103 (41) = happyShift action_17
action_103 (43) = happyShift action_18
action_103 (44) = happyShift action_19
action_103 (46) = happyShift action_20
action_103 (47) = happyShift action_21
action_103 (49) = happyShift action_22
action_103 (50) = happyShift action_34
action_103 (51) = happyShift action_24
action_103 (66) = happyShift action_25
action_103 (73) = happyShift action_26
action_103 (74) = happyShift action_27
action_103 (75) = happyShift action_28
action_103 (76) = happyShift action_29
action_103 (90) = happyShift action_30
action_103 (91) = happyShift action_31
action_103 (92) = happyShift action_32
action_103 (6) = happyGoto action_104
action_103 (7) = happyGoto action_8
action_103 (9) = happyGoto action_9
action_103 (12) = happyGoto action_10
action_103 (23) = happyGoto action_11
action_103 (31) = happyGoto action_12
action_103 (37) = happyGoto action_13
action_103 _ = happyFail

action_104 _ = happyReduce_8

action_105 _ = happyReduce_6

action_106 (77) = happyShift action_111
action_106 (78) = happyShift action_112
action_106 (18) = happyGoto action_110
action_106 _ = happyReduce_29

action_107 _ = happyReduce_111

action_108 (90) = happyShift action_46
action_108 (91) = happyShift action_31
action_108 (92) = happyShift action_32
action_108 (35) = happyGoto action_203
action_108 (36) = happyGoto action_44
action_108 (37) = happyGoto action_45
action_108 _ = happyFail

action_109 (52) = happyShift action_58
action_109 (53) = happyShift action_59
action_109 (54) = happyShift action_60
action_109 (55) = happyShift action_61
action_109 (56) = happyShift action_62
action_109 (57) = happyShift action_63
action_109 (58) = happyShift action_64
action_109 (59) = happyShift action_65
action_109 (60) = happyShift action_66
action_109 (61) = happyShift action_67
action_109 (62) = happyShift action_68
action_109 (63) = happyShift action_69
action_109 (64) = happyShift action_70
action_109 (65) = happyShift action_71
action_109 (67) = happyShift action_72
action_109 (68) = happyShift action_85
action_109 (69) = happyShift action_86
action_109 (70) = happyShift action_87
action_109 (71) = happyShift action_88
action_109 (72) = happyShift action_89
action_109 (78) = happyShift action_73
action_109 (90) = happyShift action_90
action_109 (91) = happyShift action_31
action_109 (92) = happyShift action_32
action_109 (93) = happyShift action_91
action_109 (94) = happyShift action_74
action_109 (95) = happyShift action_75
action_109 (100) = happyShift action_76
action_109 (13) = happyGoto action_94
action_109 (14) = happyGoto action_80
action_109 (15) = happyGoto action_81
action_109 (16) = happyGoto action_51
action_109 (17) = happyGoto action_95
action_109 (20) = happyGoto action_53
action_109 (21) = happyGoto action_54
action_109 (22) = happyGoto action_55
action_109 (30) = happyGoto action_56
action_109 (32) = happyGoto action_202
action_109 (33) = happyGoto action_97
action_109 (37) = happyGoto action_57
action_109 _ = happyReduce_106

action_110 (52) = happyShift action_58
action_110 (53) = happyShift action_59
action_110 (54) = happyShift action_60
action_110 (55) = happyShift action_61
action_110 (56) = happyShift action_62
action_110 (57) = happyShift action_63
action_110 (58) = happyShift action_64
action_110 (59) = happyShift action_65
action_110 (60) = happyShift action_66
action_110 (61) = happyShift action_67
action_110 (62) = happyShift action_68
action_110 (63) = happyShift action_69
action_110 (64) = happyShift action_70
action_110 (65) = happyShift action_71
action_110 (67) = happyShift action_72
action_110 (91) = happyShift action_31
action_110 (92) = happyShift action_32
action_110 (94) = happyShift action_74
action_110 (95) = happyShift action_75
action_110 (100) = happyShift action_76
action_110 (16) = happyGoto action_169
action_110 (20) = happyGoto action_201
action_110 (21) = happyGoto action_54
action_110 (22) = happyGoto action_55
action_110 (30) = happyGoto action_56
action_110 (37) = happyGoto action_57
action_110 _ = happyFail

action_111 _ = happyReduce_61

action_112 _ = happyReduce_62

action_113 (77) = happyShift action_111
action_113 (78) = happyShift action_112
action_113 (84) = happyShift action_124
action_113 (85) = happyShift action_125
action_113 (86) = happyShift action_126
action_113 (87) = happyShift action_127
action_113 (88) = happyShift action_128
action_113 (89) = happyShift action_129
action_113 (101) = happyShift action_187
action_113 (18) = happyGoto action_110
action_113 (29) = happyGoto action_123
action_113 _ = happyFail

action_114 (101) = happyShift action_200
action_114 _ = happyFail

action_115 (68) = happyShift action_85
action_115 (69) = happyShift action_86
action_115 (70) = happyShift action_87
action_115 (71) = happyShift action_88
action_115 (72) = happyShift action_89
action_115 (90) = happyShift action_90
action_115 (93) = happyShift action_91
action_115 (13) = happyGoto action_199
action_115 (14) = happyGoto action_80
action_115 (15) = happyGoto action_81
action_115 _ = happyFail

action_116 (68) = happyShift action_85
action_116 (69) = happyShift action_86
action_116 (70) = happyShift action_87
action_116 (71) = happyShift action_88
action_116 (72) = happyShift action_89
action_116 (90) = happyShift action_90
action_116 (93) = happyShift action_91
action_116 (13) = happyGoto action_198
action_116 (14) = happyGoto action_80
action_116 (15) = happyGoto action_81
action_116 _ = happyFail

action_117 (68) = happyShift action_85
action_117 (69) = happyShift action_86
action_117 (70) = happyShift action_87
action_117 (71) = happyShift action_88
action_117 (72) = happyShift action_89
action_117 (90) = happyShift action_90
action_117 (93) = happyShift action_91
action_117 (13) = happyGoto action_197
action_117 (14) = happyGoto action_80
action_117 (15) = happyGoto action_81
action_117 _ = happyFail

action_118 (52) = happyShift action_58
action_118 (53) = happyShift action_59
action_118 (54) = happyShift action_60
action_118 (55) = happyShift action_61
action_118 (56) = happyShift action_62
action_118 (57) = happyShift action_63
action_118 (58) = happyShift action_64
action_118 (59) = happyShift action_65
action_118 (60) = happyShift action_66
action_118 (61) = happyShift action_67
action_118 (62) = happyShift action_68
action_118 (63) = happyShift action_69
action_118 (64) = happyShift action_70
action_118 (65) = happyShift action_71
action_118 (67) = happyShift action_72
action_118 (78) = happyShift action_73
action_118 (91) = happyShift action_31
action_118 (92) = happyShift action_32
action_118 (94) = happyShift action_74
action_118 (95) = happyShift action_75
action_118 (100) = happyShift action_76
action_118 (16) = happyGoto action_51
action_118 (17) = happyGoto action_196
action_118 (20) = happyGoto action_53
action_118 (21) = happyGoto action_54
action_118 (22) = happyGoto action_55
action_118 (30) = happyGoto action_56
action_118 (37) = happyGoto action_57
action_118 _ = happyFail

action_119 (52) = happyShift action_58
action_119 (53) = happyShift action_59
action_119 (54) = happyShift action_60
action_119 (55) = happyShift action_61
action_119 (56) = happyShift action_62
action_119 (57) = happyShift action_63
action_119 (58) = happyShift action_64
action_119 (59) = happyShift action_65
action_119 (60) = happyShift action_66
action_119 (61) = happyShift action_67
action_119 (62) = happyShift action_68
action_119 (63) = happyShift action_69
action_119 (64) = happyShift action_70
action_119 (65) = happyShift action_71
action_119 (67) = happyShift action_72
action_119 (78) = happyShift action_73
action_119 (91) = happyShift action_31
action_119 (92) = happyShift action_32
action_119 (94) = happyShift action_74
action_119 (95) = happyShift action_75
action_119 (100) = happyShift action_76
action_119 (16) = happyGoto action_51
action_119 (17) = happyGoto action_195
action_119 (20) = happyGoto action_53
action_119 (21) = happyGoto action_54
action_119 (22) = happyGoto action_55
action_119 (30) = happyGoto action_56
action_119 (37) = happyGoto action_57
action_119 _ = happyFail

action_120 _ = happyReduce_72

action_121 (38) = happyShift action_14
action_121 (39) = happyShift action_15
action_121 (40) = happyShift action_16
action_121 (41) = happyShift action_17
action_121 (43) = happyShift action_18
action_121 (44) = happyShift action_19
action_121 (46) = happyShift action_20
action_121 (47) = happyShift action_21
action_121 (49) = happyShift action_22
action_121 (50) = happyShift action_34
action_121 (51) = happyShift action_24
action_121 (66) = happyShift action_25
action_121 (73) = happyShift action_26
action_121 (74) = happyShift action_27
action_121 (75) = happyShift action_28
action_121 (76) = happyShift action_29
action_121 (90) = happyShift action_30
action_121 (91) = happyShift action_31
action_121 (92) = happyShift action_32
action_121 (95) = happyShift action_194
action_121 (6) = happyGoto action_193
action_121 (7) = happyGoto action_8
action_121 (9) = happyGoto action_9
action_121 (12) = happyGoto action_10
action_121 (23) = happyGoto action_11
action_121 (31) = happyGoto action_12
action_121 (37) = happyGoto action_13
action_121 _ = happyFail

action_122 (95) = happyShift action_192
action_122 _ = happyFail

action_123 (52) = happyShift action_58
action_123 (53) = happyShift action_59
action_123 (54) = happyShift action_60
action_123 (55) = happyShift action_61
action_123 (56) = happyShift action_62
action_123 (57) = happyShift action_63
action_123 (58) = happyShift action_64
action_123 (59) = happyShift action_65
action_123 (60) = happyShift action_66
action_123 (61) = happyShift action_67
action_123 (62) = happyShift action_68
action_123 (63) = happyShift action_69
action_123 (64) = happyShift action_70
action_123 (65) = happyShift action_71
action_123 (67) = happyShift action_72
action_123 (78) = happyShift action_73
action_123 (91) = happyShift action_31
action_123 (92) = happyShift action_32
action_123 (94) = happyShift action_74
action_123 (95) = happyShift action_75
action_123 (100) = happyShift action_76
action_123 (16) = happyGoto action_51
action_123 (17) = happyGoto action_191
action_123 (20) = happyGoto action_53
action_123 (21) = happyGoto action_54
action_123 (22) = happyGoto action_55
action_123 (30) = happyGoto action_56
action_123 (37) = happyGoto action_57
action_123 _ = happyFail

action_124 _ = happyReduce_93

action_125 _ = happyReduce_96

action_126 _ = happyReduce_94

action_127 _ = happyReduce_95

action_128 _ = happyReduce_97

action_129 _ = happyReduce_98

action_130 (68) = happyShift action_85
action_130 (69) = happyShift action_86
action_130 (70) = happyShift action_87
action_130 (71) = happyShift action_88
action_130 (72) = happyShift action_89
action_130 (90) = happyShift action_90
action_130 (93) = happyShift action_91
action_130 (14) = happyGoto action_80
action_130 (15) = happyGoto action_190
action_130 _ = happyFail

action_131 (68) = happyShift action_85
action_131 (69) = happyShift action_86
action_131 (70) = happyShift action_87
action_131 (71) = happyShift action_88
action_131 (72) = happyShift action_89
action_131 (90) = happyShift action_90
action_131 (93) = happyShift action_91
action_131 (13) = happyGoto action_189
action_131 (14) = happyGoto action_80
action_131 (15) = happyGoto action_81
action_131 _ = happyFail

action_132 (91) = happyShift action_31
action_132 (92) = happyShift action_32
action_132 (94) = happyShift action_74
action_132 (95) = happyShift action_75
action_132 (22) = happyGoto action_188
action_132 (30) = happyGoto action_56
action_132 (37) = happyGoto action_57
action_132 _ = happyFail

action_133 (77) = happyShift action_111
action_133 (78) = happyShift action_112
action_133 (101) = happyShift action_187
action_133 (18) = happyGoto action_110
action_133 _ = happyFail

action_134 (77) = happyShift action_111
action_134 (78) = happyShift action_112
action_134 (18) = happyGoto action_110
action_134 _ = happyReduce_60

action_135 (52) = happyShift action_58
action_135 (53) = happyShift action_59
action_135 (54) = happyShift action_60
action_135 (55) = happyShift action_61
action_135 (56) = happyShift action_62
action_135 (57) = happyShift action_63
action_135 (58) = happyShift action_64
action_135 (59) = happyShift action_65
action_135 (60) = happyShift action_66
action_135 (61) = happyShift action_67
action_135 (62) = happyShift action_68
action_135 (63) = happyShift action_69
action_135 (64) = happyShift action_70
action_135 (65) = happyShift action_71
action_135 (67) = happyShift action_72
action_135 (78) = happyShift action_73
action_135 (91) = happyShift action_31
action_135 (92) = happyShift action_32
action_135 (94) = happyShift action_74
action_135 (95) = happyShift action_75
action_135 (100) = happyShift action_76
action_135 (16) = happyGoto action_51
action_135 (17) = happyGoto action_186
action_135 (20) = happyGoto action_53
action_135 (21) = happyGoto action_54
action_135 (22) = happyGoto action_55
action_135 (30) = happyGoto action_56
action_135 (37) = happyGoto action_57
action_135 _ = happyFail

action_136 (52) = happyShift action_58
action_136 (53) = happyShift action_59
action_136 (54) = happyShift action_60
action_136 (55) = happyShift action_61
action_136 (56) = happyShift action_62
action_136 (57) = happyShift action_63
action_136 (58) = happyShift action_64
action_136 (59) = happyShift action_65
action_136 (60) = happyShift action_66
action_136 (61) = happyShift action_67
action_136 (62) = happyShift action_68
action_136 (63) = happyShift action_69
action_136 (64) = happyShift action_70
action_136 (65) = happyShift action_71
action_136 (67) = happyShift action_72
action_136 (78) = happyShift action_73
action_136 (91) = happyShift action_31
action_136 (92) = happyShift action_32
action_136 (94) = happyShift action_74
action_136 (95) = happyShift action_75
action_136 (100) = happyShift action_76
action_136 (16) = happyGoto action_51
action_136 (17) = happyGoto action_185
action_136 (20) = happyGoto action_53
action_136 (21) = happyGoto action_54
action_136 (22) = happyGoto action_55
action_136 (30) = happyGoto action_56
action_136 (37) = happyGoto action_57
action_136 _ = happyFail

action_137 (52) = happyShift action_58
action_137 (53) = happyShift action_59
action_137 (54) = happyShift action_60
action_137 (55) = happyShift action_61
action_137 (56) = happyShift action_62
action_137 (57) = happyShift action_63
action_137 (58) = happyShift action_64
action_137 (59) = happyShift action_65
action_137 (60) = happyShift action_66
action_137 (61) = happyShift action_67
action_137 (62) = happyShift action_68
action_137 (63) = happyShift action_69
action_137 (64) = happyShift action_70
action_137 (65) = happyShift action_71
action_137 (67) = happyShift action_72
action_137 (78) = happyShift action_73
action_137 (91) = happyShift action_31
action_137 (92) = happyShift action_32
action_137 (94) = happyShift action_74
action_137 (95) = happyShift action_75
action_137 (100) = happyShift action_76
action_137 (16) = happyGoto action_51
action_137 (17) = happyGoto action_184
action_137 (20) = happyGoto action_53
action_137 (21) = happyGoto action_54
action_137 (22) = happyGoto action_55
action_137 (30) = happyGoto action_56
action_137 (37) = happyGoto action_57
action_137 _ = happyFail

action_138 (52) = happyShift action_58
action_138 (53) = happyShift action_59
action_138 (54) = happyShift action_60
action_138 (55) = happyShift action_61
action_138 (56) = happyShift action_62
action_138 (57) = happyShift action_63
action_138 (58) = happyShift action_64
action_138 (59) = happyShift action_65
action_138 (60) = happyShift action_66
action_138 (61) = happyShift action_67
action_138 (62) = happyShift action_68
action_138 (63) = happyShift action_69
action_138 (64) = happyShift action_70
action_138 (65) = happyShift action_71
action_138 (67) = happyShift action_72
action_138 (78) = happyShift action_73
action_138 (91) = happyShift action_31
action_138 (92) = happyShift action_32
action_138 (94) = happyShift action_74
action_138 (95) = happyShift action_75
action_138 (100) = happyShift action_76
action_138 (16) = happyGoto action_51
action_138 (17) = happyGoto action_183
action_138 (20) = happyGoto action_53
action_138 (21) = happyGoto action_54
action_138 (22) = happyGoto action_55
action_138 (30) = happyGoto action_56
action_138 (37) = happyGoto action_57
action_138 _ = happyFail

action_139 (52) = happyShift action_58
action_139 (53) = happyShift action_59
action_139 (54) = happyShift action_60
action_139 (55) = happyShift action_61
action_139 (56) = happyShift action_62
action_139 (57) = happyShift action_63
action_139 (58) = happyShift action_64
action_139 (59) = happyShift action_65
action_139 (60) = happyShift action_66
action_139 (61) = happyShift action_67
action_139 (62) = happyShift action_68
action_139 (63) = happyShift action_69
action_139 (64) = happyShift action_70
action_139 (65) = happyShift action_71
action_139 (67) = happyShift action_72
action_139 (78) = happyShift action_73
action_139 (91) = happyShift action_31
action_139 (92) = happyShift action_32
action_139 (94) = happyShift action_74
action_139 (95) = happyShift action_75
action_139 (100) = happyShift action_76
action_139 (16) = happyGoto action_51
action_139 (17) = happyGoto action_182
action_139 (20) = happyGoto action_53
action_139 (21) = happyGoto action_54
action_139 (22) = happyGoto action_55
action_139 (30) = happyGoto action_56
action_139 (37) = happyGoto action_57
action_139 _ = happyFail

action_140 (68) = happyShift action_85
action_140 (69) = happyShift action_86
action_140 (70) = happyShift action_87
action_140 (71) = happyShift action_88
action_140 (72) = happyShift action_89
action_140 (90) = happyShift action_90
action_140 (93) = happyShift action_91
action_140 (13) = happyGoto action_181
action_140 (14) = happyGoto action_80
action_140 (15) = happyGoto action_81
action_140 _ = happyFail

action_141 (52) = happyShift action_58
action_141 (53) = happyShift action_59
action_141 (54) = happyShift action_60
action_141 (55) = happyShift action_61
action_141 (56) = happyShift action_62
action_141 (57) = happyShift action_63
action_141 (58) = happyShift action_64
action_141 (59) = happyShift action_65
action_141 (60) = happyShift action_66
action_141 (61) = happyShift action_67
action_141 (62) = happyShift action_68
action_141 (63) = happyShift action_69
action_141 (64) = happyShift action_70
action_141 (65) = happyShift action_71
action_141 (67) = happyShift action_72
action_141 (78) = happyShift action_73
action_141 (91) = happyShift action_31
action_141 (92) = happyShift action_32
action_141 (94) = happyShift action_74
action_141 (95) = happyShift action_75
action_141 (100) = happyShift action_76
action_141 (16) = happyGoto action_51
action_141 (17) = happyGoto action_180
action_141 (20) = happyGoto action_53
action_141 (21) = happyGoto action_54
action_141 (22) = happyGoto action_55
action_141 (30) = happyGoto action_56
action_141 (37) = happyGoto action_57
action_141 _ = happyFail

action_142 (52) = happyShift action_58
action_142 (53) = happyShift action_59
action_142 (54) = happyShift action_60
action_142 (55) = happyShift action_61
action_142 (56) = happyShift action_62
action_142 (57) = happyShift action_63
action_142 (58) = happyShift action_64
action_142 (59) = happyShift action_65
action_142 (60) = happyShift action_66
action_142 (61) = happyShift action_67
action_142 (62) = happyShift action_68
action_142 (63) = happyShift action_69
action_142 (64) = happyShift action_70
action_142 (65) = happyShift action_71
action_142 (67) = happyShift action_72
action_142 (78) = happyShift action_73
action_142 (91) = happyShift action_31
action_142 (92) = happyShift action_32
action_142 (94) = happyShift action_74
action_142 (95) = happyShift action_75
action_142 (100) = happyShift action_76
action_142 (16) = happyGoto action_51
action_142 (17) = happyGoto action_179
action_142 (20) = happyGoto action_53
action_142 (21) = happyGoto action_54
action_142 (22) = happyGoto action_55
action_142 (30) = happyGoto action_56
action_142 (37) = happyGoto action_57
action_142 _ = happyFail

action_143 (52) = happyShift action_58
action_143 (53) = happyShift action_59
action_143 (54) = happyShift action_60
action_143 (55) = happyShift action_61
action_143 (56) = happyShift action_62
action_143 (57) = happyShift action_63
action_143 (58) = happyShift action_64
action_143 (59) = happyShift action_65
action_143 (60) = happyShift action_66
action_143 (61) = happyShift action_67
action_143 (62) = happyShift action_68
action_143 (63) = happyShift action_69
action_143 (64) = happyShift action_70
action_143 (65) = happyShift action_71
action_143 (67) = happyShift action_72
action_143 (78) = happyShift action_73
action_143 (91) = happyShift action_31
action_143 (92) = happyShift action_32
action_143 (94) = happyShift action_74
action_143 (95) = happyShift action_75
action_143 (100) = happyShift action_76
action_143 (16) = happyGoto action_51
action_143 (17) = happyGoto action_178
action_143 (20) = happyGoto action_53
action_143 (21) = happyGoto action_54
action_143 (22) = happyGoto action_55
action_143 (30) = happyGoto action_56
action_143 (37) = happyGoto action_57
action_143 _ = happyFail

action_144 (52) = happyShift action_58
action_144 (53) = happyShift action_59
action_144 (54) = happyShift action_60
action_144 (55) = happyShift action_61
action_144 (56) = happyShift action_62
action_144 (57) = happyShift action_63
action_144 (58) = happyShift action_64
action_144 (59) = happyShift action_65
action_144 (60) = happyShift action_66
action_144 (61) = happyShift action_67
action_144 (62) = happyShift action_68
action_144 (63) = happyShift action_69
action_144 (64) = happyShift action_70
action_144 (65) = happyShift action_71
action_144 (67) = happyShift action_72
action_144 (78) = happyShift action_73
action_144 (91) = happyShift action_31
action_144 (92) = happyShift action_32
action_144 (94) = happyShift action_74
action_144 (95) = happyShift action_75
action_144 (100) = happyShift action_76
action_144 (16) = happyGoto action_51
action_144 (17) = happyGoto action_177
action_144 (20) = happyGoto action_53
action_144 (21) = happyGoto action_54
action_144 (22) = happyGoto action_55
action_144 (30) = happyGoto action_56
action_144 (37) = happyGoto action_57
action_144 _ = happyFail

action_145 (68) = happyShift action_85
action_145 (69) = happyShift action_86
action_145 (70) = happyShift action_87
action_145 (71) = happyShift action_88
action_145 (72) = happyShift action_89
action_145 (90) = happyShift action_90
action_145 (93) = happyShift action_91
action_145 (13) = happyGoto action_176
action_145 (14) = happyGoto action_80
action_145 (15) = happyGoto action_81
action_145 _ = happyFail

action_146 (52) = happyShift action_58
action_146 (53) = happyShift action_59
action_146 (54) = happyShift action_60
action_146 (55) = happyShift action_61
action_146 (56) = happyShift action_62
action_146 (57) = happyShift action_63
action_146 (58) = happyShift action_64
action_146 (59) = happyShift action_65
action_146 (60) = happyShift action_66
action_146 (61) = happyShift action_67
action_146 (62) = happyShift action_68
action_146 (63) = happyShift action_69
action_146 (64) = happyShift action_70
action_146 (65) = happyShift action_71
action_146 (67) = happyShift action_72
action_146 (78) = happyShift action_73
action_146 (91) = happyShift action_31
action_146 (92) = happyShift action_32
action_146 (94) = happyShift action_74
action_146 (95) = happyShift action_75
action_146 (100) = happyShift action_76
action_146 (16) = happyGoto action_51
action_146 (17) = happyGoto action_175
action_146 (20) = happyGoto action_53
action_146 (21) = happyGoto action_54
action_146 (22) = happyGoto action_55
action_146 (30) = happyGoto action_56
action_146 (37) = happyGoto action_57
action_146 _ = happyFail

action_147 (52) = happyShift action_58
action_147 (53) = happyShift action_59
action_147 (54) = happyShift action_60
action_147 (55) = happyShift action_61
action_147 (56) = happyShift action_62
action_147 (57) = happyShift action_63
action_147 (58) = happyShift action_64
action_147 (59) = happyShift action_65
action_147 (60) = happyShift action_66
action_147 (61) = happyShift action_67
action_147 (62) = happyShift action_68
action_147 (63) = happyShift action_69
action_147 (64) = happyShift action_70
action_147 (65) = happyShift action_71
action_147 (67) = happyShift action_72
action_147 (78) = happyShift action_73
action_147 (91) = happyShift action_31
action_147 (92) = happyShift action_32
action_147 (94) = happyShift action_74
action_147 (95) = happyShift action_75
action_147 (100) = happyShift action_76
action_147 (16) = happyGoto action_51
action_147 (17) = happyGoto action_174
action_147 (20) = happyGoto action_53
action_147 (21) = happyGoto action_54
action_147 (22) = happyGoto action_55
action_147 (30) = happyGoto action_56
action_147 (37) = happyGoto action_57
action_147 _ = happyFail

action_148 (90) = happyShift action_172
action_148 (93) = happyShift action_173
action_148 _ = happyFail

action_149 (95) = happyShift action_171
action_149 _ = happyFail

action_150 (52) = happyShift action_58
action_150 (53) = happyShift action_59
action_150 (54) = happyShift action_60
action_150 (55) = happyShift action_61
action_150 (56) = happyShift action_62
action_150 (57) = happyShift action_63
action_150 (58) = happyShift action_64
action_150 (59) = happyShift action_65
action_150 (60) = happyShift action_66
action_150 (61) = happyShift action_67
action_150 (62) = happyShift action_68
action_150 (63) = happyShift action_69
action_150 (64) = happyShift action_70
action_150 (65) = happyShift action_71
action_150 (67) = happyShift action_72
action_150 (91) = happyShift action_31
action_150 (92) = happyShift action_32
action_150 (94) = happyShift action_74
action_150 (95) = happyShift action_75
action_150 (100) = happyShift action_76
action_150 (16) = happyGoto action_169
action_150 (21) = happyGoto action_170
action_150 (22) = happyGoto action_55
action_150 (30) = happyGoto action_56
action_150 (37) = happyGoto action_57
action_150 _ = happyFail

action_151 _ = happyReduce_63

action_152 _ = happyReduce_64

action_153 (95) = happyShift action_167
action_153 (24) = happyGoto action_168
action_153 _ = happyFail

action_154 (95) = happyShift action_167
action_154 (24) = happyGoto action_166
action_154 _ = happyFail

action_155 (91) = happyShift action_31
action_155 (92) = happyShift action_32
action_155 (8) = happyGoto action_165
action_155 (37) = happyGoto action_50
action_155 _ = happyFail

action_156 (92) = happyShift action_164
action_156 _ = happyFail

action_157 (90) = happyShift action_46
action_157 (91) = happyShift action_31
action_157 (92) = happyShift action_32
action_157 (35) = happyGoto action_163
action_157 (36) = happyGoto action_44
action_157 (37) = happyGoto action_45
action_157 _ = happyFail

action_158 _ = happyReduce_26

action_159 _ = happyReduce_25

action_160 (78) = happyShift action_38
action_160 (92) = happyShift action_39
action_160 (93) = happyShift action_40
action_160 (94) = happyShift action_41
action_160 (95) = happyShift action_42
action_160 (10) = happyGoto action_162
action_160 (11) = happyGoto action_37
action_160 _ = happyFail

action_161 _ = happyReduce_30

action_162 _ = happyReduce_22

action_163 _ = happyReduce_114

action_164 (101) = happyShift action_231
action_164 _ = happyFail

action_165 _ = happyReduce_12

action_166 _ = happyReduce_80

action_167 (99) = happyShift action_230
action_167 _ = happyReduce_81

action_168 _ = happyReduce_79

action_169 _ = happyReduce_69

action_170 _ = happyReduce_65

action_171 (101) = happyShift action_229
action_171 _ = happyFail

action_172 (101) = happyShift action_228
action_172 _ = happyFail

action_173 (101) = happyShift action_227
action_173 _ = happyFail

action_174 (77) = happyShift action_111
action_174 (78) = happyShift action_112
action_174 (101) = happyShift action_226
action_174 (18) = happyGoto action_110
action_174 _ = happyFail

action_175 (77) = happyShift action_111
action_175 (78) = happyShift action_112
action_175 (101) = happyShift action_225
action_175 (18) = happyGoto action_110
action_175 _ = happyFail

action_176 (101) = happyShift action_224
action_176 _ = happyFail

action_177 (77) = happyShift action_111
action_177 (78) = happyShift action_112
action_177 (101) = happyShift action_223
action_177 (18) = happyGoto action_110
action_177 _ = happyFail

action_178 (77) = happyShift action_111
action_178 (78) = happyShift action_112
action_178 (101) = happyShift action_222
action_178 (18) = happyGoto action_110
action_178 _ = happyFail

action_179 (77) = happyShift action_111
action_179 (78) = happyShift action_112
action_179 (101) = happyShift action_221
action_179 (18) = happyGoto action_110
action_179 _ = happyFail

action_180 (77) = happyShift action_111
action_180 (78) = happyShift action_112
action_180 (101) = happyShift action_220
action_180 (18) = happyGoto action_110
action_180 _ = happyFail

action_181 (101) = happyShift action_219
action_181 _ = happyFail

action_182 (77) = happyShift action_111
action_182 (78) = happyShift action_112
action_182 (101) = happyShift action_218
action_182 (18) = happyGoto action_110
action_182 _ = happyFail

action_183 (77) = happyShift action_111
action_183 (78) = happyShift action_112
action_183 (101) = happyShift action_217
action_183 (18) = happyGoto action_110
action_183 _ = happyFail

action_184 (77) = happyShift action_111
action_184 (78) = happyShift action_112
action_184 (101) = happyShift action_216
action_184 (18) = happyGoto action_110
action_184 _ = happyFail

action_185 (77) = happyShift action_111
action_185 (78) = happyShift action_112
action_185 (101) = happyShift action_215
action_185 (18) = happyGoto action_110
action_185 _ = happyFail

action_186 (77) = happyShift action_111
action_186 (78) = happyShift action_112
action_186 (101) = happyShift action_214
action_186 (18) = happyGoto action_110
action_186 _ = happyFail

action_187 _ = happyReduce_68

action_188 (45) = happyShift action_213
action_188 _ = happyFail

action_189 _ = happyReduce_91

action_190 _ = happyReduce_32

action_191 (77) = happyShift action_111
action_191 (78) = happyShift action_112
action_191 (18) = happyGoto action_110
action_191 _ = happyReduce_92

action_192 _ = happyReduce_85

action_193 _ = happyReduce_84

action_194 _ = happyReduce_83

action_195 (77) = happyShift action_111
action_195 (78) = happyShift action_112
action_195 (101) = happyShift action_212
action_195 (18) = happyGoto action_110
action_195 _ = happyFail

action_196 (77) = happyShift action_111
action_196 (78) = happyShift action_112
action_196 (101) = happyShift action_211
action_196 (18) = happyGoto action_110
action_196 _ = happyFail

action_197 (99) = happyShift action_210
action_197 _ = happyFail

action_198 (99) = happyShift action_209
action_198 _ = happyFail

action_199 (99) = happyShift action_208
action_199 _ = happyFail

action_200 (81) = happyShift action_205
action_200 (82) = happyShift action_206
action_200 (83) = happyShift action_207
action_200 (27) = happyGoto action_204
action_200 _ = happyFail

action_201 (79) = happyShift action_151
action_201 (80) = happyShift action_152
action_201 (19) = happyGoto action_150
action_201 _ = happyReduce_57

action_202 _ = happyReduce_107

action_203 _ = happyReduce_110

action_204 (100) = happyShift action_238
action_204 _ = happyFail

action_205 _ = happyReduce_88

action_206 _ = happyReduce_89

action_207 _ = happyReduce_90

action_208 (52) = happyShift action_58
action_208 (53) = happyShift action_59
action_208 (54) = happyShift action_60
action_208 (55) = happyShift action_61
action_208 (56) = happyShift action_62
action_208 (57) = happyShift action_63
action_208 (58) = happyShift action_64
action_208 (59) = happyShift action_65
action_208 (60) = happyShift action_66
action_208 (61) = happyShift action_67
action_208 (62) = happyShift action_68
action_208 (63) = happyShift action_69
action_208 (64) = happyShift action_70
action_208 (65) = happyShift action_71
action_208 (67) = happyShift action_72
action_208 (78) = happyShift action_73
action_208 (91) = happyShift action_31
action_208 (92) = happyShift action_32
action_208 (94) = happyShift action_74
action_208 (95) = happyShift action_75
action_208 (100) = happyShift action_76
action_208 (16) = happyGoto action_51
action_208 (17) = happyGoto action_237
action_208 (20) = happyGoto action_53
action_208 (21) = happyGoto action_54
action_208 (22) = happyGoto action_55
action_208 (30) = happyGoto action_56
action_208 (37) = happyGoto action_57
action_208 _ = happyFail

action_209 (52) = happyShift action_58
action_209 (53) = happyShift action_59
action_209 (54) = happyShift action_60
action_209 (55) = happyShift action_61
action_209 (56) = happyShift action_62
action_209 (57) = happyShift action_63
action_209 (58) = happyShift action_64
action_209 (59) = happyShift action_65
action_209 (60) = happyShift action_66
action_209 (61) = happyShift action_67
action_209 (62) = happyShift action_68
action_209 (63) = happyShift action_69
action_209 (64) = happyShift action_70
action_209 (65) = happyShift action_71
action_209 (67) = happyShift action_72
action_209 (78) = happyShift action_73
action_209 (91) = happyShift action_31
action_209 (92) = happyShift action_32
action_209 (94) = happyShift action_74
action_209 (95) = happyShift action_75
action_209 (100) = happyShift action_76
action_209 (16) = happyGoto action_51
action_209 (17) = happyGoto action_236
action_209 (20) = happyGoto action_53
action_209 (21) = happyGoto action_54
action_209 (22) = happyGoto action_55
action_209 (30) = happyGoto action_56
action_209 (37) = happyGoto action_57
action_209 _ = happyFail

action_210 (52) = happyShift action_58
action_210 (53) = happyShift action_59
action_210 (54) = happyShift action_60
action_210 (55) = happyShift action_61
action_210 (56) = happyShift action_62
action_210 (57) = happyShift action_63
action_210 (58) = happyShift action_64
action_210 (59) = happyShift action_65
action_210 (60) = happyShift action_66
action_210 (61) = happyShift action_67
action_210 (62) = happyShift action_68
action_210 (63) = happyShift action_69
action_210 (64) = happyShift action_70
action_210 (65) = happyShift action_71
action_210 (67) = happyShift action_72
action_210 (78) = happyShift action_73
action_210 (91) = happyShift action_31
action_210 (92) = happyShift action_32
action_210 (94) = happyShift action_74
action_210 (95) = happyShift action_75
action_210 (100) = happyShift action_76
action_210 (16) = happyGoto action_51
action_210 (17) = happyGoto action_235
action_210 (20) = happyGoto action_53
action_210 (21) = happyGoto action_54
action_210 (22) = happyGoto action_55
action_210 (30) = happyGoto action_56
action_210 (37) = happyGoto action_57
action_210 _ = happyFail

action_211 _ = happyReduce_34

action_212 _ = happyReduce_33

action_213 (91) = happyShift action_31
action_213 (92) = happyShift action_32
action_213 (94) = happyShift action_74
action_213 (95) = happyShift action_75
action_213 (22) = happyGoto action_234
action_213 (30) = happyGoto action_56
action_213 (37) = happyGoto action_57
action_213 _ = happyFail

action_214 _ = happyReduce_56

action_215 _ = happyReduce_55

action_216 _ = happyReduce_54

action_217 _ = happyReduce_53

action_218 _ = happyReduce_52

action_219 _ = happyReduce_51

action_220 _ = happyReduce_50

action_221 _ = happyReduce_49

action_222 _ = happyReduce_48

action_223 _ = happyReduce_47

action_224 _ = happyReduce_46

action_225 _ = happyReduce_45

action_226 _ = happyReduce_44

action_227 _ = happyReduce_41

action_228 _ = happyReduce_42

action_229 _ = happyReduce_43

action_230 (95) = happyShift action_167
action_230 (24) = happyGoto action_233
action_230 _ = happyFail

action_231 (84) = happyShift action_232
action_231 _ = happyFail

action_232 (52) = happyShift action_58
action_232 (53) = happyShift action_59
action_232 (54) = happyShift action_60
action_232 (55) = happyShift action_61
action_232 (56) = happyShift action_62
action_232 (57) = happyShift action_63
action_232 (58) = happyShift action_64
action_232 (59) = happyShift action_65
action_232 (60) = happyShift action_66
action_232 (61) = happyShift action_67
action_232 (62) = happyShift action_68
action_232 (63) = happyShift action_69
action_232 (64) = happyShift action_70
action_232 (65) = happyShift action_71
action_232 (67) = happyShift action_72
action_232 (78) = happyShift action_73
action_232 (91) = happyShift action_31
action_232 (92) = happyShift action_32
action_232 (94) = happyShift action_74
action_232 (95) = happyShift action_75
action_232 (100) = happyShift action_76
action_232 (16) = happyGoto action_51
action_232 (17) = happyGoto action_244
action_232 (20) = happyGoto action_53
action_232 (21) = happyGoto action_54
action_232 (22) = happyGoto action_55
action_232 (30) = happyGoto action_56
action_232 (37) = happyGoto action_57
action_232 _ = happyFail

action_233 _ = happyReduce_82

action_234 (48) = happyShift action_243
action_234 _ = happyReduce_74

action_235 (77) = happyShift action_111
action_235 (78) = happyShift action_112
action_235 (101) = happyShift action_242
action_235 (18) = happyGoto action_110
action_235 _ = happyFail

action_236 (77) = happyShift action_111
action_236 (78) = happyShift action_112
action_236 (99) = happyShift action_241
action_236 (18) = happyGoto action_110
action_236 _ = happyFail

action_237 (77) = happyShift action_111
action_237 (78) = happyShift action_112
action_237 (101) = happyShift action_240
action_237 (18) = happyGoto action_110
action_237 _ = happyFail

action_238 (52) = happyShift action_58
action_238 (53) = happyShift action_59
action_238 (54) = happyShift action_60
action_238 (55) = happyShift action_61
action_238 (56) = happyShift action_62
action_238 (57) = happyShift action_63
action_238 (58) = happyShift action_64
action_238 (59) = happyShift action_65
action_238 (60) = happyShift action_66
action_238 (61) = happyShift action_67
action_238 (62) = happyShift action_68
action_238 (63) = happyShift action_69
action_238 (64) = happyShift action_70
action_238 (65) = happyShift action_71
action_238 (67) = happyShift action_72
action_238 (68) = happyShift action_85
action_238 (69) = happyShift action_86
action_238 (70) = happyShift action_87
action_238 (71) = happyShift action_88
action_238 (72) = happyShift action_89
action_238 (78) = happyShift action_73
action_238 (90) = happyShift action_90
action_238 (91) = happyShift action_31
action_238 (92) = happyShift action_32
action_238 (93) = happyShift action_91
action_238 (94) = happyShift action_74
action_238 (95) = happyShift action_75
action_238 (100) = happyShift action_92
action_238 (13) = happyGoto action_79
action_238 (14) = happyGoto action_80
action_238 (15) = happyGoto action_81
action_238 (16) = happyGoto action_51
action_238 (17) = happyGoto action_82
action_238 (20) = happyGoto action_53
action_238 (21) = happyGoto action_54
action_238 (22) = happyGoto action_55
action_238 (26) = happyGoto action_239
action_238 (28) = happyGoto action_84
action_238 (30) = happyGoto action_56
action_238 (37) = happyGoto action_57
action_238 _ = happyFail

action_239 (101) = happyShift action_247
action_239 _ = happyFail

action_240 _ = happyReduce_37

action_241 (52) = happyShift action_58
action_241 (53) = happyShift action_59
action_241 (54) = happyShift action_60
action_241 (55) = happyShift action_61
action_241 (56) = happyShift action_62
action_241 (57) = happyShift action_63
action_241 (58) = happyShift action_64
action_241 (59) = happyShift action_65
action_241 (60) = happyShift action_66
action_241 (61) = happyShift action_67
action_241 (62) = happyShift action_68
action_241 (63) = happyShift action_69
action_241 (64) = happyShift action_70
action_241 (65) = happyShift action_71
action_241 (67) = happyShift action_72
action_241 (78) = happyShift action_73
action_241 (91) = happyShift action_31
action_241 (92) = happyShift action_32
action_241 (94) = happyShift action_74
action_241 (95) = happyShift action_75
action_241 (100) = happyShift action_76
action_241 (16) = happyGoto action_51
action_241 (17) = happyGoto action_246
action_241 (20) = happyGoto action_53
action_241 (21) = happyGoto action_54
action_241 (22) = happyGoto action_55
action_241 (30) = happyGoto action_56
action_241 (37) = happyGoto action_57
action_241 _ = happyFail

action_242 _ = happyReduce_35

action_243 (91) = happyShift action_31
action_243 (92) = happyShift action_32
action_243 (94) = happyShift action_74
action_243 (95) = happyShift action_75
action_243 (22) = happyGoto action_245
action_243 (30) = happyGoto action_56
action_243 (37) = happyGoto action_57
action_243 _ = happyFail

action_244 (77) = happyShift action_111
action_244 (78) = happyShift action_112
action_244 (18) = happyGoto action_110
action_244 _ = happyReduce_20

action_245 _ = happyReduce_73

action_246 (77) = happyShift action_111
action_246 (78) = happyShift action_112
action_246 (101) = happyShift action_248
action_246 (18) = happyGoto action_110
action_246 _ = happyFail

action_247 _ = happyReduce_87

action_248 _ = happyReduce_36

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

happyReduce_3 = happySpecReduce_2  4 happyReduction_3
happyReduction_3 _
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn4
		 (let nr = getTkIntVal happy_var_1
                                          in (nr, [ControlStructure Return])
	)
happyReduction_3 _ _  = notHappyAtAll 

happyReduce_4 = happyMonadReduce 2 5 happyReduction_4
happyReduction_4 ((HappyAbsSyn6  happy_var_2) `HappyStk`
	(HappyTerminal happy_var_1) `HappyStk`
	happyRest) tk
	 = happyThen (( do 
                                                st <- get
                                                nr <- buildLineNumber $! happy_var_1
                                                put $ st { cur_basline = nr }
                                                return (nr,happy_var_2))
	) (\r -> happyReturn (HappyAbsSyn5 r))

happyReduce_5 = happySpecReduce_1  6 happyReduction_5
happyReduction_5 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn6
		 ([happy_var_1]
	)
happyReduction_5 _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_3  6 happyReduction_6
happyReduction_6 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1:happy_var_3
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_1  6 happyReduction_7
happyReduction_7 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  6 happyReduction_8
happyReduction_8 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1 ++ happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_2  7 happyReduction_9
happyReduction_9 (HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (reverse happy_var_2
	)
happyReduction_9 _ _  = notHappyAtAll 

happyReduce_10 = happyMonadReduce 1 7 happyReduction_10
happyReduction_10 (_ `HappyStk`
	happyRest) tk
	 = happyThen (( do
                                       st <- get
                                       let nx = [Next $ head $ last_for st]
                                       let rst = tail $ last_for st
                                       put $ st { last_for = rst }
                                       return nx)
	) (\r -> happyReturn (HappyAbsSyn7 r))

happyReduce_11 = happyMonadReduce 1 8 happyReduction_11
happyReduction_11 (_ `HappyStk`
	happyRest) tk
	 = happyThen (( do 
                                               st <- get
                                               -- TODO: CHeck if head differs from given var => failure!
                                               let myfor = head $ last_for st
                                               put $ st { last_for = tail $ last_for st }
                                               return [Next myfor])
	) (\r -> happyReturn (HappyAbsSyn8 r))

happyReduce_12 = happyMonadReduce 3 8 happyReduction_12
happyReduction_12 ((HappyAbsSyn8  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest) tk
	 = happyThen ((do
                                               st <- get
                                               -- TODO: CHeck if head differs from given var => failure!
                                               let myfor = head $ last_for st
                                               put $ st { last_for = tail $ last_for st }
                                               -- rst <- happy_var_3
                                               return $ (Next myfor) : happy_var_3)
	) (\r -> happyReturn (HappyAbsSyn8 r))

happyReduce_13 = happySpecReduce_1  9 happyReduction_13
happyReduction_13 (HappyAbsSyn31  happy_var_1)
	 =  HappyAbsSyn9
		 (IO_Com happy_var_1
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_1  9 happyReduction_14
happyReduction_14 (HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn9
		 (ControlStructure happy_var_1
	)
happyReduction_14 _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_1  9 happyReduction_15
happyReduction_15 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1
	)
happyReduction_15 _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_2  9 happyReduction_16
happyReduction_16 (HappyAbsSyn35  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (Read happy_var_2
	)
happyReduction_16 _ _  = notHappyAtAll 

happyReduce_17 = happyMonadReduce 2 9 happyReduction_17
happyReduction_17 ((HappyAbsSyn10  happy_var_2) `HappyStk`
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
	) (\r -> happyReturn (HappyAbsSyn9 r))

happyReduce_18 = happySpecReduce_1  9 happyReduction_18
happyReduction_18 _
	 =  HappyAbsSyn9
		 (Restore
	)

happyReduce_19 = happySpecReduce_1  9 happyReduction_19
happyReduction_19 _
	 =  HappyAbsSyn9
		 (NOOP
	)

happyReduce_20 = happyReduce 7 9 happyReduction_20
happyReduction_20 ((HappyAbsSyn17  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (Def (getTkStrVal happy_var_2) (NumVar_Var $ FloatVar $ getTkStrVal happy_var_4) happy_var_7
	) `HappyStk` happyRest

happyReduce_21 = happySpecReduce_1  10 happyReduction_21
happyReduction_21 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 ([happy_var_1]
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  10 happyReduction_22
happyReduction_22 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1:happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_1  11 happyReduction_23
happyReduction_23 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn11
		 (DataInt $ getTkIntVal happy_var_1
	)
happyReduction_23 _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_1  11 happyReduction_24
happyReduction_24 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn11
		 (DataFloat $ getTkFltVal happy_var_1
	)
happyReduction_24 _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_2  11 happyReduction_25
happyReduction_25 (HappyTerminal happy_var_2)
	_
	 =  HappyAbsSyn11
		 (DataInt $ (- getTkIntVal happy_var_2)
	)
happyReduction_25 _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_2  11 happyReduction_26
happyReduction_26 (HappyTerminal happy_var_2)
	_
	 =  HappyAbsSyn11
		 (DataFloat $ (- getTkFltVal happy_var_2)
	)
happyReduction_26 _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_1  11 happyReduction_27
happyReduction_27 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn11
		 (DataString $ getTkStrVal happy_var_1
	)
happyReduction_27 _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_1  11 happyReduction_28
happyReduction_28 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn11
		 (DataString $ getTkStrVal happy_var_1
	)
happyReduction_28 _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  12 happyReduction_29
happyReduction_29 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn37  happy_var_1)
	 =  HappyAbsSyn12
		 (ArithAssignment happy_var_1 happy_var_3
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  12 happyReduction_30
happyReduction_30 (HappyAbsSyn13  happy_var_3)
	_
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn12
		 (let {
                                                      str = getTkStrVal happy_var_1;
                                                      str' = StringVar str
                                               } in StringAssignment str' happy_var_3
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_1  13 happyReduction_31
happyReduction_31 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_1
	)
happyReduction_31 _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  13 happyReduction_32
happyReduction_32 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn13
		 (StringExpr (happy_var_1,happy_var_3) "+"
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happyReduce 4 14 happyReduction_33
happyReduction_33 (_ `HappyStk`
	(HappyAbsSyn17  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (ChrFunc happy_var_3
	) `HappyStk` happyRest

happyReduce_34 = happyReduce 4 14 happyReduction_34
happyReduction_34 (_ `HappyStk`
	(HappyAbsSyn17  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (StrFunc happy_var_3
	) `HappyStk` happyRest

happyReduce_35 = happyReduce 6 14 happyReduction_35
happyReduction_35 (_ `HappyStk`
	(HappyAbsSyn17  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (LeftFunc  happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_36 = happyReduce 8 14 happyReduction_36
happyReduction_36 (_ `HappyStk`
	(HappyAbsSyn17  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (MidFunc happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_37 = happyReduce 6 14 happyReduction_37
happyReduction_37 (_ `HappyStk`
	(HappyAbsSyn17  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (RightFunc happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_38 = happySpecReduce_1  15 happyReduction_38
happyReduction_38 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn15
		 (let str = getTkStrVal happy_var_1
                                          in StringOp $ StringLiteral str
	)
happyReduction_38 _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_1  15 happyReduction_39
happyReduction_39 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn15
		 (let {
                                              str = getTkStrVal happy_var_1;
                                              str' = StringVar str
                                      } in StringOp $ StringVar_BString str'
	)
happyReduction_39 _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_1  15 happyReduction_40
happyReduction_40 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn15
		 (StringFunc happy_var_1
	)
happyReduction_40 _  = notHappyAtAll 

happyReduce_41 = happyReduce 4 16 happyReduction_41
happyReduction_41 (_ `HappyStk`
	(HappyTerminal happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (Len $ getTkStrVal happy_var_3
	) `HappyStk` happyRest

happyReduce_42 = happyReduce 4 16 happyReduction_42
happyReduction_42 (_ `HappyStk`
	(HappyTerminal happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (let str = getTkStrVal happy_var_3
                                                 in LenVar (StringVar $ str)
	) `HappyStk` happyRest

happyReduce_43 = happyReduce 4 16 happyReduction_43
happyReduction_43 (_ `HappyStk`
	(HappyTerminal happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (Random $ getTkIntVal happy_var_3
	) `HappyStk` happyRest

happyReduce_44 = happyReduce 4 16 happyReduction_44
happyReduction_44 (_ `HappyStk`
	(HappyAbsSyn17  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (IntFunc happy_var_3
	) `HappyStk` happyRest

happyReduce_45 = happyReduce 4 16 happyReduction_45
happyReduction_45 (_ `HappyStk`
	(HappyAbsSyn17  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (AbsFunc happy_var_3
	) `HappyStk` happyRest

happyReduce_46 = happyReduce 4 16 happyReduction_46
happyReduction_46 (_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (AscFunc happy_var_3
	) `HappyStk` happyRest

happyReduce_47 = happyReduce 4 16 happyReduction_47
happyReduction_47 (_ `HappyStk`
	(HappyAbsSyn17  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (AtnFunc happy_var_3
	) `HappyStk` happyRest

happyReduce_48 = happyReduce 4 16 happyReduction_48
happyReduction_48 (_ `HappyStk`
	(HappyAbsSyn17  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (CosFunc happy_var_3
	) `HappyStk` happyRest

happyReduce_49 = happyReduce 4 16 happyReduction_49
happyReduction_49 (_ `HappyStk`
	(HappyAbsSyn17  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (ExpFunc happy_var_3
	) `HappyStk` happyRest

happyReduce_50 = happyReduce 4 16 happyReduction_50
happyReduction_50 (_ `HappyStk`
	(HappyAbsSyn17  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (LogFunc happy_var_3
	) `HappyStk` happyRest

happyReduce_51 = happyReduce 4 16 happyReduction_51
happyReduction_51 (_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (ValFunc happy_var_3
	) `HappyStk` happyRest

happyReduce_52 = happyReduce 4 16 happyReduction_52
happyReduction_52 (_ `HappyStk`
	(HappyAbsSyn17  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (SgnFunc happy_var_3
	) `HappyStk` happyRest

happyReduce_53 = happyReduce 4 16 happyReduction_53
happyReduction_53 (_ `HappyStk`
	(HappyAbsSyn17  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (SinFunc happy_var_3
	) `HappyStk` happyRest

happyReduce_54 = happyReduce 4 16 happyReduction_54
happyReduction_54 (_ `HappyStk`
	(HappyAbsSyn17  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (SqrFunc happy_var_3
	) `HappyStk` happyRest

happyReduce_55 = happyReduce 4 16 happyReduction_55
happyReduction_55 (_ `HappyStk`
	(HappyAbsSyn17  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (TanFunc happy_var_3
	) `HappyStk` happyRest

happyReduce_56 = happyReduce 4 16 happyReduction_56
happyReduction_56 (_ `HappyStk`
	(HappyAbsSyn17  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (Fnxx (getTkStrVal happy_var_1)  happy_var_3
	) `HappyStk` happyRest

happyReduce_57 = happySpecReduce_3  17 happyReduction_57
happyReduction_57 (HappyAbsSyn20  happy_var_3)
	(HappyAbsSyn18  happy_var_2)
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (NumExpr (happy_var_1,happy_var_3) happy_var_2
	)
happyReduction_57 _ _ _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_1  17 happyReduction_58
happyReduction_58 (HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1
	)
happyReduction_58 _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_1  17 happyReduction_59
happyReduction_59 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn17
		 (NumFunc happy_var_1
	)
happyReduction_59 _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_2  17 happyReduction_60
happyReduction_60 (HappyAbsSyn17  happy_var_2)
	_
	 =  HappyAbsSyn17
		 (NumMinus happy_var_2
	)
happyReduction_60 _ _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_1  18 happyReduction_61
happyReduction_61 _
	 =  HappyAbsSyn18
		 ("+"
	)

happyReduce_62 = happySpecReduce_1  18 happyReduction_62
happyReduction_62 _
	 =  HappyAbsSyn18
		 ("-"
	)

happyReduce_63 = happySpecReduce_1  19 happyReduction_63
happyReduction_63 _
	 =  HappyAbsSyn19
		 ("*"
	)

happyReduce_64 = happySpecReduce_1  19 happyReduction_64
happyReduction_64 _
	 =  HappyAbsSyn19
		 ("/"
	)

happyReduce_65 = happySpecReduce_3  20 happyReduction_65
happyReduction_65 (HappyAbsSyn21  happy_var_3)
	(HappyAbsSyn19  happy_var_2)
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (NumExpr (happy_var_1,happy_var_3) happy_var_2
	)
happyReduction_65 _ _ _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_1  20 happyReduction_66
happyReduction_66 (HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn20
		 (happy_var_1
	)
happyReduction_66 _  = notHappyAtAll 

happyReduce_67 = happySpecReduce_1  21 happyReduction_67
happyReduction_67 (HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn21
		 (NumOp happy_var_1
	)
happyReduction_67 _  = notHappyAtAll 

happyReduce_68 = happySpecReduce_3  21 happyReduction_68
happyReduction_68 _
	(HappyAbsSyn17  happy_var_2)
	_
	 =  HappyAbsSyn21
		 (happy_var_2
	)
happyReduction_68 _ _ _  = notHappyAtAll 

happyReduce_69 = happySpecReduce_1  21 happyReduction_69
happyReduction_69 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn21
		 (NumFunc happy_var_1
	)
happyReduction_69 _  = notHappyAtAll 

happyReduce_70 = happySpecReduce_1  22 happyReduction_70
happyReduction_70 (HappyAbsSyn37  happy_var_1)
	 =  HappyAbsSyn22
		 (OpVar happy_var_1
	)
happyReduction_70 _  = notHappyAtAll 

happyReduce_71 = happySpecReduce_1  22 happyReduction_71
happyReduction_71 (HappyAbsSyn30  happy_var_1)
	 =  HappyAbsSyn22
		 (happy_var_1
	)
happyReduction_71 _  = notHappyAtAll 

happyReduce_72 = happySpecReduce_3  23 happyReduction_72
happyReduction_72 (HappyAbsSyn25  happy_var_3)
	(HappyAbsSyn26  happy_var_2)
	_
	 =  HappyAbsSyn23
		 (If happy_var_2 happy_var_3
	)
happyReduction_72 _ _ _  = notHappyAtAll 

happyReduce_73 = happyMonadReduce 8 23 happyReduction_73
happyReduction_73 ((HappyAbsSyn22  happy_var_8) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn22  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn22  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest) tk
	 = happyThen (( do
                                    st <- get
                                    let myvar =  (FloatVar $ getTkStrVal happy_var_2)
                                    let com = For myvar (happy_var_4,happy_var_8,happy_var_6)
                                    put $ st { last_for = com : (last_for st) }
                                    return com)
	) (\r -> happyReturn (HappyAbsSyn23 r))

happyReduce_74 = happyMonadReduce 6 23 happyReduction_74
happyReduction_74 ((HappyAbsSyn22  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn22  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest) tk
	 = happyThen (( do
                                    st <- get
                                    let myvar =  (FloatVar $ getTkStrVal happy_var_2)
                                    let com = For myvar (happy_var_4,(IntConst 1),happy_var_6)
                                 --   put $ st { last_for = trace ("myfors: " ++ show (com : (last_for st))) $ com : (last_for st) }
                                    put $ st { last_for = com : (last_for st) }
                                    return com)
	) (\r -> happyReturn (HappyAbsSyn23 r))

happyReduce_75 = happySpecReduce_2  23 happyReduction_75
happyReduction_75 (HappyTerminal happy_var_2)
	_
	 =  HappyAbsSyn23
		 (GoSub $ getTkIntVal happy_var_2
	)
happyReduction_75 _ _  = notHappyAtAll 

happyReduce_76 = happySpecReduce_2  23 happyReduction_76
happyReduction_76 (HappyTerminal happy_var_2)
	_
	 =  HappyAbsSyn23
		 (Goto $ getTkIntVal happy_var_2
	)
happyReduction_76 _ _  = notHappyAtAll 

happyReduce_77 = happySpecReduce_1  23 happyReduction_77
happyReduction_77 _
	 =  HappyAbsSyn23
		 (End
	)

happyReduce_78 = happySpecReduce_1  23 happyReduction_78
happyReduction_78 _
	 =  HappyAbsSyn23
		 (Return
	)

happyReduce_79 = happyReduce 4 23 happyReduction_79
happyReduction_79 ((HappyAbsSyn24  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn23
		 (On_Goto  happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_80 = happyReduce 4 23 happyReduction_80
happyReduction_80 ((HappyAbsSyn24  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn23
		 (On_Gosub happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_81 = happySpecReduce_1  24 happyReduction_81
happyReduction_81 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn24
		 ([getTkIntVal happy_var_1]
	)
happyReduction_81 _  = notHappyAtAll 

happyReduce_82 = happySpecReduce_3  24 happyReduction_82
happyReduction_82 (HappyAbsSyn24  happy_var_3)
	_
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn24
		 ((getTkIntVal happy_var_1):happy_var_3
	)
happyReduction_82 _ _ _  = notHappyAtAll 

happyReduce_83 = happySpecReduce_2  25 happyReduction_83
happyReduction_83 (HappyTerminal happy_var_2)
	_
	 =  HappyAbsSyn25
		 (let nr  = getTkIntVal happy_var_2
                                            in [ControlStructure $ Goto nr]
	)
happyReduction_83 _ _  = notHappyAtAll 

happyReduce_84 = happySpecReduce_2  25 happyReduction_84
happyReduction_84 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn25
		 (happy_var_2
	)
happyReduction_84 _ _  = notHappyAtAll 

happyReduce_85 = happySpecReduce_2  25 happyReduction_85
happyReduction_85 (HappyTerminal happy_var_2)
	_
	 =  HappyAbsSyn25
		 (let nr  = getTkIntVal happy_var_2
                                            in [ControlStructure $ Goto nr]
	)
happyReduction_85 _ _  = notHappyAtAll 

happyReduce_86 = happySpecReduce_1  26 happyReduction_86
happyReduction_86 (HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn26
		 (happy_var_1
	)
happyReduction_86 _  = notHappyAtAll 

happyReduce_87 = happyReduce 7 26 happyReduction_87
happyReduction_87 (_ `HappyStk`
	(HappyAbsSyn26  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn27  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn26  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn26
		 (BoolExprLog (happy_var_2,happy_var_6) happy_var_4
	) `HappyStk` happyRest

happyReduce_88 = happySpecReduce_1  27 happyReduction_88
happyReduction_88 _
	 =  HappyAbsSyn27
		 ("||"
	)

happyReduce_89 = happySpecReduce_1  27 happyReduction_89
happyReduction_89 _
	 =  HappyAbsSyn27
		 ("&&"
	)

happyReduce_90 = happySpecReduce_1  27 happyReduction_90
happyReduction_90 _
	 =  HappyAbsSyn27
		 ("neg"
	)

happyReduce_91 = happySpecReduce_3  28 happyReduction_91
happyReduction_91 (HappyAbsSyn13  happy_var_3)
	(HappyAbsSyn29  happy_var_2)
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn28
		 (BoolExprString (happy_var_1,happy_var_3) happy_var_2
	)
happyReduction_91 _ _ _  = notHappyAtAll 

happyReduce_92 = happySpecReduce_3  28 happyReduction_92
happyReduction_92 (HappyAbsSyn17  happy_var_3)
	(HappyAbsSyn29  happy_var_2)
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn28
		 (BoolExprNum (happy_var_1,happy_var_3) happy_var_2
	)
happyReduction_92 _ _ _  = notHappyAtAll 

happyReduce_93 = happySpecReduce_1  29 happyReduction_93
happyReduction_93 _
	 =  HappyAbsSyn29
		 ("=="
	)

happyReduce_94 = happySpecReduce_1  29 happyReduction_94
happyReduction_94 _
	 =  HappyAbsSyn29
		 ("<"
	)

happyReduce_95 = happySpecReduce_1  29 happyReduction_95
happyReduction_95 _
	 =  HappyAbsSyn29
		 (">"
	)

happyReduce_96 = happySpecReduce_1  29 happyReduction_96
happyReduction_96 _
	 =  HappyAbsSyn29
		 ("/="
	)

happyReduce_97 = happySpecReduce_1  29 happyReduction_97
happyReduction_97 _
	 =  HappyAbsSyn29
		 ("<="
	)

happyReduce_98 = happySpecReduce_1  29 happyReduction_98
happyReduction_98 _
	 =  HappyAbsSyn29
		 (">="
	)

happyReduce_99 = happySpecReduce_1  30 happyReduction_99
happyReduction_99 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn30
		 (let int = getTkIntVal happy_var_1
                                                   in IntConst int
	)
happyReduction_99 _  = notHappyAtAll 

happyReduce_100 = happySpecReduce_1  30 happyReduction_100
happyReduction_100 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn30
		 (let flt = getTkFltVal happy_var_1
                                                   in FloatConst flt
	)
happyReduction_100 _  = notHappyAtAll 

happyReduce_101 = happySpecReduce_2  31 happyReduction_101
happyReduction_101 (HappyAbsSyn32  happy_var_2)
	_
	 =  HappyAbsSyn31
		 (Print happy_var_2
	)
happyReduction_101 _ _  = notHappyAtAll 

happyReduce_102 = happySpecReduce_1  31 happyReduction_102
happyReduction_102 _
	 =  HappyAbsSyn31
		 (Print ([], True)
	)

happyReduce_103 = happySpecReduce_2  31 happyReduction_103
happyReduction_103 (HappyAbsSyn34  happy_var_2)
	_
	 =  HappyAbsSyn31
		 (Input happy_var_2
	)
happyReduction_103 _ _  = notHappyAtAll 

happyReduce_104 = happySpecReduce_2  31 happyReduction_104
happyReduction_104 (HappyAbsSyn36  happy_var_2)
	_
	 =  HappyAbsSyn31
		 (Get happy_var_2
	)
happyReduction_104 _ _  = notHappyAtAll 

happyReduce_105 = happySpecReduce_1  32 happyReduction_105
happyReduction_105 (HappyAbsSyn33  happy_var_1)
	 =  HappyAbsSyn32
		 (([happy_var_1], True)
	)
happyReduction_105 _  = notHappyAtAll 

happyReduce_106 = happySpecReduce_2  32 happyReduction_106
happyReduction_106 _
	(HappyAbsSyn33  happy_var_1)
	 =  HappyAbsSyn32
		 (([happy_var_1], False)
	)
happyReduction_106 _ _  = notHappyAtAll 

happyReduce_107 = happySpecReduce_3  32 happyReduction_107
happyReduction_107 (HappyAbsSyn32  happy_var_3)
	_
	(HappyAbsSyn33  happy_var_1)
	 =  HappyAbsSyn32
		 ((happy_var_1:(fst happy_var_3), snd happy_var_3)
	)
happyReduction_107 _ _ _  = notHappyAtAll 

happyReduce_108 = happySpecReduce_1  33 happyReduction_108
happyReduction_108 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn33
		 (OutStringExpr happy_var_1
	)
happyReduction_108 _  = notHappyAtAll 

happyReduce_109 = happySpecReduce_1  33 happyReduction_109
happyReduction_109 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn33
		 (OutNumExpr happy_var_1
	)
happyReduction_109 _  = notHappyAtAll 

happyReduce_110 = happySpecReduce_3  34 happyReduction_110
happyReduction_110 (HappyAbsSyn35  happy_var_3)
	_
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn34
		 ((InputStuff [getTkStrVal happy_var_1] happy_var_3, False)
	)
happyReduction_110 _ _ _  = notHappyAtAll 

happyReduce_111 = happySpecReduce_2  34 happyReduction_111
happyReduction_111 (HappyAbsSyn35  happy_var_2)
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn34
		 ((InputStuff [getTkStrVal happy_var_1] happy_var_2, True)
	)
happyReduction_111 _ _  = notHappyAtAll 

happyReduce_112 = happySpecReduce_1  34 happyReduction_112
happyReduction_112 (HappyAbsSyn35  happy_var_1)
	 =  HappyAbsSyn34
		 ((InputStuff [] happy_var_1, False)
	)
happyReduction_112 _  = notHappyAtAll 

happyReduce_113 = happySpecReduce_1  35 happyReduction_113
happyReduction_113 (HappyAbsSyn36  happy_var_1)
	 =  HappyAbsSyn35
		 ([happy_var_1]
	)
happyReduction_113 _  = notHappyAtAll 

happyReduce_114 = happySpecReduce_3  35 happyReduction_114
happyReduction_114 (HappyAbsSyn35  happy_var_3)
	_
	(HappyAbsSyn36  happy_var_1)
	 =  HappyAbsSyn35
		 (happy_var_1:happy_var_3
	)
happyReduction_114 _ _ _  = notHappyAtAll 

happyReduce_115 = happySpecReduce_1  36 happyReduction_115
happyReduction_115 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn36
		 (StringVar_Var (StringVar $ getTkStrVal happy_var_1)
	)
happyReduction_115 _  = notHappyAtAll 

happyReduce_116 = happySpecReduce_1  36 happyReduction_116
happyReduction_116 (HappyAbsSyn37  happy_var_1)
	 =  HappyAbsSyn36
		 (NumVar_Var happy_var_1
	)
happyReduction_116 _  = notHappyAtAll 

happyReduce_117 = happySpecReduce_1  37 happyReduction_117
happyReduction_117 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn37
		 (IntVar $ getTkStrVal happy_var_1
	)
happyReduction_117 _  = notHappyAtAll 

happyReduce_118 = happySpecReduce_1  37 happyReduction_118
happyReduction_118 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn37
		 (FloatVar $ getTkStrVal happy_var_1
	)
happyReduction_118 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 102 102 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenWrap _type pos TkInput -> cont 38;
	TokenWrap _type pos TkPrint -> cont 39;
	TokenWrap _type pos TkGet -> cont 40;
	TokenWrap _type pos TkIf -> cont 41;
	TokenWrap _type pos TkThen -> cont 42;
	TokenWrap _type pos TkGoto -> cont 43;
	TokenWrap _type pos TkFor -> cont 44;
	TokenWrap _type pos TkTo -> cont 45;
	TokenWrap _type pos TkOn -> cont 46;
	TokenWrap _type pos TkNext -> cont 47;
	TokenWrap _type pos TkStep -> cont 48;
	TokenWrap _type pos TkGoSub -> cont 49;
	TokenWrap _type pos TkReturn -> cont 50;
	TokenWrap _type pos TkEnd -> cont 51;
	TokenWrap _type pos TkRandom -> cont 52;
	TokenWrap _type pos TkLen -> cont 53;
	TokenWrap _type pos TkIntFunc -> cont 54;
	TokenWrap _type pos TkAbsFunc -> cont 55;
	TokenWrap _type pos TkAscFunc -> cont 56;
	TokenWrap _type pos TkAtnFunc -> cont 57;
	TokenWrap _type pos TkCosFunc -> cont 58;
	TokenWrap _type pos TkExpFunc -> cont 59;
	TokenWrap _type pos TkLogFunc -> cont 60;
	TokenWrap _type pos TkValFunc -> cont 61;
	TokenWrap _type pos TkSgnFunc -> cont 62;
	TokenWrap _type pos TkSinFunc -> cont 63;
	TokenWrap _type pos TkSqrFunc -> cont 64;
	TokenWrap _type pos TkTanFunc -> cont 65;
	TokenWrap _type pos TkDef -> cont 66;
	TokenWrap _type pos (TkFnxx str) -> cont 67;
	TokenWrap _type pos TkChrFunc -> cont 68;
	TokenWrap _type pos TkStrFunc -> cont 69;
	TokenWrap _type pos TkLeftFunc -> cont 70;
	TokenWrap _type pos TkMidFunc -> cont 71;
	TokenWrap _type pos TkRightFunc -> cont 72;
	TokenWrap _type pos TkRead -> cont 73;
	TokenWrap _type pos TkData -> cont 74;
	TokenWrap _type pos TkRestore -> cont 75;
	TokenWrap _type pos TkComment -> cont 76;
	TokenWrap _type pos TkPlus -> cont 77;
	TokenWrap _type pos TkMinus -> cont 78;
	TokenWrap _type pos TkTimes -> cont 79;
	TokenWrap _type pos TkDiv -> cont 80;
	TokenWrap _type pos TkLogOr -> cont 81;
	TokenWrap _type pos TkLogAnd -> cont 82;
	TokenWrap _type pos TkLogNeg -> cont 83;
	TokenWrap _type pos TkEqual -> cont 84;
	TokenWrap _type pos TkUnEqual -> cont 85;
	TokenWrap _type pos TkLt -> cont 86;
	TokenWrap _type pos TkGt -> cont 87;
	TokenWrap _type pos TkLE -> cont 88;
	TokenWrap _type pos TkGE -> cont 89;
	TokenWrap _type pos (TkStringVar val) -> cont 90;
	TokenWrap _type pos (TkIntVar val) -> cont 91;
	TokenWrap _t p (TkFloatVar_Or_DataString val) -> cont 92;
	TokenWrap _type pos (TkString val) -> cont 93;
	TokenWrap _type pos (TkConst (TkFloatConst val)) -> cont 94;
	TokenWrap _type pos (TkConst (TkIntConst val)) -> cont 95;
	TokenWrap _type pos (TkLineNumber val) -> cont 96;
	TokenWrap _type pos TkStringConcat -> cont 97;
	TokenWrap _type pos TkSingleLineCommandCombinator -> cont 98;
	TokenWrap _type pos TkKomma -> cont 99;
	TokenWrap _type pos TkBracketOpen -> cont 100;
	TokenWrap _type pos TkBracketClose -> cont 101;
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
