# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

SEED_HERO_IDS = [1253,1254,1255,1256,1257,1259,1260,1261,1262,1263,1264,1265,1267,1268,1269,1271,1273,1274,1275,1276,1277,1278,1279,1281,1282,1283,1284,1285,1286,1287,1288,1289,1290,1291,1292,1294,1295,1296,1297,1300,1301,1304,1305,1306,1307,1308,1309,1310,1311,1312,1313,1314,1315,1316,1317,1318,1320,1321,1323,1324,1327,1329,1331,1332,1333,1334,1336,1337,1338,1339,1340,1341,1342,1343,1345,1346,1348,1353,1354,1355,1356,1357,1358,1359,1360,1363,1364,1365,1366,1367,1369,1375,1376,1378,1379,1380,1381,1382,1383,1384,1386,1387,1388,1389,1390,1391,1393,1394,1395,1396,1397,1398,1399,1400,1401,1402,1403,1404,1405,1406,1407,1409,1410,1411,1412,1413,1414,1415,1416,1417,1418,1419,1420,1421,1422,1423,1424,1425,1426,1427,1428,1430,1431,1432,1434,1438,1440,1441,1442,1443,1444,1445,1446,1447,1449,1450,1451,1453,1454,1455,1456,1457,1459,1460,1461,1462,1463,1464,1465,1466,1467,1468,1469,1470,1472,1473,1474,1475,1476,1477,1478,1479,1480,1483,1485,1486,1487,1488,1489,1490,1491,1492,1493,1494,1496,1498,1499,1501,1502,1503,1504,1505,1506,1507,1510,1511,1520,1521,1525,1526,1527,1528,1529,1530,1532,1534,1535,1536,1538,1542,1544,1546,1548,1549,1550,1552,1553,1554,1556,1558,1560,1561,1562,1563,1564,1565,1566,1567,1568,1569,1570,1571,1572,1573,1574,1578,1579,1580,1581,1582,1583,1584,1585,1586,1587,1588,1589,1590,1591,1592,1593,1594,1595,1596,1597,1599,1600,1601,1603,1604,1606,1608,1611,1612,1614,1615,1616,1617,1618,1619,1620,1621,1622,1623,1624,1625,1626,1628,1629,1630,1631,1632,1633,1634,1636,1637,1638,1639,1640,1641,1837,1838,1843,1844,1845,1847,1848,1849,1851,1853,1854,1855,1857,1858,1860,1862,1864,1866,1868,1869,1870,1871,1873,1874,1875,1879,1884,1885,1888,1891,1892,1895,1896,1897,1898,1900,1901,1902,1903,1904,1907,1908,1909,1910,1911,1912,1913,1914,1917,1918,1920,1924,1925,1926,1927,1935,1936,1937,1938,1939,1940,1943,1944,1945,1946,1947,1950,1951,1952,1953,1954,1955,1956,1957,1958,1959,1960,1961,1962,1963,1964,1965,1966,1968,1970,1971,1972,1974,1975,1976,1977,1978,1981,1983,1984,1985,1986,1991,1993,1996,1998,2010,2012,2015,2018,2021,2022,2024,2025,2026,2027,2030,2031,2032,2033,2034,2035,2036,2038,2039,2040,2041,2042,2044,2046,2047,2048,2049,2050,2051,2053,2054,2055,2060,2061,2062,2063,2067,2068,2070,2071,2072,2074,2075,2076,2077,2078,2079,2080,2083,2087,2088,2089,2092,2093,2094,2095,2096,2097,2098,2101,2102,2103,2104,2105,2106,2110,2111,2112,2113,2114,2115,2116,2117,2118,2119,2120,2122,2125,2126,2127,2128,2129,2131,2132,2133,2134,2135,2136,2137,2138,2139,2140,2141,2142,2143,2144,2145,2146,2147,3522,3526,3529,3530,3534,3535,3537,3541,3542,3544,3546,3547,3548,3552,3553,3554,3555,3556,3557,3558,3559,3560,3561,3562,3563,3564,3565,3566,3567,3568,3569,3573,3574,3575,3576,3577,3581,3582,3583,3584,3585,3586,3587,3588,3592,3593,3594,3596,3598,3600,3601,3602,3603,3604,3607,3608,3609,3610,3611,3612,3614,3615,3616,3617,3618,3619,3620,3621,3622,3625,3628,3629,3631,3632,3633,3634,3637,3638,3639,3640,3642,3643,3644,3645,3646,3647,3649,3650,3651,3652,3654,3655,3656,3658,3659,3660,3661,3662,3663,3666,8408,8409,8410,8412,8413,8414,8415,8416,8417,8418,8419,8420,8421,8424,8425,8426,8427,8428,8429,8433,8436,8437,8438,8439,8440,8441,8445,8448,8449,8452,8453,8456,8460,8461,8462,8464,8465,8466,8468,8469,8470,8471,8473,8474,8475,8476,8477,8478,8479,8480,8481,8483,8484,8485,8488,8489,8490,8491,8492,8493,8494,8495,8496,8497,8498,8499,8500,8501,8502,8503,8504,8505,8506,8507,8508,8509,8510,8511,8512,8513,8514,8515,8516,8517,8518,8519,8520,8521,8522,8523,8524,8525,8526,8527,8528,8529,8530,8532,8533,8534,15162,15164,15167,15169,15171,15172,15173,15174,15175,15176,15177,15178,15179,15180,15182,15183,15186,15187,15190,15192,15193,15194,15195,15196,15197,15198,15199,15201,15202,15203,15205,15209,15210,15212,15216,15217,15218,15219,15220,15222,15223,15224,15225,15226,15232,15233,15235,15237,15238,15240,15241,15243,15244,15245,15248,15249,15250,15251,15252,15253,15254,15255,15256,15257,15258,15260,15261,15262,15263,15264,15265,15266,15267,15268,15269,15270,15271,15272,15274,15275,15276,15277,15279,15280,15281,15282,15283,15284,15286,15287,15288,15290,15292,15294,15296,15297,15298,15299,15300,15301,37305,37306,37307,37308,37309,37310,37311,37312,37313,37314,37315,37316,37317,37318,37319,37321,37322,37323,37324,37325,37326,37327,37328,37329,37330,37331,37332,37333,37334,37335,37336,37339,37340,37341,37342,37343,37344,37345,37346,37347,37348,37349,37350,37351,37352,37353,37354,37355,37357,37358,37359,37360,37362,37364,37365,37366,37367,37368,37369,37370,37379,37381,37382,37383,37384,37385,37386,37387,37389,37390,37391,37392,37393,37394,37395,37396,37397,37398,37400,37401,37402,37403,37405,37406,37407,37408,37409,37411,37412,37413,37414,37416,37417,37418,37419,37420,37421,37422,37423,37424,71604,71605,71606,71608,71609,71610,71612,71613,71614,71615,71616,71617,71618,71619,71620,71621,71622,71623,71624,71625,71626,71627,71628,71629,71630,71631,71632,71633,71634,71635,71636,71637,71638,71639,71640,71641,71642,71643,71646,71647,71649,71650,71651,71652,71653,71654,71655,71656,71657,71658,71659,71660,71661,71664,71665,71666,71667,71668,71669,71670,71672,71673,71674,71675,71676,71677,71678,71679,71680,71681,71682,71683,71684,71685,71686,71687,71688,71689,71691,71692,71693,71694,71695,71696,71697,71698,71699,71700,71701,71702,71703,71704,71705,71706,71708,71709,71710,71711,71712,71713
]

# matches don't require anything except an ID because it functions as a join. 180 is an arbitrary number.
180.times do
  Match.create
end

users = CSV.read('seed_csvs/users.csv', :headers => true)
user_hash = {}
users.each do |row|
  user_hash[:provider] = row[0].to_s
  user_hash[:uid] = row[1]
  user_hash[:name] = row[2].to_s
  user_hash[:image] = row[3].to_s
  user = User.create(user_hash)
  rand(8).times do
    team_hash = {}

    team_hash[:user_id] = user.id
    # hero and villain ids are generated for seeds by using upper and lower bounds of range in API
    team_hash[:hero_one] = SEED_HERO_IDS[rand(1..999)]
    team_hash[:hero_two] = SEED_HERO_IDS[rand(1..999)]
    team_hash[:hero_three] = SEED_HERO_IDS[rand(1..999)]
    team_hash[:hero_four] = SEED_HERO_IDS[rand(1..999)]
    team_hash[:hero_five] = SEED_HERO_IDS[rand(1..999)]
    team_hash[:hero_six] = SEED_HERO_IDS[rand(1..999)]
    team_hash[:villain_one] = SEED_HERO_IDS[rand(1..999)]
    team_hash[:villain_two] = SEED_HERO_IDS[rand(1..999)]
    team_hash[:villain_three] = SEED_HERO_IDS[rand(1..999)]
    team_hash[:villain_four] = SEED_HERO_IDS[rand(1..999)]
    team_hash[:cover_url] = "cover.jpg"
    team_hash[:playlist_url] = "spotify link"
    team_hash[:pitch] = "coming soon"
    team_hash[:name] = "team name"
    team_hash[:match_id] = Match.offset(rand(Match.count)).first.id
    Team.create(team_hash)
  end
end

# 5000 is also an arbitrary number. This will also have to change. :)
5000.times do 
  user_offset = rand(User.count)
  team_offset = rand(Team.count)
  
  vote_hash = {user_id: User.offset(user_offset).first.id, team_id: Team.offset(team_offset).first.id }
  Vote.create(vote_hash)
end