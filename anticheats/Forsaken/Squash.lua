-- https://lua.expert
-- this might NOT be  the anticheat, but i think it is. hope u enjoy this

local function getbuf(p1) -- line: 9
    return p1[1]
end

local function setbuf(p2, p3) -- line: 13
    p2[1] = p3
end

local function getpos(p4) -- line: 17
    return (buffer.readu32(p4, 0))
end

local function setpos(p5, p6) -- line: 21
    buffer.writeu32(p5, 0, p6)
end

local function newcursor(p7, p8) -- line: 25
    local v1 = buffer.create((p7 or 8) + 4)

    buffer.writeu32(v1, 0, (p8 or 0) + 4)

    return { v1 }
end

local function frombuffer(p9, p10) -- line: 31
    local v3 = buffer.len(p9)
    local v4 = buffer.create(v3 + 4)

    buffer.writeu32(v4, 0, (p10 or v3) + 4)
    buffer.copy(v4, 4, p9, 0, v3)

    return { v4 }
end

local function tobuffer(p11) -- line: 40
    local v6 = p11[1]
    local v7 = buffer.readu32(v6, 0)
    local v8 = buffer.create(v7 - 4)

    buffer.copy(v8, 0, v6, 4, v7 - 4)

    return v8
end

local function tryrealloc(p12, p13) -- line: 48
    local v9 = p12[1]
    local v10 = buffer.readu32(v9, 0)
    local v11 = buffer.len(v9)
    local v12 = v10 + p13

    if not (v11 < v12) then
        return
    end

    local v13

    while true do
        v13 = v11 * 2

        if v12 < v13 then
            break
        end

        v11 = v13
    end

    local v14 = buffer.create(v13)

    buffer.copy(v14, 0, v9, 0, v10)
    p12[1] = v14
end

local function pushu1(p14, p15) -- line: 64
    local v15 = p14[1]
    local v16 = buffer.readu32(v15, 0)

    buffer.writeu32(v15, 0, v16 + 1)
    buffer.writeu8(v15, v16, p15)
end

local function popu1(p16) -- line: 71
    local v18 = p16[1]
    local v19 = buffer.readu32(v18, 0) - 1

    buffer.writeu32(v18, 0, v19)

    return (buffer.readu8(v18, v19))
end

local function pushu2(p17, p18) -- line: 78
    local v20 = p17[1]
    local v21 = buffer.readu32(v20, 0)

    buffer.writeu32(v20, 0, v21 + 2)
    buffer.writeu16(v20, v21, p18)
end

local function popu2(p19) -- line: 85
    local v23 = p19[1]
    local v24 = buffer.readu32(v23, 0) - 2

    buffer.writeu32(v23, 0, v24)

    return (buffer.readu16(v23, v24))
end

local function pushu3(p20, p21) -- line: 92
    local v25 = p20[1]
    local v26 = buffer.readu32(v25, 0)

    buffer.writeu32(v25, 0, v26 + 3)
    buffer.writeu8(v25, v26, p21)
    buffer.writeu16(v25, v26 + 1, p21 // 256)
end

local function popu3(p22) -- line: 100
    local v30 = p22[1]
    local v31 = buffer.readu32(v30, 0) - 3
    local v32 = buffer.readu8(v30, v31)
    local v34 = buffer.readu16(v30, v31 + 1)

    buffer.writeu32(v30, 0, v31)

    return v32 + v34 * 256
end

local function pushu4(p23, p24) -- line: 109
    local v35 = p23[1]
    local v36 = buffer.readu32(v35, 0)

    buffer.writeu32(v35, 0, v36 + 4)
    buffer.writeu32(v35, v36, p24)
end

local function popu4(p25) -- line: 116
    local v38 = p25[1]
    local v39 = buffer.readu32(v38, 0) - 4

    buffer.writeu32(v38, 0, v39)

    return (buffer.readu32(v38, v39))
end

local function pushu5(p26, p27) -- line: 123
    local v40 = p26[1]
    local v41 = buffer.readu32(v40, 0)

    buffer.writeu32(v40, 0, v41 + 5)
    buffer.writeu8(v40, v41, p27)
    buffer.writeu32(v40, v41 + 1, p27 // 256)
end

local function popu5(p28) -- line: 131
    local v45 = p28[1]
    local v46 = buffer.readu32(v45, 0) - 5
    local v47 = buffer.readu8(v45, v46)
    local v49 = buffer.readu32(v45, v46 + 1)

    buffer.writeu32(v45, 0, v46)

    return v47 + v49 * 256
end

local function pushu6(p29, p30) -- line: 140
    local v50 = p29[1]
    local v51 = buffer.readu32(v50, 0)

    buffer.writeu32(v50, 0, v51 + 6)
    buffer.writeu16(v50, v51, p30)
    buffer.writeu32(v50, v51 + 2, p30 // 65536)
end

local function popu6(p31) -- line: 148
    local v55 = p31[1]
    local v56 = buffer.readu32(v55, 0) - 6
    local v57 = buffer.readu16(v55, v56)
    local v59 = buffer.readu32(v55, v56 + 2)

    buffer.writeu32(v55, 0, v56)

    return v57 + v59 * 65536
end

local function pushu7(p32, p33) -- line: 157
    local v60 = p32[1]
    local v61 = buffer.readu32(v60, 0)

    buffer.writeu32(v60, 0, v61 + 7)
    buffer.writeu8(v60, v61, p33)
    buffer.writeu16(v60, v61 + 1, p33 // 256)
    buffer.writeu32(v60, v61 + 3, p33 // 16777216)
end

local function popu7(p34) -- line: 166
    local v67 = p34[1]
    local v68 = buffer.readu32(v67, 0) - 7
    local v69 = buffer.readu8(v67, v68)
    local v71 = buffer.readu16(v67, v68 + 1)
    local v73 = buffer.readu32(v67, v68 + 3)

    buffer.writeu32(v67, 0, v68)

    return v69 + v71 * 256 + v73 * 16777216
end

local function pushu8(p35, p36) -- line: 176
    local v74 = p35[1]
    local v75 = buffer.readu32(v74, 0)

    buffer.writeu32(v74, 0, v75 + 8)
    buffer.writeu32(v74, v75, p36)
    buffer.writeu32(v74, v75 + 4, p36 // 4294967296)
end

local function popu8(p37) -- line: 184
    local v79 = p37[1]
    local v80 = buffer.readu32(v79, 0) - 8
    local v81 = buffer.readu32(v79, v80)
    local v83 = buffer.readu32(v79, v80 + 4)

    buffer.writeu32(v79, 0, v80)

    return v81 + v83 * 4294967296
end

local function pushi1(p38, p39) -- line: 193
    local v84 = p38[1]
    local v85 = buffer.readu32(v84, 0)

    buffer.writeu32(v84, 0, v85 + 1)
    buffer.writei8(v84, v85, p39)
end

local function popi1(p40) -- line: 200
    local v87 = p40[1]
    local v88 = buffer.readu32(v87, 0) - 1

    buffer.writeu32(v87, 0, v88)

    return (buffer.readi8(v87, v88))
end

local function pushi2(p41, p42) -- line: 207
    local v89 = p41[1]
    local v90 = buffer.readu32(v89, 0)

    buffer.writeu32(v89, 0, v90 + 2)
    buffer.writei16(v89, v90, p42)
end

local function popi2(p43) -- line: 214
    local v92 = p43[1]
    local v93 = buffer.readu32(v92, 0) - 2

    buffer.writeu32(v92, 0, v93)

    return (buffer.readi16(v92, v93))
end

local function pushi3(p44, p45) -- line: 221
    local v94 = p45 % 16777216
    local v95 = p44[1]
    local v96 = buffer.readu32(v95, 0)

    buffer.writeu32(v95, 0, v96 + 3)
    buffer.writeu8(v95, v96, v94 % 256)
    buffer.writeu16(v95, v96 + 1, v94 / 256)
end

local function popi3(p46) -- line: 230
    local v101 = p46[1]
    local v102 = buffer.readu32(v101, 0) - 3
    local v103 = buffer.readu8(v101, v102)
    local v105 = buffer.readu16(v101, v102 + 1)

    buffer.writeu32(v101, 0, v102)

    local v106 = v103 + v105 * 256

    if v106 >= 8388608 then
        return v106 - 16777216
    end

    return v106
end

local function pushi4(p47, p48) -- line: 240
    local v107 = p47[1]
    local v108 = buffer.readu32(v107, 0)

    buffer.writeu32(v107, 0, v108 + 4)
    buffer.writei32(v107, v108, p48)
end

local function popi4(p49) -- line: 247
    local v110 = p49[1]
    local v111 = buffer.readu32(v110, 0) - 4

    buffer.writeu32(v110, 0, v111)

    return (buffer.readi32(v110, v111))
end

local function pushi5(p50, p51) -- line: 254
    local v112 = p51 % 1099511627776
    local v113 = p50[1]
    local v114 = buffer.readu32(v113, 0)

    buffer.writeu32(v113, 0, v114 + 5)
    buffer.writeu8(v113, v114, v112)
    buffer.writeu32(v113, v114 + 1, v112 / 256)
end

local function popi5(p52) -- line: 263
    local v118 = p52[1]
    local v119 = buffer.readu32(v118, 0) - 5

    buffer.writeu32(v118, 0, v119)

    local v122 = buffer.readu8(v118, v119) + buffer.readu32(v118, v119 + 1) * 256

    if v122 >= 549755813888 then
        return v122 - 1099511627776
    end

    return v122
end

local function pushi6(p53, p54) -- line: 273
    local v123 = p54 % 281474976710656
    local v124 = p53[1]
    local v125 = buffer.readu32(v124, 0)

    buffer.writeu32(v124, 0, v125 + 6)
    buffer.writeu16(v124, v125, v123)
    buffer.writeu32(v124, v125 + 2, v123 / 65536)
end

local function popi6(p55) -- line: 282
    local v129 = p55[1]
    local v130 = buffer.readu32(v129, 0) - 6

    buffer.writeu32(v129, 0, v130)

    local v133 = buffer.readu16(v129, v130) + buffer.readu32(v129, v130 + 2) * 65536

    if v133 >= 140737488355328 then
        return v133 - 281474976710656
    end

    return v133
end

local function pushi7(p56, p57) -- line: 292
    local v134 = p57 % 72057594037927940
    local v135 = p56[1]
    local v136 = buffer.readu32(v135, 0)

    buffer.writeu32(v135, 0, v136 + 7)
    buffer.writeu8(v135, v136, v134)
    buffer.writeu16(v135, v136 + 1, v134 / 256)
    buffer.writeu32(v135, v136 + 3, v134 / 16777216)
end

local function popi7(p58) -- line: 302
    local v142 = p58[1]
    local v143 = buffer.readu32(v142, 0) - 7

    buffer.writeu32(v142, 0, v143)

    local v144 = buffer.readu8(v142, v143)
    local v146 = buffer.readu16(v142, v143 + 1)
    local v148 = buffer.readu32(v142, v143 + 3)
    local v149 = v144 + v146 * 256 + v148 * 16777216

    if v149 >= 36028797018963970 then
        return v149 - 72057594037927940
    end

    return v149
end

local function pushi8(p59, p60) -- line: 313
    local v150 = p60 % 18446744073709552000
    local v151 = p59[1]
    local v152 = buffer.readu32(v151, 0)

    buffer.writeu32(v151, 0, v152 + 8)
    buffer.writeu32(v151, v152, v150)
    buffer.writeu32(v151, v152 + 4, v150 / 4294967296)
end

local function popi8(p61) -- line: 322
    local v156 = p61[1]
    local v157 = buffer.readu32(v156, 0) - 8

    buffer.writeu32(v156, 0, v157)

    local v160 = buffer.readu32(v156, v157) + buffer.readu32(v156, v157 + 4) * 4294967296

    if v160 >= 9223372036854776000 then
        return v160 - 18446744073709552000
    end

    return v160
end

local function pushf4(p62, p63) -- line: 332
    local v161 = p62[1]
    local v162 = buffer.readu32(v161, 0)

    buffer.writeu32(v161, 0, v162 + 4)
    buffer.writef32(v161, v162, p63)
end

local function popf4(p64) -- line: 339
    local v164 = p64[1]
    local v165 = buffer.readu32(v164, 0) - 4

    buffer.writeu32(v164, 0, v165)

    return (buffer.readf32(v164, v165))
end

local function pushf8(p65, p66) -- line: 346
    local v166 = p65[1]
    local v167 = buffer.readu32(v166, 0)

    buffer.writeu32(v166, 0, v167 + 8)
    buffer.writef64(v166, v167, p66)
end

local function popf8(p67) -- line: 353
    local v169 = p67[1]
    local v170 = buffer.readu32(v169, 0) - 8

    buffer.writeu32(v169, 0, v170)

    return (buffer.readf64(v169, v170))
end

local function pushbool(p68, p69, p70, p71, p72, p73, p74, p75, p76) -- line: 360
    local v171 = if p69 then 1 else 0

    if p70 then
        v171 += 2
    end

    if p71 then
        v171 += 4
    end

    if p72 then
        v171 += 8
    end

    if p73 then
        v171 += 16
    end

    if p74 then
        v171 += 32
    end

    if p75 then
        v171 += 64
    end

    if p76 then
        v171 += 128
    end

    local v172 = p68[1]
    local v173 = buffer.readu32(v172, 0)

    buffer.writeu32(v172, 0, v173 + 1)
    buffer.writeu8(v172, v173, v171)
end

local function popbool(p77) -- line: 396
    local v175 = p77[1]
    local v176 = buffer.readu32(v175, 0) - 1

    buffer.writeu32(v175, 0, v176)

    local v177 = buffer.readu8(v175, v176)

    return v177 % 2 >= 1, v177 % 4 >= 2, v177 % 8 >= 4, v177 % 16 >= 8, v177 % 32 >= 16, v177 % 64 >= 32, v177 % 128 >= 64, v177 % 256 >= 128
end

local function pushvlqrealloc(p78, p79) -- line: 407
    -- upvalues: tryrealloc (copy)
    local v178 = if not (p79 >= 562949953421312) then if not (p79 >= 4398046511104) then if not (p79 >= 34359738368) then if not (p79 >= 268435456) then if not (p79 >= 2097152) then if not (p79 >= 16384) then if p79 >= 128 then 2 else 1 else 3 else 4 else 5 else 6 else 7 else 8

    tryrealloc(p78, v178)

    local v179 = p79 // 4294967296
    local v180 = p79 - v179 * 4294967296
    local v181 = v180 % 128
    local v182 = p78[1]
    local v183 = buffer.readu32(v182, 0)

    buffer.writeu32(v182, 0, v183 + 1)
    buffer.writeu8(v182, v183, v181)

    if v178 >= 2 then
        v180 = v179 % 128 * 33554432 + v180 // 128
        v179 //= 128

        local v185 = v180 % 128 + 128
        local v186 = p78[1]
        local v187 = buffer.readu32(v186, 0)

        buffer.writeu32(v186, 0, v187 + 1)
        buffer.writeu8(v186, v187, v185)
    end

    if v178 >= 3 then
        v180 = v179 % 128 * 33554432 + v180 // 128
        v179 //= 128

        local v189 = v180 % 128 + 128
        local v190 = p78[1]
        local v191 = buffer.readu32(v190, 0)

        buffer.writeu32(v190, 0, v191 + 1)
        buffer.writeu8(v190, v191, v189)
    end

    if v178 >= 4 then
        v180 = v179 % 128 * 33554432 + v180 // 128
        v179 //= 128

        local v193 = v180 % 128 + 128
        local v194 = p78[1]
        local v195 = buffer.readu32(v194, 0)

        buffer.writeu32(v194, 0, v195 + 1)
        buffer.writeu8(v194, v195, v193)
    end

    if v178 >= 5 then
        v180 = v179 % 128 * 33554432 + v180 // 128
        v179 //= 128

        local v197 = v180 % 128 + 128
        local v198 = p78[1]
        local v199 = buffer.readu32(v198, 0)

        buffer.writeu32(v198, 0, v199 + 1)
        buffer.writeu8(v198, v199, v197)
    end

    if v178 >= 6 then
        v180 = v179 % 128 * 33554432 + v180 // 128
        v179 //= 128

        local v201 = v180 % 128 + 128
        local v202 = p78[1]
        local v203 = buffer.readu32(v202, 0)

        buffer.writeu32(v202, 0, v203 + 1)
        buffer.writeu8(v202, v203, v201)
    end

    if v178 >= 7 then
        v180 = v179 % 128 * 33554432 + v180 // 128
        v179 //= 128

        local v205 = v180 % 128 + 128
        local v206 = p78[1]
        local v207 = buffer.readu32(v206, 0)

        buffer.writeu32(v206, 0, v207 + 1)
        buffer.writeu8(v206, v207, v205)
    end

    if v178 ~= 8 then
        return
    end

    local v209 = (v179 % 128 * 33554432 + v180 // 128) % 128 + 128
    local v210 = p78[1]
    local v211 = buffer.readu32(v210, 0)

    buffer.writeu32(v210, 0, v211 + 1)
    buffer.writeu8(v210, v211, v209)
end

local function popvlq(p80) -- line: 494
    local v213 = p80[1]
    local v214 = buffer.readu32(v213, 0) - 1

    buffer.writeu32(v213, 0, v214)

    local v215 = buffer.readu8(v213, v214)
    local v216 = v215 % 128

    if v215 < 128 then
        return v216
    end

    local v217 = p80[1]
    local v218 = buffer.readu32(v217, 0) - 1

    buffer.writeu32(v217, 0, v218)

    local v219 = buffer.readu8(v217, v218)
    local v220 = v216 * 128 + v219 % 128

    if v219 < 128 then
        return v220
    end

    local v221 = p80[1]
    local v222 = buffer.readu32(v221, 0) - 1

    buffer.writeu32(v221, 0, v222)

    local v223 = buffer.readu8(v221, v222)
    local v224 = v220 * 128 + v223 % 128

    if v223 < 128 then
        return v224
    end

    local v225 = p80[1]
    local v226 = buffer.readu32(v225, 0) - 1

    buffer.writeu32(v225, 0, v226)

    local v227 = buffer.readu8(v225, v226)
    local v228 = v224 * 128 + v227 % 128

    if v227 < 128 then
        return v228
    end

    local v229 = p80[1]
    local v230 = buffer.readu32(v229, 0) - 1

    buffer.writeu32(v229, 0, v230)

    local v231 = buffer.readu8(v229, v230)
    local v232 = v228 * 128 + v231 % 128

    if v231 < 128 then
        return v232
    end

    local v233 = p80[1]
    local v234 = buffer.readu32(v233, 0) - 1

    buffer.writeu32(v233, 0, v234)

    local v235 = buffer.readu8(v233, v234)
    local v236 = v232 * 128 + v235 % 128

    if v235 < 128 then
        return v236
    end

    local v237 = p80[1]
    local v238 = buffer.readu32(v237, 0) - 1

    buffer.writeu32(v237, 0, v238)

    local v239 = buffer.readu8(v237, v238)
    local v240 = v236 * 128 + v239 % 128

    if v239 < 128 then
        return v240
    end

    local v241 = p80[1]
    local v242 = buffer.readu32(v241, 0) - 1

    buffer.writeu32(v241, 0, v242)

    local v243 = buffer.readu8(v241, v242)

    return v240 * 128 + v243 % 128
end

local function pushstr(p81, p82, p83) -- line: 543
    -- upvalues: pushvlqrealloc (copy)
    local v244 = p83 or #p82
    local v245 = p81[1]
    local v246 = buffer.readu32(v245, 0)

    buffer.writestring(v245, v246, p82)
    buffer.writeu32(v245, 0, v246 + v244)

    if not p83 then
        pushvlqrealloc(p81, v244)
    end
end

local function popstr(p84, p85) -- line: 555
    -- upvalues: popvlq (copy)
    p85 = p85 or popvlq(p84)

    local v249 = p84[1]
    local v250 = buffer.readu32(v249, 0) - p85

    buffer.writeu32(v249, 0, v250)

    return buffer.readstring(v249, v250, p85)
end

local function pushbuf(p86, p87, p88) -- line: 563
    -- upvalues: tryrealloc (copy), pushvlqrealloc (copy)
    local v251 = p88 or buffer.len(p87)

    tryrealloc(p86, v251)

    local v252 = p86[1]
    local v253 = buffer.readu32(v252, 0)

    buffer.copy(v252, v253, p87, 0, v251)
    buffer.writeu32(v252, 0, v253 + v251)

    if not p88 then
        pushvlqrealloc(p86, v251)
    end
end

local function popbuf(p89, p90) -- line: 577
    -- upvalues: popvlq (copy)
    p90 = p90 or popvlq(p89)

    local v256 = p89[1]
    local v257 = buffer.readu32(v256, 0) - p90

    buffer.writeu32(v256, 0, v257)

    local v258 = buffer.create(p90)

    buffer.copy(v258, 0, v256, v257, p90)

    return v258
end

local t1 = {
    print = function(p91) -- printcursor | line: 588
        local v259 = p91[1]
        local v260 = buffer.readu32(v259, 0) - 4
        local t2 = { string.byte(buffer.tostring(v259), 5, -1) }
        local n1 = 7

        for i = 1, v260 do
            local v262 = t2[i]

            n1 += (if v262 == 0 then 1 else math.ceil((math.log10(1 + v262)))) + 1
        end

        local v266 = t2[v260 + 1]

        if v266 then
            n1 += (if v266 == 0 then 1 else math.ceil((math.log10(1 + v266)))) // 2
        end

        if #t2 == 0 or v260 == buffer.len(v259) - 4 then
            table.insert(t2, " ")
        end

        print((("Pos: %* / %*\nBuf: { %* }\n%*^"):format(v260, buffer.len(v259) - 4, table.concat(t2, " "), (string.rep(" ", n1)))))
    end,
    cursor = newcursor,
    frombuffer = frombuffer,
    tobuffer = tobuffer,
    tryrealloc = tryrealloc,
    setpos = setpos,
    getpos = getpos,
    setbuf = setbuf,
    getbuf = getbuf,
    T = function(p92) -- T | line: 630
        return p92
    end
}
local t3 = {
    ser = function(p93, p94, p95, p96, p97, p98, p99, p100, p101) -- ser | line: 637
        -- upvalues: tryrealloc (copy)
        tryrealloc(p93, 1)

        local v270 = if p94 then 1 else 0

        if p95 then
            v270 += 2
        end

        if p96 then
            v270 += 4
        end

        if p97 then
            v270 += 8
        end

        if p98 then
            v270 += 16
        end

        if p99 then
            v270 += 32
        end

        if p100 then
            v270 += 64
        end

        if p101 then
            v270 += 128
        end

        local v271 = p93[1]
        local v272 = buffer.readu32(v271, 0)

        buffer.writeu32(v271, 0, v272 + 1)
        buffer.writeu8(v271, v272, v270)
    end,
    des = popbool
}

function t1.boolean() -- line: 643
    -- upvalues: t3 (copy)
    return t3
end

local t4 = {
    ser = function(p102, p103) -- ser | line: 650
        -- upvalues: tryrealloc (copy)
        tryrealloc(p102, 1)

        local v274 = p102[1]
        local v275 = buffer.readu32(v274, 0)

        buffer.writeu32(v274, 0, v275 + 1)
        buffer.writeu8(v274, v275, p103)
    end,
    des = popu1
}

function t1.u8() -- line: 656
    -- upvalues: t4 (copy)
    return t4
end

local t5 = {
    ser = function(p104, p105) -- ser | line: 661
        -- upvalues: tryrealloc (copy)
        tryrealloc(p104, 2)

        local v277 = p104[1]
        local v278 = buffer.readu32(v277, 0)

        buffer.writeu32(v277, 0, v278 + 2)
        buffer.writeu16(v277, v278, p105)
    end,
    des = popu2
}

function t1.u16() -- line: 667
    -- upvalues: t5 (copy)
    return t5
end

local t6 = {
    ser = function(p106, p107) -- ser | line: 672
        -- upvalues: tryrealloc (copy)
        tryrealloc(p106, 3)

        local v280 = p106[1]
        local v281 = buffer.readu32(v280, 0)

        buffer.writeu32(v280, 0, v281 + 3)
        buffer.writeu8(v280, v281, p107)
        buffer.writeu16(v280, v281 + 1, p107 // 256)
    end,
    des = popu3
}

function t1.u24() -- line: 678
    -- upvalues: t6 (copy)
    return t6
end

local t7 = {
    ser = function(p108, p109) -- ser | line: 683
        -- upvalues: tryrealloc (copy)
        tryrealloc(p108, 4)

        local v285 = p108[1]
        local v286 = buffer.readu32(v285, 0)

        buffer.writeu32(v285, 0, v286 + 4)
        buffer.writeu32(v285, v286, p109)
    end,
    des = popu4
}

function t1.u32() -- line: 689
    -- upvalues: t7 (copy)
    return t7
end

local t8 = {
    ser = function(p110, p111) -- ser | line: 694
        -- upvalues: tryrealloc (copy)
        tryrealloc(p110, 5)

        local v288 = p110[1]
        local v289 = buffer.readu32(v288, 0)

        buffer.writeu32(v288, 0, v289 + 5)
        buffer.writeu8(v288, v289, p111)
        buffer.writeu32(v288, v289 + 1, p111 // 256)
    end,
    des = popu5
}

function t1.u40() -- line: 700
    -- upvalues: t8 (copy)
    return t8
end

local t9 = {
    ser = function(p112, p113) -- ser | line: 705
        -- upvalues: tryrealloc (copy)
        tryrealloc(p112, 6)

        local v293 = p112[1]
        local v294 = buffer.readu32(v293, 0)

        buffer.writeu32(v293, 0, v294 + 6)
        buffer.writeu16(v293, v294, p113)
        buffer.writeu32(v293, v294 + 2, p113 // 65536)
    end,
    des = popu6
}

function t1.u48() -- line: 711
    -- upvalues: t9 (copy)
    return t9
end

local t10 = {
    ser = function(p114, p115) -- ser | line: 716
        -- upvalues: tryrealloc (copy)
        tryrealloc(p114, 7)

        local v298 = p114[1]
        local v299 = buffer.readu32(v298, 0)

        buffer.writeu32(v298, 0, v299 + 7)
        buffer.writeu8(v298, v299, p115)
        buffer.writeu16(v298, v299 + 1, p115 // 256)
        buffer.writeu32(v298, v299 + 3, p115 // 16777216)
    end,
    des = popu7
}

function t1.u56() -- line: 722
    -- upvalues: t10 (copy)
    return t10
end

local t11 = {
    ser = function(p116, p117) -- ser | line: 727
        -- upvalues: tryrealloc (copy)
        tryrealloc(p116, 8)

        local v305 = p116[1]
        local v306 = buffer.readu32(v305, 0)

        buffer.writeu32(v305, 0, v306 + 8)
        buffer.writeu32(v305, v306, p117)
        buffer.writeu32(v305, v306 + 4, p117 // 4294967296)
    end,
    des = popu8
}

function t1.u64() -- line: 733
    -- upvalues: t11 (copy)
    return t11
end

local t12 = {
    ser = function(p118, p119) -- ser | line: 740
        -- upvalues: tryrealloc (copy)
        tryrealloc(p118, 1)

        local v310 = p118[1]
        local v311 = buffer.readu32(v310, 0)

        buffer.writeu32(v310, 0, v311 + 1)
        buffer.writei8(v310, v311, p119)
    end,
    des = popi1
}

function t1.i8() -- line: 746
    -- upvalues: t12 (copy)
    return t12
end

local t13 = {
    ser = function(p120, p121) -- ser | line: 751
        -- upvalues: tryrealloc (copy)
        tryrealloc(p120, 2)

        local v313 = p120[1]
        local v314 = buffer.readu32(v313, 0)

        buffer.writeu32(v313, 0, v314 + 2)
        buffer.writei16(v313, v314, p121)
    end,
    des = popi2
}

function t1.i16() -- line: 757
    -- upvalues: t13 (copy)
    return t13
end

local t14 = {
    ser = function(p122, p123) -- ser | line: 762
        -- upvalues: tryrealloc (copy)
        tryrealloc(p122, 3)

        local v316 = p123 % 16777216
        local v317 = p122[1]
        local v318 = buffer.readu32(v317, 0)

        buffer.writeu32(v317, 0, v318 + 3)
        buffer.writeu8(v317, v318, v316 % 256)
        buffer.writeu16(v317, v318 + 1, v316 / 256)
    end,
    des = popi3
}

function t1.i24() -- line: 768
    -- upvalues: t14 (copy)
    return t14
end

local t15 = {
    ser = function(p124, p125) -- ser | line: 773
        -- upvalues: tryrealloc (copy)
        tryrealloc(p124, 4)

        local v323 = p124[1]
        local v324 = buffer.readu32(v323, 0)

        buffer.writeu32(v323, 0, v324 + 4)
        buffer.writei32(v323, v324, p125)
    end,
    des = popi4
}

function t1.i32() -- line: 779
    -- upvalues: t15 (copy)
    return t15
end

local t16 = {
    ser = function(p126, p127) -- ser | line: 784
        -- upvalues: tryrealloc (copy)
        tryrealloc(p126, 5)

        local v326 = p127 % 1099511627776
        local v327 = p126[1]
        local v328 = buffer.readu32(v327, 0)

        buffer.writeu32(v327, 0, v328 + 5)
        buffer.writeu8(v327, v328, v326)
        buffer.writeu32(v327, v328 + 1, v326 / 256)
    end,
    des = popi5
}

function t1.i40() -- line: 790
    -- upvalues: t16 (copy)
    return t16
end

local t17 = {
    ser = function(p128, p129) -- ser | line: 795
        -- upvalues: tryrealloc (copy)
        tryrealloc(p128, 6)

        local v332 = p129 % 281474976710656
        local v333 = p128[1]
        local v334 = buffer.readu32(v333, 0)

        buffer.writeu32(v333, 0, v334 + 6)
        buffer.writeu16(v333, v334, v332)
        buffer.writeu32(v333, v334 + 2, v332 / 65536)
    end,
    des = popi6
}

function t1.i48() -- line: 801
    -- upvalues: t17 (copy)
    return t17
end

local t18 = {
    ser = function(p130, p131) -- ser | line: 806
        -- upvalues: tryrealloc (copy)
        tryrealloc(p130, 7)

        local v338 = p131 % 72057594037927940
        local v339 = p130[1]
        local v340 = buffer.readu32(v339, 0)

        buffer.writeu32(v339, 0, v340 + 7)
        buffer.writeu8(v339, v340, v338)
        buffer.writeu16(v339, v340 + 1, v338 / 256)
        buffer.writeu32(v339, v340 + 3, v338 / 16777216)
    end,
    des = popi7
}

function t1.i56() -- line: 812
    -- upvalues: t18 (copy)
    return t18
end

local t19 = {
    ser = function(p132, p133) -- ser | line: 817
        -- upvalues: tryrealloc (copy)
        tryrealloc(p132, 8)

        local v346 = p133 % 18446744073709552000
        local v347 = p132[1]
        local v348 = buffer.readu32(v347, 0)

        buffer.writeu32(v347, 0, v348 + 8)
        buffer.writeu32(v347, v348, v346)
        buffer.writeu32(v347, v348 + 4, v346 / 4294967296)
    end,
    des = popi8
}

function t1.i64() -- line: 823
    -- upvalues: t19 (copy)
    return t19
end

local t20 = {
    ser = function(p134, p135) -- ser | line: 830
        -- upvalues: tryrealloc (copy)
        tryrealloc(p134, 4)

        local v352 = p134[1]
        local v353 = buffer.readu32(v352, 0)

        buffer.writeu32(v352, 0, v353 + 4)
        buffer.writef32(v352, v353, p135)
    end,
    des = popf4
}

function t1.f32() -- line: 836
    -- upvalues: t20 (copy)
    return t20
end

local t21 = {
    ser = function(p136, p137) -- ser | line: 841
        -- upvalues: tryrealloc (copy)
        tryrealloc(p136, 8)

        local v355 = p136[1]
        local v356 = buffer.readu32(v355, 0)

        buffer.writeu32(v355, 0, v356 + 8)
        buffer.writef64(v355, v356, p137)
    end,
    des = popf8
}

function t1.f64() -- line: 847
    -- upvalues: t21 (copy)
    return t21
end

local function getNumberSizePushPop(p138) -- line: 852
    -- upvalues: pushu1 (copy), popu1 (copy), pushu2 (copy), popu2 (copy), pushu3 (copy), popu3 (copy), pushu4 (copy), popu4 (copy), pushu5 (copy), popu5 (copy), pushu6 (copy), popu6 (copy), pushu7 (copy), popu7 (copy), pushu8 (copy), popu8 (copy), pushi1 (copy), popi1 (copy), pushi2 (copy), popi2 (copy), pushi3 (copy), popi3 (copy), pushi4 (copy), popi4 (copy), pushi5 (copy), popi5 (copy), pushi6 (copy), popi6 (copy), pushi7 (copy), popi7 (copy), pushi8 (copy), popi8 (copy), pushf4 (copy), popf4 (copy), pushf8 (copy), popf8 (copy), t1 (copy)
    if p138 == t1.f64() then
        return 8, pushf8, popf8
    end

    if p138 == t1.f32() then
        return 4, pushf4, popf4
    end

    if p138 == t1.u8() then
        return 1, pushu1, popu1
    end

    if p138 == t1.u16() then
        return 2, pushu2, popu2
    end

    if p138 == t1.u24() then
        return 3, pushu3, popu3
    end

    if p138 == t1.u32() then
        return 4, pushu4, popu4
    end

    if p138 == t1.u40() then
        return 5, pushu5, popu5
    end

    if p138 == t1.u48() then
        return 6, pushu6, popu6
    end

    if p138 == t1.u56() then
        return 7, pushu7, popu7
    end

    if p138 == t1.u64() then
        return 8, pushu8, popu8
    end

    if p138 == t1.i8() then
        return 1, pushi1, popi1
    end

    if p138 == t1.i16() then
        return 2, pushi2, popi2
    end

    if p138 == t1.i24() then
        return 3, pushi3, popi3
    end

    if p138 == t1.i32() then
        return 4, pushi4, popi4
    end

    if p138 == t1.i40() then
        return 5, pushi5, popi5
    end

    if p138 == t1.i48() then
        return 6, pushi6, popi6
    end

    if p138 == t1.i56() then
        return 7, pushi7, popi7
    end

    if p138 == t1.i64() then
        return 8, pushi8, popi8
    end

    return nil, p138.ser, p138.des
end

local t22 = {}

function t1.vector2(p139) -- line: 900
    -- upvalues: tryrealloc (copy), getNumberSizePushPop (copy), t22 (copy)
    if t22[p139] then
        return t22[p139]
    end

    local v358, v359, v360 = getNumberSizePushPop(p139)
    local v361 = v358
    local t23 = {}

    if v358 then
        v361 = v358 * 2

        function t23.ser(p140, p141) -- line: 914
            -- upvalues: v361 (ref), v359 (copy), tryrealloc (copy)
            tryrealloc(p140, v361)
            v359(p140, p141.y)
            v359(p140, p141.x)
        end
    else
        function t23.ser(p142, p143) -- line: 908
            -- upvalues: v359 (copy)
            v359(p142, p143.y)
            v359(p142, p143.x)
        end
    end

    function t23.des(p144) -- line: 921
        -- upvalues: v360 (copy)
        return (vector.create(v360(p144), v360(p144)))
    end

    t22[p139] = t23

    return t23
end

local t24 = {}

function t1.vector3(p145) -- line: 932
    -- upvalues: tryrealloc (copy), getNumberSizePushPop (copy), t24 (copy)
    if t24[p145] then
        return t24[p145]
    end

    local v363, v364, v365 = getNumberSizePushPop(p145)
    local v366 = v363
    local t25 = {}

    if v363 then
        v366 = v363 * 3

        function t25.ser(p146, p147) -- line: 947
            -- upvalues: v366 (ref), v364 (copy), tryrealloc (copy)
            tryrealloc(p146, v366)
            v364(p146, p147.z)
            v364(p146, p147.y)
            v364(p146, p147.x)
        end
    else
        function t25.ser(p148, p149) -- line: 940
            -- upvalues: v364 (copy)
            v364(p148, p149.z)
            v364(p148, p149.y)
            v364(p148, p149.x)
        end
    end

    function t25.des(p150) -- line: 955
        -- upvalues: v365 (copy)
        return (vector.create(v365(p150), v365(p150), v365(p150)))
    end

    t24[p145] = t25

    return t25
end

local t26 = {}

function t1.vector4(p151) -- line: 966
    -- upvalues: tryrealloc (copy), getNumberSizePushPop (copy), t26 (copy)
    if t26[p151] then
        return t26[p151]
    end

    local v369, v370, v371 = getNumberSizePushPop(p151)
    local v372 = v369
    local t27 = {}

    if v369 then
        v372 = v369 * 4

        function t27.ser(p152, p153) -- line: 982
            -- upvalues: v372 (ref), v370 (copy), tryrealloc (copy)
            tryrealloc(p152, v372)
            v370(p152, p153.w)
            v370(p152, p153.z)
            v370(p152, p153.y)
            v370(p152, p153.x)
        end
    else
        function t27.ser(p154, p155) -- line: 974
            -- upvalues: v370 (copy)
            v370(p154, p155.w)
            v370(p154, p155.z)
            v370(p154, p155.y)
            v370(p154, p155.x)
        end
    end

    function t27.des(p156) -- line: 991
        -- upvalues: v371 (copy)
        return (vector.create(v371(p156), v371(p156), v371(p156), v371(p156)))
    end

    t26[p151] = t27

    return t27
end

local function v376() -- line: 1001
    return vector.zero.w
end

if pcall(v376) then
    v376 = t1.vector4
else
    v376 = t1.vector3
end

t1.vector = v376

local t28 = {}

function t1.range(p157, p158) -- line: 1010
    -- upvalues: tryrealloc (copy), pushu1 (copy), popu1 (copy), pushu2 (copy), popu2 (copy), pushu3 (copy), popu3 (copy), pushu4 (copy), popu4 (copy), pushu5 (copy), popu5 (copy), pushu6 (copy), popu6 (copy), pushu7 (copy), popu7 (copy), pushu8 (copy), popu8 (copy), t28 (copy)
    local v377 = ("%*_%*"):format(p157, p158)
    local v378 = t28[v377]

    if v378 then
        return v378
    end

    assert(p157 == p157 // 1 and p158 == p158 // 1 and p157 < p158, "min and max must be integers, and min < max")

    local v380 = p158 - p157
    local v381, v382, v383

    if v380 < 256 then
        v381 = pushu1
        v382 = popu1
        v383 = 1
    elseif v380 < 65536 then
        v381 = pushu2
        v382 = popu2
        v383 = 2
    elseif v380 < 16777216 then
        v381 = pushu3
        v382 = popu3
        v383 = 3
    elseif v380 < 4294967296 then
        v381 = pushu4
        v382 = popu4
        v383 = 4
    elseif v380 < 1099511627776 then
        v381 = pushu5
        v382 = popu5
        v383 = 5
    elseif v380 < 281474976710656 then
        v381 = pushu6
        v382 = popu6
        v383 = 6
    elseif v380 < 72057594037927940 then
        v381 = pushu7
        v382 = popu7
        v383 = 7
    else
        v381 = pushu8
        v382 = popu8
        v383 = 8
    end

    local t29 = {
        ser = function(p159, p160) -- ser | line: 1039
            -- upvalues: p157 (copy), v381 (ref), v383 (ref), tryrealloc (copy)
            tryrealloc(p159, v383)
            v381(p159, p160 - p157)
        end,
        des = function(p161) -- des | line: 1043
            -- upvalues: p157 (copy), v382 (ref)
            return v382(p161) + p157
        end
    }

    t28[v377] = t29

    return t29
end

local t30 = {
    ser = function(p162, p163) -- ser | line: 1055
        -- upvalues: tryrealloc (copy), pushvlqrealloc (copy)
        tryrealloc(p162, #p163)

        local v385 = #p163
        local v386 = p162[1]
        local v387 = buffer.readu32(v386, 0)

        buffer.writestring(v386, v387, p163)
        buffer.writeu32(v386, 0, v387 + v385)
        pushvlqrealloc(p162, v385)
    end,
    des = popstr
}
local t31 = {}
local t32 = {
    __call = function(_, p165) -- __call | line: 1064
        -- upvalues: tryrealloc (copy), pushstr (copy), popstr (copy), t30 (copy), t31 (copy)
        if not p165 then
            return t30
        end

        if t31[p165] then
            return t31[p165]
        end

        local t33 = {
            ser = function(p166, p167) -- ser | line: 1074
                -- upvalues: p165 (copy), tryrealloc (copy), pushstr (copy)
                tryrealloc(p166, p165)
                pushstr(p166, p167, p165)
            end,
            des = function(p168) -- des | line: 1079
                -- upvalues: p165 (copy), popstr (copy)
                return popstr(p168, p165)
            end
        }

        t31[p165] = t33

        return t33
    end
}
local t34 = {
    convert = function(p169, p170, p171) -- convert | line: 1088
        local t35 = {}

        for i = 1, #p170 do
            t35[string.byte(p170, i)] = i - 1
        end

        local t36 = {}

        for i = 1, #p171 do
            t36[i - 1] = string.byte(p171, i)
        end

        local t37 = {}

        for i = 1, #p169 do
            table.insert(t37, t35[string.byte(p169, i)])
        end

        local t38 = {}
        local v390 = #p170
        local v391 = #p171

        while #t37 > 0 do
            local n2 = 0

            for i = 1, #t37 do
                local v393 = t37[i] + n2 * v390

                t37[i] = v393 // v391
                n2 = v393 % v391
            end

            while #t37 > 0 and t37[1] == 0 do
                table.remove(t37, 1)
            end

            table.insert(t38, 1, (string.char(t36[n2])))
        end

        return table.concat(t38)
    end,
    alphabet = function(p172) -- alphabet | line: 1126
        local t39 = {}
        local v396 = table.create(#p172)

        for i = 1, #p172 do
            local v397 = string.sub(p172, i, i)

            if not t39[v397] then
                t39[v397] = true
                table.insert(v396, v397)
            end
        end

        table.sort(v396)

        return table.concat(v396)
    end,
    binary = "01",
    octal = "01234567",
    decimal = "0123456789",
    duodecimal = "0123456789AB",
    hexadecimal = "0123456789ABCDEF"
}
local v398 = table.create(256)

for i = 0, 255 do
    v398[i + 1] = string.char(i)
end

t34.utf8 = table.concat(v398)
t34.lower = "abcdefghijklmnopqrstuvwxyz"
t34.upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
t34.letters = t34.lower .. t34.upper
t34.punctuation = " .,?!:;'\"-_"
t34.english = t34.letters .. t34.punctuation
t34.filepath = t34.letters .. ":/"
t34.datastore = " !#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[]^_`abcdefghijklmnopqrstuvwxyz{|}~"
t1.string = setmetatable(t34, t32)

local t40 = {}
local t41 = {}

function t1.opt(p173) -- line: 1165
    -- upvalues: tryrealloc (copy), t40 (copy), t41 (copy)
    if t41[p173] then
        return t41[p173]
    end

    local t42 = {
        ser = function(p174, p175) -- ser | line: 1171
            -- upvalues: p173 (copy), tryrealloc (copy)
            if p175 ~= nil then
                p173.ser(p174, p175)
                tryrealloc(p174, 1)

                local v402 = p174[1]
                local v403 = buffer.readu32(v402, 0)

                buffer.writeu32(v402, 0, v403 + 1)
                buffer.writeu8(v402, v403, 1)
            else
                tryrealloc(p174, 1)

                local v399 = p174[1]
                local v400 = buffer.readu32(v399, 0)

                buffer.writeu32(v399, 0, v400 + 1)
                buffer.writeu8(v399, v400, 0)
            end
        end,
        des = function(p176) -- des | line: 1182
            -- upvalues: p173 (copy)
            local v405 = p176[1]
            local v406 = buffer.readu32(v405, 0) - 1

            buffer.writeu32(v405, 0, v406)

            if buffer.readu8(v405, v406) == 1 then
                return p173.des(p176)
            end

            return nil
        end
    }

    t41[p173] = t42
    t40[t42] = p173

    return t42
end

local t43 = {
    ser = function(p177, p178) -- ser | line: 1198
        -- upvalues: tryrealloc (copy), pushbuf (copy)
        tryrealloc(p177, buffer.len(p178))
        pushbuf(p177, p178)
    end,
    des = popbuf
}
local t44 = {}

function t1.buffer(p179) -- line: 1205
    -- upvalues: tryrealloc (copy), pushbuf (copy), popbuf (copy), t43 (copy), t44 (copy)
    if not p179 then
        return t43
    end

    if t44[p179] then
        return t44[p179]
    end

    local t45 = {
        ser = function(p180, p181) -- ser | line: 1215
            -- upvalues: p179 (copy), tryrealloc (copy), pushbuf (copy)
            tryrealloc(p180, p179)
            pushbuf(p180, p181, p179)
        end,
        des = function(p182) -- des | line: 1220
            -- upvalues: p179 (copy), popbuf (copy)
            return (popbuf(p182, p179))
        end
    }

    t44[p179] = t45

    return t45
end

local t46 = {
    ser = pushvlqrealloc,
    des = popvlq
}

function t1.vlq() -- line: 1234
    -- upvalues: t46 (copy)
    return t46
end

local function serbitarr(p183, p184, p185) -- line: 1241
    p185 = p185 or #p184

    if p185 == 0 then
        return
    end

    local v408 = p185 % 8
    local v409 = p185 - v408

    for i = 0, v409 - 1, 8 do
        local v410 = p184[i + 1]
        local v411 = p184[i + 2]
        local v412 = p184[i + 3]
        local v413 = p184[i + 4]
        local v414 = p184[i + 5]
        local v415 = p184[i + 6]
        local v416 = p184[i + 7]
        local v417 = p184[i + 8]
        local v418 = if v410 then 1 else 0

        if v411 then
            v418 += 2
        end

        if v412 then
            v418 += 4
        end

        if v413 then
            v418 += 8
        end

        if v414 then
            v418 += 16
        end

        if v415 then
            v418 += 32
        end

        if v416 then
            v418 += 64
        end

        if v417 then
            v418 += 128
        end

        local v419 = p183[1]
        local v420 = buffer.readu32(v419, 0)

        buffer.writeu32(v419, 0, v420 + 1)
        buffer.writeu8(v419, v420, v418)
    end

    if v408 == 1 then
        local v422 = if p184[v409 + 1] then 1 else 0
        local v423 = p183[1]
        local v424 = buffer.readu32(v423, 0)

        buffer.writeu32(v423, 0, v424 + 1)
        buffer.writeu8(v423, v424, v422)
    elseif v408 == 2 then
        local v426 = p184[v409 + 1]
        local v427 = p184[v409 + 2]
        local v428 = if v426 then 1 else 0

        if v427 then
            v428 += 2
        end

        local v429 = p183[1]
        local v430 = buffer.readu32(v429, 0)

        buffer.writeu32(v429, 0, v430 + 1)
        buffer.writeu8(v429, v430, v428)
    elseif v408 == 3 then
        local v432 = p184[v409 + 1]
        local v433 = p184[v409 + 2]
        local v434 = p184[v409 + 3]
        local v435 = if v432 then 1 else 0

        if v433 then
            v435 += 2
        end

        if v434 then
            v435 += 4
        end

        local v436 = p183[1]
        local v437 = buffer.readu32(v436, 0)

        buffer.writeu32(v436, 0, v437 + 1)
        buffer.writeu8(v436, v437, v435)
    elseif v408 == 4 then
        local v439 = p184[v409 + 1]
        local v440 = p184[v409 + 2]
        local v441 = p184[v409 + 3]
        local v442 = p184[v409 + 4]
        local v443 = if v439 then 1 else 0

        if v440 then
            v443 += 2
        end

        if v441 then
            v443 += 4
        end

        if v442 then
            v443 += 8
        end

        local v444 = p183[1]
        local v445 = buffer.readu32(v444, 0)

        buffer.writeu32(v444, 0, v445 + 1)
        buffer.writeu8(v444, v445, v443)
    elseif v408 == 5 then
        local v447 = p184[v409 + 1]
        local v448 = p184[v409 + 2]
        local v449 = p184[v409 + 3]
        local v450 = p184[v409 + 4]
        local v451 = p184[v409 + 5]
        local v452 = if v447 then 1 else 0

        if v448 then
            v452 += 2
        end

        if v449 then
            v452 += 4
        end

        if v450 then
            v452 += 8
        end

        if v451 then
            v452 += 16
        end

        local v453 = p183[1]
        local v454 = buffer.readu32(v453, 0)

        buffer.writeu32(v453, 0, v454 + 1)
        buffer.writeu8(v453, v454, v452)
    elseif v408 == 6 then
        local v456 = p184[v409 + 1]
        local v457 = p184[v409 + 2]
        local v458 = p184[v409 + 3]
        local v459 = p184[v409 + 4]
        local v460 = p184[v409 + 5]
        local v461 = p184[v409 + 6]
        local v462 = if v456 then 1 else 0

        if v457 then
            v462 += 2
        end

        if v458 then
            v462 += 4
        end

        if v459 then
            v462 += 8
        end

        if v460 then
            v462 += 16
        end

        if v461 then
            v462 += 32
        end

        local v463 = p183[1]
        local v464 = buffer.readu32(v463, 0)

        buffer.writeu32(v463, 0, v464 + 1)
        buffer.writeu8(v463, v464, v462)
    elseif v408 == 7 then
        local v466 = p184[v409 + 1]
        local v467 = p184[v409 + 2]
        local v468 = p184[v409 + 3]
        local v469 = p184[v409 + 4]
        local v470 = p184[v409 + 5]
        local v471 = p184[v409 + 6]
        local v472 = p184[v409 + 7]
        local v473 = if v466 then 1 else 0

        if v467 then
            v473 += 2
        end

        if v468 then
            v473 += 4
        end

        if v469 then
            v473 += 8
        end

        if v470 then
            v473 += 16
        end

        if v471 then
            v473 += 32
        end

        if v472 then
            v473 += 64
        end

        local v474 = p183[1]
        local v475 = buffer.readu32(v474, 0)

        buffer.writeu32(v474, 0, v475 + 1)
        buffer.writeu8(v474, v475, v473)
    end
end

local function desbitarr(p186, p187) -- line: 1273
    if p187 == 0 then
        return {}
    end

    local v477 = table.create(p187)
    local v478 = p187 // 8
    local v479 = v478 * 8
    local v480 = p187 % 8

    if v480 > 0 then
        local v481 = p186[1]
        local v482 = buffer.readu32(v481, 0) - 1

        buffer.writeu32(v481, 0, v482)

        local v483 = buffer.readu8(v481, v482)
        local v484 = v483 % 2 >= 1
        local v485 = v483 % 4 >= 2
        local v486 = v483 % 8 >= 4
        local v487 = v483 % 16 >= 8
        local v488 = v483 % 32 >= 16
        local v489 = v483 % 64 >= 32
        local v490 = v483 % 128 >= 64

        if v483 % 256 >= 128 then
        end

        v477[v479 + 1] = v484

        local v491 = v479 + 2

        if not (v480 > 1) then
            v485 = nil
        end

        v477[v491] = v485

        local v492 = v479 + 3

        if not (v480 > 2) then
            v486 = nil
        end

        v477[v492] = v486

        local v493 = v479 + 4

        if not (v480 > 3) then
            v487 = nil
        end

        v477[v493] = v487

        local v494 = v479 + 5

        if not (v480 > 4) then
            v488 = nil
        end

        v477[v494] = v488

        local v495 = v479 + 6

        if not (v480 > 5) then
            v489 = nil
        end

        v477[v495] = v489

        local v496 = v479 + 7

        if not (v480 > 6) then
            v490 = nil
        end

        v477[v496] = v490
    end

    for i = v478 - 1, 0, -1 do
        local v497 = i * 8
        local v498 = v497 + 1
        local v499 = v497 + 2
        local v500 = v497 + 3
        local v501 = v497 + 4
        local v502 = v497 + 5
        local v503 = v497 + 6
        local v504 = v497 + 7
        local v505 = v497 + 8
        local v506 = p186[1]
        local v507 = buffer.readu32(v506, 0) - 1

        buffer.writeu32(v506, 0, v507)

        local v508 = buffer.readu8(v506, v507)
        local v509 = v508 % 2 >= 1
        local v510 = v508 % 4 >= 2
        local v511 = v508 % 8 >= 4
        local v512 = v508 % 16 >= 8
        local v513 = v508 % 32 >= 16
        local v514 = v508 % 64 >= 32
        local v515 = v508 % 128 >= 64
        local v516 = v508 % 256 >= 128

        v477[v498] = v509
        v477[v499] = v510
        v477[v500] = v511
        v477[v501] = v512
        v477[v502] = v513
        v477[v503] = v514
        v477[v504] = v515
        v477[v505] = v516
    end

    return v477
end

local t47 = {}

function t1.array(p188, p189) -- line: 1305
    -- upvalues: tryrealloc (copy), pushvlqrealloc (copy), popvlq (copy), t3 (copy), t40 (copy), serbitarr (copy), desbitarr (copy), t47 (copy)
    local v517 = t47[p188]
    local v518 = p189 or 0
    local v519, t48

    if v517 then
        v519 = v517[v518]
    else
        t48 = {}
        t47[p188] = t48
    end

    if (not v517 or v519) and v517 then
        return v517[v518]
    end

    local v520 = v517 or t48

    if p188 == t3 then
        local t49 = {
            ser = function(p190, p191) -- ser | line: 1319
                -- upvalues: p189 (copy), pushvlqrealloc (copy), serbitarr (copy)
                local v521 = if type(p189) == "number" then p189 else #p191

                serbitarr(p190, p191, v521)

                if p189 then
                    if type(p189) ~= "number" then
                        p189.ser(p190, v521)
                    end
                else
                    pushvlqrealloc(p190, v521)
                end
            end,
            des = function(p192) -- des | line: 1328
                -- upvalues: p189 (copy), popvlq (copy), desbitarr (copy)
                return (desbitarr(p192, if p189 then if type(p189) == "number" then p189 else p189.des(p192) else popvlq(p192)))
            end
        }

        v520[v518] = t49

        return t49
    end

    if t40[p188] then
        local v523 = t40[p188]

        if v523 == t3 then
            local t50 = {
                ser = function(p193, p194) -- ser | line: 1339
                    -- upvalues: p189 (copy), tryrealloc (copy), pushvlqrealloc (copy), serbitarr (copy)
                    local v524 = if type(p189) == "number" then p189 else table.maxn(p194)
                    local v525 = table.create(v524)
                    local v526 = table.create(v524)

                    for i = 1, v524 do
                        local v527 = p194[i]

                        if v527 ~= nil then
                            table.insert(v525, v527)
                            v526[i] = true
                        else
                            v526[i] = false
                        end
                    end

                    tryrealloc(p193, #v525 // 8 + 1 + (1 + v524 // 8))
                    serbitarr(p193, v525)
                    serbitarr(p193, v526)

                    if p189 then
                        if type(p189) ~= "number" then
                            p189.ser(p193, v524)
                        end
                    else
                        pushvlqrealloc(p193, v524)
                    end
                end,
                des = function(p195) -- des | line: 1364
                    -- upvalues: p189 (copy), popvlq (copy), desbitarr (copy)
                    local v530 = if p189 then if type(p189) == "number" then p189 else p189.des(p195) else popvlq(p195)
                    local v531 = desbitarr(p195, v530)
                    local n3 = 0

                    for _, v532 in v531 do
                        n3 += if v532 then 1 else 0
                    end

                    local v533 = desbitarr(p195, n3)
                    local v534 = table.create(v530)
                    local n4 = 1

                    for v535, v536 in v531 do
                        if v536 then
                            v534[v535] = v533[n4]
                            n4 += 1
                        end
                    end

                    return v534
                end
            }

            v520[v518] = t50

            return t50
        end

        local t51 = {
            ser = function(p196, p197) -- ser | line: 1389
                -- upvalues: p189 (copy), v523 (copy), tryrealloc (copy), pushvlqrealloc (copy), serbitarr (copy)
                local ser = v523.ser
                local v537 = if type(p189) == "number" then p189 else table.maxn(p197)
                local v538 = table.create(v537)

                for i = 1, v537 do
                    local v539 = p197[i]

                    if v539 ~= nil then
                        ser(p196, v539)
                        v538[i] = true
                    else
                        v538[i] = false
                    end
                end

                tryrealloc(p196, 1 + v537 // 8)
                serbitarr(p196, v538)

                if p189 then
                    if type(p189) ~= "number" then
                        p189.ser(p196, v537)
                    end
                else
                    pushvlqrealloc(p196, v537)
                end
            end,
            des = function(p198) -- des | line: 1412
                -- upvalues: p189 (copy), v523 (copy), popvlq (copy), desbitarr (copy)
                local des = v523.des
                local v541 = if p189 then if type(p189) == "number" then p189 else p189.des(p198) else popvlq(p198)
                local v542 = desbitarr(p198, v541)
                local v543 = table.create(v541)

                for i = v541, 1, -1 do
                    if v542[i] then
                        v543[i] = des(p198)
                    end
                end

                return v543
            end
        }

        v520[v518] = t51

        return t51
    end

    local t52 = {
        ser = function(p199, p200) -- ser | line: 1432
            -- upvalues: p188 (copy), p189 (copy), pushvlqrealloc (copy)
            local ser = p188.ser
            local v544 = if type(p189) == "number" then p189 else #p200

            for i = 1, v544 do
                ser(p199, p200[i])
            end

            if p189 then
                if type(p189) ~= "number" then
                    p189.ser(p199, v544)
                end
            else
                pushvlqrealloc(p199, v544)
            end
        end,
        des = function(p201) -- des | line: 1445
            -- upvalues: p188 (copy), p189 (copy), popvlq (copy)
            local des = p188.des
            local v545 = if p189 then if type(p189) == "number" then p189 else p189.des(p201) else popvlq(p201)
            local v546 = table.create(v545)

            for i = v545, 1, -1 do
                v546[i] = des(p201)
            end

            return v546
        end
    }

    v520[v518] = t52

    return t52
end

function t1.tuple(...) -- line: 1463
    local t53 = { ... }
    local v547 = #t53

    if v547 == 1 then
        return t53[1]
    end

    return {
        ser = function(p202, ...) -- ser | line: 1471
            -- upvalues: t53 (copy)
            for v548, v549 in { ... } do
                t53[v548].ser(p202, v549)
            end
        end,
        des = function(p203) -- des | line: 1477
            -- upvalues: t53 (copy), v547 (copy)
            local v550 = table.create(v547)

            for i = v547, 1, -1 do
                v550[i] = t53[i].des(p203)
            end

            return table.unpack(v550)
        end
    }
end

function t1.record(p204) -- line: 1491
    -- upvalues: tryrealloc (copy), t3 (copy), t40 (copy), serbitarr (copy), desbitarr (copy)
    local t55 = {}
    local t56 = {}
    local t57 = {}
    local t58 = {}

    for v551, v552 in p204 do
        if type(v551) == "string" then
            local v553 = t40[v552]

            if v553 == t3 then
                table.insert(t58, v551)
            elseif v553 then
                table.insert(t56, v551)
            elseif v552 == t3 then
                table.insert(t57, v551)
            else
                table.insert(t55, v551)
            end
        end
    end

    local v554 = #t55

    table.sort(t55)

    local v555 = #t57

    if v555 > 0 then
        table.sort(t57)
    end

    local v556 = #t56
    local t59 = {}

    if v556 > 0 then
        table.sort(t56)

        for v557, v558 in t56 do
            t59[v557] = t40[p204[v558]]
        end
    end

    local v559 = #t58

    if v559 > 0 then
        table.sort(t58)
    end

    return {
        ser = function(p205, p206) -- ser | line: 1534
            -- upvalues: p204 (copy), t55 (copy), t56 (copy), t57 (copy), t58 (copy), v555 (copy), v556 (copy), t59 (copy), v559 (copy), tryrealloc (copy), serbitarr (copy)
            for _, v560 in t55 do
                local v561 = p206[v560]

                p204[v560].ser(p205, v561)
            end

            local v562 = table.create(v555 + v559)

            for v563, v564 in t57 do
                v562[v563] = p206[v564]
            end

            local v565 = v555
            local v566 = table.create(v559 + v556)

            for v567, v568 in t58 do
                local v569 = p206[v568]

                if v569 ~= nil then
                    v565 += 1
                    v562[v565] = v569
                    v566[v567] = true
                else
                    v566[v567] = false
                end
            end

            for v570, v571 in t56 do
                local v572 = v570 + v559
                local v573 = p206[v571]

                if v573 ~= nil then
                    t59[v570].ser(p205, v573)
                    v566[v572] = true
                else
                    v566[v572] = false
                end
            end

            tryrealloc(p205, v565 + v559 + v556)
            serbitarr(p205, v562, v565)
            serbitarr(p205, v566, v559 + v556)
        end,
        des = function(p207) -- des | line: 1576
            -- upvalues: p204 (copy), t55 (copy), t56 (copy), t57 (copy), t58 (copy), v554 (copy), v555 (copy), v556 (copy), t59 (copy), v559 (copy), desbitarr (copy)
            local t61 = {}
            local v574 = desbitarr(p207, v559 + v556)
            local v575 = v555

            for i = 1, v559 do
                v575 += if v574[i] then 1 else 0
            end

            local v576 = desbitarr(p207, v575)

            for v577, v578 in t57 do
                t61[v578] = v576[v577]
            end

            for i = v559, 1, -1 do
                if v574[i] then
                    t61[t58[i]] = v576[v575]
                    v575 -= 1
                end
            end

            for i = v556, 1, -1 do
                if v574[i + v559] then
                    t61[t56[i]] = t59[i].des(p207)
                end
            end

            for i = v554, 1, -1 do
                local v579 = t55[i]

                t61[v579] = p204[v579].des(p207)
            end

            return t61
        end
    }
end

function t1.map(p208, p209, p210) -- line: 1623
    -- upvalues: pushvlqrealloc (copy), popvlq (copy)
    return {
        ser = function(p211, p212) -- ser | line: 1625
            -- upvalues: p208 (copy), p209 (copy), p210 (copy), pushvlqrealloc (copy)
            local n5 = 0

            for v580, v581 in p212 do
                p209.ser(p211, v581)
                p208.ser(p211, v580)
                n5 += 1
            end

            if p210 then
                if type(p210) ~= "number" then
                    p210.ser(p211, n5)
                end
            else
                pushvlqrealloc(p211, n5)
            end
        end,
        des = function(p213) -- des | line: 1639
            -- upvalues: p208 (copy), p209 (copy), p210 (copy), popvlq (copy)
            local t63 = {}

            for _ = 1, if p210 then if type(p210) == "number" then p210 else p210.des(p213) else popvlq(p213) do
                t63[p208.des(p213)] = p209.des(p213)
            end

            return t63
        end
    }
end

function t1.literal(...) -- line: 1657
    -- upvalues: tryrealloc (copy)
    local t64 = { ... }
    local t65 = {}

    for v582, v583 in t64 do
        t65[v583] = v582 - 1
    end

    return {
        ser = function(p214, p215) -- ser | line: 1666
            -- upvalues: t65 (copy), tryrealloc (copy)
            tryrealloc(p214, 1)

            local v584 = t65[p215]
            local v585 = p214[1]
            local v586 = buffer.readu32(v585, 0)

            buffer.writeu32(v585, 0, v586 + 1)
            buffer.writeu8(v585, v586, v584)
        end,
        des = function(p216) -- des | line: 1671
            -- upvalues: t64 (copy)
            local v588 = p216[1]
            local v589 = buffer.readu32(v588, 0) - 1

            buffer.writeu32(v588, 0, v589)

            return t64[buffer.readu8(v588, v589) + 1]
        end
    }
end

function t1.table(p217, p218) -- line: 1679
    -- upvalues: tryrealloc (copy), pushvlqrealloc (copy), popvlq (copy)
    local t67 = {}
    local t68 = {}

    for v590 in p217 do
        local v591 = #t67 + 1

        t67[v591] = v590
        t68[v590] = v591
    end

    return {
        ser = function(p219, p220) -- ser | line: 1690
            -- upvalues: p217 (copy), p218 (copy), t68 (copy), tryrealloc (copy), pushvlqrealloc (copy)
            local n6 = 0

            for v592, v593 in p220 do
                local v594 = typeof(v593)
                local v595 = p217[v594]

                if v595 then
                    local v596 = typeof(v592)
                    local v597 = p217[v596]

                    if v597 then
                        v595.ser(p219, v593)

                        local v598 = t68[v594] or error("")

                        tryrealloc(p219, 1)

                        local v599 = v598 - 1
                        local v600 = p219[1]
                        local v601 = buffer.readu32(v600, 0)

                        buffer.writeu32(v600, 0, v601 + 1)
                        buffer.writeu8(v600, v601, v599)
                        v597.ser(p219, v592)

                        local v603 = t68[v596] or error("")

                        tryrealloc(p219, 1)

                        local v604 = v603 - 1
                        local v605 = p219[1]
                        local v606 = buffer.readu32(v605, 0)

                        buffer.writeu32(v605, 0, v606 + 1)
                        buffer.writeu8(v605, v606, v604)
                        n6 += 1
                    end
                end
            end

            if p218 then
                if type(p218) ~= "number" then
                    p218.ser(p219, n6)
                end
            else
                pushvlqrealloc(p219, n6)
            end
        end,
        des = function(p221) -- des | line: 1725
            -- upvalues: p217 (copy), p218 (copy), t67 (copy), popvlq (copy)
            local t70 = {}

            for _ = 1, if p218 then if type(p218) == "number" then p218 else p218.des(p221) else popvlq(p221) do
                local v608 = p221[1]
                local v609 = buffer.readu32(v608, 0) - 1

                buffer.writeu32(v608, 0, v609)

                local v612 = p217[t67[buffer.readu8(v608, v609) + 1]].des(p221)
                local v613 = p221[1]
                local v614 = buffer.readu32(v613, 0) - 1

                buffer.writeu32(v613, 0, v614)
                t70[v612] = p217[t67[buffer.readu8(v613, v614) + 1]].des(p221)
            end

            return t70
        end
    }
end

local des

if Axes ~= nil then
    local t71 = {}

    function t71.ser(p222, p223) -- line: 1749
        -- upvalues: tryrealloc (copy)
        tryrealloc(p222, 2)

        local Back, Bottom, Front, Left = p223.Back, p223.Bottom, p223.Front, p223.Left
        local Right, Top = p223.Right, p223.Top
        local v617 = if Back then 1 else 0

        if Bottom then
            v617 += 2
        end

        if Front then
            v617 += 4
        end

        if Left then
            v617 += 8
        end

        if Right then
            v617 += 16
        end

        if Top then
            v617 += 32
        end

        local v618 = p222[1]
        local v619 = buffer.readu32(v618, 0)

        buffer.writeu32(v618, 0, v619 + 1)
        buffer.writeu8(v618, v619, v617)

        local X, Y, Z = p223.X, p223.Y, p223.Z
        local v621 = if X then 1 else 0

        if Y then
            v621 += 2
        end

        if Z then
            v621 += 4
        end

        local v622 = p222[1]
        local v623 = buffer.readu32(v622, 0)

        buffer.writeu32(v622, 0, v623 + 1)
        buffer.writeu8(v622, v623, v621)
    end

    function des(p224) -- line: 1755
        local v625 = p224[1]
        local v626 = buffer.readu32(v625, 0) - 1

        buffer.writeu32(v625, 0, v626)

        local v627 = buffer.readu8(v625, v626)
        local v628 = v627 % 2 >= 1
        local v629 = v627 % 4 >= 2
        local v630 = v627 % 8 >= 4

        if v627 % 16 >= 8 then
        end

        if v627 % 32 >= 16 then
        end

        if v627 % 64 >= 32 then
        end

        if v627 % 128 >= 64 then
        end

        if v627 % 256 >= 128 then
        end

        local v631 = p224[1]
        local v632 = buffer.readu32(v631, 0) - 1

        buffer.writeu32(v631, 0, v632)

        local v633 = buffer.readu8(v631, v632)
        local v634 = v633 % 2 >= 1
        local v635 = v633 % 4 >= 2
        local v636 = v633 % 8 >= 4
        local v637 = v633 % 16 >= 8
        local v638 = v633 % 32 >= 16
        local v639 = v633 % 64 >= 32

        if v633 % 128 >= 64 then
        end

        if v633 % 256 >= 128 then
        end

        return Axes.new(v628 and Enum.Axis.X, v629 and Enum.Axis.Y, v630 and Enum.Axis.Z, v634 and Enum.NormalId.Back, v635 and Enum.NormalId.Bottom, v636 and Enum.NormalId.Front, v637 and Enum.NormalId.Left, v638 and Enum.NormalId.Right, v639 and Enum.NormalId.Top)
    end

    t71.des = des

    function t1.Axes() -- line: 1771
        -- upvalues: t71 (copy)
        return t71
    end
end

if BrickColor ~= nil then
    local t72 = {}

    function t72.ser(p225, p226) -- line: 1778
        -- upvalues: tryrealloc (copy)
        tryrealloc(p225, 2)

        local Number = p226.Number
        local v640 = p225[1]
        local v641 = buffer.readu32(v640, 0)

        buffer.writeu32(v640, 0, v641 + 2)
        buffer.writeu16(v640, v641, Number)
    end

    function des(p227) -- line: 1783
        local v643 = p227[1]
        local v644 = buffer.readu32(v643, 0) - 2

        buffer.writeu32(v643, 0, v644)

        local v645 = buffer.readu16(v643, v644)

        return BrickColor.new(v645)
    end

    t72.des = des

    function t1.BrickColor() -- line: 1788
        -- upvalues: t72 (copy)
        return t72
    end
end

local EnumItem

if Enum ~= nil then
    local t73 = {}

    function t1.EnumItem(p228) -- line: 1796
        -- upvalues: pushvlqrealloc (copy), popvlq (copy), t73 (copy)
        if t73[p228] then
            return t73[p228]
        end

        local EnumItems = p228:GetEnumItems()

        table.sort(EnumItems, function(p229, p230) -- line: 1802
            return p229.Value < p230.Value
        end)

        local t74 = {}
        local v646 = table.create(#EnumItems)

        for v647, v648 in EnumItems do
            t74[v648] = v647
            v646[v647] = v648
        end

        local t75 = {
            ser = function(p231, p232) -- ser | line: 1814
                -- upvalues: t74 (copy), pushvlqrealloc (copy)
                pushvlqrealloc(p231, t74[p232])
            end,
            des = function(p233) -- des | line: 1818
                -- upvalues: v646 (copy), popvlq (copy)
                return v646[popvlq(p233)]
            end
        }

        t73[p228] = t75

        return t75
    end

    EnumItem = t1.EnumItem
end

if CatalogSearchParams ~= nil then
    local t76 = {
        ser = function(p234, p235) -- ser | line: 1832
            -- upvalues: tryrealloc (copy), pushvlqrealloc (copy), EnumItem (ref)
            tryrealloc(p234, #p235.CreatorName + 10 + #p235.SearchKeyword)

            local v650 = if p235.IncludeOffSale then 1 else 0
            local v651 = p234[1]
            local v652 = buffer.readu32(v651, 0)

            buffer.writeu32(v651, 0, v652 + 1)
            buffer.writeu8(v651, v652, v650)

            local Limit = p235.Limit
            local v654 = p234[1]
            local v655 = buffer.readu32(v654, 0)

            buffer.writeu32(v654, 0, v655 + 1)
            buffer.writeu8(v654, v655, Limit)

            local MinPrice = p235.MinPrice
            local v657 = p234[1]
            local v658 = buffer.readu32(v657, 0)

            buffer.writeu32(v657, 0, v658 + 4)
            buffer.writeu32(v657, v658, MinPrice)

            local MaxPrice = p235.MaxPrice
            local v660 = p234[1]
            local v661 = buffer.readu32(v660, 0)

            buffer.writeu32(v660, 0, v661 + 4)
            buffer.writeu32(v660, v661, MaxPrice)

            local CreatorName = p235.CreatorName
            local v663 = #CreatorName
            local v664 = p234[1]
            local v665 = buffer.readu32(v664, 0)

            buffer.writestring(v664, v665, CreatorName)
            buffer.writeu32(v664, 0, v665 + v663)
            pushvlqrealloc(p234, v663)

            local SearchKeyword = p235.SearchKeyword
            local v667 = #SearchKeyword
            local v668 = p234[1]
            local v669 = buffer.readu32(v668, 0)

            buffer.writestring(v668, v669, SearchKeyword)
            buffer.writeu32(v668, 0, v669 + v667)
            pushvlqrealloc(p234, v667)
            EnumItem(Enum.CatalogSortType).ser(p234, p235.SortType)
            EnumItem(Enum.CatalogSortAggregation).ser(p234, p235.SortAggregation)
            EnumItem(Enum.CatalogCategoryFilter).ser(p234, p235.CategoryFilter)
            EnumItem(Enum.SalesTypeFilter).ser(p234, p235.SalesTypeFilter)

            for _, v671 in p235.AssetTypes do
                EnumItem(Enum.AssetType).ser(p234, v671)
            end

            pushvlqrealloc(p234, #p235.AssetTypes)
        end,
        des = function(p236) -- des | line: 1850
            -- upvalues: popvlq (copy), EnumItem (ref)
            local v672 = CatalogSearchParams.new()
            local v673 = popvlq(p236)
            local v674 = table.create(v673)

            for i = v673, 1, -1 do
                v674[i] = EnumItem(Enum.AssetType).des(p236)
            end

            v672.AssetTypes = v674
            v672.SalesTypeFilter = EnumItem(Enum.SalesTypeFilter).des(p236)
            v672.CategoryFilter = EnumItem(Enum.CatalogCategoryFilter).des(p236)
            v672.SortAggregation = EnumItem(Enum.CatalogSortAggregation).des(p236)
            v672.SortType = EnumItem(Enum.CatalogSortType).des(p236)

            local v675 = popvlq(p236)
            local v676 = p236[1]
            local v677 = buffer.readu32(v676, 0) - v675

            buffer.writeu32(v676, 0, v677)
            v672.SearchKeyword = buffer.readstring(v676, v677, v675)

            local v678 = popvlq(p236)
            local v679 = p236[1]
            local v680 = buffer.readu32(v679, 0) - v678

            buffer.writeu32(v679, 0, v680)
            v672.CreatorName = buffer.readstring(v679, v680, v678)

            local v681 = p236[1]
            local v682 = buffer.readu32(v681, 0) - 4

            buffer.writeu32(v681, 0, v682)
            v672.MaxPrice = buffer.readu32(v681, v682)

            local v683 = p236[1]
            local v684 = buffer.readu32(v683, 0) - 4

            buffer.writeu32(v683, 0, v684)
            v672.MinPrice = buffer.readu32(v683, v684)

            local v685 = p236[1]
            local v686 = buffer.readu32(v685, 0) - 1

            buffer.writeu32(v685, 0, v686)
            v672.Limit = buffer.readu8(v685, v686)

            local v687 = p236[1]
            local v688 = buffer.readu32(v687, 0) - 1

            buffer.writeu32(v687, 0, v688)

            local v689 = buffer.readu8(v687, v688)
            local v690 = v689 % 2 >= 1

            if v689 % 4 >= 2 then
            end

            if v689 % 8 >= 4 then
            end

            if v689 % 16 >= 8 then
            end

            if v689 % 32 >= 16 then
            end

            if v689 % 64 >= 32 then
            end

            if v689 % 128 >= 64 then
            end

            if v689 % 256 >= 128 then
            end

            v672.IncludeOffSale = v690

            return v672
        end
    }

    function t1.CatalogSearchParams() -- line: 1872
        -- upvalues: t76 (copy)
        return t76
    end
end

local rotser, rotdes, t77, t78

if CFrame ~= nil then
    local t79 = {
        CFrame.Angles(0, 0, 0),
        CFrame.Angles(1.5707963267948966, 0, 0),
        CFrame.Angles(0, 3.141592653589793, 3.141592653589793),
        CFrame.Angles(-1.5707963267948966, 0, 0),
        CFrame.Angles(0, 3.141592653589793, 1.5707963267948966),
        CFrame.Angles(0, 1.5707963267948966, 1.5707963267948966),
        CFrame.Angles(0, 0, 1.5707963267948966),
        CFrame.Angles(0, -1.5707963267948966, 1.5707963267948966),
        CFrame.Angles(-1.5707963267948966, -1.5707963267948966, 0),
        CFrame.Angles(0, -1.5707963267948966, 0),
        CFrame.Angles(1.5707963267948966, -1.5707963267948966, 0),
        CFrame.Angles(0, 1.5707963267948966, 3.141592653589793),
        CFrame.Angles(0, -1.5707963267948966, 3.141592653589793),
        CFrame.Angles(0, 3.141592653589793, 0),
        CFrame.Angles(-1.5707963267948966, -3.141592653589793, 0),
        CFrame.Angles(0, 0, 3.141592653589793),
        CFrame.Angles(1.5707963267948966, 3.141592653589793, 0),
        CFrame.Angles(0, 0, -1.5707963267948966),
        CFrame.Angles(0, -1.5707963267948966, -1.5707963267948966),
        CFrame.Angles(0, -3.141592653589793, -1.5707963267948966),
        CFrame.Angles(0, 1.5707963267948966, -1.5707963267948966),
        CFrame.Angles(1.5707963267948966, 1.5707963267948966, 0),
        CFrame.Angles(0, 1.5707963267948966, 0),
        CFrame.Angles(-1.5707963267948966, 1.5707963267948966, 0)
    }

    t77 = t79

    local t80 = {}

    t78 = t80

    for v691, v692 in t79 do
        t80[vector.create(v692:ToOrientation())] = v691
    end

    local function rotser2(p237, p238) -- line: 1912
        -- upvalues: tryrealloc (copy), t78 (ref)
        local v693 = t78[vector.create(p238:ToOrientation())]

        if v693 then
            tryrealloc(p237, 1)

            local v694 = p237[1]
            local v695 = buffer.readu32(v694, 0)

            buffer.writeu32(v694, 0, v695 + 1)
            buffer.writeu8(v694, v695, v693)
        else
            local v697, v698 = p238:ToAxisAngle()
            local v700 = v697 * math.sin(v698 / 2)

            tryrealloc(p237, 7)

            local v702 = math.round((v700.Z + 1) * 32768 - 1)
            local v704 = math.round((v700.Y + 1) * 32768 - 1)
            local v706 = math.round((v700.X + 1) * 32768 - 1)
            local v707 = p237[1]
            local v708 = buffer.readu32(v707, 0)

            buffer.writeu32(v707, 0, v708 + 2)
            buffer.writeu16(v707, v708, v702)

            local v710 = p237[1]
            local v711 = buffer.readu32(v710, 0)

            buffer.writeu32(v710, 0, v711 + 2)
            buffer.writeu16(v710, v711, v704)

            local v713 = p237[1]
            local v714 = buffer.readu32(v713, 0)

            buffer.writeu32(v713, 0, v714 + 2)
            buffer.writeu16(v713, v714, v706)

            local v716 = p237[1]
            local v717 = buffer.readu32(v716, 0)

            buffer.writeu32(v716, 0, v717 + 1)
            buffer.writeu8(v716, v717, 0)
        end
    end

    rotser = rotser2

    local function rotdes2(p239) -- line: 1931
        -- upvalues: t77 (ref)
        local v719 = p239[1]
        local v720 = buffer.readu32(v719, 0) - 1

        buffer.writeu32(v719, 0, v720)

        local v721 = buffer.readu8(v719, v720)

        if v721 ~= 0 then
            return t77[v721]
        end

        local v722 = p239[1]
        local v723 = buffer.readu32(v722, 0) - 2

        buffer.writeu32(v722, 0, v723)

        local v724 = (buffer.readu16(v722, v723) + 1) * 0.000030517578125 - 1
        local v725 = p239[1]
        local v726 = buffer.readu32(v725, 0) - 2

        buffer.writeu32(v725, 0, v726)

        local v727 = (buffer.readu16(v725, v726) + 1) * 0.000030517578125 - 1
        local v728 = p239[1]
        local v729 = buffer.readu32(v728, 0) - 2

        buffer.writeu32(v728, 0, v729)

        local v730 = (buffer.readu16(v728, v729) + 1) * 0.000030517578125 - 1
        local v733 = math.sqrt(1 - math.clamp(v724 * v724 + v727 * v727 + v730 * v730, 0, 1))

        return CFrame.new(0, 0, 0, v724, v727, v730, v733)
    end

    rotdes = rotdes2

    local t81 = {
        ser = rotser2,
        des = rotdes2
    }

    function t1.rotation() -- line: 1948
        -- upvalues: t81 (copy)
        return t81
    end
end

local _CFrame

if CFrame ~= nil then
    local t82 = {}

    function t1.CFrame(p240) -- line: 1956
        -- upvalues: tryrealloc (copy), getNumberSizePushPop (copy), rotser (ref), rotdes (ref), t78 (ref), t82 (copy)
        if t82[p240] then
            return t82[p240]
        end

        local v734, v735, v736 = getNumberSizePushPop(p240)
        local v737 = v734
        local t83 = {}

        if v734 then
            v737 = v734 * 3

            function t83.ser(p241, p242) -- line: 1974
                -- upvalues: v737 (ref), v735 (copy), tryrealloc (copy), t78 (ref)
                local v738 = t78[vector.create(p242:ToOrientation())]

                if v738 then
                    tryrealloc(p241, 1 + v737)

                    local v739 = p241[1]
                    local v740 = buffer.readu32(v739, 0)

                    buffer.writeu32(v739, 0, v740 + 1)
                    buffer.writeu8(v739, v740, v738)
                else
                    local v742, v743 = p242:ToAxisAngle()
                    local v745 = v742 * math.sin(v743 / 2)

                    tryrealloc(p241, 7 + v737)

                    local v747 = math.round((v745.Z + 1) * 32768 - 1)
                    local v749 = math.round((v745.Y + 1) * 32768 - 1)
                    local v751 = math.round((v745.X + 1) * 32768 - 1)
                    local v752 = p241[1]
                    local v753 = buffer.readu32(v752, 0)

                    buffer.writeu32(v752, 0, v753 + 2)
                    buffer.writeu16(v752, v753, v747)

                    local v755 = p241[1]
                    local v756 = buffer.readu32(v755, 0)

                    buffer.writeu32(v755, 0, v756 + 2)
                    buffer.writeu16(v755, v756, v749)

                    local v758 = p241[1]
                    local v759 = buffer.readu32(v758, 0)

                    buffer.writeu32(v758, 0, v759 + 2)
                    buffer.writeu16(v758, v759, v751)

                    local v761 = p241[1]
                    local v762 = buffer.readu32(v761, 0)

                    buffer.writeu32(v761, 0, v762 + 1)
                    buffer.writeu8(v761, v762, 0)
                end

                local Position = p242.Position

                v735(p241, Position.Z)
                v735(p241, Position.Y)
                v735(p241, Position.X)
            end
        else
            function t83.ser(p243, p244) -- line: 1964
                -- upvalues: v735 (copy), rotser (ref)
                rotser(p243, p244)

                local Position = p244.Position

                v735(p243, Position.Z)
                v735(p243, Position.Y)
                v735(p243, Position.X)
            end
        end

        function t83.des(p245) -- line: 1999
            -- upvalues: v736 (copy), rotdes (ref)
            local v764 = v736(p245)
            local v765 = v736(p245)
            local v766 = v736(p245)

            return rotdes(p245) + Vector3.new(v764, v765, v766)
        end

        t82[p240] = t83

        return t83
    end

    _CFrame = t1.CFrame
end

local pushcolor3, popcolor3

if Color3 ~= nil then
    function pushcolor3(p246, p247) -- line: 2013
        local v767 = p247.B * 255
        local v768 = p246[1]
        local v769 = buffer.readu32(v768, 0)

        buffer.writeu32(v768, 0, v769 + 1)
        buffer.writeu8(v768, v769, v767)

        local v771 = p247.G * 255
        local v772 = p246[1]
        local v773 = buffer.readu32(v772, 0)

        buffer.writeu32(v772, 0, v773 + 1)
        buffer.writeu8(v772, v773, v771)

        local v775 = p247.R * 255
        local v776 = p246[1]
        local v777 = buffer.readu32(v776, 0)

        buffer.writeu32(v776, 0, v777 + 1)
        buffer.writeu8(v776, v777, v775)
    end

    local function popcolor3_2(p248) -- line: 2019
        local fromRGB = Color3.fromRGB
        local v779 = p248[1]
        local v780 = buffer.readu32(v779, 0) - 1

        buffer.writeu32(v779, 0, v780)

        local v781 = buffer.readu8(v779, v780)
        local v782 = p248[1]
        local v783 = buffer.readu32(v782, 0) - 1

        buffer.writeu32(v782, 0, v783)

        local v784 = buffer.readu8(v782, v783)
        local v785 = p248[1]
        local v786 = buffer.readu32(v785, 0) - 1

        buffer.writeu32(v785, 0, v786)

        return fromRGB(v781, v784, (buffer.readu8(v785, v786)))
    end

    popcolor3 = popcolor3_2

    local t84 = {
        ser = function(p249, p250) -- ser | line: 2024
            -- upvalues: tryrealloc (copy), pushcolor3 (ref)
            tryrealloc(p249, 3)
            pushcolor3(p249, p250)
        end,
        des = popcolor3_2
    }

    function t1.Color3() -- line: 2030
        -- upvalues: t84 (copy)
        return t84
    end
end

local pushcolorsequencekeypoint, popcolorsequencekeypoint

if ColorSequenceKeypoint ~= nil then
    function pushcolorsequencekeypoint(p251, p252) -- line: 2037
        -- upvalues: pushcolor3 (ref)
        pushcolor3(p251, p252.Value)

        local v787 = p252.Time * 255
        local v788 = p251[1]
        local v789 = buffer.readu32(v788, 0)

        buffer.writeu32(v788, 0, v789 + 1)
        buffer.writeu8(v788, v789, v787)
    end

    local function popcolorsequencekeypoint2(p253) -- line: 2042
        -- upvalues: popcolor3 (ref)
        local new = ColorSequenceKeypoint.new
        local v791 = p253[1]
        local v792 = buffer.readu32(v791, 0) - 1

        buffer.writeu32(v791, 0, v792)

        return new(buffer.readu8(v791, v792) / 255, popcolor3(p253))
    end

    popcolorsequencekeypoint = popcolorsequencekeypoint2

    local t85 = {
        ser = function(p254, p255) -- ser | line: 2047
            -- upvalues: tryrealloc (copy), pushcolorsequencekeypoint (ref)
            tryrealloc(p254, 4)
            pushcolorsequencekeypoint(p254, p255)
        end,
        des = popcolorsequencekeypoint2
    }

    function t1.ColorSequenceKeypoint() -- line: 2053
        -- upvalues: t85 (copy)
        return t85
    end
end

if ColorSequence ~= nil then
    local t86 = {
        ser = function(p256, p257) -- ser | line: 2060
            -- upvalues: tryrealloc (copy), pushvlqrealloc (copy), pushcolorsequencekeypoint (ref)
            tryrealloc(p256, #p257.Keypoints * 4)

            for _, v793 in p257.Keypoints do
                pushcolorsequencekeypoint(p256, v793)
            end

            pushvlqrealloc(p256, #p257.Keypoints)
        end,
        des = function(p258) -- des | line: 2068
            -- upvalues: popvlq (copy), popcolorsequencekeypoint (ref)
            local v794 = popvlq(p258)
            local v795 = table.create(v794)

            for i = v794, 1, -1 do
                v795[i] = popcolorsequencekeypoint(p258)
            end

            return ColorSequence.new(v795)
        end
    }

    function t1.ColorSequence() -- line: 2077
        -- upvalues: t86 (copy)
        return t86
    end
end

local des2

if DateTime ~= nil then
    local t87 = {}

    function t87.ser(p259, p260) -- line: 2084
        -- upvalues: tryrealloc (copy)
        tryrealloc(p259, 6)

        local UnixTimestampMillis = p260.UnixTimestampMillis
        local v796 = p259[1]
        local v797 = buffer.readu32(v796, 0)

        buffer.writeu32(v796, 0, v797 + 6)
        buffer.writeu16(v796, v797, UnixTimestampMillis)
        buffer.writeu32(v796, v797 + 2, UnixTimestampMillis // 65536)
    end

    function des2(p261) -- line: 2088
        local fromUnixTimestampMillis = DateTime.fromUnixTimestampMillis
        local v801 = p261[1]
        local v802 = buffer.readu32(v801, 0) - 6
        local v803 = buffer.readu16(v801, v802)
        local v805 = buffer.readu32(v801, v802 + 2)

        buffer.writeu32(v801, 0, v802)

        return fromUnixTimestampMillis(v803 + v805 * 65536)
    end

    t87.des = des2

    function t1.DateTime() -- line: 2092
        -- upvalues: t87 (copy)
        return t87
    end
end

if Faces ~= nil then
    local t88 = {}

    function t88.ser(p262, p263) -- line: 2099
        -- upvalues: tryrealloc (copy)
        tryrealloc(p262, 1)

        local Back, Bottom, Front, Left = p263.Back, p263.Bottom, p263.Front, p263.Left
        local Right, Top = p263.Right, p263.Top
        local v806 = if Back then 1 else 0

        if Bottom then
            v806 += 2
        end

        if Front then
            v806 += 4
        end

        if Left then
            v806 += 8
        end

        if Right then
            v806 += 16
        end

        if Top then
            v806 += 32
        end

        local v807 = p262[1]
        local v808 = buffer.readu32(v807, 0)

        buffer.writeu32(v807, 0, v808 + 1)
        buffer.writeu8(v807, v808, v806)
    end

    function des2(p264) -- line: 2104
        local v810 = p264[1]
        local v811 = buffer.readu32(v810, 0) - 1

        buffer.writeu32(v810, 0, v811)

        local v812 = buffer.readu8(v810, v811)
        local v813 = v812 % 2 >= 1
        local v814 = v812 % 4 >= 2
        local v815 = v812 % 8 >= 4
        local v816 = v812 % 16 >= 8
        local v817 = v812 % 32 >= 16
        local v818 = v812 % 64 >= 32

        if v812 % 128 >= 64 then
        end

        if v812 % 256 >= 128 then
        end

        return Faces.new(v813 and Enum.NormalId.Back, v814 and Enum.NormalId.Bottom, v815 and Enum.NormalId.Front, v816 and Enum.NormalId.Left, v817 and Enum.NormalId.Right, v818 and Enum.NormalId.Top)
    end

    t88.des = des2

    function t1.Faces() -- line: 2116
        -- upvalues: t88 (copy)
        return t88
    end
end

if FloatCurveKey ~= nil then
    local t89 = {
        ser = function(p265, p266) -- ser | line: 2123
            -- upvalues: tryrealloc (copy), EnumItem (ref)
            EnumItem(Enum.KeyInterpolationMode).ser(p265, p266.Interpolation)
            tryrealloc(p265, 8)

            local Value = p266.Value
            local v819 = p265[1]
            local v820 = buffer.readu32(v819, 0)

            buffer.writeu32(v819, 0, v820 + 4)
            buffer.writef32(v819, v820, Value)

            local Time = p266.Time
            local v822 = p265[1]
            local v823 = buffer.readu32(v822, 0)

            buffer.writeu32(v822, 0, v823 + 4)
            buffer.writef32(v822, v823, Time)
        end,
        des = function(p267) -- des | line: 2130
            -- upvalues: EnumItem (ref)
            local new = FloatCurveKey.new
            local v825 = p267[1]
            local v826 = buffer.readu32(v825, 0) - 4

            buffer.writeu32(v825, 0, v826)

            local v827 = buffer.readf32(v825, v826)
            local v828 = p267[1]
            local v829 = buffer.readu32(v828, 0) - 4

            buffer.writeu32(v828, 0, v829)

            return new(v827, buffer.readf32(v828, v829), (EnumItem(Enum.KeyInterpolationMode).des(p267)))
        end
    }

    function t1.FloatCurveKey() -- line: 2134
        -- upvalues: t89 (copy)
        return t89
    end
end

if Font ~= nil then
    local t90 = {
        ser = function(p268, p269) -- ser | line: 2141
            -- upvalues: tryrealloc (copy), pushvlqrealloc (copy), EnumItem (ref)
            local v830 = string.match(p269.Family, "rbxasset://fonts/families/(.+).json") or error((("Invalid font family %*"):format(p269.Family)))

            tryrealloc(p268, #v830 + 1)

            local v831 = #v830
            local v832 = p268[1]
            local v833 = buffer.readu32(v832, 0)

            buffer.writestring(v832, v833, v830)
            buffer.writeu32(v832, 0, v833 + v831)
            pushvlqrealloc(p268, v831)

            local v835 = if p269.Bold then 1 else 0
            local v836 = p268[1]
            local v837 = buffer.readu32(v836, 0)

            buffer.writeu32(v836, 0, v837 + 1)
            buffer.writeu8(v836, v837, v835)
            EnumItem(Enum.FontWeight).ser(p268, p269.Weight)
            EnumItem(Enum.FontStyle).ser(p268, p269.Style)
        end,
        des = function(p270) -- des | line: 2150
            -- upvalues: popvlq (copy), EnumItem (ref)
            local v839 = EnumItem(Enum.FontStyle).des(p270)
            local v840 = EnumItem(Enum.FontWeight).des(p270)
            local v841 = p270[1]
            local v842 = buffer.readu32(v841, 0) - 1

            buffer.writeu32(v841, 0, v842)

            local v843 = buffer.readu8(v841, v842)
            local v844 = v843 % 2 >= 1

            if v843 % 4 >= 2 then
            end

            if v843 % 8 >= 4 then
            end

            if v843 % 16 >= 8 then
            end

            if v843 % 32 >= 16 then
            end

            if v843 % 64 >= 32 then
            end

            if v843 % 128 >= 64 then
            end

            if v843 % 256 >= 128 then
            end

            local v845 = popvlq(p270)
            local v846 = p270[1]
            local v847 = buffer.readu32(v846, 0) - v845

            buffer.writeu32(v846, 0, v847)

            local v848 = buffer.readstring(v846, v847, v845)
            local v849 = Font.new(("rbxasset://fonts/families/%*.json"):format(v848), v840, v839)

            v849.Bold = v844

            return v849
        end
    }

    function t1.Font() -- line: 2160
        -- upvalues: t90 (copy)
        return t90
    end
end

if NumberRange ~= nil then
    local t91 = {}

    function t1.NumberRange(p271) -- line: 2167
        -- upvalues: t91 (copy)
        if t91[p271] then
            return t91[p271]
        end

        local ser, des = p271.ser, p271.des
        local t92 = {
            ser = function(p272, p273) -- ser | line: 2175
                -- upvalues: ser (copy)
                ser(p272, p273.Max)
                ser(p272, p273.Min)
            end,
            des = function(p274) -- des | line: 2180
                -- upvalues: des (copy)
                return NumberRange.new(des(p274), des(p274))
            end
        }

        t91[p271] = t92

        return t92
    end
end

local _NumberSequenceKeypoint

if NumberSequenceKeypoint ~= nil then
    local t93 = {}

    function t1.NumberSequenceKeypoint(p275) -- line: 2192
        -- upvalues: tryrealloc (copy), t93 (copy)
        if t93[p275] then
            return t93[p275]
        end

        local ser, des = p275.ser, p275.des
        local t94 = {
            ser = function(p276, p277) -- ser | line: 2200
                -- upvalues: ser (copy), tryrealloc (copy)
                ser(p276, p277.Value)
                ser(p276, p277.Envelope)
                tryrealloc(p276, 4)

                local Time = p277.Time
                local v850 = p276[1]
                local v851 = buffer.readu32(v850, 0)

                buffer.writeu32(v850, 0, v851 + 4)
                buffer.writef32(v850, v851, Time)
            end,
            des = function(p278) -- des | line: 2207
                -- upvalues: des (copy)
                local v853 = p278[1]
                local v854 = buffer.readu32(v853, 0) - 4

                buffer.writeu32(v853, 0, v854)

                local v855 = buffer.readf32(v853, v854)
                local v856 = des(p278)
                local v857 = des(p278)

                return NumberSequenceKeypoint.new(v855, v857, v856)
            end
        }

        t93[p275] = t94

        return t94
    end

    _NumberSequenceKeypoint = t1.NumberSequenceKeypoint
end

if NumberSequence ~= nil then
    local t95 = {}

    function t1.NumberSequence(p279) -- line: 2222
        -- upvalues: pushvlqrealloc (copy), popvlq (copy), _NumberSequenceKeypoint (ref), t95 (copy)
        if t95[p279] then
            return t95[p279]
        end

        local ser, des = _NumberSequenceKeypoint(p279).ser, _NumberSequenceKeypoint(p279).des
        local t96 = {
            ser = function(p280, p281) -- ser | line: 2230
                -- upvalues: ser (copy), pushvlqrealloc (copy)
                for _, v858 in p281.Keypoints do
                    ser(p280, v858)
                end

                pushvlqrealloc(p280, #p281.Keypoints)
            end,
            des = function(p282) -- des | line: 2238
                -- upvalues: des (copy), popvlq (copy)
                local v859 = popvlq(p282)
                local v860 = table.create(v859)

                for i = v859, 1, -1 do
                    v860[i] = des(p282)
                end

                return NumberSequence.new(v860)
            end
        }

        t95[p279] = t96

        return t96
    end
end

if OverlapParams ~= nil then
    local t97 = {
        ser = function(p283, p284) -- ser | line: 2256
            -- upvalues: tryrealloc (copy), pushvlqrealloc (copy), EnumItem (ref)
            tryrealloc(p283, #p284.CollisionGroup + 3)

            local BruteForceAllSlow, RespectCanCollide = p284.BruteForceAllSlow, p284.RespectCanCollide
            local v861 = if BruteForceAllSlow then 1 else 0

            if RespectCanCollide then
                v861 += 2
            end

            local v862 = p283[1]
            local v863 = buffer.readu32(v862, 0)

            buffer.writeu32(v862, 0, v863 + 1)
            buffer.writeu8(v862, v863, v861)

            local MaxParts = p284.MaxParts
            local v865 = p283[1]
            local v866 = buffer.readu32(v865, 0)

            buffer.writeu32(v865, 0, v866 + 2)
            buffer.writeu16(v865, v866, MaxParts)

            local CollisionGroup = p284.CollisionGroup
            local v868 = #CollisionGroup
            local v869 = p283[1]
            local v870 = buffer.readu32(v869, 0)

            buffer.writestring(v869, v870, CollisionGroup)
            buffer.writeu32(v869, 0, v870 + v868)
            pushvlqrealloc(p283, v868)
            EnumItem(Enum.RaycastFilterType).ser(p283, p284.FilterType)
        end,
        des = function(p285) -- des | line: 2264
            -- upvalues: popvlq (copy), EnumItem (ref)
            local v872 = OverlapParams.new()

            v872.FilterType = EnumItem(Enum.RaycastFilterType).des(p285)

            local v873 = popvlq(p285)
            local v874 = p285[1]
            local v875 = buffer.readu32(v874, 0) - v873

            buffer.writeu32(v874, 0, v875)
            v872.CollisionGroup = buffer.readstring(v874, v875, v873)

            local v876 = p285[1]
            local v877 = buffer.readu32(v876, 0) - 2

            buffer.writeu32(v876, 0, v877)
            v872.MaxParts = buffer.readu16(v876, v877)

            local v878 = p285[1]
            local v879 = buffer.readu32(v878, 0) - 1

            buffer.writeu32(v878, 0, v879)

            local v880 = buffer.readu8(v878, v879)
            local v881 = v880 % 2 >= 1
            local v882 = v880 % 4 >= 2

            if v880 % 8 >= 4 then
            end

            if v880 % 16 >= 8 then
            end

            if v880 % 32 >= 16 then
            end

            if v880 % 64 >= 32 then
            end

            if v880 % 128 >= 64 then
            end

            if v880 % 256 >= 128 then
            end

            v872.BruteForceAllSlow = v881
            v872.RespectCanCollide = v882

            return v872
        end
    }

    function t1.OverlapParams() -- line: 2273
        -- upvalues: t97 (copy)
        return t97
    end
end

if RaycastParams ~= nil then
    local t98 = {
        ser = function(p286, p287) -- ser | line: 2281
            -- upvalues: tryrealloc (copy), pushvlqrealloc (copy), EnumItem (ref)
            tryrealloc(p286, #p287.CollisionGroup + 1)

            local BruteForceAllSlow, RespectCanCollide, IgnoreWater = p287.BruteForceAllSlow, p287.RespectCanCollide, p287.IgnoreWater
            local v883 = if BruteForceAllSlow then 1 else 0

            if RespectCanCollide then
                v883 += 2
            end

            if IgnoreWater then
                v883 += 4
            end

            local v884 = p286[1]
            local v885 = buffer.readu32(v884, 0)

            buffer.writeu32(v884, 0, v885 + 1)
            buffer.writeu8(v884, v885, v883)

            local CollisionGroup = p287.CollisionGroup
            local v887 = #CollisionGroup
            local v888 = p286[1]
            local v889 = buffer.readu32(v888, 0)

            buffer.writestring(v888, v889, CollisionGroup)
            buffer.writeu32(v888, 0, v889 + v887)
            pushvlqrealloc(p286, v887)
            EnumItem(Enum.RaycastFilterType).ser(p286, p287.FilterType)
        end,
        des = function(p288) -- des | line: 2288
            -- upvalues: popvlq (copy), EnumItem (ref)
            local v891 = RaycastParams.new()

            v891.FilterType = EnumItem(Enum.RaycastFilterType).des(p288)

            local v892 = popvlq(p288)
            local v893 = p288[1]
            local v894 = buffer.readu32(v893, 0) - v892

            buffer.writeu32(v893, 0, v894)
            v891.CollisionGroup = buffer.readstring(v893, v894, v892)

            local v895 = p288[1]
            local v896 = buffer.readu32(v895, 0) - 1

            buffer.writeu32(v895, 0, v896)

            local v897 = buffer.readu8(v895, v896)
            local v898 = v897 % 2 >= 1
            local v899 = v897 % 4 >= 2
            local v900 = v897 % 8 >= 4

            if v897 % 16 >= 8 then
            end

            if v897 % 32 >= 16 then
            end

            if v897 % 64 >= 32 then
            end

            if v897 % 128 >= 64 then
            end

            if v897 % 256 >= 128 then
            end

            v891.BruteForceAllSlow = v898
            v891.RespectCanCollide = v899
            v891.IgnoreWater = v900

            return v891
        end
    }

    function t1.RaycastParams() -- line: 2296
        -- upvalues: t98 (copy)
        return t98
    end
end

if Vector2 ~= nil then
    local t99 = {}

    function t1.Vector2(p289) -- line: 2303
        -- upvalues: tryrealloc (copy), getNumberSizePushPop (copy), t99 (copy)
        if t99[p289] then
            return t99[p289]
        end

        local v901, v902, v903 = getNumberSizePushPop(p289)
        local v904 = v901
        local t100 = {}

        if v901 then
            v904 = v901 * 2

            function t100.ser(p290, p291) -- line: 2317
                -- upvalues: v904 (ref), v902 (copy), tryrealloc (copy)
                tryrealloc(p290, v904)
                v902(p290, p291.Y)
                v902(p290, p291.X)
            end
        else
            function t100.ser(p292, p293) -- line: 2311
                -- upvalues: v902 (copy)
                v902(p292, p293.Y)
                v902(p292, p293.X)
            end
        end

        function t100.des(p294) -- line: 2324
            -- upvalues: v903 (copy)
            return Vector2.new(v903(p294), v903(p294))
        end

        t99[p289] = t100

        return t100
    end
end

if PathWaypoint ~= nil then
    local t101 = {}

    function t1.PathWaypoint(p295) -- line: 2335
        -- upvalues: tryrealloc (copy), pushvlqrealloc (copy), popstr (copy), EnumItem (ref), t101 (copy)
        if t101[p295] then
            return t101[p295]
        end

        local ser, des = p295.ser, p295.des
        local t102 = {
            ser = function(p296, p297) -- ser | line: 2343
                -- upvalues: ser (copy), tryrealloc (copy), pushvlqrealloc (copy), EnumItem (ref)
                tryrealloc(p296, #p297.Label)

                local Label = p297.Label
                local v905 = #Label
                local v906 = p296[1]
                local v907 = buffer.readu32(v906, 0)

                buffer.writestring(v906, v907, Label)
                buffer.writeu32(v906, 0, v907 + v905)
                pushvlqrealloc(p296, v905)
                EnumItem(Enum.PathWaypointAction).ser(p296, p297.Action)
                ser(p296, p297.Position.Z)
                ser(p296, p297.Position.Y)
                ser(p296, p297.Position.X)
            end,
            des = function(p298) -- des | line: 2352
                -- upvalues: des (copy), popstr (copy), EnumItem (ref)
                return PathWaypoint.new(Vector3.new(des(p298), des(p298), des(p298)), EnumItem(Enum.PathWaypointAction).des(p298), popstr(p298))
            end
        }

        t101[p295] = t102

        return t102
    end
end

local des3

if PhysicalProperties ~= nil then
    local t103 = {}

    function t103.ser(p299, p300) -- line: 2367
        -- upvalues: tryrealloc (copy)
        tryrealloc(p299, 20)

        local ElasticityWeight = p300.ElasticityWeight
        local v911 = p299[1]
        local v912 = buffer.readu32(v911, 0)

        buffer.writeu32(v911, 0, v912 + 4)
        buffer.writef32(v911, v912, ElasticityWeight)

        local FrictionWeight = p300.FrictionWeight
        local v914 = p299[1]
        local v915 = buffer.readu32(v914, 0)

        buffer.writeu32(v914, 0, v915 + 4)
        buffer.writef32(v914, v915, FrictionWeight)

        local Elasticity = p300.Elasticity
        local v917 = p299[1]
        local v918 = buffer.readu32(v917, 0)

        buffer.writeu32(v917, 0, v918 + 4)
        buffer.writef32(v917, v918, Elasticity)

        local Friction = p300.Friction
        local v920 = p299[1]
        local v921 = buffer.readu32(v920, 0)

        buffer.writeu32(v920, 0, v921 + 4)
        buffer.writef32(v920, v921, Friction)

        local Density = p300.Density
        local v923 = p299[1]
        local v924 = buffer.readu32(v923, 0)

        buffer.writeu32(v923, 0, v924 + 4)
        buffer.writef32(v923, v924, Density)
    end

    function des3(p301) -- line: 2376
        local new = PhysicalProperties.new
        local v926 = p301[1]
        local v927 = buffer.readu32(v926, 0) - 4

        buffer.writeu32(v926, 0, v927)

        local v928 = buffer.readf32(v926, v927)
        local v929 = p301[1]
        local v930 = buffer.readu32(v929, 0) - 4

        buffer.writeu32(v929, 0, v930)

        local v931 = buffer.readf32(v929, v930)
        local v932 = p301[1]
        local v933 = buffer.readu32(v932, 0) - 4

        buffer.writeu32(v932, 0, v933)

        local v934 = buffer.readf32(v932, v933)
        local v935 = p301[1]
        local v936 = buffer.readu32(v935, 0) - 4

        buffer.writeu32(v935, 0, v936)

        local v937 = buffer.readf32(v935, v936)
        local v938 = p301[1]
        local v939 = buffer.readu32(v938, 0) - 4

        buffer.writeu32(v938, 0, v939)

        return new(v928, v931, v934, v937, (buffer.readf32(v938, v939)))
    end

    t103.des = des3

    function t1.PhysicalProperties() -- line: 2380
        -- upvalues: t103 (copy)
        return t103
    end
end

if Ray ~= nil then
    local t104 = {}

    function t1.Ray(p302) -- line: 2387
        -- upvalues: t104 (copy)
        if t104[p302] then
            return t104[p302]
        end

        local ser, des = p302.ser, p302.des
        local t105 = {
            ser = function(p303, p304) -- ser | line: 2395
                -- upvalues: ser (copy)
                ser(p303, p304.Direction.Z)
                ser(p303, p304.Direction.Y)
                ser(p303, p304.Direction.X)
                ser(p303, p304.Origin.Z)
                ser(p303, p304.Origin.Y)
                ser(p303, p304.Origin.X)
            end,
            des = function(p305) -- des | line: 2404
                -- upvalues: des (copy)
                return Ray.new(Vector3.new(des(p305), des(p305), des(p305)), (Vector3.new(des(p305), des(p305), des(p305))))
            end
        }

        t104[p302] = t105

        return t105
    end
end

if RaycastParams ~= nil then
    local t106 = {}

    function t1.RaycastResult(p306) -- line: 2422
        -- upvalues: tryrealloc (copy), EnumItem (ref), t106 (copy)
        if t106[p306] then
            return t106[p306]
        end

        local ser, des = p306.ser, p306.des
        local t107 = {
            ser = function(p307, p308) -- ser | line: 2430
                -- upvalues: ser (copy), tryrealloc (copy), EnumItem (ref)
                tryrealloc(p307, 4)

                local Distance = p308.Distance
                local v945 = p307[1]
                local v946 = buffer.readu32(v945, 0)

                buffer.writeu32(v945, 0, v946 + 4)
                buffer.writef32(v945, v946, Distance)
                ser(p307, p308.Position.Z)
                ser(p307, p308.Position.Y)
                ser(p307, p308.Position.X)
                ser(p307, p308.Normal.Z)
                ser(p307, p308.Normal.Y)
                ser(p307, p308.Normal.X)
                EnumItem(Enum.Material).ser(p307, p308.Material)
            end,
            des = function(p309) -- des | line: 2442
                -- upvalues: des (copy), EnumItem (ref)
                local t108 = {
                    Instance = nil,
                    Material = EnumItem(Enum.Material).des(p309)
                }

                t108.Normal = Vector3.new(des(p309), des(p309), des(p309))
                t108.Position = Vector3.new(des(p309), des(p309), des(p309))

                local v952 = p309[1]
                local v953 = buffer.readu32(v952, 0) - 4

                buffer.writeu32(v952, 0, v953)
                t108.Distance = buffer.readf32(v952, v953)

                return t108
            end
        }

        t106[p306] = t107

        return t107
    end
end

if Vector3 ~= nil then
    local t109 = {}

    function t1.Vector3(p310) -- line: 2460
        -- upvalues: tryrealloc (copy), getNumberSizePushPop (copy), t109 (copy)
        if t109[p310] then
            return t109[p310]
        end

        local v954, v955, v956 = getNumberSizePushPop(p310)
        local v957 = v954
        local t110 = {}

        if v954 then
            v957 = v954 * 3

            function t110.ser(p311, p312) -- line: 2475
                -- upvalues: v957 (ref), v955 (copy), tryrealloc (copy)
                tryrealloc(p311, v957)
                v955(p311, p312.Z)
                v955(p311, p312.Y)
                v955(p311, p312.X)
            end
        else
            function t110.ser(p313, p314) -- line: 2468
                -- upvalues: v955 (copy)
                v955(p313, p314.Z)
                v955(p313, p314.Y)
                v955(p313, p314.X)
            end
        end

        function t110.des(p315) -- line: 2483
            -- upvalues: v956 (copy)
            return (Vector3.new(v956(p315), v956(p315), v956(p315)))
        end

        t109[p310] = t110

        return t110
    end
end

if Rect ~= nil then
    local t111 = {}

    function t1.Rect(p316) -- line: 2494
        -- upvalues: t111 (copy)
        if t111[p316] then
            return t111[p316]
        end

        local ser, des = p316.ser, p316.des
        local t112 = {
            ser = function(p317, p318) -- ser | line: 2502
                -- upvalues: ser (copy)
                ser(p317, p318.Max.Y)
                ser(p317, p318.Max.X)
                ser(p317, p318.Min.Y)
                ser(p317, p318.Min.X)
            end,
            des = function(p319) -- des | line: 2509
                -- upvalues: des (copy)
                return Rect.new(des(p319), des(p319), des(p319), des(p319))
            end
        }

        t111[p316] = t112

        return t112
    end
end

if Region3 ~= nil then
    local t113 = {}

    function t1.Region3(p320) -- line: 2520
        -- upvalues: t113 (copy)
        if t113[p320] then
            return t113[p320]
        end

        local ser, des = p320.ser, p320.des
        local t114 = {
            ser = function(p321, p322) -- ser | line: 2528
                -- upvalues: ser (copy)
                local Size = p322.Size

                ser(p321, Size.Z)
                ser(p321, Size.Y)
                ser(p321, Size.X)

                local CFramePosition = p322.CFrame.Position

                ser(p321, CFramePosition.Z)
                ser(p321, CFramePosition.Y)
                ser(p321, CFramePosition.X)
            end,
            des = function(p323) -- des | line: 2539
                -- upvalues: des (copy)
                local v962 = Vector3.new(des(p323), des(p323), des(p323))
                local v965 = Vector3.new(des(p323), des(p323), des(p323)) * 0.5

                return Region3.new(v962 - v965, v962 + v965)
            end
        }

        t113[p320] = t114

        return t114
    end
end

if Region3int16 ~= nil then
    local t115 = {}

    function t115.ser(p324, p325) -- line: 2552
        -- upvalues: tryrealloc (copy)
        tryrealloc(p324, 12)

        local Max = p325.Max
        local Z = Max.Z
        local v966 = p324[1]
        local v967 = buffer.readu32(v966, 0)

        buffer.writeu32(v966, 0, v967 + 2)
        buffer.writei16(v966, v967, Z)

        local Y = Max.Y
        local v969 = p324[1]
        local v970 = buffer.readu32(v969, 0)

        buffer.writeu32(v969, 0, v970 + 2)
        buffer.writei16(v969, v970, Y)

        local X = Max.X
        local v972 = p324[1]
        local v973 = buffer.readu32(v972, 0)

        buffer.writeu32(v972, 0, v973 + 2)
        buffer.writei16(v972, v973, X)

        local Min = p325.Min
        local Z2 = Min.Z
        local v975 = p324[1]
        local v976 = buffer.readu32(v975, 0)

        buffer.writeu32(v975, 0, v976 + 2)
        buffer.writei16(v975, v976, Z2)

        local Y2 = Min.Y
        local v978 = p324[1]
        local v979 = buffer.readu32(v978, 0)

        buffer.writeu32(v978, 0, v979 + 2)
        buffer.writei16(v978, v979, Y2)

        local X2 = Min.X
        local v981 = p324[1]
        local v982 = buffer.readu32(v981, 0)

        buffer.writeu32(v981, 0, v982 + 2)
        buffer.writei16(v981, v982, X2)
    end

    function des3(p326) -- line: 2564
        local new = Vector3int16.new
        local v984 = p326[1]
        local v985 = buffer.readu32(v984, 0) - 2

        buffer.writeu32(v984, 0, v985)

        local v986 = buffer.readi16(v984, v985)
        local v987 = p326[1]
        local v988 = buffer.readu32(v987, 0) - 2

        buffer.writeu32(v987, 0, v988)

        local v989 = buffer.readi16(v987, v988)
        local v990 = p326[1]
        local v991 = buffer.readu32(v990, 0) - 2

        buffer.writeu32(v990, 0, v991)

        local v992 = new(v986, v989, (buffer.readi16(v990, v991)))
        local new2 = Vector3int16.new
        local v993 = p326[1]
        local v994 = buffer.readu32(v993, 0) - 2

        buffer.writeu32(v993, 0, v994)

        local v995 = buffer.readi16(v993, v994)
        local v996 = p326[1]
        local v997 = buffer.readu32(v996, 0) - 2

        buffer.writeu32(v996, 0, v997)

        local v998 = buffer.readi16(v996, v997)
        local v999 = p326[1]
        local v1000 = buffer.readu32(v999, 0) - 2

        buffer.writeu32(v999, 0, v1000)

        local v1001 = new2(v995, v998, (buffer.readi16(v999, v1000)))

        return Region3int16.new(v992, v1001)
    end

    t115.des = des3

    function t1.Region3int16() -- line: 2570
        -- upvalues: t115 (copy)
        return t115
    end
end

if RotationCurveKey ~= nil then
    local t116 = {}

    function t1.RotationCurveKey(p327) -- line: 2577
        -- upvalues: tryrealloc (copy), EnumItem (ref), _CFrame (ref), t116 (copy)
        if t116[p327] then
            return t116[p327]
        end

        local ser, des = _CFrame(p327).ser, _CFrame(p327).des
        local t117 = {
            ser = function(p328, p329) -- ser | line: 2585
                -- upvalues: ser (copy), tryrealloc (copy), EnumItem (ref)
                EnumItem(Enum.KeyInterpolationMode).ser(p328, p329.Interpolation)
                ser(p328, p329.Value)
                tryrealloc(p328, 4)

                local Time = p329.Time
                local v1002 = p328[1]
                local v1003 = buffer.readu32(v1002, 0)

                buffer.writeu32(v1002, 0, v1003 + 4)
                buffer.writef32(v1002, v1003, Time)
            end,
            des = function(p330) -- des | line: 2592
                -- upvalues: des (copy), EnumItem (ref)
                local new = RotationCurveKey.new
                local v1005 = p330[1]
                local v1006 = buffer.readu32(v1005, 0) - 4

                buffer.writeu32(v1005, 0, v1006)

                return new(buffer.readf32(v1005, v1006), des(p330), (EnumItem(Enum.KeyInterpolationMode).des(p330)))
            end
        }

        t116[p327] = t117

        return t117
    end
end

if TweenInfo ~= nil then
    local t118 = {
        ser = function(p331, p332) -- ser | line: 2607
            -- upvalues: tryrealloc (copy), pushvlqrealloc (copy), EnumItem (ref)
            tryrealloc(p331, 9)

            local DelayTime = p332.DelayTime
            local v1007 = p331[1]
            local v1008 = buffer.readu32(v1007, 0)

            buffer.writeu32(v1007, 0, v1008 + 4)
            buffer.writef32(v1007, v1008, DelayTime)

            local Time = p332.Time
            local v1010 = p331[1]
            local v1011 = buffer.readu32(v1010, 0)

            buffer.writeu32(v1010, 0, v1011 + 4)
            buffer.writef32(v1010, v1011, Time)

            local v1013 = if p332.Reverses then 1 else 0
            local v1014 = p331[1]
            local v1015 = buffer.readu32(v1014, 0)

            buffer.writeu32(v1014, 0, v1015 + 1)
            buffer.writeu8(v1014, v1015, v1013)
            pushvlqrealloc(p331, p332.RepeatCount)
            EnumItem(Enum.EasingDirection).ser(p331, p332.EasingDirection)
            EnumItem(Enum.EasingStyle).ser(p331, p332.EasingStyle)
        end,
        des = function(p333) -- des | line: 2617
            -- upvalues: popvlq (copy), EnumItem (ref)
            local v1017 = EnumItem(Enum.EasingStyle).des(p333)
            local v1018 = EnumItem(Enum.EasingDirection).des(p333)
            local v1019 = popvlq(p333)
            local v1020 = p333[1]
            local v1021 = buffer.readu32(v1020, 0) - 1

            buffer.writeu32(v1020, 0, v1021)

            local v1022 = buffer.readu8(v1020, v1021)
            local v1023 = v1022 % 2 >= 1

            if v1022 % 4 >= 2 then
            end

            if v1022 % 8 >= 4 then
            end

            if v1022 % 16 >= 8 then
            end

            if v1022 % 32 >= 16 then
            end

            if v1022 % 64 >= 32 then
            end

            if v1022 % 128 >= 64 then
            end

            if v1022 % 256 >= 128 then
            end

            local v1024 = p333[1]
            local v1025 = buffer.readu32(v1024, 0) - 4

            buffer.writeu32(v1024, 0, v1025)

            local v1026 = buffer.readf32(v1024, v1025)
            local v1027 = p333[1]
            local v1028 = buffer.readu32(v1027, 0) - 4

            buffer.writeu32(v1027, 0, v1028)

            local v1029 = buffer.readf32(v1027, v1028)

            return TweenInfo.new(v1026, v1017, v1018, v1019, v1023, v1029)
        end
    }

    function t1.TweenInfo() -- line: 2627
        -- upvalues: t118 (copy)
        return t118
    end
end

if UDim ~= nil then
    local t119 = {}

    function t1.UDim(p334) -- line: 2634
        -- upvalues: t119 (copy)
        if t119[p334] then
            return t119[p334]
        end

        local ser, des = p334.ser, p334.des
        local t120 = {
            ser = function(p335, p336) -- ser | line: 2642
                -- upvalues: ser (copy)
                ser(p335, p336.Offset)
                ser(p335, p336.Scale)
            end,
            des = function(p337) -- des | line: 2647
                -- upvalues: des (copy)
                return UDim.new(des(p337), des(p337))
            end
        }

        t119[p334] = t120

        return t120
    end
end

if UDim2 ~= nil then
    local t121 = {}

    function t1.UDim2(p338) -- line: 2659
        -- upvalues: t121 (copy)
        if t121[p338] then
            return t121[p338]
        end

        local ser, des = p338.ser, p338.des
        local t122 = {
            ser = function(p339, p340) -- ser | line: 2667
                -- upvalues: ser (copy)
                ser(p339, p340.Y.Offset)
                ser(p339, p340.Y.Scale)
                ser(p339, p340.X.Offset)
                ser(p339, p340.X.Scale)
            end,
            des = function(p341) -- des | line: 2674
                -- upvalues: des (copy)
                return UDim2.new(des(p341), des(p341), des(p341), des(p341))
            end
        }

        t121[p338] = t122

        return t122
    end
end

if Vector2int16 ~= nil then
    local t123 = {}

    function t123.ser(p342, p343) -- line: 2686
        -- upvalues: tryrealloc (copy)
        tryrealloc(p342, 4)

        local Y = p343.Y
        local v1030 = p342[1]
        local v1031 = buffer.readu32(v1030, 0)

        buffer.writeu32(v1030, 0, v1031 + 2)
        buffer.writei16(v1030, v1031, Y)

        local X = p343.X
        local v1033 = p342[1]
        local v1034 = buffer.readu32(v1033, 0)

        buffer.writeu32(v1033, 0, v1034 + 2)
        buffer.writei16(v1033, v1034, X)
    end

    function des3(p344) -- line: 2692
        local new = Vector2int16.new
        local v1036 = p344[1]
        local v1037 = buffer.readu32(v1036, 0) - 2

        buffer.writeu32(v1036, 0, v1037)

        local v1038 = buffer.readi16(v1036, v1037)
        local v1039 = p344[1]
        local v1040 = buffer.readu32(v1039, 0) - 2

        buffer.writeu32(v1039, 0, v1040)

        return new(v1038, (buffer.readi16(v1039, v1040)))
    end

    t123.des = des3

    function t1.Vector2int16() -- line: 2696
        -- upvalues: t123 (copy)
        return t123
    end
end

if Vector3int16 ~= nil then
    local t124 = {}

    function t124.ser(p345, p346) -- line: 2703
        -- upvalues: tryrealloc (copy)
        tryrealloc(p345, 6)

        local Z = p346.Z
        local v1041 = p345[1]
        local v1042 = buffer.readu32(v1041, 0)

        buffer.writeu32(v1041, 0, v1042 + 2)
        buffer.writei16(v1041, v1042, Z)

        local Y = p346.Y
        local v1044 = p345[1]
        local v1045 = buffer.readu32(v1044, 0)

        buffer.writeu32(v1044, 0, v1045 + 2)
        buffer.writei16(v1044, v1045, Y)

        local X = p346.X
        local v1047 = p345[1]
        local v1048 = buffer.readu32(v1047, 0)

        buffer.writeu32(v1047, 0, v1048 + 2)
        buffer.writei16(v1047, v1048, X)
    end

    function des3(p347) -- line: 2710
        local new = Vector3int16.new
        local v1050 = p347[1]
        local v1051 = buffer.readu32(v1050, 0) - 2

        buffer.writeu32(v1050, 0, v1051)

        local v1052 = buffer.readi16(v1050, v1051)
        local v1053 = p347[1]
        local v1054 = buffer.readu32(v1053, 0) - 2

        buffer.writeu32(v1053, 0, v1054)

        local v1055 = buffer.readi16(v1053, v1054)
        local v1056 = p347[1]
        local v1057 = buffer.readu32(v1056, 0) - 2

        buffer.writeu32(v1056, 0, v1057)

        return new(v1052, v1055, (buffer.readi16(v1056, v1057)))
    end

    t124.des = des3

    function t1.Vector3int16() -- line: 2714
        -- upvalues: t124 (copy)
        return t124
    end
end

return t1
