-- Placement II YEAR DATA.xlsx import (132 CSE II year students)
-- Safe to run on an existing college_management DB (uses INSERT IGNORE).
-- Student logins: username = Reg No, password = welcome123
USE college_management;

INSERT IGNORE INTO student (roll_no, name, dob, gender, email, phone, address, department_id, year_of_study, admission_date) VALUES
('73152313001', 'AARTHI K', NULL, NULL, 'aarthikcse2427@ksrce.ac.in', '6374437337', NULL, 1, 2, '2024-08-01'),
('73152313002', 'ABISECK D', NULL, NULL, 'abiseckdcse2427@ksrce.ac.in', '9342747327', NULL, 1, 2, '2024-08-01'),
('73152313003', 'ADITYA V', NULL, NULL, 'adityavcse2427@ksrce.ac.in', '6380007564', NULL, 1, 2, '2024-08-01'),
('73152313004', 'AJAY B', NULL, NULL, 'ajaybcse2427@ksrce.ac.in', '8344548686', NULL, 1, 2, '2024-08-01'),
('73152313005', 'AKILANI I', NULL, NULL, 'akilanicse2427@ksrce.ac.in', '7200576476', NULL, 1, 2, '2024-08-01'),
('73152313006', 'ANANDHA KUMARAN M S', NULL, NULL, 'anandhakumaranmscse2427@ksrce.ac.in', '9566892647', NULL, 1, 2, '2024-08-01'),
('73152313007', 'ANANTHU N', NULL, NULL, 'ananthuncse2427@ksrce.ac.in', '7418840748', NULL, 1, 2, '2024-08-01'),
('73152313008', 'ANUSRI S', NULL, NULL, 'anusriscse2427@ksrce.ac.in', '6380329525', NULL, 1, 2, '2024-08-01'),
('73152313009', 'ARUL M', NULL, NULL, 'arulmcse2427@ksrce.ac.in', '8072709046', NULL, 1, 2, '2024-08-01'),
('73152313010', 'ASWINTHRAJ DEVARAJ', NULL, NULL, 'aswinthrajdevarajcse2427@ksrce.ac.in', '6369585965', NULL, 1, 2, '2024-08-01'),
('73152313011', 'BAARHAVI M D', NULL, NULL, 'baarhavimdcse2427@ksrce.ac.in', '6369163774', NULL, 1, 2, '2024-08-01'),
('73152313012', 'BALAMURUGAN T', NULL, NULL, 'balamurugantcse2427@ksrce.ac.in', '6381767535', NULL, 1, 2, '2024-08-01'),
('73152313013', 'BHARANI M', NULL, NULL, 'bharanimcse2427@ksrce.ac.in', '9962983012', NULL, 1, 2, '2024-08-01'),
('73152313014', 'BHARANIDHARAN R', NULL, NULL, 'bharanidharanrcse2427@ksrce.ac.in', '9597704329', NULL, 1, 2, '2024-08-01'),
('73152313015', 'BHARATH V', NULL, NULL, 'bharathvcse2427@ksrce.ac.in', '8838354569', NULL, 1, 2, '2024-08-01'),
('73152313016', 'BHAVAGEETHA S', NULL, NULL, 'bhavageethascse2427@ksrce.ac.in', '9629159333', NULL, 1, 2, '2024-08-01'),
('73152313017', 'CHANDRAPRADEEP R', NULL, NULL, 'chandrapradeeprcse2427@ksrce.ac.in', '9047353386', NULL, 1, 2, '2024-08-01'),
('73152313018', 'CHERALATHAN B N', NULL, NULL, 'cheralathanbncse2427@ksrce.ac.in', '8668180041', NULL, 1, 2, '2024-08-01'),
('73152313019', 'DEENADHAYALAN A', NULL, NULL, NULL, '8667525669', NULL, 1, 2, '2024-08-01'),
('73152313020', 'DEENATHAYALAN P', NULL, NULL, 'deenathayalanpcse2427@ksrce.ac.in', '6383421621', NULL, 1, 2, '2024-08-01'),
('73152313021', 'DEEPANA M', NULL, NULL, 'deepanamcse2427@ksrce.ac.in', '8870754453', NULL, 1, 2, '2024-08-01'),
('73152313022', 'DEVAPRASATH J', NULL, NULL, 'devaprasathjcse2427@ksrce.ac.in', '8778125316', NULL, 1, 2, '2024-08-01'),
('73152313023', 'DHANUSHPRIYAN T', NULL, NULL, 'dhanushpriyantcse2427@ksrce.ac.in', '9342469794', NULL, 1, 2, '2024-08-01'),
('73152313024', 'DHARSANKUMAR R K', NULL, NULL, 'dharsankumarrkcse2427@ksrce.ac.in', '7339022060', NULL, 1, 2, '2024-08-01'),
('73152313025', 'DHARSHINI E', NULL, NULL, 'dharshiniecse2427@ksrce.ac.in', '9500560294', NULL, 1, 2, '2024-08-01'),
('73152313026', 'DHARSHINI J', NULL, NULL, 'dharshinijcse2427@ksrce.ac.in', '8072048353', NULL, 1, 2, '2024-08-01'),
('73152313027', 'DHARSHINI V', NULL, NULL, 'dharshinivcse2427@ksrce.ac.in', '9384492791', NULL, 1, 2, '2024-08-01'),
('73152313028', 'DHILIPKUMAR M', NULL, NULL, 'dhilipkumarmcse2427@ksrce.ac.in', '8940739141', NULL, 1, 2, '2024-08-01'),
('73152313029', 'DHIVAGAR P R', NULL, NULL, 'dhivagarprcse2427@ksrce.ac.in', '7339224113', NULL, 1, 2, '2024-08-01'),
('73152313030', 'DINESH KUMAR S', NULL, NULL, 'dineshkumarscse2427@ksrce.ac.in', '9344923793', NULL, 1, 2, '2024-08-01'),
('73152313031', 'DIVYA M', NULL, NULL, 'divyamcse2427@ksrce.ac.in', '6381835760', NULL, 1, 2, '2024-08-01'),
('73152313032', 'GAYATHRI K', NULL, NULL, 'gayathrikcse2427@ksrce.ac.in', '6374148401', NULL, 1, 2, '2024-08-01'),
('73152313033', 'GISHNU B', NULL, NULL, 'gishnubcse2427@ksrce.ac.in', '6381120253', NULL, 1, 2, '2024-08-01'),
('73152313034', 'GOKUL PRASATH R', NULL, NULL, 'gokulprasathrcse2427@ksrce.ac.in', '8220389470', NULL, 1, 2, '2024-08-01'),
('73152313035', 'GOPIKA M', NULL, NULL, 'gopikamcse2427@ksrce.ac.in', '9042625270', NULL, 1, 2, '2024-08-01'),
('73152313036', 'GOPIKA P', NULL, NULL, 'gopikapcse2427@ksrce.ac.in', '9080352239', NULL, 1, 2, '2024-08-01'),
('73152313037', 'GOPIKA R', NULL, NULL, 'gopikarcse2427@gmail.com', '9894859889', NULL, 1, 2, '2024-08-01'),
('73152313038', 'GOWRINATH S', NULL, NULL, 'gowrinathscse2427@gmail.com', '9597898379', NULL, 1, 2, '2024-08-01'),
('73152313039', 'GOWSHIGAN T', NULL, NULL, 'gowshigantcse2427@ksrce.ac.in', '9361688990', NULL, 1, 2, '2024-08-01'),
('73152313040', 'GOWTHAM M', NULL, NULL, 'gowthammcse2427@ksrce.ac.in', '9578081165', NULL, 1, 2, '2024-08-01'),
('73152313041', 'HARISHKUMAR D', NULL, NULL, 'harishkumardcse2427@ksrce.ac.in', '6383261753', NULL, 1, 2, '2024-08-01'),
('73152313042', 'HARSHAVARDINI T', NULL, NULL, 'harshavardinitcse2427@ksrce.ac.in', '6374491354', NULL, 1, 2, '2024-08-01'),
('73152313043', 'HEMASHRI T K', NULL, NULL, 'hemashrimtkcse2427@ksrce.ac.in', '6369489001', NULL, 1, 2, '2024-08-01'),
('73152313044', 'IMMANUEL FRANKLIN S', NULL, NULL, 'immanuelfranklinscse22427@ksrce.ac.in', '9791621615', NULL, 1, 2, '2024-08-01'),
('73152313045', 'JAYASUDHAN N', NULL, NULL, 'jayasudhanncse2427@ksrce.ac.in', '8489206436', NULL, 1, 2, '2024-08-01'),
('73152313046', 'JEEVITH K', NULL, NULL, 'jeevithkcse2427@ksrce.ac.in', '9342430387', NULL, 1, 2, '2024-08-01'),
('73152313047', 'JEEVITHA P', NULL, NULL, 'jeevithapcse2427@ksrce.ac.in', '9952741466', NULL, 1, 2, '2024-08-01'),
('73152313048', 'JEGAN D', NULL, NULL, 'jegandcse2427@ksrce.ac.in', '9342640878', NULL, 1, 2, '2024-08-01'),
('73152313049', 'JOTHILAKSHMI M', NULL, NULL, 'jothilakshmimcse2427@ksrce.ac.in', '7339028579', NULL, 1, 2, '2024-08-01'),
('73152313050', 'KALAIYARASI S', NULL, NULL, 'kalaiyarasiscse2427@ksrce.ac.in', '8838122147', NULL, 1, 2, '2024-08-01'),
('73152313051', 'KAMALESH V', NULL, NULL, 'kamaleshvcse2427@ksrce.ac.in', '8608928772', NULL, 1, 2, '2024-08-01'),
('73152313052', 'KARTHI K', NULL, NULL, 'karthikcse2427@ksrce.ac.in', '8248146153', NULL, 1, 2, '2024-08-01'),
('73152313053', 'KAVIDHARSHINI S', NULL, NULL, 'kavidharshiniscse2427@ksrce.ac.in', '8610881590', NULL, 1, 2, '2024-08-01'),
('73152313054', 'KAVINESHAN K', NULL, NULL, 'kavineshankcse2427@ksrce.ac.in', '9344093349', NULL, 1, 2, '2024-08-01'),
('73152313055', 'KAVIYARASAN S', NULL, NULL, 'kaviyarasanscse2427@ksrce.ac.in', '6383923092', NULL, 1, 2, '2024-08-01'),
('73152313056', 'KEERTHIKA G', NULL, NULL, 'keerthikagcse2427@ksrce.ac.in', '9025412645', NULL, 1, 2, '2024-08-01'),
('73152313057', 'KEERTHIKA K', NULL, NULL, 'keerthikakcse2427@ksrce.ac.in', '9159948717', NULL, 1, 2, '2024-08-01'),
('73152313058', 'KEERTHIKA P', NULL, NULL, 'keerthikapcse2427@ksrce.ac.in', '7010110727', NULL, 1, 2, '2024-08-01'),
('73152313059', 'KIRUTHIKA P', NULL, NULL, 'kiruthikapcse2427@ksrce.ac.in', '9361202450', NULL, 1, 2, '2024-08-01'),
('73152313060', 'KIRUTHIKKAILASH S', NULL, NULL, 'kiruthikkailashscse2427@ksrce.ac.in', '9994472411', NULL, 1, 2, '2024-08-01'),
('73152313061', 'KISHORE R', NULL, NULL, 'kishorercse2427@ksrce.ac.in', '8110810448', NULL, 1, 2, '2024-08-01'),
('73152313062', 'KISHORE KUMAR M', NULL, NULL, NULL, '9442969578', NULL, 1, 2, '2024-08-01'),
('73152313063', 'KOKILA V', NULL, NULL, 'kokilavcse2427@ksrce.ac.in', '9944754651', NULL, 1, 2, '2024-08-01'),
('73152313064', 'KRISHNA KUMAR K N', NULL, NULL, 'KrishnaKumarkncse2427@ksrce.ac.in', '9790502187', NULL, 1, 2, '2024-08-01'),
('73152313065', 'LAVANYA K', NULL, NULL, 'lavanyakcse2427@ksrce.ac.in', '8838895928', NULL, 1, 2, '2024-08-01'),
('73152313066', 'LOGESH J', NULL, NULL, 'logeshjcse2427@ksrce.ac.in', '8825476695', NULL, 1, 2, '2024-08-01'),
('73152313067', 'LOKITH V', NULL, NULL, 'lokithvcse2427@ksrce.ac.in', '8015118079', NULL, 1, 2, '2024-08-01'),
('73152313068', 'MANEESH ADHITHYA S', NULL, NULL, 'maneeshadhithyascse2427@ksrce.ac.in', '9788657300', NULL, 1, 2, '2024-08-01'),
('73152313069', 'MANORANJITH D', NULL, NULL, 'Manoranjithdcse2427@ksrce.ac.in', '9025199507', NULL, 1, 2, '2024-08-01'),
('73152313070', 'MD NAUFAL M', NULL, NULL, 'mdnaufalmcse2427@ksrce.ac.in', '9842884758', NULL, 1, 2, '2024-08-01'),
('73152313071', 'MIRUTHULA K', NULL, NULL, 'miruthulakcse2427@ksrce.ac.in', '8610041599', NULL, 1, 2, '2024-08-01'),
('73152313072', 'MOGESWARAN P', NULL, NULL, 'mogeswaranpcse2427@ksrce.ac.in', '9789755506', NULL, 1, 2, '2024-08-01'),
('73152313073', 'MOHAMMAD RAYYAAN JAMIL', NULL, NULL, 'mohammadrayyaanjamilcse2427@ksrce.ac.in', '6206063556', NULL, 1, 2, '2024-08-01'),
('73152313074', 'MOHAMMED ASHIK M', NULL, NULL, 'mohammedashikmcse2427@ksrce.ac.in', '6369373271', NULL, 1, 2, '2024-08-01'),
('73152313075', 'MOUNEESHWARAN B', NULL, NULL, 'mouneeshwaranbcse2427@ksrce.ac.in', '9025856165', NULL, 1, 2, '2024-08-01'),
('73152313076', 'MUGADHARSHINI E', NULL, NULL, 'mugadharshiniecse2427@ksrce.ac.in', '6374541621', NULL, 1, 2, '2024-08-01'),
('73152313077', 'MUHILAN S', NULL, NULL, 'muhilanscse2427@ksrce.ac.in', '7806897639', NULL, 1, 2, '2024-08-01'),
('73152313078', 'MUKESH S', NULL, NULL, 'mukeshscse2427@ksrce.ac.in', '9042781929', NULL, 1, 2, '2024-08-01'),
('73152313080', 'NATRAYAN N', NULL, NULL, 'natrayanncse2427@ksrce.ac.in', '6379273231', NULL, 1, 2, '2024-08-01'),
('73152313081', 'NAVEEN V', NULL, NULL, 'naveenvcse2427@ksrce.ac.in', '7845454045', NULL, 1, 2, '2024-08-01'),
('73152313082', 'NITESH R P', NULL, NULL, 'niteshrpcse2427@ksrce.ac.in', '6374092484', NULL, 1, 2, '2024-08-01'),
('73152313083', 'NITHISH T', NULL, NULL, 'nithishtcse2427@ksrce.ac.in', '9342925484', NULL, 1, 2, '2024-08-01'),
('73152313084', 'NITHIYAN S', NULL, NULL, 'nithiyanscse2427@ksrce.ac.in', '8072299885', NULL, 1, 2, '2024-08-01'),
('73152313085', 'OVIYA P', NULL, NULL, 'oviyapcse2427@ksrce.ac.in', '8925548422', NULL, 1, 2, '2024-08-01'),
('73152313086', 'PRAGADEESHWARAN S', NULL, NULL, 'pragadeeshwaranscse2427@ksrce.ac.in', '7867964468', NULL, 1, 2, '2024-08-01'),
('73152313087', 'PRAGATHI R', NULL, NULL, 'pragathircse2427@ksrce.ac.in', '6380028818', NULL, 1, 2, '2024-08-01'),
('73152313088', 'PRANEETHA C', NULL, NULL, 'praneethaccse2427@ksrce.ac.in', '9865597647', NULL, 1, 2, '2024-08-01'),
('73152313089', 'PRAVEEN K', NULL, NULL, 'praveenkcse2427@ksrce.ac.in', '6381796344', NULL, 1, 2, '2024-08-01'),
('73152313090', 'PRIYADHARSHINI K', NULL, NULL, 'priyadharshinikcse2427@ksrce.ac.in', '9043703248', NULL, 1, 2, '2024-08-01'),
('73152313091', 'PRIYANKA S', NULL, NULL, 'priyankascse2427@ksrce.ac.in', '8825788084', NULL, 1, 2, '2024-08-01'),
('73152313092', 'RAJARAJAN R', NULL, NULL, 'rajarajanrcse2427@ksrce.ac.in', '6374102792', NULL, 1, 2, '2024-08-01'),
('73152313093', 'RAJKUMAR G', NULL, NULL, 'rajkumargcse2427@ksrce.ac.in', '9080229045', NULL, 1, 2, '2024-08-01'),
('73152313094', 'RAMYA S', NULL, NULL, 'ramyascse2427@ksrce.ac.in', '8056495754', NULL, 1, 2, '2024-08-01'),
('73152313095', 'RAVINDER SINGH', NULL, NULL, 'ravindersinghcse2427@ksrce.ac.in', '7006540818', NULL, 1, 2, '2024-08-01'),
('73152313096', 'RITHISH V N', NULL, NULL, 'rithishvncse2427@ksrce.ac.in', '9363636011', NULL, 1, 2, '2024-08-01'),
('73152313097', 'RIYASATH AAKIL S', NULL, NULL, 'riyasathaakilscse2427@ksrce.ac.in', '7867956587', NULL, 1, 2, '2024-08-01'),
('73152313098', 'SAIKRISHNAN K R', NULL, NULL, 'saikrishnankrcse2427@ksrce.ac.in', '9345734268', NULL, 1, 2, '2024-08-01'),
('73152313099', 'SAKKTHISREE SV', NULL, NULL, 'sakkthisreesvcse2427@ksrce.ac.in', '9043724051', NULL, 1, 2, '2024-08-01'),
('73152313100', 'SAMIKSHA M', NULL, NULL, 'samikshamcse2427@ksrce.ac.in', '6369666283', NULL, 1, 2, '2024-08-01'),
('73152313101', 'SANGAMITHA P', NULL, NULL, 'sangamithapcse2427@ksrce.ac.in', '7010699283', NULL, 1, 2, '2024-08-01'),
('73152313102', 'SANJAY G', NULL, NULL, 'sanjaygcse2427@ksrce.ac.in', '6374831716', NULL, 1, 2, '2024-08-01'),
('73152313103', 'SAVITHA D', NULL, NULL, 'savithadcse2427@ksrce.ac.in', '7806875686', NULL, 1, 2, '2024-08-01'),
('73152313104', 'SHAMYUKTHA M', NULL, NULL, 'shamyukthamcse2427@ksrce.ac.in', '6379337205', NULL, 1, 2, '2024-08-01'),
('73152313105', 'SHANMUGAM B', NULL, NULL, 'Shanmugambcse2427@ksrce.ac.in', '9381204226', NULL, 1, 2, '2024-08-01'),
('73152313106', 'SHANMUGANATHAN T', NULL, NULL, 'shanmuganathantcse2427@ksrce.ac.in', '6379872138', NULL, 1, 2, '2024-08-01'),
('73152313107', 'SHANMUGAVADIVU A', NULL, NULL, 'shanmugavadivuacse2427@ksrce.ac.in', '9043842924', NULL, 1, 2, '2024-08-01'),
('73152313108', 'SHARAVANNAN M', NULL, NULL, 'sharavannanmcse2427@ksrce.ac.in', '7904168749', NULL, 1, 2, '2024-08-01'),
('73152313109', 'SHAYAMALA DEVI V', NULL, NULL, 'shayamaladevivcse2427@ksrce.ac.in', '9940880779', NULL, 1, 2, '2024-08-01'),
('73152313110', 'SIBIRAGAVAN D', NULL, NULL, 'sibiragavandcse2427@ksrce.ac.in', '6374073116', NULL, 1, 2, '2024-08-01'),
('73152313111', 'SINDHUMATHI A', NULL, NULL, 'sindhumathiacse2427@ksrce.ac.in', '6380066180', NULL, 1, 2, '2024-08-01'),
('73152313112', 'SONIKA G', NULL, NULL, 'sonikagcse2427@ksrce.ac.in', '8531001508', NULL, 1, 2, '2024-08-01'),
('73152313113', 'SONIKA SHARMA', NULL, NULL, 'sonikasharmacse2427@ksrce.ac.in', '6005017224', NULL, 1, 2, '2024-08-01'),
('73152313114', 'SOWMIYA R', NULL, NULL, 'sowmiyarcse2427@ksrce.ac.in', '9123538056', NULL, 1, 2, '2024-08-01'),
('73152313115', 'SRIMATHI G', NULL, NULL, 'srimathigcse2427@ksrce.ac.in', '8072025276', NULL, 1, 2, '2024-08-01'),
('73152313116', 'SRIRAM S', NULL, NULL, 'sriramscse2427@ksrce.ac.in', '8438052380', NULL, 1, 2, '2024-08-01'),
('73152313117', 'SURIYA A', NULL, NULL, 'suriyaacse2427@ksrce.ac.in', '9344164325', NULL, 1, 2, '2024-08-01'),
('73152313118', 'SWATHI T', NULL, NULL, 'swathitcse2427@ksrce.ac.in', '8610893380', NULL, 1, 2, '2024-08-01'),
('73152313119', 'SWETHA T S', NULL, NULL, 'swethatscse2427@ksrce.ac.in', '7904433635', NULL, 1, 2, '2024-08-01'),
('73152313120', 'SYED UMAR S', NULL, NULL, 'syedumarscse2427@ksrce.ac.in', '7338988721', NULL, 1, 2, '2024-08-01'),
('73152313121', 'TAMILARASI M', NULL, NULL, 'tamilarasimcse2427@ksrce.ac.in', '6374185911', NULL, 1, 2, '2024-08-01'),
('73152313122', 'TEENA S', NULL, NULL, 'teenascse2427@ksrce.ac.in', '7010507109', NULL, 1, 2, '2024-08-01'),
('73152313123', 'UMA SANKARI K', NULL, NULL, 'umasankarikcse2427@ksrce.ac.in', '6379222844', NULL, 1, 2, '2024-08-01'),
('73152313124', 'USHADEVI K', NULL, NULL, 'ushadevikcse2427@ksrce.ac.in', '7603863889', NULL, 1, 2, '2024-08-01'),
('73152313125', 'VIGNESH G', NULL, NULL, 'vigneshgcse2427@ksrce.ac.in', '7094842435', NULL, 1, 2, '2024-08-01'),
('73152313127', 'YAZHINI S', NULL, NULL, 'yazhiniscse2427@ksrce.ac.in', '6380411015', NULL, 1, 2, '2024-08-01'),
('73152313128', 'YESWANTH M', NULL, NULL, 'yeswanthmcse2427@ksrce.ac.in', '8148374037', NULL, 1, 2, '2024-08-01'),
('73152313501', 'KAVIN M', NULL, NULL, 'kavinkavin1654@gmail.com', '9092163746', NULL, 1, 2, '2024-08-01'),
('73152313502', 'KESAVAN SITHAN', NULL, NULL, 'kesavansid@gmail.com', '8220823006', NULL, 1, 2, '2024-08-01'),
('73152313504', 'MANICKAM R', NULL, NULL, 'manicka709@gmail.com', '8870640019', NULL, 1, 2, '2024-08-01'),
('73152313505', 'MEIYARASU M', NULL, NULL, 'mmeiyarasu22@gmail.com', '6381043583', NULL, 1, 2, '2024-08-01'),
('73152313506', 'POOVARASAN C', NULL, NULL, 'poovarasanc76@gmail.com', '8838516013', NULL, 1, 2, '2024-08-01'),
('73152313507', 'VIJAY RAGAVAN A', NULL, NULL, 'avijayragavan06@gmail.com', '6374413749', NULL, 1, 2, '2024-08-01');

INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313001', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313001';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313002', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313002';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313003', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313003';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313004', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313004';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313005', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313005';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313006', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313006';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313007', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313007';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313008', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313008';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313009', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313009';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313010', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313010';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313011', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313011';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313012', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313012';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313013', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313013';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313014', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313014';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313015', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313015';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313016', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313016';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313017', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313017';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313018', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313018';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313019', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313019';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313020', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313020';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313021', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313021';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313022', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313022';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313023', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313023';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313024', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313024';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313025', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313025';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313026', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313026';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313027', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313027';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313028', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313028';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313029', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313029';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313030', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313030';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313031', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313031';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313032', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313032';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313033', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313033';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313034', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313034';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313035', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313035';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313036', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313036';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313037', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313037';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313038', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313038';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313039', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313039';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313040', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313040';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313041', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313041';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313042', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313042';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313043', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313043';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313044', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313044';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313045', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313045';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313046', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313046';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313047', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313047';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313048', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313048';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313049', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313049';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313050', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313050';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313051', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313051';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313052', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313052';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313053', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313053';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313054', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313054';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313055', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313055';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313056', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313056';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313057', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313057';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313058', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313058';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313059', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313059';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313060', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313060';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313061', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313061';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313062', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313062';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313063', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313063';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313064', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313064';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313065', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313065';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313066', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313066';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313067', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313067';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313068', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313068';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313069', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313069';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313070', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313070';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313071', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313071';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313072', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313072';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313073', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313073';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313074', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313074';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313075', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313075';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313076', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313076';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313077', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313077';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313078', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313078';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313080', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313080';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313081', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313081';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313082', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313082';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313083', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313083';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313084', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313084';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313085', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313085';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313086', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313086';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313087', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313087';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313088', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313088';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313089', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313089';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313090', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313090';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313091', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313091';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313092', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313092';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313093', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313093';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313094', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313094';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313095', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313095';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313096', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313096';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313097', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313097';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313098', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313098';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313099', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313099';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313100', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313100';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313101', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313101';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313102', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313102';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313103', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313103';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313104', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313104';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313105', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313105';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313106', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313106';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313107', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313107';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313108', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313108';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313109', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313109';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313110', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313110';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313111', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313111';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313112', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313112';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313113', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313113';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313114', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313114';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313115', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313115';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313116', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313116';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313117', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313117';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313118', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313118';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313119', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313119';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313120', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313120';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313121', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313121';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313122', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313122';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313123', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313123';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313124', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313124';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313125', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313125';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313127', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313127';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313128', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313128';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313501', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313501';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313502', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313502';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313504', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313504';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313505', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313505';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313506', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313506';
INSERT IGNORE INTO users (username, password, role, linked_id)
SELECT '73152313507', 'c92e4a48b8eef3fe03472a9a591e507f:239eccdfeeb39f90e8f3ca6f0c4505bb7b15d8b5eaced343ac3cb6c46efa3a5f', 'STUDENT', student_id FROM student WHERE roll_no = '73152313507';
