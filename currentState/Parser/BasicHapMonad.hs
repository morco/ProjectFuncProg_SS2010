{-# OPTIONS_GHC -fno-warn-overlapping-patterns #-}
module Parser.BasicHapMonad(getParseTree) where

import Parser.Lexer.BasicAlexMonad(getTokens)
import Parser.ParserTypes
import Parser.ParserErrors

import Data.List(delete)
import Control.Monad.State

import Debug.Trace

-- parser produced by Happy Version 1.18.4

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26 t27 t28 t29 t30 t31 t32 t33 t34 t35 t36 t37 t38
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
	| HappyAbsSyn38 t38

action_0 (97) = happyShift action_6
action_0 (4) = happyGoto action_4
action_0 (5) = happyGoto action_5
action_0 _ = happyFail

action_1 (97) = happyShift action_3
action_1 (5) = happyGoto action_2
action_1 _ = happyFail

action_2 _ = happyFail

action_3 (39) = happyShift action_13
action_3 (40) = happyShift action_14
action_3 (41) = happyShift action_15
action_3 (42) = happyShift action_16
action_3 (44) = happyShift action_17
action_3 (45) = happyShift action_18
action_3 (47) = happyShift action_19
action_3 (50) = happyShift action_21
action_3 (51) = happyShift action_33
action_3 (52) = happyShift action_23
action_3 (67) = happyShift action_24
action_3 (74) = happyShift action_25
action_3 (75) = happyShift action_26
action_3 (76) = happyShift action_27
action_3 (77) = happyShift action_28
action_3 (91) = happyShift action_29
action_3 (92) = happyShift action_30
action_3 (93) = happyShift action_31
action_3 (6) = happyGoto action_7
action_3 (8) = happyGoto action_8
action_3 (11) = happyGoto action_9
action_3 (22) = happyGoto action_10
action_3 (32) = happyGoto action_11
action_3 (38) = happyGoto action_12
action_3 _ = happyFail

action_4 (103) = happyAccept
action_4 _ = happyFail

action_5 (97) = happyShift action_6
action_5 (4) = happyGoto action_32
action_5 (5) = happyGoto action_5
action_5 _ = happyReduce_1

action_6 (39) = happyShift action_13
action_6 (40) = happyShift action_14
action_6 (41) = happyShift action_15
action_6 (42) = happyShift action_16
action_6 (44) = happyShift action_17
action_6 (45) = happyShift action_18
action_6 (47) = happyShift action_19
action_6 (48) = happyShift action_20
action_6 (50) = happyShift action_21
action_6 (51) = happyShift action_22
action_6 (52) = happyShift action_23
action_6 (67) = happyShift action_24
action_6 (74) = happyShift action_25
action_6 (75) = happyShift action_26
action_6 (76) = happyShift action_27
action_6 (77) = happyShift action_28
action_6 (91) = happyShift action_29
action_6 (92) = happyShift action_30
action_6 (93) = happyShift action_31
action_6 (6) = happyGoto action_7
action_6 (8) = happyGoto action_8
action_6 (11) = happyGoto action_9
action_6 (22) = happyGoto action_10
action_6 (32) = happyGoto action_11
action_6 (38) = happyGoto action_12
action_6 _ = happyFail

action_7 _ = happyReduce_6

action_8 (99) = happyShift action_100
action_8 _ = happyReduce_7

action_9 _ = happyReduce_13

action_10 _ = happyReduce_12

action_11 _ = happyReduce_11

action_12 (85) = happyShift action_99
action_12 _ = happyFail

action_13 (91) = happyShift action_45
action_13 (92) = happyShift action_30
action_13 (93) = happyShift action_31
action_13 (94) = happyShift action_98
action_13 (35) = happyGoto action_96
action_13 (36) = happyGoto action_97
action_13 (37) = happyGoto action_43
action_13 (38) = happyGoto action_44
action_13 _ = happyFail

action_14 (53) = happyShift action_56
action_14 (54) = happyShift action_57
action_14 (55) = happyShift action_58
action_14 (56) = happyShift action_59
action_14 (57) = happyShift action_60
action_14 (58) = happyShift action_61
action_14 (59) = happyShift action_62
action_14 (60) = happyShift action_63
action_14 (61) = happyShift action_64
action_14 (62) = happyShift action_65
action_14 (63) = happyShift action_66
action_14 (64) = happyShift action_67
action_14 (65) = happyShift action_68
action_14 (66) = happyShift action_69
action_14 (68) = happyShift action_70
action_14 (69) = happyShift action_83
action_14 (70) = happyShift action_84
action_14 (71) = happyShift action_85
action_14 (72) = happyShift action_86
action_14 (73) = happyShift action_87
action_14 (79) = happyShift action_71
action_14 (91) = happyShift action_88
action_14 (92) = happyShift action_30
action_14 (93) = happyShift action_31
action_14 (94) = happyShift action_89
action_14 (95) = happyShift action_72
action_14 (96) = happyShift action_73
action_14 (101) = happyShift action_74
action_14 (12) = happyGoto action_92
action_14 (13) = happyGoto action_78
action_14 (14) = happyGoto action_79
action_14 (15) = happyGoto action_49
action_14 (16) = happyGoto action_93
action_14 (19) = happyGoto action_51
action_14 (20) = happyGoto action_52
action_14 (21) = happyGoto action_53
action_14 (31) = happyGoto action_54
action_14 (33) = happyGoto action_94
action_14 (34) = happyGoto action_95
action_14 (38) = happyGoto action_55
action_14 _ = happyReduce_106

action_15 (91) = happyShift action_45
action_15 (92) = happyShift action_30
action_15 (93) = happyShift action_31
action_15 (37) = happyGoto action_91
action_15 (38) = happyGoto action_44
action_15 _ = happyFail

action_16 (53) = happyShift action_56
action_16 (54) = happyShift action_57
action_16 (55) = happyShift action_58
action_16 (56) = happyShift action_59
action_16 (57) = happyShift action_60
action_16 (58) = happyShift action_61
action_16 (59) = happyShift action_62
action_16 (60) = happyShift action_63
action_16 (61) = happyShift action_64
action_16 (62) = happyShift action_65
action_16 (63) = happyShift action_66
action_16 (64) = happyShift action_67
action_16 (65) = happyShift action_68
action_16 (66) = happyShift action_69
action_16 (68) = happyShift action_70
action_16 (69) = happyShift action_83
action_16 (70) = happyShift action_84
action_16 (71) = happyShift action_85
action_16 (72) = happyShift action_86
action_16 (73) = happyShift action_87
action_16 (79) = happyShift action_71
action_16 (91) = happyShift action_88
action_16 (92) = happyShift action_30
action_16 (93) = happyShift action_31
action_16 (94) = happyShift action_89
action_16 (95) = happyShift action_72
action_16 (96) = happyShift action_73
action_16 (101) = happyShift action_90
action_16 (12) = happyGoto action_77
action_16 (13) = happyGoto action_78
action_16 (14) = happyGoto action_79
action_16 (15) = happyGoto action_49
action_16 (16) = happyGoto action_80
action_16 (19) = happyGoto action_51
action_16 (20) = happyGoto action_52
action_16 (21) = happyGoto action_53
action_16 (27) = happyGoto action_81
action_16 (29) = happyGoto action_82
action_16 (31) = happyGoto action_54
action_16 (38) = happyGoto action_55
action_16 _ = happyFail

action_17 (96) = happyShift action_76
action_17 _ = happyFail

action_18 (93) = happyShift action_75
action_18 _ = happyFail

action_19 (53) = happyShift action_56
action_19 (54) = happyShift action_57
action_19 (55) = happyShift action_58
action_19 (56) = happyShift action_59
action_19 (57) = happyShift action_60
action_19 (58) = happyShift action_61
action_19 (59) = happyShift action_62
action_19 (60) = happyShift action_63
action_19 (61) = happyShift action_64
action_19 (62) = happyShift action_65
action_19 (63) = happyShift action_66
action_19 (64) = happyShift action_67
action_19 (65) = happyShift action_68
action_19 (66) = happyShift action_69
action_19 (68) = happyShift action_70
action_19 (79) = happyShift action_71
action_19 (92) = happyShift action_30
action_19 (93) = happyShift action_31
action_19 (95) = happyShift action_72
action_19 (96) = happyShift action_73
action_19 (101) = happyShift action_74
action_19 (15) = happyGoto action_49
action_19 (16) = happyGoto action_50
action_19 (19) = happyGoto action_51
action_19 (20) = happyGoto action_52
action_19 (21) = happyGoto action_53
action_19 (31) = happyGoto action_54
action_19 (38) = happyGoto action_55
action_19 _ = happyFail

action_20 (92) = happyShift action_30
action_20 (93) = happyShift action_31
action_20 (38) = happyGoto action_48
action_20 _ = happyReduce_4

action_21 (96) = happyShift action_47
action_21 _ = happyFail

action_22 (97) = happyReduce_76
action_22 (99) = happyReduce_76
action_22 (103) = happyReduce_76
action_22 _ = happyReduce_76

action_23 _ = happyReduce_75

action_24 (68) = happyShift action_46
action_24 _ = happyFail

action_25 (91) = happyShift action_45
action_25 (92) = happyShift action_30
action_25 (93) = happyShift action_31
action_25 (36) = happyGoto action_42
action_25 (37) = happyGoto action_43
action_25 (38) = happyGoto action_44
action_25 _ = happyFail

action_26 (79) = happyShift action_37
action_26 (93) = happyShift action_38
action_26 (94) = happyShift action_39
action_26 (95) = happyShift action_40
action_26 (96) = happyShift action_41
action_26 (9) = happyGoto action_35
action_26 (10) = happyGoto action_36
action_26 _ = happyFail

action_27 _ = happyReduce_16

action_28 _ = happyReduce_17

action_29 (85) = happyShift action_34
action_29 _ = happyFail

action_30 _ = happyReduce_121

action_31 _ = happyReduce_122

action_32 _ = happyReduce_2

action_33 _ = happyReduce_76

action_34 (69) = happyShift action_83
action_34 (70) = happyShift action_84
action_34 (71) = happyShift action_85
action_34 (72) = happyShift action_86
action_34 (73) = happyShift action_87
action_34 (91) = happyShift action_88
action_34 (94) = happyShift action_89
action_34 (12) = happyGoto action_156
action_34 (13) = happyGoto action_78
action_34 (14) = happyGoto action_79
action_34 _ = happyFail

action_35 _ = happyReduce_15

action_36 (100) = happyShift action_155
action_36 _ = happyReduce_19

action_37 (95) = happyShift action_153
action_37 (96) = happyShift action_154
action_37 _ = happyFail

action_38 _ = happyReduce_26

action_39 _ = happyReduce_25

action_40 _ = happyReduce_22

action_41 _ = happyReduce_21

action_42 _ = happyReduce_14

action_43 (100) = happyShift action_152
action_43 _ = happyReduce_117

action_44 _ = happyReduce_120

action_45 _ = happyReduce_119

action_46 (101) = happyShift action_151
action_46 _ = happyFail

action_47 _ = happyReduce_73

action_48 _ = happyReduce_3

action_49 (43) = happyReduce_67
action_49 (44) = happyReduce_67
action_49 (50) = happyReduce_67
action_49 (78) = happyReduce_67
action_49 (79) = happyReduce_67
action_49 (85) = happyReduce_67
action_49 (86) = happyReduce_67
action_49 (87) = happyReduce_67
action_49 (88) = happyReduce_67
action_49 (89) = happyReduce_67
action_49 (90) = happyReduce_67
action_49 (97) = happyReduce_67
action_49 (98) = happyReduce_67
action_49 (99) = happyReduce_67
action_49 (100) = happyReduce_67
action_49 (102) = happyReduce_67
action_49 (103) = happyReduce_67
action_49 _ = happyReduce_67

action_50 (44) = happyShift action_149
action_50 (50) = happyShift action_150
action_50 (78) = happyShift action_107
action_50 (79) = happyShift action_108
action_50 (17) = happyGoto action_106
action_50 _ = happyFail

action_51 (80) = happyShift action_147
action_51 (81) = happyShift action_148
action_51 (18) = happyGoto action_146
action_51 _ = happyReduce_56

action_52 _ = happyReduce_64

action_53 _ = happyReduce_65

action_54 _ = happyReduce_69

action_55 _ = happyReduce_68

action_56 (101) = happyShift action_145
action_56 _ = happyFail

action_57 (101) = happyShift action_144
action_57 _ = happyFail

action_58 (101) = happyShift action_143
action_58 _ = happyFail

action_59 (101) = happyShift action_142
action_59 _ = happyFail

action_60 (101) = happyShift action_141
action_60 _ = happyFail

action_61 (101) = happyShift action_140
action_61 _ = happyFail

action_62 (101) = happyShift action_139
action_62 _ = happyFail

action_63 (101) = happyShift action_138
action_63 _ = happyFail

action_64 (101) = happyShift action_137
action_64 _ = happyFail

action_65 (101) = happyShift action_136
action_65 _ = happyFail

action_66 (101) = happyShift action_135
action_66 _ = happyFail

action_67 (101) = happyShift action_134
action_67 _ = happyFail

action_68 (101) = happyShift action_133
action_68 _ = happyFail

action_69 (101) = happyShift action_132
action_69 _ = happyFail

action_70 (101) = happyShift action_131
action_70 _ = happyFail

action_71 (53) = happyShift action_56
action_71 (54) = happyShift action_57
action_71 (55) = happyShift action_58
action_71 (56) = happyShift action_59
action_71 (57) = happyShift action_60
action_71 (58) = happyShift action_61
action_71 (59) = happyShift action_62
action_71 (60) = happyShift action_63
action_71 (61) = happyShift action_64
action_71 (62) = happyShift action_65
action_71 (63) = happyShift action_66
action_71 (64) = happyShift action_67
action_71 (65) = happyShift action_68
action_71 (66) = happyShift action_69
action_71 (68) = happyShift action_70
action_71 (79) = happyShift action_71
action_71 (92) = happyShift action_30
action_71 (93) = happyShift action_31
action_71 (95) = happyShift action_72
action_71 (96) = happyShift action_73
action_71 (101) = happyShift action_74
action_71 (15) = happyGoto action_49
action_71 (16) = happyGoto action_130
action_71 (19) = happyGoto action_51
action_71 (20) = happyGoto action_52
action_71 (21) = happyGoto action_53
action_71 (31) = happyGoto action_54
action_71 (38) = happyGoto action_55
action_71 _ = happyFail

action_72 _ = happyReduce_104

action_73 _ = happyReduce_103

action_74 (53) = happyShift action_56
action_74 (54) = happyShift action_57
action_74 (55) = happyShift action_58
action_74 (56) = happyShift action_59
action_74 (57) = happyShift action_60
action_74 (58) = happyShift action_61
action_74 (59) = happyShift action_62
action_74 (60) = happyShift action_63
action_74 (61) = happyShift action_64
action_74 (62) = happyShift action_65
action_74 (63) = happyShift action_66
action_74 (64) = happyShift action_67
action_74 (65) = happyShift action_68
action_74 (66) = happyShift action_69
action_74 (68) = happyShift action_70
action_74 (79) = happyShift action_71
action_74 (92) = happyShift action_30
action_74 (93) = happyShift action_31
action_74 (95) = happyShift action_72
action_74 (96) = happyShift action_73
action_74 (101) = happyShift action_74
action_74 (15) = happyGoto action_49
action_74 (16) = happyGoto action_129
action_74 (19) = happyGoto action_51
action_74 (20) = happyGoto action_52
action_74 (21) = happyGoto action_53
action_74 (31) = happyGoto action_54
action_74 (38) = happyGoto action_55
action_74 _ = happyFail

action_75 (85) = happyShift action_128
action_75 _ = happyFail

action_76 _ = happyReduce_74

action_77 (85) = happyShift action_120
action_77 (86) = happyShift action_121
action_77 (87) = happyShift action_122
action_77 (88) = happyShift action_123
action_77 (89) = happyShift action_124
action_77 (90) = happyShift action_125
action_77 (30) = happyGoto action_127
action_77 _ = happyFail

action_78 _ = happyReduce_38

action_79 (78) = happyShift action_126
action_79 _ = happyReduce_29

action_80 (78) = happyShift action_107
action_80 (79) = happyShift action_108
action_80 (85) = happyShift action_120
action_80 (86) = happyShift action_121
action_80 (87) = happyShift action_122
action_80 (88) = happyShift action_123
action_80 (89) = happyShift action_124
action_80 (90) = happyShift action_125
action_80 (17) = happyGoto action_106
action_80 (30) = happyGoto action_119
action_80 _ = happyFail

action_81 (43) = happyShift action_117
action_81 (44) = happyShift action_118
action_81 (26) = happyGoto action_116
action_81 _ = happyFail

action_82 _ = happyReduce_90

action_83 (101) = happyShift action_115
action_83 _ = happyFail

action_84 (101) = happyShift action_114
action_84 _ = happyFail

action_85 (101) = happyShift action_113
action_85 _ = happyFail

action_86 (101) = happyShift action_112
action_86 _ = happyFail

action_87 (101) = happyShift action_111
action_87 _ = happyFail

action_88 _ = happyReduce_37

action_89 _ = happyReduce_36

action_90 (53) = happyShift action_56
action_90 (54) = happyShift action_57
action_90 (55) = happyShift action_58
action_90 (56) = happyShift action_59
action_90 (57) = happyShift action_60
action_90 (58) = happyShift action_61
action_90 (59) = happyShift action_62
action_90 (60) = happyShift action_63
action_90 (61) = happyShift action_64
action_90 (62) = happyShift action_65
action_90 (63) = happyShift action_66
action_90 (64) = happyShift action_67
action_90 (65) = happyShift action_68
action_90 (66) = happyShift action_69
action_90 (68) = happyShift action_70
action_90 (69) = happyShift action_83
action_90 (70) = happyShift action_84
action_90 (71) = happyShift action_85
action_90 (72) = happyShift action_86
action_90 (73) = happyShift action_87
action_90 (79) = happyShift action_71
action_90 (91) = happyShift action_88
action_90 (92) = happyShift action_30
action_90 (93) = happyShift action_31
action_90 (94) = happyShift action_89
action_90 (95) = happyShift action_72
action_90 (96) = happyShift action_73
action_90 (101) = happyShift action_90
action_90 (12) = happyGoto action_77
action_90 (13) = happyGoto action_78
action_90 (14) = happyGoto action_79
action_90 (15) = happyGoto action_49
action_90 (16) = happyGoto action_109
action_90 (19) = happyGoto action_51
action_90 (20) = happyGoto action_52
action_90 (21) = happyGoto action_53
action_90 (27) = happyGoto action_110
action_90 (29) = happyGoto action_82
action_90 (31) = happyGoto action_54
action_90 (38) = happyGoto action_55
action_90 _ = happyFail

action_91 _ = happyReduce_108

action_92 _ = happyReduce_112

action_93 (78) = happyShift action_107
action_93 (79) = happyShift action_108
action_93 (17) = happyGoto action_106
action_93 _ = happyReduce_113

action_94 _ = happyReduce_105

action_95 (98) = happyShift action_105
action_95 _ = happyReduce_109

action_96 _ = happyReduce_107

action_97 _ = happyReduce_116

action_98 (91) = happyShift action_45
action_98 (92) = happyShift action_30
action_98 (93) = happyShift action_31
action_98 (98) = happyShift action_104
action_98 (36) = happyGoto action_103
action_98 (37) = happyGoto action_43
action_98 (38) = happyGoto action_44
action_98 _ = happyFail

action_99 (53) = happyShift action_56
action_99 (54) = happyShift action_57
action_99 (55) = happyShift action_58
action_99 (56) = happyShift action_59
action_99 (57) = happyShift action_60
action_99 (58) = happyShift action_61
action_99 (59) = happyShift action_62
action_99 (60) = happyShift action_63
action_99 (61) = happyShift action_64
action_99 (62) = happyShift action_65
action_99 (63) = happyShift action_66
action_99 (64) = happyShift action_67
action_99 (65) = happyShift action_68
action_99 (66) = happyShift action_69
action_99 (68) = happyShift action_70
action_99 (79) = happyShift action_71
action_99 (92) = happyShift action_30
action_99 (93) = happyShift action_31
action_99 (95) = happyShift action_72
action_99 (96) = happyShift action_73
action_99 (101) = happyShift action_74
action_99 (15) = happyGoto action_49
action_99 (16) = happyGoto action_102
action_99 (19) = happyGoto action_51
action_99 (20) = happyGoto action_52
action_99 (21) = happyGoto action_53
action_99 (31) = happyGoto action_54
action_99 (38) = happyGoto action_55
action_99 _ = happyFail

action_100 (39) = happyShift action_13
action_100 (40) = happyShift action_14
action_100 (41) = happyShift action_15
action_100 (42) = happyShift action_16
action_100 (44) = happyShift action_17
action_100 (45) = happyShift action_18
action_100 (47) = happyShift action_19
action_100 (50) = happyShift action_21
action_100 (51) = happyShift action_33
action_100 (52) = happyShift action_23
action_100 (67) = happyShift action_24
action_100 (74) = happyShift action_25
action_100 (75) = happyShift action_26
action_100 (76) = happyShift action_27
action_100 (77) = happyShift action_28
action_100 (91) = happyShift action_29
action_100 (92) = happyShift action_30
action_100 (93) = happyShift action_31
action_100 (6) = happyGoto action_101
action_100 (8) = happyGoto action_8
action_100 (11) = happyGoto action_9
action_100 (22) = happyGoto action_10
action_100 (32) = happyGoto action_11
action_100 (38) = happyGoto action_12
action_100 _ = happyFail

action_101 _ = happyReduce_8

action_102 (78) = happyShift action_107
action_102 (79) = happyShift action_108
action_102 (17) = happyGoto action_106
action_102 _ = happyReduce_27

action_103 _ = happyReduce_115

action_104 (91) = happyShift action_45
action_104 (92) = happyShift action_30
action_104 (93) = happyShift action_31
action_104 (36) = happyGoto action_197
action_104 (37) = happyGoto action_43
action_104 (38) = happyGoto action_44
action_104 _ = happyFail

action_105 (53) = happyShift action_56
action_105 (54) = happyShift action_57
action_105 (55) = happyShift action_58
action_105 (56) = happyShift action_59
action_105 (57) = happyShift action_60
action_105 (58) = happyShift action_61
action_105 (59) = happyShift action_62
action_105 (60) = happyShift action_63
action_105 (61) = happyShift action_64
action_105 (62) = happyShift action_65
action_105 (63) = happyShift action_66
action_105 (64) = happyShift action_67
action_105 (65) = happyShift action_68
action_105 (66) = happyShift action_69
action_105 (68) = happyShift action_70
action_105 (69) = happyShift action_83
action_105 (70) = happyShift action_84
action_105 (71) = happyShift action_85
action_105 (72) = happyShift action_86
action_105 (73) = happyShift action_87
action_105 (79) = happyShift action_71
action_105 (91) = happyShift action_88
action_105 (92) = happyShift action_30
action_105 (93) = happyShift action_31
action_105 (94) = happyShift action_89
action_105 (95) = happyShift action_72
action_105 (96) = happyShift action_73
action_105 (101) = happyShift action_74
action_105 (12) = happyGoto action_92
action_105 (13) = happyGoto action_78
action_105 (14) = happyGoto action_79
action_105 (15) = happyGoto action_49
action_105 (16) = happyGoto action_93
action_105 (19) = happyGoto action_51
action_105 (20) = happyGoto action_52
action_105 (21) = happyGoto action_53
action_105 (31) = happyGoto action_54
action_105 (33) = happyGoto action_196
action_105 (34) = happyGoto action_95
action_105 (38) = happyGoto action_55
action_105 _ = happyReduce_110

action_106 (53) = happyShift action_56
action_106 (54) = happyShift action_57
action_106 (55) = happyShift action_58
action_106 (56) = happyShift action_59
action_106 (57) = happyShift action_60
action_106 (58) = happyShift action_61
action_106 (59) = happyShift action_62
action_106 (60) = happyShift action_63
action_106 (61) = happyShift action_64
action_106 (62) = happyShift action_65
action_106 (63) = happyShift action_66
action_106 (64) = happyShift action_67
action_106 (65) = happyShift action_68
action_106 (66) = happyShift action_69
action_106 (68) = happyShift action_70
action_106 (92) = happyShift action_30
action_106 (93) = happyShift action_31
action_106 (95) = happyShift action_72
action_106 (96) = happyShift action_73
action_106 (101) = happyShift action_74
action_106 (15) = happyGoto action_163
action_106 (19) = happyGoto action_195
action_106 (20) = happyGoto action_52
action_106 (21) = happyGoto action_53
action_106 (31) = happyGoto action_54
action_106 (38) = happyGoto action_55
action_106 _ = happyFail

action_107 _ = happyReduce_59

action_108 _ = happyReduce_60

action_109 (78) = happyShift action_107
action_109 (79) = happyShift action_108
action_109 (85) = happyShift action_120
action_109 (86) = happyShift action_121
action_109 (87) = happyShift action_122
action_109 (88) = happyShift action_123
action_109 (89) = happyShift action_124
action_109 (90) = happyShift action_125
action_109 (102) = happyShift action_181
action_109 (17) = happyGoto action_106
action_109 (30) = happyGoto action_119
action_109 _ = happyFail

action_110 (102) = happyShift action_194
action_110 _ = happyFail

action_111 (69) = happyShift action_83
action_111 (70) = happyShift action_84
action_111 (71) = happyShift action_85
action_111 (72) = happyShift action_86
action_111 (73) = happyShift action_87
action_111 (91) = happyShift action_88
action_111 (94) = happyShift action_89
action_111 (12) = happyGoto action_193
action_111 (13) = happyGoto action_78
action_111 (14) = happyGoto action_79
action_111 _ = happyFail

action_112 (69) = happyShift action_83
action_112 (70) = happyShift action_84
action_112 (71) = happyShift action_85
action_112 (72) = happyShift action_86
action_112 (73) = happyShift action_87
action_112 (91) = happyShift action_88
action_112 (94) = happyShift action_89
action_112 (12) = happyGoto action_192
action_112 (13) = happyGoto action_78
action_112 (14) = happyGoto action_79
action_112 _ = happyFail

action_113 (69) = happyShift action_83
action_113 (70) = happyShift action_84
action_113 (71) = happyShift action_85
action_113 (72) = happyShift action_86
action_113 (73) = happyShift action_87
action_113 (91) = happyShift action_88
action_113 (94) = happyShift action_89
action_113 (12) = happyGoto action_191
action_113 (13) = happyGoto action_78
action_113 (14) = happyGoto action_79
action_113 _ = happyFail

action_114 (53) = happyShift action_56
action_114 (54) = happyShift action_57
action_114 (55) = happyShift action_58
action_114 (56) = happyShift action_59
action_114 (57) = happyShift action_60
action_114 (58) = happyShift action_61
action_114 (59) = happyShift action_62
action_114 (60) = happyShift action_63
action_114 (61) = happyShift action_64
action_114 (62) = happyShift action_65
action_114 (63) = happyShift action_66
action_114 (64) = happyShift action_67
action_114 (65) = happyShift action_68
action_114 (66) = happyShift action_69
action_114 (68) = happyShift action_70
action_114 (79) = happyShift action_71
action_114 (92) = happyShift action_30
action_114 (93) = happyShift action_31
action_114 (95) = happyShift action_72
action_114 (96) = happyShift action_73
action_114 (101) = happyShift action_74
action_114 (15) = happyGoto action_49
action_114 (16) = happyGoto action_190
action_114 (19) = happyGoto action_51
action_114 (20) = happyGoto action_52
action_114 (21) = happyGoto action_53
action_114 (31) = happyGoto action_54
action_114 (38) = happyGoto action_55
action_114 _ = happyFail

action_115 (53) = happyShift action_56
action_115 (54) = happyShift action_57
action_115 (55) = happyShift action_58
action_115 (56) = happyShift action_59
action_115 (57) = happyShift action_60
action_115 (58) = happyShift action_61
action_115 (59) = happyShift action_62
action_115 (60) = happyShift action_63
action_115 (61) = happyShift action_64
action_115 (62) = happyShift action_65
action_115 (63) = happyShift action_66
action_115 (64) = happyShift action_67
action_115 (65) = happyShift action_68
action_115 (66) = happyShift action_69
action_115 (68) = happyShift action_70
action_115 (79) = happyShift action_71
action_115 (92) = happyShift action_30
action_115 (93) = happyShift action_31
action_115 (95) = happyShift action_72
action_115 (96) = happyShift action_73
action_115 (101) = happyShift action_74
action_115 (15) = happyGoto action_49
action_115 (16) = happyGoto action_189
action_115 (19) = happyGoto action_51
action_115 (20) = happyGoto action_52
action_115 (21) = happyGoto action_53
action_115 (31) = happyGoto action_54
action_115 (38) = happyGoto action_55
action_115 _ = happyFail

action_116 _ = happyReduce_70

action_117 (39) = happyShift action_13
action_117 (40) = happyShift action_14
action_117 (41) = happyShift action_15
action_117 (42) = happyShift action_16
action_117 (44) = happyShift action_17
action_117 (45) = happyShift action_18
action_117 (47) = happyShift action_19
action_117 (50) = happyShift action_21
action_117 (51) = happyShift action_33
action_117 (52) = happyShift action_23
action_117 (67) = happyShift action_24
action_117 (74) = happyShift action_25
action_117 (75) = happyShift action_26
action_117 (76) = happyShift action_27
action_117 (77) = happyShift action_28
action_117 (91) = happyShift action_29
action_117 (92) = happyShift action_30
action_117 (93) = happyShift action_31
action_117 (96) = happyShift action_188
action_117 (6) = happyGoto action_187
action_117 (8) = happyGoto action_8
action_117 (11) = happyGoto action_9
action_117 (22) = happyGoto action_10
action_117 (32) = happyGoto action_11
action_117 (38) = happyGoto action_12
action_117 _ = happyFail

action_118 (96) = happyShift action_186
action_118 _ = happyFail

action_119 (53) = happyShift action_56
action_119 (54) = happyShift action_57
action_119 (55) = happyShift action_58
action_119 (56) = happyShift action_59
action_119 (57) = happyShift action_60
action_119 (58) = happyShift action_61
action_119 (59) = happyShift action_62
action_119 (60) = happyShift action_63
action_119 (61) = happyShift action_64
action_119 (62) = happyShift action_65
action_119 (63) = happyShift action_66
action_119 (64) = happyShift action_67
action_119 (65) = happyShift action_68
action_119 (66) = happyShift action_69
action_119 (68) = happyShift action_70
action_119 (79) = happyShift action_71
action_119 (92) = happyShift action_30
action_119 (93) = happyShift action_31
action_119 (95) = happyShift action_72
action_119 (96) = happyShift action_73
action_119 (101) = happyShift action_74
action_119 (15) = happyGoto action_49
action_119 (16) = happyGoto action_185
action_119 (19) = happyGoto action_51
action_119 (20) = happyGoto action_52
action_119 (21) = happyGoto action_53
action_119 (31) = happyGoto action_54
action_119 (38) = happyGoto action_55
action_119 _ = happyFail

action_120 _ = happyReduce_97

action_121 _ = happyReduce_100

action_122 _ = happyReduce_98

action_123 _ = happyReduce_99

action_124 _ = happyReduce_101

action_125 _ = happyReduce_102

action_126 (69) = happyShift action_83
action_126 (70) = happyShift action_84
action_126 (71) = happyShift action_85
action_126 (72) = happyShift action_86
action_126 (73) = happyShift action_87
action_126 (91) = happyShift action_88
action_126 (94) = happyShift action_89
action_126 (13) = happyGoto action_78
action_126 (14) = happyGoto action_184
action_126 _ = happyFail

action_127 (69) = happyShift action_83
action_127 (70) = happyShift action_84
action_127 (71) = happyShift action_85
action_127 (72) = happyShift action_86
action_127 (73) = happyShift action_87
action_127 (91) = happyShift action_88
action_127 (94) = happyShift action_89
action_127 (12) = happyGoto action_183
action_127 (13) = happyGoto action_78
action_127 (14) = happyGoto action_79
action_127 _ = happyFail

action_128 (92) = happyShift action_30
action_128 (93) = happyShift action_31
action_128 (95) = happyShift action_72
action_128 (96) = happyShift action_73
action_128 (21) = happyGoto action_182
action_128 (31) = happyGoto action_54
action_128 (38) = happyGoto action_55
action_128 _ = happyFail

action_129 (78) = happyShift action_107
action_129 (79) = happyShift action_108
action_129 (102) = happyShift action_181
action_129 (17) = happyGoto action_106
action_129 _ = happyFail

action_130 (78) = happyShift action_107
action_130 (79) = happyShift action_108
action_130 (17) = happyGoto action_106
action_130 _ = happyReduce_58

action_131 (53) = happyShift action_56
action_131 (54) = happyShift action_57
action_131 (55) = happyShift action_58
action_131 (56) = happyShift action_59
action_131 (57) = happyShift action_60
action_131 (58) = happyShift action_61
action_131 (59) = happyShift action_62
action_131 (60) = happyShift action_63
action_131 (61) = happyShift action_64
action_131 (62) = happyShift action_65
action_131 (63) = happyShift action_66
action_131 (64) = happyShift action_67
action_131 (65) = happyShift action_68
action_131 (66) = happyShift action_69
action_131 (68) = happyShift action_70
action_131 (79) = happyShift action_71
action_131 (92) = happyShift action_30
action_131 (93) = happyShift action_31
action_131 (95) = happyShift action_72
action_131 (96) = happyShift action_73
action_131 (101) = happyShift action_74
action_131 (15) = happyGoto action_49
action_131 (16) = happyGoto action_180
action_131 (19) = happyGoto action_51
action_131 (20) = happyGoto action_52
action_131 (21) = happyGoto action_53
action_131 (31) = happyGoto action_54
action_131 (38) = happyGoto action_55
action_131 _ = happyFail

action_132 (53) = happyShift action_56
action_132 (54) = happyShift action_57
action_132 (55) = happyShift action_58
action_132 (56) = happyShift action_59
action_132 (57) = happyShift action_60
action_132 (58) = happyShift action_61
action_132 (59) = happyShift action_62
action_132 (60) = happyShift action_63
action_132 (61) = happyShift action_64
action_132 (62) = happyShift action_65
action_132 (63) = happyShift action_66
action_132 (64) = happyShift action_67
action_132 (65) = happyShift action_68
action_132 (66) = happyShift action_69
action_132 (68) = happyShift action_70
action_132 (79) = happyShift action_71
action_132 (92) = happyShift action_30
action_132 (93) = happyShift action_31
action_132 (95) = happyShift action_72
action_132 (96) = happyShift action_73
action_132 (101) = happyShift action_74
action_132 (15) = happyGoto action_49
action_132 (16) = happyGoto action_179
action_132 (19) = happyGoto action_51
action_132 (20) = happyGoto action_52
action_132 (21) = happyGoto action_53
action_132 (31) = happyGoto action_54
action_132 (38) = happyGoto action_55
action_132 _ = happyFail

action_133 (53) = happyShift action_56
action_133 (54) = happyShift action_57
action_133 (55) = happyShift action_58
action_133 (56) = happyShift action_59
action_133 (57) = happyShift action_60
action_133 (58) = happyShift action_61
action_133 (59) = happyShift action_62
action_133 (60) = happyShift action_63
action_133 (61) = happyShift action_64
action_133 (62) = happyShift action_65
action_133 (63) = happyShift action_66
action_133 (64) = happyShift action_67
action_133 (65) = happyShift action_68
action_133 (66) = happyShift action_69
action_133 (68) = happyShift action_70
action_133 (79) = happyShift action_71
action_133 (92) = happyShift action_30
action_133 (93) = happyShift action_31
action_133 (95) = happyShift action_72
action_133 (96) = happyShift action_73
action_133 (101) = happyShift action_74
action_133 (15) = happyGoto action_49
action_133 (16) = happyGoto action_178
action_133 (19) = happyGoto action_51
action_133 (20) = happyGoto action_52
action_133 (21) = happyGoto action_53
action_133 (31) = happyGoto action_54
action_133 (38) = happyGoto action_55
action_133 _ = happyFail

action_134 (53) = happyShift action_56
action_134 (54) = happyShift action_57
action_134 (55) = happyShift action_58
action_134 (56) = happyShift action_59
action_134 (57) = happyShift action_60
action_134 (58) = happyShift action_61
action_134 (59) = happyShift action_62
action_134 (60) = happyShift action_63
action_134 (61) = happyShift action_64
action_134 (62) = happyShift action_65
action_134 (63) = happyShift action_66
action_134 (64) = happyShift action_67
action_134 (65) = happyShift action_68
action_134 (66) = happyShift action_69
action_134 (68) = happyShift action_70
action_134 (79) = happyShift action_71
action_134 (92) = happyShift action_30
action_134 (93) = happyShift action_31
action_134 (95) = happyShift action_72
action_134 (96) = happyShift action_73
action_134 (101) = happyShift action_74
action_134 (15) = happyGoto action_49
action_134 (16) = happyGoto action_177
action_134 (19) = happyGoto action_51
action_134 (20) = happyGoto action_52
action_134 (21) = happyGoto action_53
action_134 (31) = happyGoto action_54
action_134 (38) = happyGoto action_55
action_134 _ = happyFail

action_135 (53) = happyShift action_56
action_135 (54) = happyShift action_57
action_135 (55) = happyShift action_58
action_135 (56) = happyShift action_59
action_135 (57) = happyShift action_60
action_135 (58) = happyShift action_61
action_135 (59) = happyShift action_62
action_135 (60) = happyShift action_63
action_135 (61) = happyShift action_64
action_135 (62) = happyShift action_65
action_135 (63) = happyShift action_66
action_135 (64) = happyShift action_67
action_135 (65) = happyShift action_68
action_135 (66) = happyShift action_69
action_135 (68) = happyShift action_70
action_135 (79) = happyShift action_71
action_135 (92) = happyShift action_30
action_135 (93) = happyShift action_31
action_135 (95) = happyShift action_72
action_135 (96) = happyShift action_73
action_135 (101) = happyShift action_74
action_135 (15) = happyGoto action_49
action_135 (16) = happyGoto action_176
action_135 (19) = happyGoto action_51
action_135 (20) = happyGoto action_52
action_135 (21) = happyGoto action_53
action_135 (31) = happyGoto action_54
action_135 (38) = happyGoto action_55
action_135 _ = happyFail

action_136 (69) = happyShift action_83
action_136 (70) = happyShift action_84
action_136 (71) = happyShift action_85
action_136 (72) = happyShift action_86
action_136 (73) = happyShift action_87
action_136 (91) = happyShift action_88
action_136 (94) = happyShift action_89
action_136 (12) = happyGoto action_175
action_136 (13) = happyGoto action_78
action_136 (14) = happyGoto action_79
action_136 _ = happyFail

action_137 (53) = happyShift action_56
action_137 (54) = happyShift action_57
action_137 (55) = happyShift action_58
action_137 (56) = happyShift action_59
action_137 (57) = happyShift action_60
action_137 (58) = happyShift action_61
action_137 (59) = happyShift action_62
action_137 (60) = happyShift action_63
action_137 (61) = happyShift action_64
action_137 (62) = happyShift action_65
action_137 (63) = happyShift action_66
action_137 (64) = happyShift action_67
action_137 (65) = happyShift action_68
action_137 (66) = happyShift action_69
action_137 (68) = happyShift action_70
action_137 (79) = happyShift action_71
action_137 (92) = happyShift action_30
action_137 (93) = happyShift action_31
action_137 (95) = happyShift action_72
action_137 (96) = happyShift action_73
action_137 (101) = happyShift action_74
action_137 (15) = happyGoto action_49
action_137 (16) = happyGoto action_174
action_137 (19) = happyGoto action_51
action_137 (20) = happyGoto action_52
action_137 (21) = happyGoto action_53
action_137 (31) = happyGoto action_54
action_137 (38) = happyGoto action_55
action_137 _ = happyFail

action_138 (53) = happyShift action_56
action_138 (54) = happyShift action_57
action_138 (55) = happyShift action_58
action_138 (56) = happyShift action_59
action_138 (57) = happyShift action_60
action_138 (58) = happyShift action_61
action_138 (59) = happyShift action_62
action_138 (60) = happyShift action_63
action_138 (61) = happyShift action_64
action_138 (62) = happyShift action_65
action_138 (63) = happyShift action_66
action_138 (64) = happyShift action_67
action_138 (65) = happyShift action_68
action_138 (66) = happyShift action_69
action_138 (68) = happyShift action_70
action_138 (79) = happyShift action_71
action_138 (92) = happyShift action_30
action_138 (93) = happyShift action_31
action_138 (95) = happyShift action_72
action_138 (96) = happyShift action_73
action_138 (101) = happyShift action_74
action_138 (15) = happyGoto action_49
action_138 (16) = happyGoto action_173
action_138 (19) = happyGoto action_51
action_138 (20) = happyGoto action_52
action_138 (21) = happyGoto action_53
action_138 (31) = happyGoto action_54
action_138 (38) = happyGoto action_55
action_138 _ = happyFail

action_139 (53) = happyShift action_56
action_139 (54) = happyShift action_57
action_139 (55) = happyShift action_58
action_139 (56) = happyShift action_59
action_139 (57) = happyShift action_60
action_139 (58) = happyShift action_61
action_139 (59) = happyShift action_62
action_139 (60) = happyShift action_63
action_139 (61) = happyShift action_64
action_139 (62) = happyShift action_65
action_139 (63) = happyShift action_66
action_139 (64) = happyShift action_67
action_139 (65) = happyShift action_68
action_139 (66) = happyShift action_69
action_139 (68) = happyShift action_70
action_139 (79) = happyShift action_71
action_139 (92) = happyShift action_30
action_139 (93) = happyShift action_31
action_139 (95) = happyShift action_72
action_139 (96) = happyShift action_73
action_139 (101) = happyShift action_74
action_139 (15) = happyGoto action_49
action_139 (16) = happyGoto action_172
action_139 (19) = happyGoto action_51
action_139 (20) = happyGoto action_52
action_139 (21) = happyGoto action_53
action_139 (31) = happyGoto action_54
action_139 (38) = happyGoto action_55
action_139 _ = happyFail

action_140 (53) = happyShift action_56
action_140 (54) = happyShift action_57
action_140 (55) = happyShift action_58
action_140 (56) = happyShift action_59
action_140 (57) = happyShift action_60
action_140 (58) = happyShift action_61
action_140 (59) = happyShift action_62
action_140 (60) = happyShift action_63
action_140 (61) = happyShift action_64
action_140 (62) = happyShift action_65
action_140 (63) = happyShift action_66
action_140 (64) = happyShift action_67
action_140 (65) = happyShift action_68
action_140 (66) = happyShift action_69
action_140 (68) = happyShift action_70
action_140 (79) = happyShift action_71
action_140 (92) = happyShift action_30
action_140 (93) = happyShift action_31
action_140 (95) = happyShift action_72
action_140 (96) = happyShift action_73
action_140 (101) = happyShift action_74
action_140 (15) = happyGoto action_49
action_140 (16) = happyGoto action_171
action_140 (19) = happyGoto action_51
action_140 (20) = happyGoto action_52
action_140 (21) = happyGoto action_53
action_140 (31) = happyGoto action_54
action_140 (38) = happyGoto action_55
action_140 _ = happyFail

action_141 (69) = happyShift action_83
action_141 (70) = happyShift action_84
action_141 (71) = happyShift action_85
action_141 (72) = happyShift action_86
action_141 (73) = happyShift action_87
action_141 (91) = happyShift action_88
action_141 (94) = happyShift action_89
action_141 (12) = happyGoto action_170
action_141 (13) = happyGoto action_78
action_141 (14) = happyGoto action_79
action_141 _ = happyFail

action_142 (53) = happyShift action_56
action_142 (54) = happyShift action_57
action_142 (55) = happyShift action_58
action_142 (56) = happyShift action_59
action_142 (57) = happyShift action_60
action_142 (58) = happyShift action_61
action_142 (59) = happyShift action_62
action_142 (60) = happyShift action_63
action_142 (61) = happyShift action_64
action_142 (62) = happyShift action_65
action_142 (63) = happyShift action_66
action_142 (64) = happyShift action_67
action_142 (65) = happyShift action_68
action_142 (66) = happyShift action_69
action_142 (68) = happyShift action_70
action_142 (79) = happyShift action_71
action_142 (92) = happyShift action_30
action_142 (93) = happyShift action_31
action_142 (95) = happyShift action_72
action_142 (96) = happyShift action_73
action_142 (101) = happyShift action_74
action_142 (15) = happyGoto action_49
action_142 (16) = happyGoto action_169
action_142 (19) = happyGoto action_51
action_142 (20) = happyGoto action_52
action_142 (21) = happyGoto action_53
action_142 (31) = happyGoto action_54
action_142 (38) = happyGoto action_55
action_142 _ = happyFail

action_143 (53) = happyShift action_56
action_143 (54) = happyShift action_57
action_143 (55) = happyShift action_58
action_143 (56) = happyShift action_59
action_143 (57) = happyShift action_60
action_143 (58) = happyShift action_61
action_143 (59) = happyShift action_62
action_143 (60) = happyShift action_63
action_143 (61) = happyShift action_64
action_143 (62) = happyShift action_65
action_143 (63) = happyShift action_66
action_143 (64) = happyShift action_67
action_143 (65) = happyShift action_68
action_143 (66) = happyShift action_69
action_143 (68) = happyShift action_70
action_143 (79) = happyShift action_71
action_143 (92) = happyShift action_30
action_143 (93) = happyShift action_31
action_143 (95) = happyShift action_72
action_143 (96) = happyShift action_73
action_143 (101) = happyShift action_74
action_143 (15) = happyGoto action_49
action_143 (16) = happyGoto action_168
action_143 (19) = happyGoto action_51
action_143 (20) = happyGoto action_52
action_143 (21) = happyGoto action_53
action_143 (31) = happyGoto action_54
action_143 (38) = happyGoto action_55
action_143 _ = happyFail

action_144 (91) = happyShift action_166
action_144 (94) = happyShift action_167
action_144 _ = happyFail

action_145 (96) = happyShift action_165
action_145 _ = happyFail

action_146 (53) = happyShift action_56
action_146 (54) = happyShift action_57
action_146 (55) = happyShift action_58
action_146 (56) = happyShift action_59
action_146 (57) = happyShift action_60
action_146 (58) = happyShift action_61
action_146 (59) = happyShift action_62
action_146 (60) = happyShift action_63
action_146 (61) = happyShift action_64
action_146 (62) = happyShift action_65
action_146 (63) = happyShift action_66
action_146 (64) = happyShift action_67
action_146 (65) = happyShift action_68
action_146 (66) = happyShift action_69
action_146 (68) = happyShift action_70
action_146 (92) = happyShift action_30
action_146 (93) = happyShift action_31
action_146 (95) = happyShift action_72
action_146 (96) = happyShift action_73
action_146 (101) = happyShift action_74
action_146 (15) = happyGoto action_163
action_146 (20) = happyGoto action_164
action_146 (21) = happyGoto action_53
action_146 (31) = happyGoto action_54
action_146 (38) = happyGoto action_55
action_146 _ = happyFail

action_147 _ = happyReduce_61

action_148 _ = happyReduce_62

action_149 (96) = happyShift action_161
action_149 (23) = happyGoto action_162
action_149 _ = happyFail

action_150 (96) = happyShift action_161
action_150 (23) = happyGoto action_160
action_150 _ = happyFail

action_151 (93) = happyShift action_159
action_151 _ = happyFail

action_152 (91) = happyShift action_45
action_152 (92) = happyShift action_30
action_152 (93) = happyShift action_31
action_152 (36) = happyGoto action_158
action_152 (37) = happyGoto action_43
action_152 (38) = happyGoto action_44
action_152 _ = happyFail

action_153 _ = happyReduce_24

action_154 _ = happyReduce_23

action_155 (79) = happyShift action_37
action_155 (93) = happyShift action_38
action_155 (94) = happyShift action_39
action_155 (95) = happyShift action_40
action_155 (96) = happyShift action_41
action_155 (9) = happyGoto action_157
action_155 (10) = happyGoto action_36
action_155 _ = happyFail

action_156 _ = happyReduce_28

action_157 _ = happyReduce_20

action_158 _ = happyReduce_118

action_159 (102) = happyShift action_225
action_159 _ = happyFail

action_160 _ = happyReduce_78

action_161 (100) = happyShift action_224
action_161 _ = happyReduce_79

action_162 _ = happyReduce_77

action_163 _ = happyReduce_67

action_164 _ = happyReduce_63

action_165 (102) = happyShift action_223
action_165 _ = happyFail

action_166 (102) = happyShift action_222
action_166 _ = happyFail

action_167 (102) = happyShift action_221
action_167 _ = happyFail

action_168 (78) = happyShift action_107
action_168 (79) = happyShift action_108
action_168 (102) = happyShift action_220
action_168 (17) = happyGoto action_106
action_168 _ = happyFail

action_169 (78) = happyShift action_107
action_169 (79) = happyShift action_108
action_169 (102) = happyShift action_219
action_169 (17) = happyGoto action_106
action_169 _ = happyFail

action_170 (102) = happyShift action_218
action_170 _ = happyFail

action_171 (78) = happyShift action_107
action_171 (79) = happyShift action_108
action_171 (102) = happyShift action_217
action_171 (17) = happyGoto action_106
action_171 _ = happyFail

action_172 (78) = happyShift action_107
action_172 (79) = happyShift action_108
action_172 (102) = happyShift action_216
action_172 (17) = happyGoto action_106
action_172 _ = happyFail

action_173 (78) = happyShift action_107
action_173 (79) = happyShift action_108
action_173 (102) = happyShift action_215
action_173 (17) = happyGoto action_106
action_173 _ = happyFail

action_174 (78) = happyShift action_107
action_174 (79) = happyShift action_108
action_174 (102) = happyShift action_214
action_174 (17) = happyGoto action_106
action_174 _ = happyFail

action_175 (102) = happyShift action_213
action_175 _ = happyFail

action_176 (78) = happyShift action_107
action_176 (79) = happyShift action_108
action_176 (102) = happyShift action_212
action_176 (17) = happyGoto action_106
action_176 _ = happyFail

action_177 (78) = happyShift action_107
action_177 (79) = happyShift action_108
action_177 (102) = happyShift action_211
action_177 (17) = happyGoto action_106
action_177 _ = happyFail

action_178 (78) = happyShift action_107
action_178 (79) = happyShift action_108
action_178 (102) = happyShift action_210
action_178 (17) = happyGoto action_106
action_178 _ = happyFail

action_179 (78) = happyShift action_107
action_179 (79) = happyShift action_108
action_179 (102) = happyShift action_209
action_179 (17) = happyGoto action_106
action_179 _ = happyFail

action_180 (78) = happyShift action_107
action_180 (79) = happyShift action_108
action_180 (102) = happyShift action_208
action_180 (17) = happyGoto action_106
action_180 _ = happyFail

action_181 _ = happyReduce_66

action_182 (46) = happyShift action_207
action_182 _ = happyFail

action_183 _ = happyReduce_95

action_184 _ = happyReduce_30

action_185 (78) = happyShift action_107
action_185 (79) = happyShift action_108
action_185 (17) = happyGoto action_106
action_185 _ = happyReduce_96

action_186 _ = happyReduce_89

action_187 _ = happyReduce_88

action_188 _ = happyReduce_87

action_189 (78) = happyShift action_107
action_189 (79) = happyShift action_108
action_189 (102) = happyShift action_206
action_189 (17) = happyGoto action_106
action_189 _ = happyFail

action_190 (78) = happyShift action_107
action_190 (79) = happyShift action_108
action_190 (102) = happyShift action_205
action_190 (17) = happyGoto action_106
action_190 _ = happyFail

action_191 (100) = happyShift action_204
action_191 _ = happyFail

action_192 (100) = happyShift action_203
action_192 _ = happyFail

action_193 (100) = happyShift action_202
action_193 _ = happyFail

action_194 (82) = happyShift action_199
action_194 (83) = happyShift action_200
action_194 (84) = happyShift action_201
action_194 (28) = happyGoto action_198
action_194 _ = happyFail

action_195 (80) = happyShift action_147
action_195 (81) = happyShift action_148
action_195 (18) = happyGoto action_146
action_195 _ = happyReduce_55

action_196 _ = happyReduce_111

action_197 _ = happyReduce_114

action_198 (101) = happyShift action_232
action_198 _ = happyFail

action_199 _ = happyReduce_92

action_200 _ = happyReduce_93

action_201 _ = happyReduce_94

action_202 (53) = happyShift action_56
action_202 (54) = happyShift action_57
action_202 (55) = happyShift action_58
action_202 (56) = happyShift action_59
action_202 (57) = happyShift action_60
action_202 (58) = happyShift action_61
action_202 (59) = happyShift action_62
action_202 (60) = happyShift action_63
action_202 (61) = happyShift action_64
action_202 (62) = happyShift action_65
action_202 (63) = happyShift action_66
action_202 (64) = happyShift action_67
action_202 (65) = happyShift action_68
action_202 (66) = happyShift action_69
action_202 (68) = happyShift action_70
action_202 (79) = happyShift action_71
action_202 (92) = happyShift action_30
action_202 (93) = happyShift action_31
action_202 (95) = happyShift action_72
action_202 (96) = happyShift action_73
action_202 (101) = happyShift action_74
action_202 (15) = happyGoto action_49
action_202 (16) = happyGoto action_231
action_202 (19) = happyGoto action_51
action_202 (20) = happyGoto action_52
action_202 (21) = happyGoto action_53
action_202 (31) = happyGoto action_54
action_202 (38) = happyGoto action_55
action_202 _ = happyFail

action_203 (53) = happyShift action_56
action_203 (54) = happyShift action_57
action_203 (55) = happyShift action_58
action_203 (56) = happyShift action_59
action_203 (57) = happyShift action_60
action_203 (58) = happyShift action_61
action_203 (59) = happyShift action_62
action_203 (60) = happyShift action_63
action_203 (61) = happyShift action_64
action_203 (62) = happyShift action_65
action_203 (63) = happyShift action_66
action_203 (64) = happyShift action_67
action_203 (65) = happyShift action_68
action_203 (66) = happyShift action_69
action_203 (68) = happyShift action_70
action_203 (79) = happyShift action_71
action_203 (92) = happyShift action_30
action_203 (93) = happyShift action_31
action_203 (95) = happyShift action_72
action_203 (96) = happyShift action_73
action_203 (101) = happyShift action_74
action_203 (15) = happyGoto action_49
action_203 (16) = happyGoto action_230
action_203 (19) = happyGoto action_51
action_203 (20) = happyGoto action_52
action_203 (21) = happyGoto action_53
action_203 (31) = happyGoto action_54
action_203 (38) = happyGoto action_55
action_203 _ = happyFail

action_204 (53) = happyShift action_56
action_204 (54) = happyShift action_57
action_204 (55) = happyShift action_58
action_204 (56) = happyShift action_59
action_204 (57) = happyShift action_60
action_204 (58) = happyShift action_61
action_204 (59) = happyShift action_62
action_204 (60) = happyShift action_63
action_204 (61) = happyShift action_64
action_204 (62) = happyShift action_65
action_204 (63) = happyShift action_66
action_204 (64) = happyShift action_67
action_204 (65) = happyShift action_68
action_204 (66) = happyShift action_69
action_204 (68) = happyShift action_70
action_204 (79) = happyShift action_71
action_204 (92) = happyShift action_30
action_204 (93) = happyShift action_31
action_204 (95) = happyShift action_72
action_204 (96) = happyShift action_73
action_204 (101) = happyShift action_74
action_204 (15) = happyGoto action_49
action_204 (16) = happyGoto action_229
action_204 (19) = happyGoto action_51
action_204 (20) = happyGoto action_52
action_204 (21) = happyGoto action_53
action_204 (31) = happyGoto action_54
action_204 (38) = happyGoto action_55
action_204 _ = happyFail

action_205 _ = happyReduce_32

action_206 _ = happyReduce_31

action_207 (92) = happyShift action_30
action_207 (93) = happyShift action_31
action_207 (95) = happyShift action_72
action_207 (96) = happyShift action_73
action_207 (21) = happyGoto action_228
action_207 (31) = happyGoto action_54
action_207 (38) = happyGoto action_55
action_207 _ = happyFail

action_208 _ = happyReduce_54

action_209 _ = happyReduce_53

action_210 _ = happyReduce_52

action_211 _ = happyReduce_51

action_212 _ = happyReduce_50

action_213 _ = happyReduce_49

action_214 _ = happyReduce_48

action_215 _ = happyReduce_47

action_216 _ = happyReduce_46

action_217 _ = happyReduce_45

action_218 _ = happyReduce_44

action_219 _ = happyReduce_43

action_220 _ = happyReduce_42

action_221 _ = happyReduce_39

action_222 _ = happyReduce_40

action_223 _ = happyReduce_41

action_224 (96) = happyShift action_161
action_224 (23) = happyGoto action_227
action_224 _ = happyFail

action_225 (85) = happyShift action_226
action_225 _ = happyFail

action_226 (53) = happyShift action_56
action_226 (54) = happyShift action_57
action_226 (55) = happyShift action_58
action_226 (56) = happyShift action_59
action_226 (57) = happyShift action_60
action_226 (58) = happyShift action_61
action_226 (59) = happyShift action_62
action_226 (60) = happyShift action_63
action_226 (61) = happyShift action_64
action_226 (62) = happyShift action_65
action_226 (63) = happyShift action_66
action_226 (64) = happyShift action_67
action_226 (65) = happyShift action_68
action_226 (66) = happyShift action_69
action_226 (68) = happyShift action_70
action_226 (79) = happyShift action_71
action_226 (92) = happyShift action_30
action_226 (93) = happyShift action_31
action_226 (95) = happyShift action_72
action_226 (96) = happyShift action_73
action_226 (101) = happyShift action_74
action_226 (15) = happyGoto action_49
action_226 (16) = happyGoto action_241
action_226 (19) = happyGoto action_51
action_226 (20) = happyGoto action_52
action_226 (21) = happyGoto action_53
action_226 (31) = happyGoto action_54
action_226 (38) = happyGoto action_55
action_226 _ = happyFail

action_227 _ = happyReduce_80

action_228 (49) = happyShift action_239
action_228 (97) = happyShift action_6
action_228 (99) = happyShift action_240
action_228 (4) = happyGoto action_237
action_228 (5) = happyGoto action_5
action_228 (24) = happyGoto action_238
action_228 _ = happyFail

action_229 (78) = happyShift action_107
action_229 (79) = happyShift action_108
action_229 (102) = happyShift action_236
action_229 (17) = happyGoto action_106
action_229 _ = happyFail

action_230 (78) = happyShift action_107
action_230 (79) = happyShift action_108
action_230 (100) = happyShift action_235
action_230 (17) = happyGoto action_106
action_230 _ = happyFail

action_231 (78) = happyShift action_107
action_231 (79) = happyShift action_108
action_231 (102) = happyShift action_234
action_231 (17) = happyGoto action_106
action_231 _ = happyFail

action_232 (53) = happyShift action_56
action_232 (54) = happyShift action_57
action_232 (55) = happyShift action_58
action_232 (56) = happyShift action_59
action_232 (57) = happyShift action_60
action_232 (58) = happyShift action_61
action_232 (59) = happyShift action_62
action_232 (60) = happyShift action_63
action_232 (61) = happyShift action_64
action_232 (62) = happyShift action_65
action_232 (63) = happyShift action_66
action_232 (64) = happyShift action_67
action_232 (65) = happyShift action_68
action_232 (66) = happyShift action_69
action_232 (68) = happyShift action_70
action_232 (69) = happyShift action_83
action_232 (70) = happyShift action_84
action_232 (71) = happyShift action_85
action_232 (72) = happyShift action_86
action_232 (73) = happyShift action_87
action_232 (79) = happyShift action_71
action_232 (91) = happyShift action_88
action_232 (92) = happyShift action_30
action_232 (93) = happyShift action_31
action_232 (94) = happyShift action_89
action_232 (95) = happyShift action_72
action_232 (96) = happyShift action_73
action_232 (101) = happyShift action_90
action_232 (12) = happyGoto action_77
action_232 (13) = happyGoto action_78
action_232 (14) = happyGoto action_79
action_232 (15) = happyGoto action_49
action_232 (16) = happyGoto action_80
action_232 (19) = happyGoto action_51
action_232 (20) = happyGoto action_52
action_232 (21) = happyGoto action_53
action_232 (27) = happyGoto action_233
action_232 (29) = happyGoto action_82
action_232 (31) = happyGoto action_54
action_232 (38) = happyGoto action_55
action_232 _ = happyFail

action_233 (102) = happyShift action_249
action_233 _ = happyFail

action_234 _ = happyReduce_35

action_235 (53) = happyShift action_56
action_235 (54) = happyShift action_57
action_235 (55) = happyShift action_58
action_235 (56) = happyShift action_59
action_235 (57) = happyShift action_60
action_235 (58) = happyShift action_61
action_235 (59) = happyShift action_62
action_235 (60) = happyShift action_63
action_235 (61) = happyShift action_64
action_235 (62) = happyShift action_65
action_235 (63) = happyShift action_66
action_235 (64) = happyShift action_67
action_235 (65) = happyShift action_68
action_235 (66) = happyShift action_69
action_235 (68) = happyShift action_70
action_235 (79) = happyShift action_71
action_235 (92) = happyShift action_30
action_235 (93) = happyShift action_31
action_235 (95) = happyShift action_72
action_235 (96) = happyShift action_73
action_235 (101) = happyShift action_74
action_235 (15) = happyGoto action_49
action_235 (16) = happyGoto action_248
action_235 (19) = happyGoto action_51
action_235 (20) = happyGoto action_52
action_235 (21) = happyGoto action_53
action_235 (31) = happyGoto action_54
action_235 (38) = happyGoto action_55
action_235 _ = happyFail

action_236 _ = happyReduce_33

action_237 _ = happyReduce_81

action_238 _ = happyReduce_72

action_239 (92) = happyShift action_30
action_239 (93) = happyShift action_31
action_239 (95) = happyShift action_72
action_239 (96) = happyShift action_73
action_239 (21) = happyGoto action_247
action_239 (31) = happyGoto action_54
action_239 (38) = happyGoto action_55
action_239 _ = happyFail

action_240 (39) = happyShift action_13
action_240 (40) = happyShift action_14
action_240 (41) = happyShift action_15
action_240 (42) = happyShift action_16
action_240 (44) = happyShift action_17
action_240 (45) = happyShift action_18
action_240 (47) = happyShift action_19
action_240 (48) = happyShift action_246
action_240 (50) = happyShift action_21
action_240 (51) = happyShift action_33
action_240 (52) = happyShift action_23
action_240 (67) = happyShift action_24
action_240 (74) = happyShift action_25
action_240 (75) = happyShift action_26
action_240 (76) = happyShift action_27
action_240 (77) = happyShift action_28
action_240 (91) = happyShift action_29
action_240 (92) = happyShift action_30
action_240 (93) = happyShift action_31
action_240 (6) = happyGoto action_242
action_240 (7) = happyGoto action_243
action_240 (8) = happyGoto action_244
action_240 (11) = happyGoto action_9
action_240 (22) = happyGoto action_10
action_240 (25) = happyGoto action_245
action_240 (32) = happyGoto action_11
action_240 (38) = happyGoto action_12
action_240 _ = happyFail

action_241 (78) = happyShift action_107
action_241 (79) = happyShift action_108
action_241 (17) = happyGoto action_106
action_241 _ = happyReduce_18

action_242 (97) = happyShift action_6
action_242 (4) = happyGoto action_254
action_242 (5) = happyGoto action_5
action_242 _ = happyFail

action_243 _ = happyReduce_84

action_244 (99) = happyShift action_253
action_244 _ = happyReduce_7

action_245 _ = happyReduce_83

action_246 (92) = happyShift action_30
action_246 (93) = happyShift action_31
action_246 (38) = happyGoto action_252
action_246 _ = happyReduce_85

action_247 (97) = happyShift action_6
action_247 (99) = happyShift action_240
action_247 (4) = happyGoto action_237
action_247 (5) = happyGoto action_5
action_247 (24) = happyGoto action_251
action_247 _ = happyFail

action_248 (78) = happyShift action_107
action_248 (79) = happyShift action_108
action_248 (102) = happyShift action_250
action_248 (17) = happyGoto action_106
action_248 _ = happyFail

action_249 _ = happyReduce_91

action_250 _ = happyReduce_34

action_251 _ = happyReduce_71

action_252 _ = happyReduce_86

action_253 (39) = happyShift action_13
action_253 (40) = happyShift action_14
action_253 (41) = happyShift action_15
action_253 (42) = happyShift action_16
action_253 (44) = happyShift action_17
action_253 (45) = happyShift action_18
action_253 (47) = happyShift action_19
action_253 (48) = happyShift action_246
action_253 (50) = happyShift action_21
action_253 (51) = happyShift action_33
action_253 (52) = happyShift action_23
action_253 (67) = happyShift action_24
action_253 (74) = happyShift action_25
action_253 (75) = happyShift action_26
action_253 (76) = happyShift action_27
action_253 (77) = happyShift action_28
action_253 (91) = happyShift action_29
action_253 (92) = happyShift action_30
action_253 (93) = happyShift action_31
action_253 (6) = happyGoto action_101
action_253 (7) = happyGoto action_255
action_253 (8) = happyGoto action_244
action_253 (11) = happyGoto action_9
action_253 (22) = happyGoto action_10
action_253 (25) = happyGoto action_256
action_253 (32) = happyGoto action_11
action_253 (38) = happyGoto action_12
action_253 _ = happyFail

action_254 _ = happyReduce_82

action_255 _ = happyReduce_9

action_256 _ = happyReduce_10

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
happyReduction_7 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn6
		 ([happy_var_1]
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  6 happyReduction_8
happyReduction_8 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1:happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  7 happyReduction_9
happyReduction_9 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1:happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  7 happyReduction_10
happyReduction_10 (HappyAbsSyn25  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1:happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_1  8 happyReduction_11
happyReduction_11 (HappyAbsSyn32  happy_var_1)
	 =  HappyAbsSyn8
		 (IO_Com happy_var_1
	)
happyReduction_11 _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_1  8 happyReduction_12
happyReduction_12 (HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn8
		 (ControlStructure happy_var_1
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_1  8 happyReduction_13
happyReduction_13 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_2  8 happyReduction_14
happyReduction_14 (HappyAbsSyn36  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (Read happy_var_2
	)
happyReduction_14 _ _  = notHappyAtAll 

happyReduce_15 = happyMonadReduce 2 8 happyReduction_15
happyReduction_15 ((HappyAbsSyn9  happy_var_2) `HappyStk`
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
	) (\r -> happyReturn (HappyAbsSyn8 r))

happyReduce_16 = happySpecReduce_1  8 happyReduction_16
happyReduction_16 _
	 =  HappyAbsSyn8
		 (Restore
	)

happyReduce_17 = happySpecReduce_1  8 happyReduction_17
happyReduction_17 _
	 =  HappyAbsSyn8
		 (NOOP
	)

happyReduce_18 = happyReduce 7 8 happyReduction_18
happyReduction_18 ((HappyAbsSyn16  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (Def (getTkStrVal happy_var_2) (NumVar_Var $ FloatVar $ getTkStrVal happy_var_4) happy_var_7
	) `HappyStk` happyRest

happyReduce_19 = happySpecReduce_1  9 happyReduction_19
happyReduction_19 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 ([happy_var_1]
	)
happyReduction_19 _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  9 happyReduction_20
happyReduction_20 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1:happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  10 happyReduction_21
happyReduction_21 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (DataInt $ getTkIntVal happy_var_1
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_1  10 happyReduction_22
happyReduction_22 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (DataFloat $ getTkFltVal happy_var_1
	)
happyReduction_22 _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_2  10 happyReduction_23
happyReduction_23 (HappyTerminal happy_var_2)
	_
	 =  HappyAbsSyn10
		 (DataInt $ (- getTkIntVal happy_var_2)
	)
happyReduction_23 _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_2  10 happyReduction_24
happyReduction_24 (HappyTerminal happy_var_2)
	_
	 =  HappyAbsSyn10
		 (DataFloat $ (- getTkFltVal happy_var_2)
	)
happyReduction_24 _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_1  10 happyReduction_25
happyReduction_25 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (DataString $ getTkStrVal happy_var_1
	)
happyReduction_25 _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_1  10 happyReduction_26
happyReduction_26 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (DataString $ getTkStrVal happy_var_1
	)
happyReduction_26 _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  11 happyReduction_27
happyReduction_27 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn38  happy_var_1)
	 =  HappyAbsSyn11
		 (ArithAssignment happy_var_1 happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  11 happyReduction_28
happyReduction_28 (HappyAbsSyn12  happy_var_3)
	_
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn11
		 (let {
                                                      str = getTkStrVal happy_var_1;
                                                      str' = StringVar str
                                               } in StringAssignment str' happy_var_3
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_1  12 happyReduction_29
happyReduction_29 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_1
	)
happyReduction_29 _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  12 happyReduction_30
happyReduction_30 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn12
		 (StringExpr (happy_var_1,happy_var_3) "+"
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happyReduce 4 13 happyReduction_31
happyReduction_31 (_ `HappyStk`
	(HappyAbsSyn16  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (ChrFunc happy_var_3
	) `HappyStk` happyRest

happyReduce_32 = happyReduce 4 13 happyReduction_32
happyReduction_32 (_ `HappyStk`
	(HappyAbsSyn16  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (StrFunc happy_var_3
	) `HappyStk` happyRest

happyReduce_33 = happyReduce 6 13 happyReduction_33
happyReduction_33 (_ `HappyStk`
	(HappyAbsSyn16  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (LeftFunc  happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_34 = happyReduce 8 13 happyReduction_34
happyReduction_34 (_ `HappyStk`
	(HappyAbsSyn16  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (MidFunc happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_35 = happyReduce 6 13 happyReduction_35
happyReduction_35 (_ `HappyStk`
	(HappyAbsSyn16  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (RightFunc happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_36 = happySpecReduce_1  14 happyReduction_36
happyReduction_36 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn14
		 (let str = getTkStrVal happy_var_1
                                          in StringOp $ StringLiteral str
	)
happyReduction_36 _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_1  14 happyReduction_37
happyReduction_37 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn14
		 (let {
                                              str = getTkStrVal happy_var_1;
                                              str' = StringVar str
                                      } in StringOp $ StringVar_BString str'
	)
happyReduction_37 _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_1  14 happyReduction_38
happyReduction_38 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn14
		 (StringFunc happy_var_1
	)
happyReduction_38 _  = notHappyAtAll 

happyReduce_39 = happyReduce 4 15 happyReduction_39
happyReduction_39 (_ `HappyStk`
	(HappyTerminal happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (Len $ getTkStrVal happy_var_3
	) `HappyStk` happyRest

happyReduce_40 = happyReduce 4 15 happyReduction_40
happyReduction_40 (_ `HappyStk`
	(HappyTerminal happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (let str = getTkStrVal happy_var_3
                                                 in LenVar (StringVar $ str)
	) `HappyStk` happyRest

happyReduce_41 = happyReduce 4 15 happyReduction_41
happyReduction_41 (_ `HappyStk`
	(HappyTerminal happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (Random $ getTkIntVal happy_var_3
	) `HappyStk` happyRest

happyReduce_42 = happyReduce 4 15 happyReduction_42
happyReduction_42 (_ `HappyStk`
	(HappyAbsSyn16  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (IntFunc happy_var_3
	) `HappyStk` happyRest

happyReduce_43 = happyReduce 4 15 happyReduction_43
happyReduction_43 (_ `HappyStk`
	(HappyAbsSyn16  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (AbsFunc happy_var_3
	) `HappyStk` happyRest

happyReduce_44 = happyReduce 4 15 happyReduction_44
happyReduction_44 (_ `HappyStk`
	(HappyAbsSyn12  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (AscFunc happy_var_3
	) `HappyStk` happyRest

happyReduce_45 = happyReduce 4 15 happyReduction_45
happyReduction_45 (_ `HappyStk`
	(HappyAbsSyn16  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (AtnFunc happy_var_3
	) `HappyStk` happyRest

happyReduce_46 = happyReduce 4 15 happyReduction_46
happyReduction_46 (_ `HappyStk`
	(HappyAbsSyn16  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (CosFunc happy_var_3
	) `HappyStk` happyRest

happyReduce_47 = happyReduce 4 15 happyReduction_47
happyReduction_47 (_ `HappyStk`
	(HappyAbsSyn16  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (ExpFunc happy_var_3
	) `HappyStk` happyRest

happyReduce_48 = happyReduce 4 15 happyReduction_48
happyReduction_48 (_ `HappyStk`
	(HappyAbsSyn16  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (LogFunc happy_var_3
	) `HappyStk` happyRest

happyReduce_49 = happyReduce 4 15 happyReduction_49
happyReduction_49 (_ `HappyStk`
	(HappyAbsSyn12  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (ValFunc happy_var_3
	) `HappyStk` happyRest

happyReduce_50 = happyReduce 4 15 happyReduction_50
happyReduction_50 (_ `HappyStk`
	(HappyAbsSyn16  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (SgnFunc happy_var_3
	) `HappyStk` happyRest

happyReduce_51 = happyReduce 4 15 happyReduction_51
happyReduction_51 (_ `HappyStk`
	(HappyAbsSyn16  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (SinFunc happy_var_3
	) `HappyStk` happyRest

happyReduce_52 = happyReduce 4 15 happyReduction_52
happyReduction_52 (_ `HappyStk`
	(HappyAbsSyn16  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (SqrFunc happy_var_3
	) `HappyStk` happyRest

happyReduce_53 = happyReduce 4 15 happyReduction_53
happyReduction_53 (_ `HappyStk`
	(HappyAbsSyn16  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (TanFunc happy_var_3
	) `HappyStk` happyRest

happyReduce_54 = happyReduce 4 15 happyReduction_54
happyReduction_54 (_ `HappyStk`
	(HappyAbsSyn16  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (Fnxx (getTkStrVal happy_var_1)  happy_var_3
	) `HappyStk` happyRest

happyReduce_55 = happySpecReduce_3  16 happyReduction_55
happyReduction_55 (HappyAbsSyn19  happy_var_3)
	(HappyAbsSyn17  happy_var_2)
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (NumExpr (happy_var_1,happy_var_3) happy_var_2
	)
happyReduction_55 _ _ _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_1  16 happyReduction_56
happyReduction_56 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_1
	)
happyReduction_56 _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_1  16 happyReduction_57
happyReduction_57 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn16
		 (NumFunc happy_var_1
	)
happyReduction_57 _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_2  16 happyReduction_58
happyReduction_58 (HappyAbsSyn16  happy_var_2)
	_
	 =  HappyAbsSyn16
		 (NumMinus happy_var_2
	)
happyReduction_58 _ _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_1  17 happyReduction_59
happyReduction_59 _
	 =  HappyAbsSyn17
		 ("+"
	)

happyReduce_60 = happySpecReduce_1  17 happyReduction_60
happyReduction_60 _
	 =  HappyAbsSyn17
		 ("-"
	)

happyReduce_61 = happySpecReduce_1  18 happyReduction_61
happyReduction_61 _
	 =  HappyAbsSyn18
		 ("*"
	)

happyReduce_62 = happySpecReduce_1  18 happyReduction_62
happyReduction_62 _
	 =  HappyAbsSyn18
		 ("/"
	)

happyReduce_63 = happySpecReduce_3  19 happyReduction_63
happyReduction_63 (HappyAbsSyn20  happy_var_3)
	(HappyAbsSyn18  happy_var_2)
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (NumExpr (happy_var_1,happy_var_3) happy_var_2
	)
happyReduction_63 _ _ _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_1  19 happyReduction_64
happyReduction_64 (HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn19
		 (happy_var_1
	)
happyReduction_64 _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_1  20 happyReduction_65
happyReduction_65 (HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn20
		 (NumOp happy_var_1
	)
happyReduction_65 _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_3  20 happyReduction_66
happyReduction_66 _
	(HappyAbsSyn16  happy_var_2)
	_
	 =  HappyAbsSyn20
		 (happy_var_2
	)
happyReduction_66 _ _ _  = notHappyAtAll 

happyReduce_67 = happySpecReduce_1  20 happyReduction_67
happyReduction_67 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn20
		 (NumFunc happy_var_1
	)
happyReduction_67 _  = notHappyAtAll 

happyReduce_68 = happySpecReduce_1  21 happyReduction_68
happyReduction_68 (HappyAbsSyn38  happy_var_1)
	 =  HappyAbsSyn21
		 (OpVar happy_var_1
	)
happyReduction_68 _  = notHappyAtAll 

happyReduce_69 = happySpecReduce_1  21 happyReduction_69
happyReduction_69 (HappyAbsSyn31  happy_var_1)
	 =  HappyAbsSyn21
		 (happy_var_1
	)
happyReduction_69 _  = notHappyAtAll 

happyReduce_70 = happySpecReduce_3  22 happyReduction_70
happyReduction_70 (HappyAbsSyn26  happy_var_3)
	(HappyAbsSyn27  happy_var_2)
	_
	 =  HappyAbsSyn22
		 (If happy_var_2 happy_var_3
	)
happyReduction_70 _ _ _  = notHappyAtAll 

happyReduce_71 = happyReduce 9 22 happyReduction_71
happyReduction_71 ((HappyAbsSyn24  happy_var_9) `HappyStk`
	(HappyAbsSyn21  happy_var_8) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn21  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn21  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn22
		 (let (a,b) = happy_var_9
                                              in For (FloatVar $ getTkStrVal happy_var_2) (happy_var_4,happy_var_8,happy_var_6) a b
	) `HappyStk` happyRest

happyReduce_72 = happyReduce 7 22 happyReduction_72
happyReduction_72 ((HappyAbsSyn24  happy_var_7) `HappyStk`
	(HappyAbsSyn21  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn21  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn22
		 (let (a,b) = happy_var_7
                                         in For (FloatVar $ getTkStrVal happy_var_2) (happy_var_4,(IntConst 1),happy_var_6) a b
	) `HappyStk` happyRest

happyReduce_73 = happySpecReduce_2  22 happyReduction_73
happyReduction_73 (HappyTerminal happy_var_2)
	_
	 =  HappyAbsSyn22
		 (GoSub $ getTkIntVal happy_var_2
	)
happyReduction_73 _ _  = notHappyAtAll 

happyReduce_74 = happySpecReduce_2  22 happyReduction_74
happyReduction_74 (HappyTerminal happy_var_2)
	_
	 =  HappyAbsSyn22
		 (Goto $ getTkIntVal happy_var_2
	)
happyReduction_74 _ _  = notHappyAtAll 

happyReduce_75 = happySpecReduce_1  22 happyReduction_75
happyReduction_75 _
	 =  HappyAbsSyn22
		 (End
	)

happyReduce_76 = happySpecReduce_1  22 happyReduction_76
happyReduction_76 _
	 =  HappyAbsSyn22
		 (Return
	)

happyReduce_77 = happyReduce 4 22 happyReduction_77
happyReduction_77 ((HappyAbsSyn23  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn22
		 (On_Goto  happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_78 = happyReduce 4 22 happyReduction_78
happyReduction_78 ((HappyAbsSyn23  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn22
		 (On_Gosub happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_79 = happySpecReduce_1  23 happyReduction_79
happyReduction_79 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn23
		 ([getTkIntVal happy_var_1]
	)
happyReduction_79 _  = notHappyAtAll 

happyReduce_80 = happySpecReduce_3  23 happyReduction_80
happyReduction_80 (HappyAbsSyn23  happy_var_3)
	_
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn23
		 ((getTkIntVal happy_var_1):happy_var_3
	)
happyReduction_80 _ _ _  = notHappyAtAll 

happyReduce_81 = happySpecReduce_1  24 happyReduction_81
happyReduction_81 (HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn24
		 (([NOOP],happy_var_1)
	)
happyReduction_81 _  = notHappyAtAll 

happyReduce_82 = happySpecReduce_3  24 happyReduction_82
happyReduction_82 (HappyAbsSyn4  happy_var_3)
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn24
		 ((happy_var_2,happy_var_3)
	)
happyReduction_82 _ _ _  = notHappyAtAll 

happyReduce_83 = happySpecReduce_2  24 happyReduction_83
happyReduction_83 (HappyAbsSyn25  happy_var_2)
	_
	 =  HappyAbsSyn24
		 (([NOOP],[(-1,happy_var_2)])
	)
happyReduction_83 _ _  = notHappyAtAll 

happyReduce_84 = happySpecReduce_2  24 happyReduction_84
happyReduction_84 (HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn24
		 ((happy_var_2,[(-1,[NOOP])])
	)
happyReduction_84 _ _  = notHappyAtAll 

happyReduce_85 = happySpecReduce_1  25 happyReduction_85
happyReduction_85 _
	 =  HappyAbsSyn25
		 ([NOOP]
	)

happyReduce_86 = happySpecReduce_2  25 happyReduction_86
happyReduction_86 _
	_
	 =  HappyAbsSyn25
		 ([NOOP]
	)

happyReduce_87 = happySpecReduce_2  26 happyReduction_87
happyReduction_87 (HappyTerminal happy_var_2)
	_
	 =  HappyAbsSyn26
		 (let nr  = getTkIntVal happy_var_2
                                            in [ControlStructure $ Goto nr]
	)
happyReduction_87 _ _  = notHappyAtAll 

happyReduce_88 = happySpecReduce_2  26 happyReduction_88
happyReduction_88 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn26
		 (happy_var_2
	)
happyReduction_88 _ _  = notHappyAtAll 

happyReduce_89 = happySpecReduce_2  26 happyReduction_89
happyReduction_89 (HappyTerminal happy_var_2)
	_
	 =  HappyAbsSyn26
		 (let nr  = getTkIntVal happy_var_2
                                            in [ControlStructure $ Goto nr]
	)
happyReduction_89 _ _  = notHappyAtAll 

happyReduce_90 = happySpecReduce_1  27 happyReduction_90
happyReduction_90 (HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn27
		 (happy_var_1
	)
happyReduction_90 _  = notHappyAtAll 

happyReduce_91 = happyReduce 7 27 happyReduction_91
happyReduction_91 (_ `HappyStk`
	(HappyAbsSyn27  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn28  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn27  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn27
		 (BoolExprLog (happy_var_2,happy_var_6) happy_var_4
	) `HappyStk` happyRest

happyReduce_92 = happySpecReduce_1  28 happyReduction_92
happyReduction_92 _
	 =  HappyAbsSyn28
		 ("||"
	)

happyReduce_93 = happySpecReduce_1  28 happyReduction_93
happyReduction_93 _
	 =  HappyAbsSyn28
		 ("&&"
	)

happyReduce_94 = happySpecReduce_1  28 happyReduction_94
happyReduction_94 _
	 =  HappyAbsSyn28
		 ("neg"
	)

happyReduce_95 = happySpecReduce_3  29 happyReduction_95
happyReduction_95 (HappyAbsSyn12  happy_var_3)
	(HappyAbsSyn30  happy_var_2)
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn29
		 (BoolExprString (happy_var_1,happy_var_3) happy_var_2
	)
happyReduction_95 _ _ _  = notHappyAtAll 

happyReduce_96 = happySpecReduce_3  29 happyReduction_96
happyReduction_96 (HappyAbsSyn16  happy_var_3)
	(HappyAbsSyn30  happy_var_2)
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn29
		 (BoolExprNum (happy_var_1,happy_var_3) happy_var_2
	)
happyReduction_96 _ _ _  = notHappyAtAll 

happyReduce_97 = happySpecReduce_1  30 happyReduction_97
happyReduction_97 _
	 =  HappyAbsSyn30
		 ("=="
	)

happyReduce_98 = happySpecReduce_1  30 happyReduction_98
happyReduction_98 _
	 =  HappyAbsSyn30
		 ("<"
	)

happyReduce_99 = happySpecReduce_1  30 happyReduction_99
happyReduction_99 _
	 =  HappyAbsSyn30
		 (">"
	)

happyReduce_100 = happySpecReduce_1  30 happyReduction_100
happyReduction_100 _
	 =  HappyAbsSyn30
		 ("/="
	)

happyReduce_101 = happySpecReduce_1  30 happyReduction_101
happyReduction_101 _
	 =  HappyAbsSyn30
		 ("<="
	)

happyReduce_102 = happySpecReduce_1  30 happyReduction_102
happyReduction_102 _
	 =  HappyAbsSyn30
		 (">="
	)

happyReduce_103 = happySpecReduce_1  31 happyReduction_103
happyReduction_103 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn31
		 (let int = getTkIntVal happy_var_1
                                                   in IntConst int
	)
happyReduction_103 _  = notHappyAtAll 

happyReduce_104 = happySpecReduce_1  31 happyReduction_104
happyReduction_104 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn31
		 (let flt = getTkFltVal happy_var_1
                                                   in FloatConst flt
	)
happyReduction_104 _  = notHappyAtAll 

happyReduce_105 = happySpecReduce_2  32 happyReduction_105
happyReduction_105 (HappyAbsSyn33  happy_var_2)
	_
	 =  HappyAbsSyn32
		 (Print happy_var_2
	)
happyReduction_105 _ _  = notHappyAtAll 

happyReduce_106 = happySpecReduce_1  32 happyReduction_106
happyReduction_106 _
	 =  HappyAbsSyn32
		 (Print ([], True)
	)

happyReduce_107 = happySpecReduce_2  32 happyReduction_107
happyReduction_107 (HappyAbsSyn35  happy_var_2)
	_
	 =  HappyAbsSyn32
		 (Input happy_var_2
	)
happyReduction_107 _ _  = notHappyAtAll 

happyReduce_108 = happySpecReduce_2  32 happyReduction_108
happyReduction_108 (HappyAbsSyn37  happy_var_2)
	_
	 =  HappyAbsSyn32
		 (Get happy_var_2
	)
happyReduction_108 _ _  = notHappyAtAll 

happyReduce_109 = happySpecReduce_1  33 happyReduction_109
happyReduction_109 (HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn33
		 (([happy_var_1], True)
	)
happyReduction_109 _  = notHappyAtAll 

happyReduce_110 = happySpecReduce_2  33 happyReduction_110
happyReduction_110 _
	(HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn33
		 (([happy_var_1], False)
	)
happyReduction_110 _ _  = notHappyAtAll 

happyReduce_111 = happySpecReduce_3  33 happyReduction_111
happyReduction_111 (HappyAbsSyn33  happy_var_3)
	_
	(HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn33
		 ((happy_var_1:(fst happy_var_3), snd happy_var_3)
	)
happyReduction_111 _ _ _  = notHappyAtAll 

happyReduce_112 = happySpecReduce_1  34 happyReduction_112
happyReduction_112 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn34
		 (OutStringExpr happy_var_1
	)
happyReduction_112 _  = notHappyAtAll 

happyReduce_113 = happySpecReduce_1  34 happyReduction_113
happyReduction_113 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn34
		 (OutNumExpr happy_var_1
	)
happyReduction_113 _  = notHappyAtAll 

happyReduce_114 = happySpecReduce_3  35 happyReduction_114
happyReduction_114 (HappyAbsSyn36  happy_var_3)
	_
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn35
		 ((InputStuff [getTkStrVal happy_var_1] happy_var_3, False)
	)
happyReduction_114 _ _ _  = notHappyAtAll 

happyReduce_115 = happySpecReduce_2  35 happyReduction_115
happyReduction_115 (HappyAbsSyn36  happy_var_2)
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn35
		 ((InputStuff [getTkStrVal happy_var_1] happy_var_2, True)
	)
happyReduction_115 _ _  = notHappyAtAll 

happyReduce_116 = happySpecReduce_1  35 happyReduction_116
happyReduction_116 (HappyAbsSyn36  happy_var_1)
	 =  HappyAbsSyn35
		 ((InputStuff [] happy_var_1, False)
	)
happyReduction_116 _  = notHappyAtAll 

happyReduce_117 = happySpecReduce_1  36 happyReduction_117
happyReduction_117 (HappyAbsSyn37  happy_var_1)
	 =  HappyAbsSyn36
		 ([happy_var_1]
	)
happyReduction_117 _  = notHappyAtAll 

happyReduce_118 = happySpecReduce_3  36 happyReduction_118
happyReduction_118 (HappyAbsSyn36  happy_var_3)
	_
	(HappyAbsSyn37  happy_var_1)
	 =  HappyAbsSyn36
		 (happy_var_1:happy_var_3
	)
happyReduction_118 _ _ _  = notHappyAtAll 

happyReduce_119 = happySpecReduce_1  37 happyReduction_119
happyReduction_119 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn37
		 (StringVar_Var (StringVar $ getTkStrVal happy_var_1)
	)
happyReduction_119 _  = notHappyAtAll 

happyReduce_120 = happySpecReduce_1  37 happyReduction_120
happyReduction_120 (HappyAbsSyn38  happy_var_1)
	 =  HappyAbsSyn37
		 (NumVar_Var happy_var_1
	)
happyReduction_120 _  = notHappyAtAll 

happyReduce_121 = happySpecReduce_1  38 happyReduction_121
happyReduction_121 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn38
		 (IntVar $ getTkStrVal happy_var_1
	)
happyReduction_121 _  = notHappyAtAll 

happyReduce_122 = happySpecReduce_1  38 happyReduction_122
happyReduction_122 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn38
		 (FloatVar $ getTkStrVal happy_var_1
	)
happyReduction_122 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 103 103 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenWrap _type pos TkInput -> cont 39;
	TokenWrap _type pos TkPrint -> cont 40;
	TokenWrap _type pos TkGet -> cont 41;
	TokenWrap _type pos TkIf -> cont 42;
	TokenWrap _type pos TkThen -> cont 43;
	TokenWrap _type pos TkGoto -> cont 44;
	TokenWrap _type pos TkFor -> cont 45;
	TokenWrap _type pos TkTo -> cont 46;
	TokenWrap _type pos TkOn -> cont 47;
	TokenWrap _type pos TkNext -> cont 48;
	TokenWrap _type pos TkStep -> cont 49;
	TokenWrap _type pos TkGoSub -> cont 50;
	TokenWrap _type pos TkReturn -> cont 51;
	TokenWrap _type pos TkEnd -> cont 52;
	TokenWrap _type pos TkRandom -> cont 53;
	TokenWrap _type pos TkLen -> cont 54;
	TokenWrap _type pos TkIntFunc -> cont 55;
	TokenWrap _type pos TkAbsFunc -> cont 56;
	TokenWrap _type pos TkAscFunc -> cont 57;
	TokenWrap _type pos TkAtnFunc -> cont 58;
	TokenWrap _type pos TkCosFunc -> cont 59;
	TokenWrap _type pos TkExpFunc -> cont 60;
	TokenWrap _type pos TkLogFunc -> cont 61;
	TokenWrap _type pos TkValFunc -> cont 62;
	TokenWrap _type pos TkSgnFunc -> cont 63;
	TokenWrap _type pos TkSinFunc -> cont 64;
	TokenWrap _type pos TkSqrFunc -> cont 65;
	TokenWrap _type pos TkTanFunc -> cont 66;
	TokenWrap _type pos TkDef -> cont 67;
	TokenWrap _type pos (TkFnxx str) -> cont 68;
	TokenWrap _type pos TkChrFunc -> cont 69;
	TokenWrap _type pos TkStrFunc -> cont 70;
	TokenWrap _type pos TkLeftFunc -> cont 71;
	TokenWrap _type pos TkMidFunc -> cont 72;
	TokenWrap _type pos TkRightFunc -> cont 73;
	TokenWrap _type pos TkRead -> cont 74;
	TokenWrap _type pos TkData -> cont 75;
	TokenWrap _type pos TkRestore -> cont 76;
	TokenWrap _type pos TkComment -> cont 77;
	TokenWrap _type pos TkPlus -> cont 78;
	TokenWrap _type pos TkMinus -> cont 79;
	TokenWrap _type pos TkTimes -> cont 80;
	TokenWrap _type pos TkDiv -> cont 81;
	TokenWrap _type pos TkLogOr -> cont 82;
	TokenWrap _type pos TkLogAnd -> cont 83;
	TokenWrap _type pos TkLogNeg -> cont 84;
	TokenWrap _type pos TkEqual -> cont 85;
	TokenWrap _type pos TkUnEqual -> cont 86;
	TokenWrap _type pos TkLt -> cont 87;
	TokenWrap _type pos TkGt -> cont 88;
	TokenWrap _type pos TkLE -> cont 89;
	TokenWrap _type pos TkGE -> cont 90;
	TokenWrap _type pos (TkStringVar val) -> cont 91;
	TokenWrap _type pos (TkIntVar val) -> cont 92;
	TokenWrap _t p (TkFloatVar_Or_DataString val) -> cont 93;
	TokenWrap _type pos (TkString val) -> cont 94;
	TokenWrap _type pos (TkConst (TkFloatConst val)) -> cont 95;
	TokenWrap _type pos (TkConst (TkIntConst val)) -> cont 96;
	TokenWrap _type pos (TkLineNumber val) -> cont 97;
	TokenWrap _type pos TkStringConcat -> cont 98;
	TokenWrap _type pos TkSingleLineCommandCombinator -> cont 99;
	TokenWrap _type pos TkKomma -> cont 100;
	TokenWrap _type pos TkBracketOpen -> cont 101;
	TokenWrap _type pos TkBracketClose -> cont 102;
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
