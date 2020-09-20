parse arg msg
if msg = '' then do
   say "syntax: [rx.exe] banner.r <message>"
   say "author: Bill N. Vlachoudis 1989"
   exit
end
 
Char. = ''
a = C2D("[");b = "Z07080300080300070400050800040A0003040304000303" ||,
                 "000303040400030B00040900060300060300060300Z"
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D(".");b = "Z11070300060500070300Z"
                  Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("<");b = "Z080A040008040007040005040003040003040004040006" ||,
                 "0400070400080400Z"
                  Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("(");b = "Z070A030008040007040006040005040004040004030004" ||,
                 "0300040300040300040400050400070300Z"
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("+");b = "Z08080300080300070400070300030B00030B0007030006" ||,
                 "0400060300060300Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("|");b = "Z0508030008030008030008030007040007030007030007" ||,
                 "03000703000703000703000604000603000603000603000" ||,
                 "60300060300Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("&");b = "Z0707040006050005030103000403020300040301030005" ||,
                 "05000406000307010300020402050002030403000203040" ||,
                 "300020A000306010300Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("!");b = "Z0707050007050007050007050006050007030007030007" ||,
                 "030001000100070300060400060300Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("$");b = "Z06080300080300050800040A0004030304000403000408" ||,
                 "000607000A04000304040300040A0005080006030006030" ||,
                 "0Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("*");b = "Z08030305030004030303000503010300060500030B0003" ||,
                 "0B00060500050301030004030303000303050300Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D(")");b = "Z070703000804000904000A03000A03000A03000A030009" ||,
                 "0400080400070400060400050400040300Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D(";");b = "Z0A07030006040006030001000100060300050400050400" ||,
                 "050300040300030300Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("^");b = "Z0C040900040900090400090300Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("-");b = "Z0C050800040800Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("/");b = "Z080C03000B04000A030009030008030007030006030005" ||,
                 "0300040300020400020300Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D(",");b = "Z0F060300050400050400050300040300030300Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("%");b = "Z0705040303000405020300030601030003050103000304" ||,
                 "01040008030007030006030005030204000403020500030" ||,
                 "30206000203030500080400Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("_");b = "Z15010F00010F00Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D(">");b = "Z080504000604000704000904000A04000A040008040006" ||,
                 "0400050400030400Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("?");b = "Z07070700060900050304030004030503000A0400070600" ||,
                 "06040006030006030001000100050300040400040300Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D(":");b = "Z0B09030008040008030001000100010007030006040006" ||,
                 "0300Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("#");b = "Z07060301030006030103000504010300030C00030C0005" ||,
                 "030104000503010300020C00020C0004030203000403010" ||,
                 "30004030103000403010300Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("@");b = "Z0706060005080004030403000C03000C03000B04000406" ||,
                 "01030003070103000203020301030002030103010400020" ||,
                 "30103010300030A000405010300Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("'");b = "Z07070300060400070200070200060200050200050100Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("=");b = "Z09050800050800010001000100040800040800Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D('"');b = "Z0706030303000504020400060204020006020402000502" ||,
                 "04020004020402000401050100Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("a");b = "Z0B06040102000502020300040204020004020402000302" ||,
                 "04020003020402000302030300030202040101000404010" ||,
                 "300Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("b");b = "Z0706030007020007020006020006020104000604020200" ||,
                 "05020502000502050200040206020004020502000402040" ||,
                 "2000402030200050500Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("c");b = "Z0B07050006020302000502040200050200040200040200" ||,
                 "04020501000502020200060400Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("d");b = "Z070A04000B03000C02000B020006040102000502010400" ||,
                 "04020402000302050200030205020002020502000202050" ||,
                 "200020203040101000305010400Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("e");b = "Z0B08040007020202000602030200050203020004070004" ||,
                 "02000402000402030200050500Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("f");b = "Z0709050008020202000802000702000507000702000602" ||,
                 "00060200060200050200050200050200050200040200010" ||,
                 "2010200010400Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("g");b = "Z0B07050006020303000502040200050203020005020302" ||,
                 "00060400050200050400040202030003020502000302050" ||,
                 "200040700Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("h");b = "Z0705040007020007020006020006020203000502020201" ||,
                 "02000502010202020005040202000402050200040204020" ||,
                 "00402040200030205020102000302040500Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("i");b = "Z080A02000A020001000803000902000902000802000802" ||,
                 "000802000702000702010100070400Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D(" ");b = "Z070A040008050007040005050004040004040005040006" ||,
                 "04000704000804000100030A00020A00Z"
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D(" ");b = "Z0107020007020007020007020007020007020007020007" ||,
                 "0200070200070200070200070200010F000702000702000" ||,
                 "70200070200070200070200070200070200070200070200" ||,
                 "070200Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("j");b = "Z080B02000B020001000804000A02000A02000902000902" ||,
                 "000902000802000802000702000401020200050300Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("k");b = "Z0705040007020007020006020006020104000502030200" ||,
                 "05020202000505000402010200040202020004020202000" ||,
                 "30204020101000302050300Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("l");b = "Z070804000A02000A020009020009020008020008020008" ||,
                 "02000702000702000602000602010100060400Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("m");b = "Z0B02030203020300030201070102000304020302020003" ||,
                 "03030203020002020402030200020204020302000103030" ||,
                 "203020001020402030201010001020402040300Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("n");b = "Z0B05030204000502010600050403020004030502000402" ||,
                 "05020004020502000402040200030205020101000302060" ||,
                 "300Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("o");b = "Z0B06050004030302000302060200020207020002020602" ||,
                 "00020206020002020502000302030200040500Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("p");b = "Z0B04040104000505020200050304020005020502000402" ||,
                 "05020004020502000402040200030501020003020203000" ||,
                 "20200020200020400Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("q");b = "Z0B08040102000603020300050204020004020502000402" ||,
                 "05020003020502000302040300030202040004040102000" ||,
                 "90200080200080400Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("r");b = "Z0B06030202000702010400070401010006030006020006" ||,
                 "0200050200050200050200Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D(" ");b = "Z07080300080300080300040A00040A0007030007030007" ||,
                 "030001000100040900030900Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D(" ");b = "Z09040900040900040900040900040900040900040900Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("s");b = "Z0B07040101000602020300060203010007020008020009" ||,
                 "0200050103020004030202000401010400Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("t");b = "Z080A010009020009020005090008020007020007020007" ||,
                 "02000602000602000602010100070300Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("u");b = "Z0B04020502000204040200040204020003020402000302" ||,
                 "0402000302040200020203030002080101000304020300Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("v");b = "Z0B03030303000402040200040204020004020302000402" ||,
                 "03020004020202000402010200040400050200Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("w");b = "Z0B01020A03000202040204020002020402040200020203" ||,
                 "03030200020202020102020200030402020102000303030" ||,
                 "201020003020404000302050200Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("x");b = "Z0B04030403000602020201010006020102000703000702" ||,
                 "0006040005020102020100020101020303000203050200Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("y");b = "Z0B04040303000602040200060204020006020302000602" ||,
                 "02020006020102000604000603000602000502000201010" ||,
                 "200020300Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("z");b = "Z0B05080005020203000501030200080200070200060200" ||,
                 "05020401000403020200030800Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D(" ");b = "Z0107020007020007020007020007020007020007020007" ||,
                 "0200070200070200070200070200070900Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D(" ");b = "Z0D07090007020007020007020007020007020007020007" ||,
                 "0200070200070200070200070200Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("[");b = "Z0708070008070007020007020006020006020005020005" ||,
                 "0200050200040200040200030200030200020700020700Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D(" ");b = "Z070504000605000705000904000A04000A040008050006" ||,
                 "05000504000304000100030A00020A00Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D(" ");b = "Z0B060500050700040900040900050700060500Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D(" ");b = "Z0506060005020402000402060200040206020004020602" ||,
                 "00040206020004020502000502030200060500Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D(" ");b = "Z0505060009020009020009020008020008020008020008" ||,
                 "0200040900Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D(" ");b = "Z08090300080400080300030B00030B0007030006030003" ||,
                 "0A00030A00050400050300050300Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D(" ");b = "Z050608000C02000B02000903000804000B020003020602" ||,
                 "000402040200050600Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D(" ");b = "Z0508030007020006020005020502000402050200040204" ||,
                 "0200040900090200080200Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D(" ");b = "Z0709040008020103000702030200060205010005050005" ||,
                 "02010300040204020005030102000605000201050200020" ||,
                 "20302000203010200030400Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D(" ");b = "Z0508030006030005030004030004090004020602000402" ||,
                 "0602000502040200060600Z";
                 Char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D(" ");b = "Z0507060006020402000502060200060204020005080004" ||,
                 "0304030004020602000403040300050800Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D(" ");b = "Z5070600050303030005020502000502050200050303030" ||,
                 "0060700090300080300070300Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D(" ");b = "Z0107020007020007020007020007020007020007020007" ||,
                 "0200070200070200070200070200010800Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D(" ");b = "Z0D01080007020007020007020007020007020007020007" ||,
                 "0200070200070200070200070200Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("]");b = "Z070807000807000C02000C02000B02000B02000A02000A" ||,
                 "02000A0200090200090200080200080200020700020700Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D(" ");b = "Z050609000D02000D02000C02000B02000A020009020008" ||,
                 "0200070200Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D(" ");b = "Z0D010F00Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("{");b = "Z060A05000A050009030009030008040008030005050005" ||,
                 "0500080300080300070300070300070500070500Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("A");b = "Z070E01000D02000C03000B04000A020102000902020200" ||,
                 "08020302000702040200060900050206020004020702000" ||,
                 "3020802000105050500Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("B");b = "Z0705090006020502000602050200050206020005020502" ||,
                 "00050204020004080004020502000402060200030207020" ||,
                 "003020602000302050200010A00Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("C");b = "Z0707060101000503040300040207020003030702000203" ||,
                 "00020300010300010300010200010200020207020002030" ||,
                 "40300030800Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("D");b = "Z07040A0005030403000602050300050206030005020603" ||,
                 "00050206030004020703000402070300040206030003020" ||,
                 "7030003020603000203050300010A00Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("E");b = "Z07040B0005030502000602060100050200050203010005" ||,
                 "02020200040700040203010004020003020701000302060" ||,
                 "2000203050200010B00Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("F");b = "Z07040B0005030502000602060100050200050203010005" ||,
                 "02020200040700040203010004020003020003020002030" ||,
                 "0010500Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("G");b = "Z0707060101000503040300040207020003030801000203" ||,
                 "00020300010300010305060001020802000102080200020" ||,
                 "20702000203050200030800Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("H");b = "Z0704050205000503040300060205020005020502000502" ||,
                 "05020005020502000409000402050200040205020003020" ||,
                 "50200030205020002030403000105020500Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("I");b = "Z0707060008040009020008020008020008020007020007" ||,
                 "0200070200060200060200050400040600Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D(" ");b = "Z0107020007020007020007020007020007020007020007" ||,
                 "0200070200070200070200070200010F00Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D(" ");b = "Z0D010F0007020007020007020007020007020007020007" ||,
                 "0200070200070200070200070200Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("}");b = "Z0607050007050009030008030008030008030008050008" ||,
                 "0500070300070300070300060300030600030600Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("J");b = "Z070806000904000A020009020009020009020008020008" ||,
                 "020008020007020003010302000202030200020600Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("K");b = "Z0704060204000503050200060204020005020402000502" ||,
                 "02020005050004050004020202000402020200030204020" ||,
                 "0030205020002030503000105030600Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("L");b = "Z0705070006030007020006020006020006020005020005" ||,
                 "0200050200040208010004020701000403050200020B00Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("M");b = "Z0701050703000303070200030405030003040404000202" ||,
                 "01020305000202020202020102000202020201020202000" ||,
                 "20203030202000202030203020002020301040200010208" ||,
                 "020001020802000103050500Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("N");b = "Z0703050404000502060200040206020004020602000403" ||,
                 "05020003020102030200030201020302000302020202020" ||,
                 "00302020202020003020302010200020205030002020503" ||,
                 "000103060200Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("O");b = "Z0707070005030403000402070200030307030002030803" ||,
                 "00020308030001030803000103080300010209020001020" ||,
                 "8020002020702000203040300030800Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("P");b = "Z07040A0005030403000602050300050206030005020602" ||,
                 "00050205020004090004020004020003020003020002030" ||,
                 "0010600Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("Q");b = "Z0707070005030403000402070200030307030002030803"  ||,
                 "000203080300010308030001030803000102090200010208" ||,
                 "020002020702000203040300030800040207010003050402" ||,
                 "000202010800Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("R");b = "Z07040A0005030403000602050300050206030005020602" ||,
                 "00050205020004090004020203000402030200030205020" ||,
                 "0030206020002030603000104050600Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("\");b = "Z0802030002040004030005030006030007030008030009" ||,
                 "03000A03000B04000C0300Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("S");b = "Z0706050103000502030400050205020005020501000503" ||,
                 "00050400060500080400090300030106020002020602000" ||,
                 "2040402000103010600Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("T");b = "Z07020D0002020302040200010204020302000602000602" ||,
                 "00060200060200050200050200050200050200040300030" ||,
                 "500Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("U");b = "Z0702050405000302070200030207020002020802000202" ||,
                 "07020002020702000102080200010207020001020702000" ||,
                 "10207020001020602000202040200030600Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("V");b = "Z0702050405000303060201010003020602000302060200" ||,
                 "03020502000302040200030203020003020202000305000" ||,
                 "30400030300030200030100Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("W");b = "Z0701050703000203040103030002020402040200020204" ||,
                 "02040200020203030402000202020403020002020102010" ||,
                 "20302000202010201020202000204020201020002030304" ||,
                 "00020204030002020402000201050100Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("X");b = "Z0703060205000503040200060203020006020202000602" ||,
                 "01020007030007020006040005020102000402020200030" ||,
                 "204020002020502000104020600Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("Y");b = "Z0702050404000303060200040205020004020402000502" ||,
                 "02020005050006030006020006020005020005020004030" ||,
                 "0020700Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("Z");b = "Z07040C00030306030002020702000A0200090200080200" ||,
                 "07020006020005020004020003020802000203060300010" ||,
                 "C00Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D(" ");b = "Z05070600050304020005020502000B0300090300070300" ||,
                 "050300040300040900Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D(" ");b = "Z0107020007020007020007020007020007020007020007" ||,
                 "02000702000702000702000702000709000702000702000" ||,
                 "70200070200070200070200070200070200070200070200" ||,
                 "070200Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D(" ");b = "Z0107020007020007020007020007020007020007020007" ||,
                 "02000702000702000702000702000108000702000702000" ||,
                 "70200070200070200070200070200070200070200070200" ||,
                 "070200Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D(" ");b = "Z50608000602000602000607000C02000C0200040206020" ||,
                 "00402050200050700Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("0");b = "Z0708040006020302000502050200040206020004020602" ||,
                 "00030207020003020602000302060200030205020003020" ||,
                 "5020003020402000302030200040400Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("1");b = "Z070A02000804000A020009020009020009020008020008" ||,
                 "0200080200070200070200060300040600Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("2");b = "Z07080400060301030005020502000C02000C02000B0200" ||,
                 "0A020009020008020007020006020401000403040100030900Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("3");b = "Z0708050007020302000C02000C02000B02000903000704" ||,
                 "000A02000A02000A02000A02000302040200040600Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("4");b = "Z070B02000A030009040008040007020102000602020200" ||,
                 "050202020004020302000302040200020B00080200080200070200Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("5");b = "Z070707000706000602000602000604000902000A02000B" ||,
                 "02000B02000A02000A02000303030200040600Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("6");b = "Z070A030008030007020006020005020004070004020303" ||,
                 "00030205020003020502000302050200030205020004020" ||,
                 "30200050500Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("7");b = "Z0705090004030303000301060200090200080200080200" ||,
                 "070200070200060200060200050200050200040200Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("8");b = "Z0708060007020402000602050200060204020006020302" ||,
                 "00070500050600040204020003020602000202070200020" ||,
                 "20602000302040200040600Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
a = C2D("9");b = "Z0707050006020302000502040200040206020004020602" ||,
                 "00040205020005020303000606000902000802000603000" ||,
                 "40300030200Z";
                 char.a = X2C(SUBSTR(b,2,length(b)-2))
 
call big msg
do i = 6 to 22
   say lines.i
end
return
 
big: procedure expose char. lines.
parse arg msg
Drop lines.
lines. = ''
Do k = 1 to length(Msg)
   Drop Letter.
   Letter. = copies(' ',18)
   i = C2d(Substr(Msg,k,1))
   flag = ' ' ; line = '' ; lprt = C2D(Left(Char.i,1))
   Do j = 2 to length(Char.i)
      c = C2d(Substr(Char.i,j,1))
      if c = 0 then do
         Letter.Lprt = Overlay(Line,Letter.Lprt,1)
         line = '' ;
         flag = 0  ; lprt = lprt + 1
      End
      Line = Line || Copies(flag,C)
      if Flag == ' ' ;then flag = '*' ;else flag = ' '
   End
 
   lef = 18 ; rig = 1
   Do j = 6 to 22
      p = POS('*',Letter.j)
      if p = 0 then ITERATE
      if p < lef then lef = p
      p = LASTPOS('*',Letter.j)
      if p > rig then rig = p
   End
   len = rig-lef+1
   if len < 1 then do ; len = 6 ; lef = 1  ; end
   Do j = 6 to 22
      Lines.j = lines.j Substr(Letter.j,lef,len)
   End
End
return
