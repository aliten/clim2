;;; -*- Mode: Lisp; Syntax: ANSI-Common-Lisp; Package: POSTSCRIPT-CLIM; Base: 10; Lowercase: Yes -*-

;; $Id: laserwriter-metrics.lisp,v 2.7 2007/04/17 21:45:52 layer Exp $

(in-package :postscript-clim)

;; copyright (c) 1993 Franz Inc, Berkeley, CA - All rights reserved.
;; copyright (c) 1993-2007 Franz Inc, Oakland, CA - All rights reserved.

;;; New revised metrics which are generated from AFM files.

(progn (setup-laserwriter-metrics
         '(("Times-Roman" 1000 (-170 -223 1024 896)) (32 223 "space") (33 298 "exclam")
           (34 365 "quotedbl") (35 447 "numbersign") (36 447 "dollar") (37 744 "percent")
           (38 695 "ampersand") (39 298 "quoteright") (40 298 "parenleft") (41 298 "parenright")
           (42 447 "asterisk") (43 504 "plus") (44 223 "comma") (45 298 "hyphen") (46 223 "period")
           (47 248 "slash") (48 447 "zero") (49 447 "one") (50 447 "two") (51 447 "three")
           (52 447 "four") (53 447 "five") (54 447 "six") (55 447 "seven") (56 447 "eight")
           (57 447 "nine") (58 248 "colon") (59 248 "semicolon") (60 504 "less") (61 504 "equal")
           (62 504 "greater") (63 397 "question") (64 823 "at") (65 645 "A") (66 596 "B") (67 596 "C")
           (68 645 "D") (69 546 "E") (70 497 "F") (71 645 "G") (72 645 "H") (73 298 "I") (74 348 "J")
           (75 645 "K") (76 546 "L") (77 794 "M") (78 645 "N") (79 645 "O") (80 497 "P") (81 645 "Q")
           (82 596 "R") (83 497 "S") (84 546 "T") (85 645 "U") (86 645 "V") (87 844 "W") (88 645 "X")
           (89 645 "Y") (90 546 "Z") (91 298 "bracketleft") (92 248 "backslash")
           (93 298 "bracketright") (94 419 "asciicircum") (95 447 "underscore") (96 298 "quoteleft")
           (97 397 "a") (98 447 "b") (99 397 "c") (100 447 "d") (101 397 "e") (102 298 "f")
           (103 447 "g") (104 447 "h") (105 248 "i") (106 248 "j") (107 447 "k") (108 248 "l")
           (109 695 "m") (110 447 "n") (111 447 "o") (112 447 "p") (113 447 "q") (114 298 "r")
           (115 348 "s") (116 248 "t") (117 447 "u") (118 447 "v") (119 645 "w") (120 447 "x")
           (121 447 "y") (122 397 "z") (123 429 "braceleft") (124 179 "bar") (125 429 "braceright")
           (126 483 "asciitilde") (161 298 "exclamdown") (162 447 "cent") (163 447 "sterling")
           (164 149 "fraction") (165 447 "yen") (166 447 "florin") (167 447 "section")
           (168 447 "currency") (169 161 "quotesingle") (170 397 "quotedblleft")
           (171 447 "guillemotleft") (172 298 "guilsinglleft") (173 298 "guilsinglright")
           (174 497 "fi") (175 497 "fl") (177 447 "endash") (178 447 "dagger") (179 447 "daggerdbl")
           (180 223 "periodcentered") (182 405 "paragraph") (183 313 "bullet")
           (184 298 "quotesinglbase") (185 397 "quotedblbase") (186 397 "quotedblright")
           (187 447 "guillemotright") (188 894 "ellipsis") (189 894 "perthousand")
           (191 397 "questiondown") (193 298 "grave") (194 298 "acute") (195 298 "circumflex")
           (196 298 "tilde") (197 298 "macron") (198 298 "breve") (199 298 "dotaccent")
           (200 298 "dieresis") (202 298 "ring") (203 298 "cedilla") (205 298 "hungarumlaut")
           (206 298 "ogonek") (207 298 "caron") (208 894 "emdash") (225 794 "AE")
           (227 247 "ordfeminine") (232 546 "Lslash") (233 645 "Oslash") (234 794 "OE")
           (235 277 "ordmasculine") (241 596 "ae") (245 248 "dotlessi") (248 248 "lslash")
           (249 447 "oslash") (250 645 "oe") (251 447 "germandbls")))
       (setup-laserwriter-metrics
         '(("Times-Italic" 1000 (-176 -252 990 930)) (32 212 "space") (33 282 "exclam")
           (34 355 "quotedbl") (35 423 "numbersign") (36 423 "dollar") (37 705 "percent")
           (38 658 "ampersand") (39 282 "quoteright") (40 282 "parenleft") (41 282 "parenright")
           (42 423 "asterisk") (43 571 "plus") (44 212 "comma") (45 282 "hyphen") (46 212 "period")
           (47 235 "slash") (48 423 "zero") (49 423 "one") (50 423 "two") (51 423 "three")
           (52 423 "four") (53 423 "five") (54 423 "six") (55 423 "seven") (56 423 "eight")
           (57 423 "nine") (58 282 "colon") (59 282 "semicolon") (60 571 "less") (61 571 "equal")
           (62 571 "greater") (63 423 "question") (64 778 "at") (65 517 "A") (66 517 "B") (67 564 "C")
           (68 611 "D") (69 517 "E") (70 517 "F") (71 611 "G") (72 611 "H") (73 282 "I") (74 376 "J")
           (75 564 "K") (76 470 "L") (77 705 "M") (78 564 "N") (79 611 "O") (80 517 "P") (81 611 "Q")
           (82 517 "R") (83 423 "S") (84 470 "T") (85 611 "U") (86 517 "V") (87 705 "W") (88 517 "X")
           (89 470 "Y") (90 470 "Z") (91 329 "bracketleft") (92 235 "backslash")
           (93 329 "bracketright") (94 357 "asciicircum") (95 423 "underscore") (96 282 "quoteleft")
           (97 423 "a") (98 423 "b") (99 376 "c") (100 423 "d") (101 376 "e") (102 235 "f")
           (103 423 "g") (104 423 "h") (105 235 "i") (106 235 "j") (107 376 "k") (108 235 "l")
           (109 611 "m") (110 423 "n") (111 423 "o") (112 423 "p") (113 423 "q") (114 329 "r")
           (115 329 "s") (116 235 "t") (117 423 "u") (118 376 "v") (119 564 "w") (120 376 "x")
           (121 376 "y") (122 329 "z") (123 338 "braceleft") (124 233 "bar") (125 338 "braceright")
           (126 458 "asciitilde") (161 329 "exclamdown") (162 423 "cent") (163 423 "sterling")
           (164 141 "fraction") (165 423 "yen") (166 423 "florin") (167 423 "section")
           (168 423 "currency") (169 181 "quotesingle") (170 470 "quotedblleft")
           (171 423 "guillemotleft") (172 282 "guilsinglleft") (173 282 "guilsinglright")
           (174 423 "fi") (175 423 "fl") (177 423 "endash") (178 423 "dagger") (179 423 "daggerdbl")
           (180 212 "periodcentered") (182 442 "paragraph") (183 296 "bullet")
           (184 282 "quotesinglbase") (185 470 "quotedblbase") (186 470 "quotedblright")
           (187 423 "guillemotright") (188 752 "ellipsis") (189 846 "perthousand")
           (191 423 "questiondown") (193 282 "grave") (194 282 "acute") (195 282 "circumflex")
           (196 282 "tilde") (197 282 "macron") (198 282 "breve") (199 282 "dotaccent")
           (200 282 "dieresis") (202 282 "ring") (203 282 "cedilla") (205 282 "hungarumlaut")
           (206 282 "ogonek") (207 282 "caron") (208 752 "emdash") (225 752 "AE")
           (227 234 "ordfeminine") (232 470 "Lslash") (233 611 "Oslash") (234 799 "OE")
           (235 262 "ordmasculine") (241 564 "ae") (245 235 "dotlessi") (248 235 "lslash")
           (249 423 "oslash") (250 564 "oe") (251 423 "germandbls")))
       (setup-laserwriter-metrics
         '(("Times-Bold" 1000 (-172 -256 1008 965)) (32 205 "space") (33 273 "exclam")
           (34 455 "quotedbl") (35 410 "numbersign") (36 410 "dollar") (37 819 "percent")
           (38 682 "ampersand") (39 273 "quoteright") (40 273 "parenleft") (41 273 "parenright")
           (42 410 "asterisk") (43 467 "plus") (44 205 "comma") (45 273 "hyphen") (46 205 "period")
           (47 228 "slash") (48 410 "zero") (49 410 "one") (50 410 "two") (51 410 "three")
           (52 410 "four") (53 410 "five") (54 410 "six") (55 410 "seven") (56 410 "eight")
           (57 410 "nine") (58 273 "colon") (59 273 "semicolon") (60 467 "less") (61 467 "equal")
           (62 467 "greater") (63 410 "question") (64 762 "at") (65 591 "A") (66 546 "B") (67 591 "C")
           (68 591 "D") (69 546 "E") (70 500 "F") (71 637 "G") (72 637 "H") (73 319 "I") (74 410 "J")
           (75 637 "K") (76 546 "L") (77 773 "M") (78 591 "N") (79 637 "O") (80 500 "P") (81 637 "Q")
           (82 591 "R") (83 455 "S") (84 546 "T") (85 591 "U") (86 591 "V") (87 819 "W") (88 591 "X")
           (89 591 "Y") (90 546 "Z") (91 273 "bracketleft") (92 228 "backslash")
           (93 273 "bracketright") (94 476 "asciicircum") (95 410 "underscore") (96 273 "quoteleft")
           (97 410 "a") (98 455 "b") (99 364 "c") (100 455 "d") (101 364 "e") (102 273 "f")
           (103 410 "g") (104 455 "h") (105 228 "i") (106 273 "j") (107 455 "k") (108 228 "l")
           (109 682 "m") (110 455 "n") (111 410 "o") (112 455 "p") (113 455 "q") (114 364 "r")
           (115 319 "s") (116 273 "t") (117 455 "u") (118 410 "v") (119 591 "w") (120 410 "x")
           (121 410 "y") (122 364 "z") (123 323 "braceleft") (124 180 "bar") (125 323 "braceright")
           (126 426 "asciitilde") (161 273 "exclamdown") (162 410 "cent") (163 410 "sterling")
           (164 137 "fraction") (165 410 "yen") (166 410 "florin") (167 410 "section")
           (168 410 "currency") (169 228 "quotesingle") (170 410 "quotedblleft")
           (171 410 "guillemotleft") (172 273 "guilsinglleft") (173 273 "guilsinglright")
           (174 455 "fi") (175 455 "fl") (177 410 "endash") (178 410 "dagger") (179 410 "daggerdbl")
           (180 205 "periodcentered") (182 442 "paragraph") (183 287 "bullet")
           (184 273 "quotesinglbase") (185 410 "quotedblbase") (186 410 "quotedblright")
           (187 410 "guillemotright") (188 819 "ellipsis") (189 819 "perthousand")
           (191 410 "questiondown") (193 273 "grave") (194 273 "acute") (195 273 "circumflex")
           (196 273 "tilde") (197 273 "macron") (198 273 "breve") (199 273 "dotaccent")
           (200 273 "dieresis") (202 273 "ring") (203 273 "cedilla") (205 273 "hungarumlaut")
           (206 273 "ogonek") (207 273 "caron") (208 819 "emdash") (225 819 "AE")
           (227 246 "ordfeminine") (232 546 "Lslash") (233 637 "Oslash") (234 819 "OE")
           (235 270 "ordmasculine") (241 591 "ae") (245 228 "dotlessi") (248 228 "lslash")
           (249 410 "oslash") (250 591 "oe") (251 455 "germandbls")))
       (setup-laserwriter-metrics
         '(("Times-BoldItalic" 1000 (-168 -232 1014 894)) (32 222 "space") (33 345 "exclam")
           (34 493 "quotedbl") (35 444 "numbersign") (36 444 "dollar") (37 740 "percent")
           (38 691 "ampersand") (39 296 "quoteright") (40 296 "parenleft") (41 296 "parenright")
           (42 444 "asterisk") (43 506 "plus") (44 222 "comma") (45 296 "hyphen") (46 222 "period")
           (47 247 "slash") (48 444 "zero") (49 444 "one") (50 444 "two") (51 444 "three")
           (52 444 "four") (53 444 "five") (54 444 "six") (55 444 "seven") (56 444 "eight")
           (57 444 "nine") (58 296 "colon") (59 296 "semicolon") (60 506 "less") (61 506 "equal")
           (62 506 "greater") (63 444 "question") (64 739 "at") (65 592 "A") (66 592 "B") (67 592 "C")
           (68 641 "D") (69 592 "E") (70 592 "F") (71 641 "G") (72 691 "H") (73 345 "I") (74 444 "J")
           (75 592 "K") (76 543 "L") (77 790 "M") (78 641 "N") (79 641 "O") (80 543 "P") (81 641 "Q")
           (82 592 "R") (83 494 "S") (84 543 "T") (85 641 "U") (86 592 "V") (87 790 "W") (88 592 "X")
           (89 543 "Y") (90 543 "Z") (91 296 "bracketleft") (92 247 "backslash")
           (93 296 "bracketright") (94 506 "asciicircum") (95 444 "underscore") (96 296 "quoteleft")
           (97 444 "a") (98 444 "b") (99 394 "c") (100 444 "d") (101 394 "e") (102 296 "f")
           (103 444 "g") (104 494 "h") (105 247 "i") (106 247 "j") (107 444 "k") (108 247 "l")
           (109 691 "m") (110 494 "n") (111 444 "o") (112 444 "p") (113 444 "q") (114 345 "r")
           (115 345 "s") (116 247 "t") (117 494 "u") (118 394 "v") (119 592 "w") (120 444 "x")
           (121 394 "y") (122 345 "z") (123 309 "braceleft") (124 195 "bar") (125 309 "braceright")
           (126 506 "asciitilde") (161 345 "exclamdown") (162 444 "cent") (163 444 "sterling")
           (164 148 "fraction") (165 444 "yen") (166 444 "florin") (167 444 "section")
           (168 444 "currency") (169 247 "quotesingle") (170 444 "quotedblleft")
           (171 444 "guillemotleft") (172 296 "guilsinglleft") (173 296 "guilsinglright")
           (174 494 "fi") (175 494 "fl") (177 444 "endash") (178 444 "dagger") (179 444 "daggerdbl")
           (180 222 "periodcentered") (182 444 "paragraph") (183 311 "bullet")
           (184 296 "quotesinglbase") (185 444 "quotedblbase") (186 444 "quotedblright")
           (187 444 "guillemotright") (188 888 "ellipsis") (189 888 "perthousand")
           (191 444 "questiondown") (193 296 "grave") (194 296 "acute") (195 296 "circumflex")
           (196 296 "tilde") (197 296 "macron") (198 296 "breve") (199 296 "dotaccent")
           (200 296 "dieresis") (202 296 "ring") (203 296 "cedilla") (205 296 "hungarumlaut")
           (206 296 "ogonek") (207 296 "caron") (208 888 "emdash") (225 838 "AE")
           (227 236 "ordfeminine") (232 543 "Lslash") (233 641 "Oslash") (234 838 "OE")
           (235 266 "ordmasculine") (241 641 "ae") (245 247 "dotlessi") (248 247 "lslash")
           (249 444 "oslash") (250 641 "oe") (251 444 "germandbls")))
       (setup-laserwriter-metrics
         '(("Helvetica" 1000 (-174 -220 1001 944)) (32 239 "space") (33 239 "exclam")
           (34 305 "quotedbl") (35 478 "numbersign") (36 478 "dollar") (37 764 "percent")
           (38 573 "ampersand") (39 191 "quoteright") (40 286 "parenleft") (41 286 "parenright")
           (42 334 "asterisk") (43 502 "plus") (44 239 "comma") (45 286 "hyphen") (46 239 "period")
           (47 239 "slash") (48 478 "zero") (49 478 "one") (50 478 "two") (51 478 "three")
           (52 478 "four") (53 478 "five") (54 478 "six") (55 478 "seven") (56 478 "eight")
           (57 478 "nine") (58 239 "colon") (59 239 "semicolon") (60 502 "less") (61 502 "equal")
           (62 502 "greater") (63 478 "question") (64 872 "at") (65 573 "A") (66 573 "B") (67 620 "C")
           (68 620 "D") (69 573 "E") (70 525 "F") (71 668 "G") (72 620 "H") (73 239 "I") (74 430 "J")
           (75 573 "K") (76 478 "L") (77 716 "M") (78 620 "N") (79 668 "O") (80 573 "P") (81 668 "Q")
           (82 620 "R") (83 573 "S") (84 525 "T") (85 620 "U") (86 573 "V") (87 811 "W") (88 573 "X")
           (89 573 "Y") (90 525 "Z") (91 239 "bracketleft") (92 239 "backslash")
           (93 239 "bracketright") (94 403 "asciicircum") (95 478 "underscore") (96 191 "quoteleft")
           (97 478 "a") (98 478 "b") (99 430 "c") (100 478 "d") (101 478 "e") (102 239 "f")
           (103 478 "g") (104 478 "h") (105 191 "i") (106 191 "j") (107 430 "k") (108 191 "l")
           (109 716 "m") (110 478 "n") (111 478 "o") (112 478 "p") (113 478 "q") (114 286 "r")
           (115 430 "s") (116 239 "t") (117 478 "u") (118 430 "v") (119 620 "w") (120 430 "x")
           (121 430 "y") (122 430 "z") (123 287 "braceleft") (124 223 "bar") (125 287 "braceright")
           (126 502 "asciitilde") (161 286 "exclamdown") (162 478 "cent") (163 478 "sterling")
           (164 143 "fraction") (165 478 "yen") (166 478 "florin") (167 478 "section")
           (168 478 "currency") (169 164 "quotesingle") (170 286 "quotedblleft")
           (171 478 "guillemotleft") (172 286 "guilsinglleft") (173 286 "guilsinglright")
           (174 430 "fi") (175 430 "fl") (177 478 "endash") (178 478 "dagger") (179 478 "daggerdbl")
           (180 239 "periodcentered") (182 461 "paragraph") (183 301 "bullet")
           (184 191 "quotesinglbase") (185 286 "quotedblbase") (186 286 "quotedblright")
           (187 478 "guillemotright") (188 859 "ellipsis") (189 859 "perthousand")
           (191 525 "questiondown") (193 286 "grave") (194 286 "acute") (195 286 "circumflex")
           (196 286 "tilde") (197 286 "macron") (198 286 "breve") (199 286 "dotaccent")
           (200 286 "dieresis") (202 286 "ring") (203 286 "cedilla") (205 286 "hungarumlaut")
           (206 286 "ogonek") (207 286 "caron") (208 859 "emdash") (225 859 "AE")
           (227 318 "ordfeminine") (232 478 "Lslash") (233 668 "Oslash") (234 859 "OE")
           (235 314 "ordmasculine") (241 764 "ae") (245 239 "dotlessi") (248 191 "lslash")
           (249 525 "oslash") (250 811 "oe") (251 525 "germandbls")))
       (setup-laserwriter-metrics
         '(("Helvetica-Oblique" 1000 (-178 -220 1108 944)) (32 239 "space") (33 239 "exclam")
           (34 305 "quotedbl") (35 478 "numbersign") (36 478 "dollar") (37 764 "percent")
           (38 573 "ampersand") (39 191 "quoteright") (40 286 "parenleft") (41 286 "parenright")
           (42 334 "asterisk") (43 502 "plus") (44 239 "comma") (45 286 "hyphen") (46 239 "period")
           (47 239 "slash") (48 478 "zero") (49 478 "one") (50 478 "two") (51 478 "three")
           (52 478 "four") (53 478 "five") (54 478 "six") (55 478 "seven") (56 478 "eight")
           (57 478 "nine") (58 239 "colon") (59 239 "semicolon") (60 502 "less") (61 502 "equal")
           (62 502 "greater") (63 478 "question") (64 872 "at") (65 573 "A") (66 573 "B") (67 620 "C")
           (68 620 "D") (69 573 "E") (70 525 "F") (71 668 "G") (72 620 "H") (73 239 "I") (74 430 "J")
           (75 573 "K") (76 478 "L") (77 716 "M") (78 620 "N") (79 668 "O") (80 573 "P") (81 668 "Q")
           (82 620 "R") (83 573 "S") (84 525 "T") (85 620 "U") (86 573 "V") (87 811 "W") (88 573 "X")
           (89 573 "Y") (90 525 "Z") (91 239 "bracketleft") (92 239 "backslash")
           (93 239 "bracketright") (94 403 "asciicircum") (95 478 "underscore") (96 191 "quoteleft")
           (97 478 "a") (98 478 "b") (99 430 "c") (100 478 "d") (101 478 "e") (102 239 "f")
           (103 478 "g") (104 478 "h") (105 191 "i") (106 191 "j") (107 430 "k") (108 191 "l")
           (109 716 "m") (110 478 "n") (111 478 "o") (112 478 "p") (113 478 "q") (114 286 "r")
           (115 430 "s") (116 239 "t") (117 478 "u") (118 430 "v") (119 620 "w") (120 430 "x")
           (121 430 "y") (122 430 "z") (123 287 "braceleft") (124 223 "bar") (125 287 "braceright")
           (126 502 "asciitilde") (161 286 "exclamdown") (162 478 "cent") (163 478 "sterling")
           (164 143 "fraction") (165 478 "yen") (166 478 "florin") (167 478 "section")
           (168 478 "currency") (169 164 "quotesingle") (170 286 "quotedblleft")
           (171 478 "guillemotleft") (172 286 "guilsinglleft") (173 286 "guilsinglright")
           (174 430 "fi") (175 430 "fl") (177 478 "endash") (178 478 "dagger") (179 478 "daggerdbl")
           (180 239 "periodcentered") (182 461 "paragraph") (183 301 "bullet")
           (184 191 "quotesinglbase") (185 286 "quotedblbase") (186 286 "quotedblright")
           (187 478 "guillemotright") (188 859 "ellipsis") (189 859 "perthousand")
           (191 525 "questiondown") (193 286 "grave") (194 286 "acute") (195 286 "circumflex")
           (196 286 "tilde") (197 286 "macron") (198 286 "breve") (199 286 "dotaccent")
           (200 286 "dieresis") (202 286 "ring") (203 286 "cedilla") (205 286 "hungarumlaut")
           (206 286 "ogonek") (207 286 "caron") (208 859 "emdash") (225 859 "AE")
           (227 318 "ordfeminine") (232 478 "Lslash") (233 668 "Oslash") (234 859 "OE")
           (235 314 "ordmasculine") (241 764 "ae") (245 239 "dotlessi") (248 191 "lslash")
           (249 525 "oslash") (250 811 "oe") (251 525 "germandbls")))
       (setup-laserwriter-metrics
         '(("Helvetica-Bold" 1000 (-173 -221 1003 936)) (32 240 "space") (33 288 "exclam")
           (34 410 "quotedbl") (35 481 "numbersign") (36 481 "dollar") (37 768 "percent")
           (38 624 "ampersand") (39 240 "quoteright") (40 288 "parenleft") (41 288 "parenright")
           (42 336 "asterisk") (43 505 "plus") (44 240 "comma") (45 288 "hyphen") (46 240 "period")
           (47 240 "slash") (48 481 "zero") (49 481 "one") (50 481 "two") (51 481 "three")
           (52 481 "four") (53 481 "five") (54 481 "six") (55 481 "seven") (56 481 "eight")
           (57 481 "nine") (58 288 "colon") (59 288 "semicolon") (60 505 "less") (61 505 "equal")
           (62 505 "greater") (63 528 "question") (64 843 "at") (65 624 "A") (66 624 "B") (67 624 "C")
           (68 624 "D") (69 576 "E") (70 528 "F") (71 672 "G") (72 624 "H") (73 240 "I") (74 481 "J")
           (75 624 "K") (76 528 "L") (77 720 "M") (78 624 "N") (79 672 "O") (80 576 "P") (81 672 "Q")
           (82 624 "R") (83 576 "S") (84 528 "T") (85 624 "U") (86 576 "V") (87 816 "W") (88 576 "X")
           (89 576 "Y") (90 528 "Z") (91 288 "bracketleft") (92 240 "backslash")
           (93 288 "bracketright") (94 505 "asciicircum") (95 481 "underscore") (96 240 "quoteleft")
           (97 481 "a") (98 528 "b") (99 481 "c") (100 528 "d") (101 481 "e") (102 288 "f")
           (103 528 "g") (104 528 "h") (105 240 "i") (106 240 "j") (107 481 "k") (108 240 "l")
           (109 768 "m") (110 528 "n") (111 528 "o") (112 528 "p") (113 528 "q") (114 336 "r")
           (115 481 "s") (116 288 "t") (117 528 "u") (118 481 "v") (119 672 "w") (120 481 "x")
           (121 481 "y") (122 432 "z") (123 336 "braceleft") (124 242 "bar") (125 336 "braceright")
           (126 505 "asciitilde") (161 288 "exclamdown") (162 481 "cent") (163 481 "sterling")
           (164 144 "fraction") (165 481 "yen") (166 481 "florin") (167 481 "section")
           (168 481 "currency") (169 206 "quotesingle") (170 432 "quotedblleft")
           (171 481 "guillemotleft") (172 288 "guilsinglleft") (173 288 "guilsinglright")
           (174 528 "fi") (175 528 "fl") (177 481 "endash") (178 481 "dagger") (179 481 "daggerdbl")
           (180 240 "periodcentered") (182 481 "paragraph") (183 303 "bullet")
           (184 240 "quotesinglbase") (185 432 "quotedblbase") (186 432 "quotedblright")
           (187 481 "guillemotright") (188 864 "ellipsis") (189 864 "perthousand")
           (191 528 "questiondown") (193 288 "grave") (194 288 "acute") (195 288 "circumflex")
           (196 288 "tilde") (197 288 "macron") (198 288 "breve") (199 288 "dotaccent")
           (200 288 "dieresis") (202 288 "ring") (203 288 "cedilla") (205 288 "hungarumlaut")
           (206 288 "ogonek") (207 288 "caron") (208 864 "emdash") (225 864 "AE")
           (227 320 "ordfeminine") (232 528 "Lslash") (233 672 "Oslash") (234 864 "OE")
           (235 315 "ordmasculine") (241 768 "ae") (245 240 "dotlessi") (248 240 "lslash")
           (249 528 "oslash") (250 816 "oe") (251 528 "germandbls")))
       (setup-laserwriter-metrics
         '(("Helvetica-BoldOblique" 1000 (-177 -221 1107 936)) (32 240 "space") (33 288 "exclam")
           (34 410 "quotedbl") (35 481 "numbersign") (36 481 "dollar") (37 768 "percent")
           (38 624 "ampersand") (39 240 "quoteright") (40 288 "parenleft") (41 288 "parenright")
           (42 336 "asterisk") (43 505 "plus") (44 240 "comma") (45 288 "hyphen") (46 240 "period")
           (47 240 "slash") (48 481 "zero") (49 481 "one") (50 481 "two") (51 481 "three")
           (52 481 "four") (53 481 "five") (54 481 "six") (55 481 "seven") (56 481 "eight")
           (57 481 "nine") (58 288 "colon") (59 288 "semicolon") (60 505 "less") (61 505 "equal")
           (62 505 "greater") (63 528 "question") (64 843 "at") (65 624 "A") (66 624 "B") (67 624 "C")
           (68 624 "D") (69 576 "E") (70 528 "F") (71 672 "G") (72 624 "H") (73 240 "I") (74 481 "J")
           (75 624 "K") (76 528 "L") (77 720 "M") (78 624 "N") (79 672 "O") (80 576 "P") (81 672 "Q")
           (82 624 "R") (83 576 "S") (84 528 "T") (85 624 "U") (86 576 "V") (87 816 "W") (88 576 "X")
           (89 576 "Y") (90 528 "Z") (91 288 "bracketleft") (92 240 "backslash")
           (93 288 "bracketright") (94 505 "asciicircum") (95 481 "underscore") (96 240 "quoteleft")
           (97 481 "a") (98 528 "b") (99 481 "c") (100 528 "d") (101 481 "e") (102 288 "f")
           (103 528 "g") (104 528 "h") (105 240 "i") (106 240 "j") (107 481 "k") (108 240 "l")
           (109 768 "m") (110 528 "n") (111 528 "o") (112 528 "p") (113 528 "q") (114 336 "r")
           (115 481 "s") (116 288 "t") (117 528 "u") (118 481 "v") (119 672 "w") (120 481 "x")
           (121 481 "y") (122 432 "z") (123 336 "braceleft") (124 242 "bar") (125 336 "braceright")
           (126 505 "asciitilde") (161 288 "exclamdown") (162 481 "cent") (163 481 "sterling")
           (164 144 "fraction") (165 481 "yen") (166 481 "florin") (167 481 "section")
           (168 481 "currency") (169 206 "quotesingle") (170 432 "quotedblleft")
           (171 481 "guillemotleft") (172 288 "guilsinglleft") (173 288 "guilsinglright")
           (174 528 "fi") (175 528 "fl") (177 481 "endash") (178 481 "dagger") (179 481 "daggerdbl")
           (180 240 "periodcentered") (182 481 "paragraph") (183 303 "bullet")
           (184 240 "quotesinglbase") (185 432 "quotedblbase") (186 432 "quotedblright")
           (187 481 "guillemotright") (188 864 "ellipsis") (189 864 "perthousand")
           (191 528 "questiondown") (193 288 "grave") (194 288 "acute") (195 288 "circumflex")
           (196 288 "tilde") (197 288 "macron") (198 288 "breve") (199 288 "dotaccent")
           (200 288 "dieresis") (202 288 "ring") (203 288 "cedilla") (205 288 "hungarumlaut")
           (206 288 "ogonek") (207 288 "caron") (208 864 "emdash") (225 864 "AE")
           (227 320 "ordfeminine") (232 528 "Lslash") (233 672 "Oslash") (234 864 "OE")
           (235 315 "ordmasculine") (241 768 "ae") (245 240 "dotlessi") (248 240 "lslash")
           (249 528 "oslash") (250 816 "oe") (251 528 "germandbls")))
       (setup-laserwriter-metrics '(("Courier" 1000 (-40 -290 640 795)) . 553))
       (setup-laserwriter-metrics '(("Courier-Oblique" 1000 (-85 -290 759 795)) . 553))
       (setup-laserwriter-metrics '(("Courier-Bold" 1000 (-100 -350 700 855)) . 498))
       (setup-laserwriter-metrics '(("Courier-BoldOblique" 1000 (-145 -350 817 855)) . 498))
       (setup-laserwriter-metrics
         '(("Symbol" 1000 (-180 -293 1090 1010)) (32 192 "space") (33 256 "exclam")
           (34 547 "universal") (35 384 "numbersign") (36 421 "existential") (37 639 "percent")
           (38 597 "ampersand") (39 337 "suchthat") (40 256 "parenleft") (41 256 "parenright")
           (42 384 "asteriskmath") (43 421 "plus") (44 192 "comma") (45 421 "minus") (46 192 "period")
           (47 213 "slash") (48 384 "zero") (49 384 "one") (50 384 "two") (51 384 "three")
           (52 384 "four") (53 384 "five") (54 384 "six") (55 384 "seven") (56 384 "eight")
           (57 384 "nine") (58 213 "colon") (59 213 "semicolon") (60 421 "less") (61 421 "equal")
           (62 421 "greater") (63 341 "question") (64 421 "congruent") (65 554 "Alpha")
           (66 512 "Beta") (67 554 "Chi") (68 470 "Delta") (69 469 "Epsilon") (70 586 "Phi")
           (71 463 "Gamma") (72 554 "Eta") (73 256 "Iota") (74 484 "theta1") (75 554 "Kappa")
           (76 526 "Lambda") (77 682 "Mu") (78 554 "Nu") (79 554 "Omicron") (80 589 "Pi")
           (81 569 "Theta") (82 427 "Rho") (83 454 "Sigma") (84 469 "Tau") (85 530 "Upsilon")
           (86 337 "sigma1") (87 589 "Omega") (88 495 "Xi") (89 610 "Psi") (90 469 "Zeta")
           (91 256 "bracketleft") (92 662 "therefore") (93 256 "bracketright")
           (94 505 "perpendicular") (95 384 "underscore") (96 384 "radicalex") (97 484 "alpha")
           (98 421 "beta") (99 421 "chi") (100 379 "delta") (101 337 "epsilon") (102 400 "phi")
           (103 315 "gamma") (104 463 "eta") (105 252 "iota") (106 463 "phi1") (107 421 "kappa")
           (108 421 "lambda") (109 442 "mu") (110 400 "nu") (111 421 "omicron") (112 421 "pi")
           (113 400 "theta") (114 421 "rho") (115 463 "sigma") (116 337 "tau") (117 442 "upsilon")
           (118 547 "omega1") (119 526 "omega") (120 378 "xi") (121 526 "psi") (122 379 "zeta")
           (123 368 "braceleft") (124 153 "bar") (125 368 "braceright") (126 421 "similar")
           (161 476 "Upsilon1") (162 190 "minute") (163 421 "lessequal") (164 128 "fraction")
           (165 547 "infinity") (166 384 "florin") (167 578 "club") (168 578 "diamond")
           (169 578 "heart") (170 578 "spade") (171 800 "arrowboth") (172 757 "arrowleft")
           (173 463 "arrowup") (174 757 "arrowright") (175 463 "arrowdown") (176 307 "degree")
           (177 421 "plusminus") (178 315 "second") (179 421 "greaterequal") (180 421 "multiply")
           (181 547 "proportional") (182 379 "partialdiff") (183 353 "bullet") (184 421 "divide")
           (185 421 "notequal") (186 421 "equivalence") (187 421 "approxequal") (188 767 "ellipsis")
           (189 463 "arrowvertex") (190 767 "arrowhorizex") (191 505 "carriagereturn")
           (192 632 "aleph") (193 526 "Ifraktur") (194 610 "Rfraktur") (195 757 "weierstrass")
           (196 589 "circlemultiply") (197 589 "circleplus") (198 632 "emptyset")
           (199 589 "intersection") (200 589 "union") (201 547 "propersuperset")
           (202 547 "reflexsuperset") (203 547 "notsubset") (204 547 "propersubset")
           (205 547 "reflexsubset") (206 547 "element") (207 547 "notelement") (208 589 "angle")
           (209 547 "gradient") (210 606 "registerserif") (211 606 "copyrightserif")
           (212 683 "trademarkserif") (213 632 "product") (214 421 "radical") (215 192 "dotmath")
           (216 547 "logicalnot") (217 463 "logicaland") (218 463 "logicalor")
           (219 800 "arrowdblboth") (220 757 "arrowdblleft") (221 463 "arrowdblup")
           (222 757 "arrowdblright") (223 463 "arrowdbldown") (224 379 "lozenge")
           (225 252 "angleleft") (226 606 "registersans") (227 606 "copyrightsans")
           (228 603 "trademarksans") (229 547 "summation") (230 295 "parenlefttp")
           (231 295 "parenleftex") (232 295 "parenleftbt") (233 295 "bracketlefttp")
           (234 295 "bracketleftex") (235 295 "bracketleftbt") (236 379 "bracelefttp")
           (237 379 "braceleftmid") (238 379 "braceleftbt") (239 379 "braceex") (241 252 "angleright")
           (242 210 "integral") (243 526 "integraltp") (244 526 "integralex") (245 526 "integralbt")
           (246 295 "parenrighttp") (247 295 "parenrightex") (248 295 "parenrightbt")
           (249 295 "bracketrighttp") (250 295 "bracketrightex") (251 295 "bracketrightbt")
           (252 379 "bracerighttp") (253 379 "bracerightmid") (254 379 "bracerightbt"))))
