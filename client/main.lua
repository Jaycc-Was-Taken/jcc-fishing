local QBCore = exports["qb-core"]:GetCoreObject()
local fishing = false
local currentArea = 0
local FailedAttemps = 0
local SucceededAttempts = 0
local NeededAttempts = 0
local hotspot = {}
local AlamoSea = PolyZone:Create({
    vector2(-104.55, 4398.48),
    vector2(74.24, 4468.18),
    vector2(162.12, 4374.24),
    vector2(507.58, 4328.79),
    vector2(843.94, 4434.85),
    vector2(2298.48, 4713.64),
    vector2(2510.61, 4553.03),
    vector2(2419.70, 4053.03),
    vector2(2259.09, 3856.06),
    vector2(2107.58, 3880.30),
    vector2(2001.52, 3850.00),
    vector2(1880.30, 3946.97),
    vector2(1334.85, 3637.88),
    vector2(1143.94, 3592.42),
    vector2(916.67, 3601.52),
    vector2(322.73, 3495.45),
    vector2(165.15, 3404.55),
    vector2(-150.00, 3710.61),
    vector2(-256.06, 4053.03),
    vector2(-180.30, 4256.06)
    }, {
    name="AlamoSea",
    debugPoly = false,
    minZ=10.0,
    maxZ=43.2,
})
local TataviamMountain = PolyZone:Create({
    vector2(1815.15, 172.73),
    vector2(1936.36, 475.76),
    vector2(2053.03, 487.88),
    vector2(2071.21, 72.73),
    vector2(1865.15, -80.30),
    vector2(1674.24, -86.36),
    vector2(1630.30, 57.58)
   }, {
    name = "TataviamMountain",
    debugPoly = false,
})
local VinewoodFishing = PolyZone:Create({
    vector2(-24.24, 728.79),
    vector2(-170.45, 805.30),
    vector2(-241.67, 900.76),
    vector2(-300.76, 892.42),
    vector2(-345.45, 817.42),
    vector2(-37.88, 584.85),
    vector2(94.70, 637.12),
    vector2(96.97, 780.30),
    vector2(131.06, 812.12),
    vector2(212.88, 800.76),
    vector2(259.85, 843.94),
    vector2(218.94, 884.09),
    vector2(138.64, 892.42),
    vector2(56.06, 978.79),
    vector2(7.58, 962.88)
   }, {
    name = "VinewoodFishing",
    debugPoly = false,
})
local saltWaterArea = PolyZone:Create({
    vector2(46.97, 7037.88),
    vector2(198.48, 7010.61),
    vector2(495.45, 6653.03),
    vector2(1240.91, 6546.97),
    vector2(1692.42, 6604.55),
    vector2(2098.48, 6677.27),
    vector2(2480.30, 6562.12),
    vector2(2856.06, 6340.91),
    vector2(3050.00, 6283.33),
    vector2(3171.21, 6219.70),
    vector2(3250.00, 6050.00),
    vector2(3365.15, 5962.12),
    vector2(3304.55, 5598.48),
    vector2(3395.45, 5486.36),
    vector2(3159.09, 5350.00),
    vector2(3177.27, 5177.27),
    vector2(3137.88, 5053.03),
    vector2(3410.61, 4953.03),
    vector2(3586.36, 4592.42),
    vector2(3822.73, 4325.76),
    vector2(3801.52, 3962.12),
    vector2(3671.21, 3786.36),
    vector2(3883.33, 3543.94),
    vector2(3710.61, 3180.30),
    vector2(3577.27, 3125.76),
    vector2(3359.09, 2731.82),
    vector2(3201.52, 2401.52),
    vector2(3056.06, 2180.30),
    vector2(2850.00, 1777.27),
    vector2(2719.70, 1080.30),
    vector2(2804.55, 837.88),
    vector2(2901.52, 674.24),
    vector2(2898.48, 331.82),
    vector2(2728.79, 104.55),
    vector2(2728.79, 13.64),
    vector2(2883.33, -177.27),
    vector2(2792.42, -492.42),
    vector2(2768.18, -819.70),
    vector2(2637.88, -907.58),
    vector2(2601.52, -1183.33),
    vector2(2465.15, -1246.97),
    vector2(2504.55, -1583.33),
    vector2(2650.00, -1662.12),
    vector2(2571.21, -2074.24),
    vector2(2465.15, -2131.82),
    vector2(2325.76, -2089.39),
    vector2(2150.00, -2274.24),
    vector2(1931.82, -2568.18),
    vector2(1789.39, -2692.42),
    vector2(1571.21, -2656.06),
    vector2(1477.27, -2731.82),
    vector2(1177.27, -2674.24),
    vector2(937.88, -2619.70),
    vector2(674.24, -2495.45),
    vector2(704.55, -1780.30),
    vector2(656.06, -1734.85),
    vector2(543.94, -2253.03),
    vector2(450.00, -2153.03),
    vector2(307.58, -2207.58),
    vector2(43.94, -2168.18),
    vector2(-480.30, -2192.42),
    vector2(-680.30, -1465.15),
    vector2(-668.18, -1277.27),
    vector2(-831.82, -1138.64),
    vector2(-988.64, -880.30),
    vector2(-1168.94, -975.00),
    vector2(-1221.97, -908.33),
    vector2(-1253.79, -924.24),
    vector2(-1043.94, -1325.00),
    vector2(-1068.18, -1595.45),
    vector2(-1231.82, -1759.09),
    vector2(-1571.21, -1137.88),
    vector2(-1816.67, -810.61),
    vector2(-2150.00, -419.70),
    vector2(-2913.64, 40.91),
    vector2(-3101.52, 268.18),
    vector2(-3046.97, 701.52),
    vector2(-3216.67, 995.45),
    vector2(-3159.09, 1374.24),
    vector2(-2937.88, 1550.00),
    vector2(-3086.36, 1704.55),
    vector2(-3001.52, 1910.61),
    vector2(-2989.39, 2180.30),
    vector2(-2737.88, 2343.94),
    vector2(-2631.82, 2410.61),
    vector2(-2568.18, 2825.76),
    vector2(-2798.48, 3080.30),
    vector2(-3046.97, 3289.39),
    vector2(-3025.76, 3465.15),
    vector2(-2631.82, 3531.82),
    vector2(-2543.94, 3677.27),
    vector2(-2486.36, 3950.00),
    vector2(-2459.09, 4183.33),
    vector2(-2186.36, 4553.03),
    vector2(-1871.21, 4537.88),
    vector2(-1743.94, 4668.18),
    vector2(-1804.55, 4792.42),
    vector2(-1568.18, 5110.61),
    vector2(-1325.76, 5259.09),
    vector2(-1007.58, 5456.06),
    vector2(-865.15, 5610.61),
    vector2(-825.76, 5865.15),
    vector2(-745.45, 5990.91),
    vector2(-543.94, 6254.55),
    vector2(-343.94, 6462.12),
    vector2(-37.88, 6704.55)
   }, {
    name="wholebitch",
    --minZ=0,
    --maxZ=800
})
local drainageArea = PolyZone:Create({
    vector2(1229.55, -1045.08),
    vector2(1280.30, -1115.91),
    vector2(1309.09, -1103.03),
    vector2(1297.35, -1076.52),
    vector2(1324.62, -1046.21),
    vector2(1347.73, -1034.47),
    vector2(1317.05, -1019.32)
   }, {
    name="drainageArea",
    debugPoly = false,
    --minZ=0,
    --maxZ=800
})
local illegalFishing = PolyZone:Create({
    vector2(126.52, 3457.58),
    vector2(181.82, 3400.76),
    vector2(53.03, 3093.94),
    vector2(-106.06, 3074.24),
    vector2(-216.67, 2953.03),
    vector2(-318.18, 2989.39),
    vector2(-490.91, 2865.15),
    vector2(-601.52, 2906.06),
    vector2(-856.06, 2757.58),
    vector2(-1015.15, 2793.94),
    vector2(-1080.30, 2783.33),
    vector2(-1178.79, 2683.33),
    vector2(-1271.21, 2622.73),
    vector2(-1360.61, 2589.39),
    vector2(-1462.12, 2557.58),
    vector2(-1559.09, 2548.48),
    vector2(-1515.15, 2471.21),
    vector2(-1465.15, 2410.61),
    vector2(-1500.00, 2400.00),
    vector2(-1560.61, 2462.88),
    vector2(-1619.70, 2507.58),
    vector2(-1662.12, 2552.27),
    vector2(-1756.82, 2518.94),
    vector2(-1900.00, 2495.45),
    vector2(-1980.30, 2483.33),
    vector2(-2075.76, 2426.52),
    vector2(-2192.42, 2460.61),
    vector2(-2312.88, 2468.94),
    vector2(-2518.94, 2412.88),
    vector2(-2609.09, 2428.79),
    vector2(-2630.30, 2434.85),
    vector2(-2568.94, 2846.21),
    vector2(-2303.79, 2812.12),
    vector2(-2259.85, 2821.97),
    vector2(-2150.00, 2690.15),
    vector2(-1976.52, 2698.48),
    vector2(-1633.33, 2694.70),
    vector2(-1415.91, 2676.52),
    vector2(-1221.97, 2744.70),
    vector2(-1081.06, 2852.27),
    vector2(-955.30, 2846.21),
    vector2(-814.39, 2855.30),
    vector2(-668.18, 2966.67),
    vector2(-617.42, 3009.85),
    vector2(-498.48, 2966.67),
    vector2(-354.55, 3056.82),
    vector2(-259.09, 3040.15),
    vector2(-167.42, 3113.64),
    vector2(9.85, 3174.24),
    vector2(63.64, 3308.33)
   }, {
    name="illegalFishing",
    --minZ=0,
    --maxZ=800
})
local mirrorParkFishing = PolyZone:Create({
    vector2(1078.79, -550.00),
    vector2(1058.33, -610.23),
    vector2(1015.15, -662.12),
    vector2(1021.97, -707.20),
    vector2(1080.30, -748.86),
    vector2(1138.64, -740.53),
    vector2(1151.89, -700.76),
    vector2(1120.45, -621.21),
    vector2(1147.73, -583.71),
    vector2(1125.76, -538.26)
   }, {
    name="mirrorparkFishing",
    debugPoly = false,
    --minZ=0,
    --maxZ=800
})
local tongvaValleyCreek = PolyZone:Create({
    vector2(-1509.09, 2400.00),
    vector2(-1456.06, 2421.21),
    vector2(-1377.27, 2143.94),
    vector2(-1387.88, 1945.45),
    vector2(-1495.45, 1669.70),
    vector2(-1484.85, 1506.06),
    vector2(-1548.48, 1403.03),
    vector2(-1587.12, 1430.30),
    vector2(-1537.88, 1560.61),
    vector2(-1555.30, 1665.91),
    vector2(-1512.88, 1806.82),
    vector2(-1477.27, 1869.70),
    vector2(-1482.58, 1950.00)
   }, {
    name="tongvaValleyCreek",
    debugPoly = false,
    --minZ=0,
    --maxZ=800
})
local ratonCanyonCreek = PolyZone:Create({
    vector2(-1789.39, 4630.30),
    vector2(-1863.64, 4556.06),
    vector2(-1577.27, 4315.15),
    vector2(-1403.03, 4271.21),
    vector2(-1106.06, 4330.30),
    vector2(-962.12, 4309.09),
    vector2(-745.45, 4387.88),
    vector2(-492.42, 4336.36),
    vector2(-196.97, 4200.00),
    vector2(-159.09, 4278.79),
    vector2(-272.73, 4431.82),
    vector2(-501.52, 4487.88),
    vector2(-786.36, 4466.67),
    vector2(-981.82, 4403.03),
    vector2(-1200.00, 4412.12),
    vector2(-1375.76, 4372.73),
    vector2(-1540.91, 4404.55)
   }, {
    name="ratonCanyonCreek",
    debugPoly = false,
    --minZ=0,
    --maxZ=800
})
local chumashPier1 = PolyZone:Create({
    vector2(-3428.8706054688, 951.39117431641),
    vector2(-3428.8991699219, 983.86254882812),
    vector2(-3408.4133300781, 983.70294189453),
    vector2(-3408.3872070312, 971.42248535156),
    vector2(-3326.05078125, 971.46752929688),
    vector2(-3326.384765625, 963.6328125),
    vector2(-3408.3273925781, 963.66687011719),
    vector2(-3408.4094238281, 951.31140136719)
  }, {
    name="chumashPier1",
    debugPoly = false,
    --minZ=0,
    --maxZ=800
})
local chumashPier2 = PolyZone:Create({
    vector2(-3410.1689453125, 953.17633056641),
    vector2(-3427.1469726562, 952.95947265625),
    vector2(-3427.3032226562, 981.81817626953),
    vector2(-3410.3405761719, 981.86541748047),
    vector2(-3410.1235351562, 969.84118652344),
    vector2(-3320.251953125, 970.07684326172),
    vector2(-3320.2661132812, 965.38909912109),
    vector2(-3410.166015625, 965.16455078125)
  }, {
    name="chumashPier2",
    debugPoly = false,
    --minZ=0,
    --maxZ=800
   })
local alamoDock = PolyZone:Create({
    vector2(1341.1240234375, 4222.8325195312),
    vector2(1342.0308837891, 4227.4731445312),
    vector2(1306.4586181641, 4234.1171875),
    vector2(1314.5875244141, 4277.8740234375),
    vector2(1307.9256591797, 4279.1723632812),
    vector2(1295.544921875, 4215.54296875),
    vector2(1302.2760009766, 4214.359375),
    vector2(1305.2982177734, 4229.6860351562)
  }, {
    name="alamoDock",
    --minZ = 33.908683776855,
    --maxZ = 33.915538787842
})
local paletoDock = PolyZone:Create({
    vector2(-272.06753540039, 6644.8061523438),
    vector2(-288.7536315918, 6629.0014648438),
    vector2(-278.30645751953, 6619.0546875),
    vector2(-273.46099853516, 6623.8745117188),
    vector2(-274.98712158203, 6625.5532226562),
    vector2(-278.44610595703, 6621.9165039062),
    vector2(-285.6171875, 6628.908203125),
    vector2(-271.14752197266, 6643.7094726562)
  }, {
    name="paletoDock",
    --minZ = 7.1720457077026,
    --maxZ = 7.5525999069214
  })
local laPuertaDock = PolyZone:Create({
    vector2(-961.49151611328, -1357.5360107422),
    vector2(-962.68243408203, -1354.2274169922),
    vector2(-874.76641845703, -1322.2019042969),
    vector2(-873.47729492188, -1325.5572509766)
  }, {
    name="laPuertaDock",
    --minZ = 1.6051671504974,
    --maxZ = 1.6051671504974
  })
local laPuertaDock2 = PolyZone:Create({
    vector2(-866.23937988281, -1323.6354980469),
    vector2(-865.04724121094, -1326.9661865234),
    vector2(-852.33148193359, -1322.2849121094),
    vector2(-850.48663330078, -1323.1611328125),
    vector2(-849.04986572266, -1326.9720458984),
    vector2(-849.87554931641, -1328.8571777344),
    vector2(-862.64831542969, -1333.5052490234),
    vector2(-861.94744873047, -1335.3967285156),
    vector2(-849.23260498047, -1330.7899169922),
    vector2(-847.38745117188, -1331.6507568359),
    vector2(-845.94989013672, -1335.4819335938),
    vector2(-846.80389404297, -1337.3204345703),
    vector2(-859.57269287109, -1341.9548339844),
    vector2(-858.87957763672, -1343.8133544922),
    vector2(-846.15502929688, -1339.2056884766),
    vector2(-844.29595947266, -1340.05859375),
    vector2(-842.89556884766, -1343.9385986328),
    vector2(-843.72564697266, -1345.7774658203),
    vector2(-856.51232910156, -1350.4094238281),
    vector2(-855.83837890625, -1352.2940673828),
    vector2(-843.11029052734, -1347.6690673828),
    vector2(-841.21752929688, -1348.4852294922),
    vector2(-839.76696777344, -1352.3941650391),
    vector2(-840.66552734375, -1354.2481689453),
    vector2(-853.42352294922, -1358.8586425781),
    vector2(-852.74664306641, -1360.7916259766),
    vector2(-840.01849365234, -1356.1334228516),
    vector2(-838.15631103516, -1356.9938964844),
    vector2(-836.7587890625, -1360.8585205078),
    vector2(-837.61102294922, -1362.6958007812),
    vector2(-850.31799316406, -1367.3454589844),
    vector2(-849.15808105469, -1370.6267089844),
    vector2(-836.41033935547, -1365.9676513672),
    vector2(-834.55548095703, -1366.8479003906),
    vector2(-833.12768554688, -1370.7082519531),
    vector2(-833.98901367188, -1372.5729980469),
    vector2(-846.76599121094, -1377.2099609375),
    vector2(-846.08233642578, -1379.1040039062),
    vector2(-833.33575439453, -1374.5013427734),
    vector2(-831.50793457031, -1375.3237304688),
    vector2(-830.08990478516, -1379.2081298828),
    vector2(-830.90478515625, -1380.9877929688),
    vector2(-843.7099609375, -1385.6645507812),
    vector2(-843.00445556641, -1387.5549316406),
    vector2(-830.25762939453, -1382.9250488281),
    vector2(-828.40991210938, -1383.7667236328),
    vector2(-827.01147460938, -1387.6470947266),
    vector2(-827.72973632812, -1389.5059814453),
    vector2(-840.58605957031, -1394.1273193359),
    vector2(-839.91583251953, -1396.0092773438),
    vector2(-827.18347167969, -1391.3682861328),
    vector2(-825.34777832031, -1392.2241210938),
    vector2(-823.91815185547, -1396.0892333984),
    vector2(-824.80230712891, -1397.9412841797),
    vector2(-837.56018066406, -1402.5744628906),
    vector2(-836.86157226562, -1404.5102539062),
    vector2(-824.10235595703, -1399.8483886719),
    vector2(-822.27740478516, -1400.7077636719),
    vector2(-820.85321044922, -1404.5356445312),
    vector2(-821.71337890625, -1406.3968505859),
    vector2(-834.47406005859, -1411.0482177734),
    vector2(-833.25238037109, -1414.3308105469),
    vector2(-816.8251953125, -1408.3720703125),
    vector2(-849.85852050781, -1317.6557617188)
  }, {
    name="laPuertaDock2",
    --minZ = 1.5952188968658,
    --maxZ = 2.224187374115
  })
local laPuertaDock3 = PolyZone:Create({
    vector2(-810.38195800781, -1411.3544921875),
    vector2(-796.97937011719, -1422.5950927734),
    vector2(-794.70642089844, -1419.8687744141),
    vector2(-805.09332275391, -1411.1418457031),
    vector2(-805.26135253906, -1409.1418457031),
    vector2(-802.64233398438, -1406.0009765625),
    vector2(-800.60949707031, -1405.8266601562),
    vector2(-790.17474365234, -1414.5931396484),
    vector2(-788.90887451172, -1412.98828125),
    vector2(-799.294921875, -1404.23828125),
    vector2(-799.47485351562, -1402.2135009766),
    vector2(-796.86297607422, -1399.1079101562),
    vector2(-794.84381103516, -1398.9240722656),
    vector2(-784.44879150391, -1407.6392822266),
    vector2(-783.11090087891, -1406.0802001953),
    vector2(-793.50982666016, -1397.3668212891),
    vector2(-793.67309570312, -1395.3403320312),
    vector2(-791.07440185547, -1392.1993408203),
    vector2(-789.04608154297, -1392.0216064453),
    vector2(-778.64947509766, -1400.7687988281),
    vector2(-777.34167480469, -1399.193359375),
    vector2(-787.73577880859, -1390.4747314453),
    vector2(-787.92584228516, -1388.4603271484),
    vector2(-785.28082275391, -1385.3116455078),
    vector2(-783.27624511719, -1385.1409912109),
    vector2(-772.87176513672, -1393.8591308594),
    vector2(-771.57196044922, -1392.2950439453),
    vector2(-781.94110107422, -1383.5767822266),
    vector2(-782.14208984375, -1381.5770263672),
    vector2(-779.51007080078, -1378.4156494141),
    vector2(-777.48480224609, -1378.2528076172),
    vector2(-767.08923339844, -1386.9702148438),
    vector2(-765.77465820312, -1385.4011230469),
    vector2(-776.11511230469, -1376.689453125),
    vector2(-776.35974121094, -1374.6904296875),
    vector2(-773.73315429688, -1371.5395507812),
    vector2(-771.71533203125, -1371.3499755859),
    vector2(-761.31036376953, -1380.0789794922),
    vector2(-759.13244628906, -1377.1998291016),
    vector2(-772.38488769531, -1366.0874023438)
  }, {
    name="laPuertaDock3",
    --minZ = 1.5952144861221,
    --maxZ = 1.6002132892609
    })
local laPuertaDock4 = PolyZone:Create({
    vector2(-767.59094238281, -1360.4613037109),
    vector2(-754.19256591797, -1371.6890869141),
    vector2(-751.912109375, -1368.9906005859),
    vector2(-762.29449462891, -1360.2658691406),
    vector2(-762.52020263672, -1358.2314453125),
    vector2(-759.86291503906, -1355.0809326172),
    vector2(-757.8173828125, -1354.8713378906),
    vector2(-747.43817138672, -1363.6060791016),
    vector2(-746.14569091797, -1362.0693359375),
    vector2(-756.50335693359, -1353.3615722656),
    vector2(-756.71264648438, -1351.3449707031),
    vector2(-754.07659912109, -1348.2238769531),
    vector2(-752.05944824219, -1348.0031738281),
    vector2(-741.66900634766, -1356.7145996094),
    vector2(-740.35064697266, -1355.189453125),
    vector2(-750.70422363281, -1346.4737548828),
    vector2(-750.90441894531, -1344.4617919922),
    vector2(-748.26055908203, -1341.3161621094),
    vector2(-746.27893066406, -1341.1102294922),
    vector2(-735.88012695312, -1349.8045654297),
    vector2(-734.6064453125, -1348.255859375),
    vector2(-744.93963623047, -1339.5268554688),
    vector2(-745.15216064453, -1337.5261230469),
    vector2(-742.4736328125, -1334.4075927734),
    vector2(-740.48547363281, -1334.2165527344),
    vector2(-730.09582519531, -1342.9289550781),
    vector2(-728.80633544922, -1341.3780517578),
    vector2(-739.17327880859, -1332.6368408203),
    vector2(-739.34899902344, -1330.6567382812),
    vector2(-736.72406005859, -1327.5212402344),
    vector2(-734.68383789062, -1327.3297119141),
    vector2(-724.318359375, -1336.0578613281),
    vector2(-722.91998291016, -1334.37890625),
    vector2(-733.35577392578, -1325.8032226562),
    vector2(-734.04809570312, -1323.9434814453),
    vector2(-730.90936279297, -1320.5546875),
    vector2(-728.78143310547, -1320.5212402344),
    vector2(-718.50238037109, -1329.1451416016),
    vector2(-716.23187255859, -1326.4542236328),
    vector2(-729.63110351562, -1315.2386474609)
  }, {
    name="laPuertaDock4",
    --minZ = 1.5952144861221,
    --maxZ = 1.6012890338898
 })
local laPuertaDock5 = PolyZone:Create({
    vector2(-704.61492919922, -1353.0006103516),
    vector2(-707.25714111328, -1350.7475585938),
    vector2(-745.16479492188, -1396.0155029297),
    vector2(-742.54571533203, -1398.2254638672)
  }, {
    name="laPuertaDock5",
    --minZ = 1.5952169895172,
    --maxZ = 1.5952171087265
  })
local laPuertaDock6 = PolyZone:Create({
    vector2(-754.88140869141, -1407.5197753906),
    vector2(-752.185546875, -1409.755859375),
    vector2(-790.14337158203, -1454.9842529297),
    vector2(-792.83654785156, -1452.7515869141)
  }, {
    name="laPuertaDock6",
    --minZ = 1.5952171087265,
    --maxZ = 1.5952171087265
  })
local laPuertaDock7 = PolyZone:Create({
    vector2(-790.44281005859, -1489.1942138672),
    vector2(-789.24096679688, -1492.4942626953),
    vector2(-807.35784912109, -1499.0582275391),
    vector2(-808.556640625, -1495.8057861328)
  }, {
    name="laPuertaDock7",
    --minZ = 1.5952184200287,
    --maxZ = 1.595218539238
  })
local laPuertaDock8 = PolyZone:Create({
    vector2(-783.79895019531, -1505.1496582031),
    vector2(-782.64758300781, -1508.3576660156),
    vector2(-801.44995117188, -1515.2208251953),
    vector2(-802.81213378906, -1511.9095458984)
  }, {
    name="laPuertaDock8",
    --minZ = 1.5952131748199,
    --maxZ = 1.5952131748199
  })
local laPuertaDock9 = PolyZone:Create({
    vector2(-861.19213867188, -1504.06640625),
    vector2(-844.82104492188, -1498.1002197266),
    vector2(-846.01300048828, -1494.7716064453),
    vector2(-858.76489257812, -1499.4298095703),
    vector2(-860.61059570312, -1498.5659179688),
    vector2(-861.98382568359, -1494.7331542969),
    vector2(-861.14331054688, -1492.8479003906),
    vector2(-848.39025878906, -1488.2205810547),
    vector2(-849.02807617188, -1486.2681884766),
    vector2(-861.81652832031, -1490.9339599609),
    vector2(-863.65954589844, -1490.115234375),
    vector2(-865.06579589844, -1486.2481689453),
    vector2(-864.216796875, -1484.4328613281),
    vector2(-851.49743652344, -1479.7728271484),
    vector2(-852.16906738281, -1477.8588867188),
    vector2(-864.90008544922, -1482.5104980469),
    vector2(-866.72943115234, -1481.6625976562),
    vector2(-868.13812255859, -1477.8215332031),
    vector2(-867.30316162109, -1475.9660644531),
    vector2(-854.53729248047, -1471.3189697266),
    vector2(-855.74456787109, -1467.9979248047),
    vector2(-872.18200683594, -1473.9331054688)
  }, {
    name="laPuertaDock9",
    --minZ = 1.5953904390335,
    --maxZ = 2.2046985626221
  })
local laPuertaDock10 = PolyZone:Create({
    vector2(-873.06469726562, -1469.6566162109),
    vector2(-879.0009765625, -1453.2513427734),
    vector2(-882.31195068359, -1454.4688720703),
    vector2(-877.67895507812, -1467.2028808594),
    vector2(-878.52197265625, -1469.0427246094),
    vector2(-882.37518310547, -1470.4230957031),
    vector2(-884.24072265625, -1469.625),
    vector2(-888.87475585938, -1456.8259277344),
    vector2(-890.80963134766, -1457.5343017578),
    vector2(-886.16729736328, -1470.2432861328),
    vector2(-886.98455810547, -1472.1374511719),
    vector2(-890.8447265625, -1473.5479736328),
    vector2(-892.70159912109, -1472.6741943359),
    vector2(-897.34399414062, -1459.9554443359),
    vector2(-899.24291992188, -1460.6363525391),
    vector2(-894.61767578125, -1473.36328125),
    vector2(-895.43756103516, -1475.1928710938),
    vector2(-899.29876708984, -1476.591796875),
    vector2(-901.134765625, -1475.7561035156),
    vector2(-905.79296875, -1462.9957275391),
    vector2(-909.12524414062, -1464.2204589844),
    vector2(-904.47979736328, -1476.9901123047),
    vector2(-905.30316162109, -1478.80078125),
    vector2(-909.22680664062, -1480.1759033203),
    vector2(-911.13317871094, -1479.0383300781),
    vector2(-915.66412353516, -1466.6552734375),
    vector2(-917.53588867188, -1467.3176269531),
    vector2(-912.92163085938, -1480.0445556641),
    vector2(-913.77435302734, -1481.8732910156),
    vector2(-917.64947509766, -1483.2523193359),
    vector2(-919.49633789062, -1482.4364013672),
    vector2(-924.11614990234, -1469.7006835938),
    vector2(-926.03228759766, -1470.3859863281),
    vector2(-921.39678955078, -1483.0869140625),
    vector2(-922.24609375, -1484.9475097656),
    vector2(-926.12194824219, -1486.3438720703),
    vector2(-927.9404296875, -1485.5153808594),
    vector2(-932.59332275391, -1472.7840576172),
    vector2(-934.45697021484, -1473.4252929688),
    vector2(-929.85455322266, -1486.2000732422),
    vector2(-930.70202636719, -1488.0184326172),
    vector2(-934.5634765625, -1489.4378662109),
    vector2(-936.39691162109, -1488.5942382812),
    vector2(-941.03698730469, -1475.8310546875),
    vector2(-942.96179199219, -1476.53125),
    vector2(-938.30865478516, -1489.2763671875),
    vector2(-939.16705322266, -1491.1013183594),
    vector2(-943.00903320312, -1492.4965820312),
    vector2(-944.83471679688, -1491.630859375),
    vector2(-949.50744628906, -1478.8837890625),
    vector2(-952.80187988281, -1480.0997314453),
    vector2(-946.81896972656, -1496.5230712891)
  }, {
    name="laPuertaDock10",
    --minZ = 1.5952309370041,
    --maxZ = 2.2155749797821
  })
local laPuertaDock11 = PolyZone:Create({
    vector2(-890.91619873047, -1425.1586914062),
    vector2(-874.50360107422, -1419.22265625),
    vector2(-875.72912597656, -1415.9099121094),
    vector2(-888.42065429688, -1420.5168457031),
    vector2(-890.27984619141, -1419.6884765625),
    vector2(-891.66528320312, -1415.8013916016),
    vector2(-890.85491943359, -1414.0108642578),
    vector2(-878.09753417969, -1409.3641357422),
    vector2(-878.7900390625, -1407.4536132812),
    vector2(-891.49420166016, -1412.0567626953),
    vector2(-893.34338378906, -1411.2401123047),
    vector2(-894.74597167969, -1407.4000244141),
    vector2(-893.91345214844, -1405.5339355469),
    vector2(-881.18182373047, -1400.9007568359),
    vector2(-881.87524414062, -1398.9696044922),
    vector2(-894.60577392578, -1403.6190185547),
    vector2(-896.42126464844, -1402.7850341797),
    vector2(-897.84936523438, -1398.9250488281),
    vector2(-896.99554443359, -1397.0909423828),
    vector2(-884.19421386719, -1392.4377441406),
    vector2(-884.94244384766, -1390.5366210938),
    vector2(-897.67327880859, -1395.1528320312),
    vector2(-899.51434326172, -1394.3287353516),
    vector2(-900.89996337891, -1390.4782714844),
    vector2(-900.07775878906, -1388.6324462891),
    vector2(-887.33941650391, -1383.9769287109),
    vector2(-888.53967285156, -1380.6624755859),
    vector2(-904.95281982422, -1386.6522216797)
  }, {
    name="laPuertaDock11",
    --minZ = 1.5953906774521,
    --maxZ = 1.6341671943665
  })
local laPuertaDock12 = PolyZone:Create({
    vector2(-911.08911132812, -1379.9578857422),
    vector2(-917.07391357422, -1363.5445556641),
    vector2(-920.37249755859, -1364.7113037109),
    vector2(-915.76617431641, -1377.4802246094),
    vector2(-916.599609375, -1379.3464355469),
    vector2(-920.46435546875, -1380.7147216797),
    vector2(-922.29925537109, -1379.87109375),
    vector2(-926.96545410156, -1367.1436767578),
    vector2(-928.87463378906, -1367.8284912109),
    vector2(-924.24432373047, -1380.5487060547),
    vector2(-925.07238769531, -1382.3942871094),
    vector2(-928.90014648438, -1383.7772216797),
    vector2(-930.78997802734, -1382.8704833984),
    vector2(-935.40563964844, -1370.1922607422),
    vector2(-937.31060791016, -1370.8970947266),
    vector2(-932.66027832031, -1383.6376953125),
    vector2(-933.51586914062, -1385.4552001953),
    vector2(-937.38916015625, -1386.8647460938),
    vector2(-939.23223876953, -1386.0363769531),
    vector2(-943.86688232422, -1373.2854003906),
    vector2(-945.78924560547, -1373.9593505859),
    vector2(-941.13586425781, -1386.7196044922),
    vector2(-941.95733642578, -1388.5476074219),
    vector2(-945.84619140625, -1389.9685058594),
    vector2(-947.67504882812, -1389.1234130859),
    vector2(-952.34161376953, -1376.3454589844),
    vector2(-954.21594238281, -1377.0401611328),
    vector2(-949.59161376953, -1389.7924804688),
    vector2(-950.43670654297, -1391.6306152344),
    vector2(-954.32666015625, -1393.0125732422),
    vector2(-956.12884521484, -1392.1846923828),
    vector2(-960.79351806641, -1379.4442138672),
    vector2(-964.14215087891, -1380.6018066406),
    vector2(-959.46893310547, -1393.3829345703),
    vector2(-960.32775878906, -1395.2120361328),
    vector2(-964.14990234375, -1396.6101074219),
    vector2(-966.0185546875, -1395.7702636719),
    vector2(-970.6572265625, -1383.048828125),
    vector2(-972.55847167969, -1383.7377929688),
    vector2(-967.93225097656, -1396.4571533203),
    vector2(-968.79406738281, -1398.2784423828),
    vector2(-972.63848876953, -1399.6923828125),
    vector2(-974.46990966797, -1398.8531494141),
    vector2(-979.10040283203, -1386.1151123047),
    vector2(-980.98504638672, -1386.9301757812),
    vector2(-976.38934326172, -1399.5234375),
    vector2(-977.23486328125, -1401.3745117188),
    vector2(-981.08117675781, -1402.771484375),
    vector2(-982.94268798828, -1401.9291992188),
    vector2(-987.59069824219, -1389.1069335938),
    vector2(-989.48968505859, -1389.8909912109),
    vector2(-984.84423828125, -1402.6156005859),
    vector2(-985.6865234375, -1404.45703125),
    vector2(-989.53582763672, -1405.8663330078),
    vector2(-991.38531494141, -1405.0004882812),
    vector2(-996.02099609375, -1392.26171875),
    vector2(-997.93640136719, -1392.958984375),
    vector2(-993.30358886719, -1405.7141113281),
    vector2(-994.14050292969, -1407.5169677734),
    vector2(-998.001953125, -1408.9143066406),
    vector2(-999.84045410156, -1408.0709228516),
    vector2(-1004.4824829102, -1395.3415527344),
    vector2(-1007.8124389648, -1396.5301513672),
    vector2(-1001.8221435547, -1412.9545898438)
  }, {
    name="laPuertaDock12",
    --minZ = 1.5953903198242,
    --maxZ = 1.6000910997391
  })
--End of Polyzones
Citizen.CreateThread(function() --These methods I learned from reading through Jimathy's scripts that he released.
	if Config.Pedspawn == true then
		CreatePeds()
    end
end)
Citizen.CreateThread(function()
    if Config.Blips == true then
		CreateBlips()
	end
end)
function CreateBlips()
	for k, v in pairs(Config.Locations) do
		if Config.Locations[k].blipTrue then
			local blip = AddBlipForCoord(v.location)
			SetBlipAsShortRange(blip, true)
			SetBlipSprite(blip, 427)
			SetBlipColour(blip, 81)
			SetBlipScale(blip, 0.7)
			SetBlipDisplay(blip, 6)

			BeginTextCommandSetBlipName('STRING')
			if Config.BlipNamer then
				AddTextComponentString(Config.Locations[k].name)
			else
				AddTextComponentString("Fishing")
			end
			EndTextCommandSetBlipName(blip)
		end
	end
end
local peds = {}
local shopPeds = {}
function CreatePeds()
	while true do
		Citizen.Wait(500)
		for k = 1, #Config.PedList, 1 do
			v = Config.PedList[k]
			local playerCoords = GetEntityCoords(PlayerPedId())
			local dist = #(playerCoords - v.coords)
			if dist < Config.Distance and not peds[k] then
				local ped = nearPed(v.model, v.coords, v.heading, v.gender, v.animDict, v.animName, v.scenario)
				peds[k] = {ped = ped}
			end
			if dist >= Config.Distance and peds[k] then
				if Config.Fade then
					for i = 255, 0, -51 do
						Citizen.Wait(50)
						SetEntityAlpha(peds[k].ped, i, false)
					end
				end
				DeletePed(peds[k].ped)
				peds[k] = nil
			end
		end
	end
end

function nearPed(model, coords, heading, gender, animDict, animName, scenario)
	RequestModel(GetHashKey(model))
	while not HasModelLoaded(GetHashKey(model)) do
		Citizen.Wait(1)
	end
	if gender == 'male' then
		genderNum = 4
	elseif gender == 'female' then 
		genderNum = 5
	else
		print("No gender provided! Check your configuration!")
	end
	if Config.MinusOne then 
		local x, y, z = table.unpack(coords)
		ped = CreatePed(genderNum, GetHashKey(model), x, y, z - 1, heading, false, true)
		table.insert(shopPeds, ped)
	else
		ped = CreatePed(genderNum, GetHashKey(v.model), coords, heading, false, true)
		table.insert(shopPeds, ped)
	end
	SetEntityAlpha(ped, 0, false)
	if Config.Frozen then
		FreezeEntityPosition(ped, true)
	end
	if Config.Invincible then
		SetEntityInvincible(ped, true)
	end
	if Config.Stoic then
		SetBlockingOfNonTemporaryEvents(ped, true)
	end
	if animDict and animName then
		RequestAnimDict(animDict)
		while not HasAnimDictLoaded(animDict) do
			Citizen.Wait(1)
		end
		TaskPlayAnim(ped, animDict, animName, 8.0, 0, -1, 1, 0, 0, 0)
	end
	if scenario then
		TaskStartScenarioInPlace(ped, scenario, 0, true)
	end
	if Config.Fade then
		for i = 0, 255, 51 do
			Citizen.Wait(50)
			SetEntityAlpha(ped, i, false)
		end
	end
	return ped
end --End of the Jimathy stuff

Citizen.CreateThread(function()
	exports['qb-target']:AddCircleZone("FreshwaterSales", Config.Locations['FreshwaterSale'].location, 2.0, { name="FreshwaterSale", debugPoly=false, useZ=true, }, 
	{ options = { { event = "jcc-fishing:freshwatersell", icon = "fas fa-fish", label = "Freshwater Fishing Supplies", }, },
		distance = 2.0
	})
    exports['qb-target']:AddCircleZone("SaltwaterSales", Config.Locations['SaltwaterSale'].location, 2.0, { name="SaltwaterSale", debugPoly=false, useZ=true, }, 
	{ options = { { event = "jcc-fishing:saltwatersell", icon = "fas fa-fish", label = "Saltwater Fishing Supplies", }, },
		distance = 2.0
	})
end)
RegisterNetEvent('jcc-fishing:freshwatersell', function()
    exports['qb-menu']:openMenu({
        { header = "💲 Freshwater Fish Buyer", txt = "Sell your fish here", isMenuHeader = true }, 
        { header = "❌ Close Menu", txt = "Close menu.", params = { event = "qb-menu:client:closeMenu",}, },
        { header = "🎣 Fishing Store", txt = "Fishing store.", params = { event = 'jcc-fishing:freshwatershop',}, },
		{ header = "🐟 Small Fish", txt = "Sell small freshwater fish.", params = { event = "jcc-fishing:freshwatersmall",}, },
        { header = "🐡 Large Fish", txt = "Sell large freshwater fish.", params = { event = "jcc-fishing:freshwaterlarge",}, },   
    })
end)
RegisterNetEvent('jcc-fishing:freshwatersmall', function()
    exports['qb-menu']:openMenu({
        { header = "Freshwater Fish Buyer", txt = "Sell your fish here", isMenuHeader = true }, 
        { header = "Go Back", txt = "Go Back.", params = { event = "jcc-fishing:freshwatersell", }, },   
		{ header = "Rainbow Trout", txt = "Sell all rainbow trout.", params = { event = "jcc-fishing:client:sellfish", args = { fish = "rainbowtrout" }, } },   
        { header = "Striped Bass", txt = "Sell all striped bass.", params = { event = "jcc-fishing:client:sellfish", args = { fish = "stripedbass" }, } },   
		{ header = "Largemouth Bass", txt = "Sell all largemouth bass.", params = { event = "jcc-fishing:client:sellfish", args = { fish = "largemouthbass" }, } },   
		{ header = "Smallmouth Bass", txt = "Sell all smallmouth bass.", params = { event = "jcc-fishing:client:sellfish", args = { fish = "smallmouthbass" }, } },   
		{ header = "Sunfish", txt = "Sell all sunfish.", params = { event = "jcc-fishing:client:sellfish", args = { fish = "sunfish" }, } },   
		{ header = "Black Crappie", txt = "Sell all black crappie.", params = { event = "jcc-fishing:client:sellfish", args = { fish = "blackcrappie" }, } },   
		{ header = "Walleye", txt = "Sell all walleye.", params = { event = "jcc-fishing:client:sellfish", args = { fish = "walleye" }, } },   
		{ header = "Pickerel", txt = "Sell all pickerel.", params = { event = "jcc-fishing:client:sellfish", args = { fish = "pickerel" }, } },   
		{ header = "Channel Catfish", txt = "Sell all channel catfish.", params = { event = "jcc-fishing:client:sellfish", args = { fish = "channelcatfish" }, } },   
    })
end)
RegisterNetEvent('jcc-fishing:freshwaterlarge', function()
    exports['qb-menu']:openMenu({
        { header = "Freshwater Fish Buyer", txt = "Sell your fish here", isMenuHeader = true }, 
        { header = "Go Back", txt = "Go Back.", params = { event = "jcc-fishing:freshwatersell", }, },   
		{ header = "Chinook Salmon", txt = "Sell all chinook salmon.", params = { event = "jcc-fishing:client:sellfish", args = { fish = "chinooksalmon" }, } },   
        { header = "Coho Salmon", txt = "Sell all coho salmon.", params = { event = "jcc-fishing:client:sellfish", args = { fish = "cohosalmon" }, } },   
		{ header = "Muskellunge", txt = "Sell all muskellunge.", params = { event = "jcc-fishing:client:sellfish", args = { fish = "largemouthbass" }, } },   
		{ header = "Smallmouth Bass", txt = "Sell all smallmouth bass.", params = { event = "jcc-fishing:client:sellfish", args = { fish = "muskellunge" }, } },   
		{ header = "Blue Catfish", txt = "Sell all blue catfish.", params = { event = "jcc-fishing:client:sellfish", args = { fish = "bluecatfish" }, } },   
		{ header = "Flathead Catfish", txt = "Sell all flathead catfish.", params = { event = "jcc-fishing:client:sellfish", args = { fish = "flatheadcatfish" }, } },   
		{ header = "Paddlefish", txt = "Sell all paddlefish.", params = { event = "jcc-fishing:client:sellfish", args = { fish = "paddlefish" }, } },   
    })
end)
RegisterNetEvent('jcc-fishing:freshwatershop', function ()
	TriggerServerEvent("inventory:server:OpenInventory", "shop", "freshwaterfish", Config.FreshwaterItems)
end)
--saltwater
RegisterNetEvent('jcc-fishing:saltwatersell', function()
    exports['qb-menu']:openMenu({
        { header = "💲 Saltwater Fish Buyer", txt = "Sell your fish here", isMenuHeader = true }, 
        { header = "❌ Close Menu", txt = "Close menu.", params = { event = "qb-menu:client:closeMenu",}, },
        { header = "🎣 Fishing Store", txt = "Fishing store.", params = { event = 'jcc-fishing:freshwatershop',}, },
		{ header = "🐠 Small Fish", txt = "Sell small saltwater fish.", params = { event = "jcc-fishing:saltwatersmall",}, },
        { header = "🦈 Large Fish", txt = "Sell large saltwater fish.", params = { event = "jcc-fishing:saltwaterlarge",}, },   
    })
end)
RegisterNetEvent('jcc-fishing:saltwatersmall', function()
    exports['qb-menu']:openMenu({
        { header = "Saltwater Fish Buyer", txt = "Sell your fish here", isMenuHeader = true }, 
        { header = "Go Back", txt = "Go Back.", params = { event = "jcc-fishing:saltwatersell", }, },   
		{ header = "Bonefish", txt = "Sell all bonefish.", params = { event = "jcc-fishing:client:sellfish", args = { fish = "bonefish" }, } },   
        { header = "Wahoo", txt = "Sell all wahoo.", params = { event = "jcc-fishing:client:sellfish", args = { fish = "wahoo" }, } },   
		{ header = "Bluefish", txt = "Sell all bluefish.", params = { event = "jcc-fishing:client:sellfish", args = { fish = "bluefish" }, } },   
		{ header = "Mackerel", txt = "Sell all mackerel.", params = { event = "jcc-fishing:client:sellfish", args = { fish = "mackerel" }, } },   
		{ header = "Flounder", txt = "Sell all flounder.", params = { event = "jcc-fishing:client:sellfish", args = { fish = "flounder" }, } },   
		{ header = "Yellowtail", txt = "Sell all yellowtail.", params = { event = "jcc-fishing:client:sellfish", args = { fish = "yellowtail" }, } },   
		{ header = "Red Snapper", txt = "Sell all red snapper.", params = { event = "jcc-fishing:client:sellfish", args = { fish = "redsnapper" }, } },   
		{ header = "Tarpon", txt = "Sell all tarpon.", params = { event = "jcc-fishing:client:sellfish", args = { fish = "tarpon" }, } },   
    })
end)
RegisterNetEvent('jcc-fishing:saltwaterlarge', function()
    exports['qb-menu']:openMenu({
        { header = "Saltwater Fish Buyer", txt = "Sell your fish here", isMenuHeader = true }, 
        { header = "Go Back", txt = "Go Back.", params = { event = "jcc-fishing:saltwatersell", }, },   
		{ header = "Blackfin Tuna", txt = "Sell all blackfin tuna.", params = { event = "jcc-fishing:client:sellfish", args = { fish = "blackfintuna" }, } },   
        { header = "Mahi Mahi", txt = "Sell all mahi mahi.", params = { event = "jcc-fishing:client:sellfish", args = { fish = "mahimahi" }, } },   
		{ header = "Crevalle Jack", txt = "Sell all crevalle jack.", params = { event = "jcc-fishing:client:sellfish", args = { fish = "crevallejack" }, } },   
		{ header = "Red Drum", txt = "Sell all red drum.", params = { event = "jcc-fishing:client:sellfish", args = { fish = "reddrum" }, } },   
		{ header = "Bluefin Tuna", txt = "Sell all bluefin tuna.", params = { event = "jcc-fishing:client:sellfish", args = { fish = "bluefintuna" }, } },   
    })
end)
RegisterNetEvent('jcc-fishing:salthwatershop', function ()
	TriggerServerEvent("inventory:server:OpenInventory", "shop", "saltwaterfish", Config.SaltwaterItems)
end)
RegisterNetEvent('jcc-fishing:client:sellfish', function(data)
    local ped = PlayerPedId()
    print(data.fish)
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(hasItem)
        if hasItem then
            QBCore.Functions.Progressbar('SellFish', 'Selling fish...', 15000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "mp_common", 
                anim = "givetake1_b",   
                flags = 1,
            }, {}, {}, function()
                ClearPedTasks(ped)
                TriggerServerEvent('jcc-fishing:server:sellfish', data.fish)
                end, function()
                ClearPedTasks(ped)
                QBCore.Functions.Notify('Cancelled.')
            end)
        else
            QBCore.Functions.Notify('You don\'t have any.', 'error')
        end
    end, data.fish, 1)
end)
RegisterNetEvent('jcc-fishing:client:startFishing', function()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local boat = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 12294)
    if not fishing then 
        if IsEntityInWater(ped) or IsEntityInWater(boat) then
            if not IsPedInAnyVehicle(ped, false) then 
                if not IsPedSwimming(ped) then
                    if checkFishingArea() then
                        if currentArea == 1 or currentArea == 3 or currentArea == 4 then
                            FreezeEntityPosition(ped, true)
                            SetCurrentPedWeapon(ped, 0xA2719263)
                            Wait(1000)
                            LocalPlayer.state:set("inv_busy", true, true)
                            fishingStart(1)
                            fishing = true 
                        elseif currentArea == 2 then
                            FreezeEntityPosition(ped, true)
                            SetCurrentPedWeapon(ped, 0xA2719263)
                            Wait(1000)
                            LocalPlayer.state:set("inv_busy", true, true)
                            fishingStart(2)
                            fishing = true
                        end
                    else
                        QBCore.Functions.Notify("Water is too shallow", 'error')
                        fishing = false
                        currentArea = 0
                    end
                else
                    FreezeEntityPosition(ped, true)
                    QBCore.Functions.Notify("You can\'t cast while swimming", 'error')
                end
            else
                QBCore.Functions.Notify("You can\'t cast in a vehicle.", 'error')
            end
        elseif checkOnDock() then
            if currentArea == 1 or currentArea == 3 or currentArea == 4 then
                FreezeEntityPosition(ped, true)
                SetCurrentPedWeapon(ped, 0xA2719263)
                Wait(1000)
                LocalPlayer.state:set("inv_busy", true, true)
                fishingStart(1)
                fishing = true 
            elseif currentArea == 2 then
                FreezeEntityPosition(ped, true)
                SetCurrentPedWeapon(ped, 0xA2719263)
                Wait(1000)
                LocalPlayer.state:set("inv_busy", true, true)
                fishingStart(2)
                fishing = true
            end
        else
            QBCore.Functions.Notify("Not enough water to fish.", 'error')
        end
    else
        FreezeEntityPosition(ped, false)
        LocalPlayer.state:set("inv_busy", false, true)
        QBCore.Functions.Notify("You stopped fishing")
        ClearPedTasks(ped)
        DeleteObject(rod)
        DeleteEntity(rod)
        fishing = false
        currentArea = 0
    end
end)
function checkFishingArea()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local inIllegalFishing = illegalFishing:isPointInside(coords)
    if inIllegalFishing then currentArea = 3 return true end
    -- local inHotSpotZone = hotspotZone:isPointInside(coords)
    -- if inHotSpotZone then currentArea = 4 return true end
    local inAlamoSea = AlamoSea:isPointInside(coords)
    if inAlamoSea then currentArea = 1 return true end
    local inTataviamMountain = TataviamMountain:isPointInside(coords)
    if inTataviamMountain then currentArea = 1 return true end
    local inVinewoodFishing = VinewoodFishing:isPointInside(coords)
    if inVinewoodFishing then currentArea = 1 return true end
    local inDrainageArea = drainageArea:isPointInside(coords)
    if inDrainageArea then currentArea = 1 return true end
    local inMirrorParkArea = mirrorParkFishing:isPointInside(coords)
    if inMirrorParkArea then currentArea = 1 return true end
    local inTongaValleyCreekArea = tongvaValleyCreek:isPointInside(coords)
    if inTongaValleyCreekArea then currentArea = 1 return true end
    local inRatonCanyonCreek = ratonCanyonCreek:isPointInside(coords)
    if inRatonCanyonCreek then currentArea = 1 return true end
    local inSaltWaterArea = saltWaterArea:isPointInside(coords)
    if not inSaltWaterArea then currentArea = 2 return true end
    currentArea = 0
    return false
end
function checkOnDock()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local onChumashPier1 = chumashPier1:isPointInside(coords)
    local onChumashPier2 = chumashPier2:isPointInside(coords)
    if onChumashPier1 and not onChumashPier2 then currentArea = 2 return true end
    local onAlamoDock = alamoDock:isPointInside(coords)
    if onAlamoDock then currentArea = 1 return true end
    local onPaletoDock = paletoDock:isPointInside(coords)
    if onPaletoDock then currentArea = 2 return true end
    local onLaPuertaDock = laPuertaDock:isPointInside(coords)
    if onLaPuertaDock then currentArea = 2 return true end
    local onLaPuertaDock2 = laPuertaDock2:isPointInside(coords)
    if onLaPuertaDock2 then currentArea = 2 return true end
    local onLaPuertaDock3 = laPuertaDock3:isPointInside(coords)
    if onLaPuertaDock3 then currentArea = 2 return true end
    local onLaPuertaDock4 = laPuertaDock4:isPointInside(coords)
    if onLaPuertaDock4 then currentArea = 2 return true end
    local onLaPuertaDock5 = laPuertaDock5:isPointInside(coords)
    if onLaPuertaDock5 then currentArea = 2 return true end
    local onLaPuertaDock6 = laPuertaDock6:isPointInside(coords)
    if onLaPuertaDock6 then currentArea = 2 return true end
    local onLaPuertaDock7 = laPuertaDock7:isPointInside(coords)
    if onLaPuertaDock7 then currentArea = 2 return true end
    local onLaPuertaDock8 = laPuertaDock8:isPointInside(coords)
    if onLaPuertaDock8 then currentArea = 2 return true end
    local onLaPuertaDock9 = laPuertaDock9:isPointInside(coords)
    if onLaPuertaDock9 then currentArea = 2 return true end
    local onLaPuertaDock10 = laPuertaDock10:isPointInside(coords)
    if onLaPuertaDock10 then currentArea = 2 return true end
    local onLaPuertaDock11 = laPuertaDock11:isPointInside(coords)
    if onLaPuertaDock11 then currentArea = 2 return true end
    local onLaPuertaDock12 = laPuertaDock12:isPointInside(coords)
    if onLaPuertaDock12 then currentArea = 2 return true end
    currentArea = 0
    return false
end

function catchFish(rarity)
    local ped = PlayerPedId()
    local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
    local duration = math.random(7500,10000)
    local pos = math.random(10,25)
    local width = math.random(10,20)
  --  exports["qb-core"]:HideText()
    if (currentArea == 1) or (currentArea == 4) then
        TriggerServerEvent('jcc-fishing:server:TakeBait')          
        if rarity == 2 then
            duration = math.random(5000,8000)
            pos = math.random(7,25)
            width = math.random(10,15)
        end
        Skillbar.Start({
            duration = duration,
            pos = pos,
            width = width,
        }, function()
            if SucceededAttempts + 1 >= NeededAttempts then
                QBCore.Functions.Notify("You caught a fish.", 'success')
                if rarity == 2 then
                    TriggerServerEvent('jcc-fishing:server:CatchRareFreshwaterFish')
                else
                    TriggerServerEvent('jcc-fishing:server:CatchFreshwaterFish')
                end
                FailedAttemps = 0
                SucceededAttempts = 0
                NeededAttempts = 0
                ClearPedTasks(ped)
                DeleteObject(rod)
                DeleteEntity(rod)
                fishing = true
                fishingStart(1)
            else
                if rarity == 2 then
                    Skillbar.Repeat({
                        duration = math.random(5000,7500),
                        pos = math.random(7,25),
                        width = math.random(10,15),
                    })
                else
                    Skillbar.Repeat({
                        duration = math.random(7000,9500),
                        pos = math.random(10,25),
                        width = math.random(10,20),
                    })
                end
                SucceededAttempts = SucceededAttempts + 1
            end
        end, function()
            ClearPedTasks(ped)
            DeleteObject(rod)
            DeleteEntity(rod)
            FreezeEntityPosition(ped, false)
            FailedAttemps = 0
            SucceededAttempts = 0
            NeededAttempts = 0
            QBCore.Functions.Notify("The fish got away.", 'error')
            LocalPlayer.state:set("inv_busy", false, true)
            fishing = false
        end)
    elseif currentArea == 2 then
        TriggerServerEvent('jcc-fishing:server:TakeBait')          
        if rarity == 2 then
            duration = math.random(5000,8000)
            pos = math.random(7,25)
            width = math.random(10,15)
        end
        Skillbar.Start({
            duration = duration,
            pos = pos,
            width = width,
        }, function()
            if SucceededAttempts + 1 >= NeededAttempts then
                QBCore.Functions.Notify("You caught a fish.", 'success')
                if rarity == 2 then
                    TriggerServerEvent('jcc-fishing:server:CatchRareSaltwaterFish')
                else
                    TriggerServerEvent('jcc-fishing:server:CatchSaltwaterFish')
                end
                FailedAttemps = 0
                SucceededAttempts = 0
                NeededAttempts = 0
                ClearPedTasks(ped)
                DeleteObject(rod)
                DeleteEntity(rod)
                fishing = true
                fishingStart(1)
            else
                if rarity == 2 then
                    Skillbar.Repeat({
                        duration = math.random(5000,7500),
                        pos = math.random(7,25),
                        width = math.random(10,15),
                    })
                else
                    Skillbar.Repeat({
                        duration = math.random(7000,9500),
                        pos = math.random(10,25),
                        width = math.random(10,20),
                    })
                end
                SucceededAttempts = SucceededAttempts + 1
            end
        end, function()
            ClearPedTasks(ped)
            DeleteObject(rod)
            DeleteEntity(rod)
            FreezeEntityPosition(ped, false)
            FailedAttemps = 0
            SucceededAttempts = 0
            NeededAttempts = 2
            QBCore.Functions.Notify("The fish got away.", 'error')
            LocalPlayer.state:set("inv_busy", false, true)
            fishing = false
        end)
    elseif currentArea == 3 then
        TriggerServerEvent('jcc-fishing:server:TakeBait')                    
        if rarity == 2 then
            duration = math.random(5000,8000)
            pos = math.random(7,25)
            width = math.random(10,15)
        end
        if rarity == 3 then
            duration = math.random(5000,7000)
            pos = math.random(7,30)
            width = math.random(10,15)
        end
        Skillbar.Start({
            duration = duration,
            pos = pos,
            width = width,
        }, function()
            if SucceededAttempts + 1 >= NeededAttempts then
                QBCore.Functions.Notify("You caught a fish.", 'success')
                if rarity == 2 then
                    TriggerServerEvent('jcc-fishing:server:CatchRareFreshwaterFish')
                elseif rarity == 3 then
                    TriggerServerEvent('jcc-fishing:server:CatchIllegalFreshwaterFish')
                else
                    TriggerServerEvent('jcc-fishing:server:CatchFreshwaterFish')
                end
                FailedAttemps = 0
                SucceededAttempts = 0
                NeededAttempts = 2
                ClearPedTasks(ped)
                DeleteObject(rod)
                DeleteEntity(rod)
                fishing = true
                fishingStart(1)
            else
                if rarity == 2 then
                    Skillbar.Repeat({
                        duration = math.random(5000,7500),
                        pos = math.random(7,25),
                        width = math.random(10,15),
                    })
                elseif rarity == 3 then
                    Skillbar.Repeat({
                        duration = math.random(5000,6500),
                        pos = math.random(7,30),
                        width = math.random(10,15),
                    })
                else
                    Skillbar.Repeat({
                        duration = math.random(7000,9500),
                        pos = math.random(10,25),
                        width = math.random(10,20),
                    })
                end
                SucceededAttempts = SucceededAttempts + 1
            end
        end, function()
            ClearPedTasks(ped)
            DeleteObject(rod)
            DeleteEntity(rod)
            FreezeEntityPosition(ped, false)
            FailedAttemps = 0
            SucceededAttempts = 0
            NeededAttempts = 2
            QBCore.Functions.Notify("The fish got away.", 'error')
            LocalPlayer.state:set("inv_busy", false, true)
            fishing = false
        end)
    end
end
Citizen.CreateThread(function()
    while true do
        if fishing == true then
            Citizen.Wait(math.random(20000,35000))
            if fishing == true then 
                fishing = false
                local fishRarity = 1
                if currentArea == 1 then
                    local fishChance = math.random(1,100)
                    if fishChance >= 90 then
                        fishRarity = 2
                    end
                end
                if currentArea == 2 then
                    local fishChance = math.random(1,100)
                    if fishChance >= 90 then
                        fishRarity = 2
                    end
                end
                if currentArea == 3 then
                    local fishChance = math.random(1,100)
                    if fishChance >= 95 then
                        fishRarity = 3
                    elseif fishChance < 95 and fishChance >= 85 then
                        fishRarity = 2
                    end
                end
                if currentArea == 4 then
                    local fishChance = math.random(1,100)
                    if fishChance >= 95 then
                        fishRarity = 3
                    elseif fishChance < 95 and fishChance >= 85 then
                        fishRarity = 2
                    end
                end
                catchFish(fishRarity)
            end
        end
    Citizen.Wait(1000)
    end
end)
--Key press to stop fishing, just makes it easier than having to only use the fishing rod again and helps prevent scuff
Citizen.CreateThread(function()
    while true do
        sleep = 1000
        if fishing == true then
            sleep = 1
            if IsControlPressed(0, 38) then
                fishing = false
                ClearPedTasks(PlayerPedId())
                DeleteObject(rod)
                DeleteEntity(rod)
                FreezeEntityPosition(PlayerPedId(), false)
                LocalPlayer.state:set("inv_busy", false, true)
            end
        end
        Citizen.Wait(sleep)
    end
end)

local function DrawText3D(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

Citizen.CreateThread(function()
    while true do
        Wait(3)
        if fishing then
            local pcoords = GetEntityCoords(PlayerPedId())
            DrawText3D(pcoords.x, pcoords.y, pcoords.z, "~g~[E]~w~ - Stop Fishing") 
        end
    end
end)

function fishingStart(area)
    if area ~= 2 then 
        QBCore.Functions.TriggerCallback('QBCore:HasItem', function(hasItem)
            if hasItem then
             --   exports["qb-core"]:DrawText("[E] - Stop Fishing", "left")
                LoadPropDict('prop_fishing_rod_01')
                rod = AttachEntityToPed('prop_fishing_rod_01',60309, 0,0,0, 0,0,0)
                fising = true
                CastingAnim()
                Wait(500)
                FishingAnim()
            else
                ClearPedTasks(ped)
                DeleteObject(rod)
                DeleteEntity(rod)
                FreezeEntityPosition(PlayerPedId(), false)
                QBCore.Functions.Notify("You don\'t have any bait.", 'error')
                LocalPlayer.state:set("inv_busy", false, true)
                fishing = false
            end
        end, 'redwiggler')
    else
        QBCore.Functions.TriggerCallback('QBCore:HasItem', function(hasItem)
            if hasItem then
           --     exports["qb-core"]:DrawText("[E] - Stop Fishing", "left")
                LoadPropDict('prop_fishing_rod_01')
                rod = AttachEntityToPed('prop_fishing_rod_01',60309, 0,0,0, 0,0,0)
                fishing = true        
                CastingAnim()
                Wait(2575)
                FishingAnim()
            else
                ClearPedTasks(ped)
                DeleteObject(rod)
                DeleteEntity(rod)
                FreezeEntityPosition(PlayerPedId(), false)
                QBCore.Functions.Notify("You don\'t have any bait.", 'error')
                LocalPlayer.state:set("inv_busy", false, true)
                fishing = false
            end
        end, 'redwiggler')
    end
end
--Some code i found in vrP_fishing https://github.com/OriginalGamers/vrp_fishing_animations/blob/master/vrp_fishing_animations/client.lua
function AttachEntityToPed(prop,bone_ID,x,y,z,RotX,RotY,RotZ)
	BoneID = GetPedBoneIndex(PlayerPedId(), bone_ID)
	obj = CreateObject(GetHashKey(prop),  1729.73,  6403.90,  34.56,  true,  true,  true)
	vX,vY,vZ = table.unpack(GetEntityCoords(PlayerPedId()))
	xRot, yRot, zRot = table.unpack(GetEntityRotation(PlayerPedId(),2))
	AttachEntityToEntity(obj,  PlayerPedId(),  BoneID, x,y,z, RotX,RotY,RotZ,  false, false, false, false, 2, true)
	return obj
end
--Anims and Props
function FishingAnim()
    local ped = PlayerPedId()
    LoadAnim("amb@world_human_stand_fishing@idle_a")
    TaskPlayAnim(ped, "amb@world_human_stand_fishing@idle_a", "idle_c", 20.0, -8, -1, 17, 0, 0, 0, 0)
end
function CastingAnim()
    local ped = PlayerPedId()
    LoadAnim("mini@tennis")
    TaskPlayAnim(ped, "mini@tennis", "close_fh_ts_md", 1.0, 1.0, 250, 48, 0, 0, 0, 0)
end
function LoadAnim(dict)
	while not HasAnimDictLoaded(dict) do
	  RequestAnimDict(dict)
	  Wait(10)
	end
end
function LoadPropDict(model)
	while not HasModelLoaded(GetHashKey(model)) do
	  RequestModel(GetHashKey(model))
	  Wait(10)
	end
end
function LoadAnimSet(set)
    while not HasAnimSetLoaded(set) do
        RequestAnimSet(set)
      Citizen.Wait(1)
    end
end
