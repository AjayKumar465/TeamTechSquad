CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL DEFAULT '0',
  `last_name` varchar(50) NOT NULL DEFAULT '0',
  `active`  bit,
  `email` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `mobile` (`mobile`)
);


CREATE TABLE IF NOT EXISTS `vitamin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `chemical_name` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
);

CREATE TABLE IF NOT EXISTS `deficiency_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
);

CREATE TABLE IF NOT EXISTS `deficiency` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `deficiency` varchar(256) not null default '0',
  `deficiency_category_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
);

CREATE TABLE IF NOT EXISTS `vitamin_deficiency` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `deficiency_id` int(11) not null default 0,
  `vitamin_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
);

insert into vitamin ( id , name , chemical_name ) values (1,'A','Retinol'),(2,'B1','Thiamine'),(3,'C','Ascorbic acid'),(4,'D','Calciferol'),(5,'B2','Riboflavin'),(6,'E','Tocopherol'),
                                                         (7,'K1','Phylloquinone'),(8,'B5','Pantothenic acid'),(9,'B7','Biotin'),(10,'B6','Pyridoxine'),(11,'B3','Niacin'),(12,'B9','Folic acid'),
                                                         (13,'B12','Cobalamins');
insert  into deficiency_category ( id , category )  values (1,'Eye'),(2,'Behaviour'),(3,'Circulation'),(4,'Digest'),(5,'Immune'),(6,'Musculo- skeletal'),(7,'Nerves'),(8,'Skin');

insert into deficiency ( id , deficiency , deficiency_category_id ) values (1,'Night blindness',1), (2,'Keratomalacia',1), (3,'Cross-eyes',1), (4,'Dry eyes',1), (5,'Thickish tear',1),
(6,'Thickish tear',1),(7,'Inflammation of lacrimal gland',1),(8,'Deteriorating color vision',1),(9,'Dizziness',1),(10,'Chronic fatigue',2),
(11,'Confusion',2),(12,'Sleepiness',2),(13,'Decreased work and school performance',2),(14,'Irritability',2),(15,'Fatigue',2),(16,'Listlessness',2),(17,'Exhaustion',2),(18,'Loss of appetite',2),
(19,'Mental disorientation',2),(20,'Nervousness',2),(21,'Tiredness',2),(22,'Weakness',2),(23,'Psychological disorders',2),(24,'Bereberi',3),(25,'Fastest Heart Beat',3),(26,'Irregular Heart Beat',3),(27,'Spontaneous bloody noses',3),
(28,'Venous circulatory disorder',3),(29,'Anemia',3),(30,'Iron deficiency anemia',3),(31,'Slow pulse',3),(32,'Slow blood',3),(33,'High blood glucose',4),(34,'Increased cholesterol',4),
(35,'Nausea',4),(36,'Pain of tongue and throat',4),(37,'Loss of appetite',4),(38,'Burning',4),(39,'Sore tongue',4),(40,'Constipation',4),(41,'The gastrointestinal tract',4),
(42,'Weight loss',4),(43,'Bleeding gums',4),(44,'Diarrhea',4),(45,'Sore throat',4),
(46,'Weakened immune system',5),(47,'Frequent respiratory infections',5),(48,'Frequent infections',5),(49,'Joint pains',6),(50,'Leg cramps',6),(51,'Muscle cramps',6),(52,'Bone Fractures or Breakage',6),
(53,'Muscle pain',6),(54,'Muscle weakness',6),(55,'Muscledegeneration',6),(56,'Osteomalacia',6),(57,'Osteoporosis',6),(58,'Rickets',6),(59,'Weakening muscles',6),(60,'Haemorrhage of joints',6),(61,'Abdominal pains',7),
(62,'Incontinence',7),(63,'Insomnia',7),(64,'Loss of body movement control',7),(65,'Loss of senses of smell',7),(66,'Numbness in the lower limbs',7),
(67,'Damage of nervous system',7),(68,'Numbness of hands and feet',7),(69,'Headache',7),(70,'Burning feet',7),(71,'Hearing disorder',7),
(72,'Loss of senses of taste or smell',7),(73,'Mental disturbances',7),(74,'Mental slowness',7),
(76,'Hyperkeratosis',8),(77,'Cracked lips',8),(78,'Damaged hair',8),(79,'Dry hair',8),(80,'Hair loss',8),(81,'Hyperpigmentation of skin exposed to sunlight',8),(82,'Itchy rashes',8),(83,'Jaundice',8),(84,'Photosensitive inflammation of the skin',8),
(85,'Pallor',8),(87,'Cracking corners of the mouth',8),(88,'Early graying',8),(89,'Yellowish discoloration of skin',8),
(90,'Scurvy',8),(91,'Corkscrew hairs',8),(92,'Dry skin',8),(93,'Flaky skin',8),(94,'Greasy skin',9),(95,'Pinpoint bleeding',8),(96,'Around hair follicles',8),(97,'Skin problems',8),(98,'Skin lesions',8),
(99,'Brittle nails',8),(100,'Soft nails',8);



insert into vitamin_deficiency ( id , vitamin_id , deficiency_id ) values (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),
(9,1,10),(10,1,11),(11,1,46),(12,1,49),(13,1,76),(14,2,24),(15,2,25),(16,2,26),(17,2,50),(18,2,51),(19,3,44),(20,3,45),(21,3,46),(22,3,90),(23,3,91),
 (24,3,92),(25,3,93),(26,3,94),(27,3,95),(28,3,96),(29,3,97),(30,3,98),(31,4,12),(32,4,26),(33,4,33),(34,4,34),
 (35,4,49),(36,4,47),(37,4,52),(38,4,61),(39,4,62),(40,4,63),(41,4,64),(42,4,65),(43,4,66),(44,4,77),(45,4,78),
 (46,4,79),(47,4,80),(48,4,81),(49,4,82),(50,4,83),(51,4,84),(52,4,85),(53,5,13),(54,5,15),(55,5,16),(56,5,27),(57,5,28),(58,5,69),(59,5,77),(60,5,87),
 (61,6,48),(62,6,49),(63,6,68),(64,6,77),(65,7,60),(66,7,32),(67,8,51),(68,9,99),(69,9,100),
 (70,10,13),(71,10,14),(72,10,46),(73,10,50),(104,10,67),(74,10,68),(75,10,85),(76,11,82),(77,11,80),(78,12,21),(79,12,14),(105,12,18),
 (80,13,9),(81,13,17),(82,13,14),(84,13,19),(85,13,20),(86,13,21),(87,13,22),(88,13,36),(89,13,37),(90,13,38),(91,13,39),(92,13,40),
 (93,13,41),(94,13,42),(95,13,70),(96,13,71),(97,13,72),(98,13,73),(99,13,74),(100,13,68),(101,13,88),(102,13,89),(103,13,85);