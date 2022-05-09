-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: proyecto
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comercios`
--

DROP TABLE IF EXISTS `comercios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comercios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(300) NOT NULL,
  `descripcion` text NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `longitud` varchar(45) DEFAULT NULL,
  `latitud` varchar(45) DEFAULT NULL,
  `usuario_creador` int(11) NOT NULL,
  `dueño` int(11) DEFAULT NULL,
  `valoracion` varchar(45) DEFAULT NULL,
  `revisado` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_usuario_creador_idx` (`usuario_creador`),
  CONSTRAINT `fk_usuario_creador` FOREIGN KEY (`usuario_creador`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comercios`
--

LOCK TABLES `comercios` WRITE;
/*!40000 ALTER TABLE `comercios` DISABLE KEYS */;
INSERT INTO `comercios` VALUES (1,'Tienda de Sofia','Tienda de cafes del mundo y tes. Es un comercio que Marc se inventó para poder explicar nuestro proyecto, pero ahora le hemos cogido cariño, y si este proyecto llega a salir a la luz, nos hemos propuesto abrir un lugar con este nombre.','Calle Barcelo n6','41.67538','34.9876',1,NULL,'5',0),(4,'Panaderia Griega','Panaderia de locos. Con paciencia, cariño y con ingredientes naturales, tratan de ofrecer una alta calidad en sus productos, recuperando recetas con siglos de antigüedad. Utilizan masa madre y largas fermentaciones con el propósito de conseguir un producto final \"excelente\".','Salònica, Grècia','22.9444191','40.6400629',2,NULL,NULL,0),(18,'Cuerpomente','Una marca de ropa sostenible unisex inspirada en la naturaleza cuyo propósito es motivar a las personas a conectar, proteger y disfrutar de nuestro planeta. Las prendas están hechas de algodón orgánico GOTS con detalles en corcho natural y cuero vegano. \r\n','Carrer de Blai, 75, 08004 Barcelona, España','2.1622654','41.37446569999999',3,NULL,NULL,0),(20,'Vedette','Es el sitio donde poder comprar objetos casi nuevos de todo tipo de marcas a precios hasta un 85% más baratos que los que encontrarías en una tienda y con la garantía de que está en perfecto estado, porque son ellos mismos quienes la revisan. Su modelo de negocio se basa en los objetos de segunda mano en perfectas condiciones.\r\n','C. Serrano, Madrid, España','-3.6862907','40.437877',4,NULL,NULL,0),(21,'Alianza Alimentaria','Una tienda con las mejores ofertas y la mayor variedad de frutas y verduras de la temporada. Pero, adicionalmente tiene la mejor variedad de productos bio, alimentación ecológica, frutas frescas y el más grande stock de alimentos.\r\n','Av. Sta. Rosa, San Ramón, Región Metropolitana, Chile','-70.6345266','-33.5376708',5,NULL,NULL,0),(22,'Vegan Heaven','Para una picada rápida, para sorprenderse con los sabores veganos, para disfrutar en pleno barrio, de una propuesta gastronómica mediterránea fusionada con toques de cocina internacional...debes probar su ya mítica fideuá, la salchicha vegana con revuelto de tofu y también su \'brunch\' (o su \'all day breakfast\', como quieras), que ya está causando sensación en la ciudad.','Au Panamericana, Martínez, Provincia de Buenos Aires, Argentina','-58.5355221','-34.5052989',6,NULL,NULL,0),(23,'Sr. Perro','La sede de ésta cooperativa está en el centro, pero se puede comprar desde cualquier sitio gracias a su tienda online. Tienen productos de alimentación como patés vegetales o barritas de cereales entre otros muchos, además de cosméticos, juegos para niños, agendas...todo de comercio justo. ','Carrer Hierbabuena, 15, 08906 L\'Hospitalet de Llobregat, Barcelona, España','2.1015689','41.3697822',62,NULL,NULL,0),(24,'Cocol','Es un centro neurálgico de la capital, y es visita ineludible para viajeros curiosos, que deseen conocer un mercado tradicional, a la vez que pasean por un rastro, y disfrutan al comiendo, tomando un vino, una sidra, un vermú o lo que les plazca. ','Fika Kalea, Bilbo, Bizkaia, España','-2.9177975','43.2540928',63,NULL,NULL,0),(25,'Hummus','Una marca de ropa sostenible unisex inspirada en la naturaleza cuyo propósito es motivar a las personas a conectar, proteger y disfrutar de nuestro planeta. Las prendas están hechas de algodón orgánico GOTS con detalles en corcho natural y cuero vegano. ','Rajkot Marketing Yard, Marketing Yard, Rajkot, Gujarat 360003, India','70.8346048','22.3004472',64,NULL,NULL,0),(26,'Remake','Es el sitio donde poder comprar objetos casi nuevos de todo tipo de marcas a precios hasta un 85% más baratos que los que encontrarías en una tienda y con la garantía de que está en perfecto estado, porque son ellos mismos quienes la revisan. Su modelo de negocio se basa en los objetos de segunda mano en perfectas condiciones.','Str. des 17. Juni, Berlin, Alemania','13.3492861','52.51414750000001',65,NULL,NULL,0),(27,'Mundo Rural','Una tienda con las mejores ofertas y la mayor variedad de frutas y verduras de la temporada. Pero, adicionalmente tiene la mejor variedad de productos bio, alimentación ecológica, frutas frescas y el más grande stock de alimentos.','2 Rue de Rivoli, 75004 Paris, Francia','2.361661100000001','48.85510619999999',1,NULL,NULL,0),(28,'La Biotika','Para una picada rápida, para sorprenderse con los sabores veganos, para disfrutar en pleno barrio, de una propuesta gastronómica mediterránea fusionada con toques de cocina internacional...debes probar su ya mítica fideuá, la salchicha vegana con revuelto de tofu y también su \'brunch\' (o su \'all day breakfast\', como quieras), que ya está causando sensación en la ciudad.','Via Toledo, 6, 80134 Napoli NA, Italia','14.2496742','40.8480047',2,NULL,NULL,0),(29,'Deco 2000','La sede de ésta cooperativa está en el centro, pero se puede comprar desde cualquier sitio gracias a su tienda online. Tienen productos de alimentación como patés vegetales o barritas de cereales entre otros muchos, además de cosméticos, juegos para niños, agendas...todo de comercio justo. ','C. del Consell de Cent, 290, 08007 Barcelona, España','2.1641266','41.389684',2,NULL,NULL,0),(30,'Mercado Medieval','Es un centro neurálgico de la capital, y es visita ineludible para viajeros curiosos, que deseen conocer un mercado tradicional, a la vez que pasean por un rastro, y disfrutan al comiendo, tomando un vino, una sidra, un vermú o lo que les plazca. ','08500 Vic, Barcelona, España','2.2544335','41.9304373',2,NULL,NULL,0),(31,'Co shop','Una marca de ropa sostenible unisex inspirada en la naturaleza cuyo propósito es motivar a las personas a conectar, proteger y disfrutar de nuestro planeta. Las prendas están hechas de algodón orgánico GOTS con detalles en corcho natural y cuero vegano. ','Str. des 18. Oktober, Leipzig, Alemania','12.394733','51.3221623',3,NULL,NULL,0),(32,'Fusta\'m','Es el sitio donde poder comprar objetos casi nuevos de todo tipo de marcas a precios significativamente más baratos que los que encontrarías en una tienda y con la garantía de que está en perfecto estado, porque son ellos mismos quienes la revisan. Su modelo de negocio se basa en los objetos de segunda mano en perfectas condiciones.\r\n','Carr. Central, Junín, Perú','-75.9935862','-11.1467983',4,NULL,NULL,0),(33,'Cosas de comer','Una tienda con las mejores ofertas y la mayor variedad de frutas y verduras de la temporada. Pero, adicionalmente tiene la mejor variedad de productos bio, alimentación ecológica, frutas frescas y el más grande stock de alimentos.','4 Long St, Cape Town City Centre, Cape Town, 8000, Sudáfrica','18.4226592','-33.9189268',5,NULL,NULL,0),(34,'Freedom pizza','Para una picada rápida, para sorprenderse con los sabores veganos, para disfrutar en pleno barrio, de una propuesta gastronómica mediterránea fusionada con toques de cocina internacional...debes probar su ya mítica fideuá, la salchicha vegana con revuelto de tofu y también su \'brunch\' (o su \'all day breakfast\', como quieras), que ya está causando sensación en la ciudad.','4 Rue Montreuil, Gatineau, QC J8T 5C8, Canadá','-75.7067465','45.4843629',6,NULL,NULL,0),(35,'El Surco','La sede de ésta cooperativa está en el centro, pero se puede comprar desde cualquier sitio gracias a su tienda online. Tienen productos de alimentación como patés vegetales o barritas de cereales entre otros muchos, además de cosméticos, juegos para niños, agendas...todo de comercio justo. ','Carrer de Maragall, 7, 08291 Ripollet, Barcelona, España','2.1544923','41.4968025',6,NULL,NULL,0),(36,'Mercadillo Fuerteventura','Es un centro neurálgico de la capital, y es visita ineludible para viajeros curiosos, que deseen conocer un mercado tradicional, a la vez que pasean por un rastro, y disfrutan al comiendo, tomando un vino, una sidra, un vermú o lo que les plazca. ','Fuerteventura, Quilicura, Región Metropolitana, Chile','-70.7264629','-33.3856339',6,NULL,NULL,0),(37,'The good store','Una marca de ropa sostenible unisex inspirada en la naturaleza cuyo propósito es motivar a las personas a conectar, proteger y disfrutar de nuestro planeta. Las prendas están hechas de algodón orgánico GOTS con detalles en corcho natural y cuero vegano. ','4 Rue Peel, Montréal, QC H3C, Canadá','-73.55653389999999','45.4928108',62,NULL,NULL,0),(38,'Eix Raval','Es el sitio donde poder comprar objetos casi nuevos de todo tipo de marcas a precios significativamente más baratos que los que encontrarías en una tienda y con la garantía de que está en perfecto estado, porque son ellos mismos quienes la revisan. Su modelo de negocio se basa en los objetos de segunda mano en perfectas condiciones.','Carrer de la Princesa, 8, 08003 Barcelona, España','2.1793696','41.3843894',63,NULL,NULL,0),(39,'Only Organics','Una tienda con las mejores ofertas y la mayor variedad de frutas y verduras de la temporada. Pero, adicionalmente tiene la mejor variedad de productos bio, alimentación ecológica, frutas frescas y el más grande stock de alimentos.','Minneapolis Ave, Minneapolis, MN 55406, EE. UU.','-93.22535099999999','44.9610639',63,NULL,NULL,0),(40,'Dolce & Vegana','Para una picada rápida, para sorprenderse con los sabores veganos, para disfrutar en pleno barrio, de una propuesta gastronómica mediterránea fusionada con toques de cocina internacional...debes probar su ya mítica fideuá, la salchicha vegana con revuelto de tofu y también su \'brunch\' (o su \'all day breakfast\', como quieras), que ya está causando sensación en la ciudad.','21 George St, Sydney NSW 2000, Australia','151.2064109','-33.8734448',64,NULL,NULL,0),(41,'Bean there','La sede de ésta cooperativa está en el centro, pero se puede comprar desde cualquier sitio gracias a su tienda online. Tienen productos de alimentación como patés vegetales o barritas de cereales entre otros muchos, además de cosméticos, juegos para niños, agendas...todo de comercio justo. ','Konak, Be?evler Cd. No:12, 16110 Nilüfer/Bursa, Turquía','28.9875062','40.2071789',65,NULL,NULL,0),(42,'El Rastro','Es un centro neurálgico de la capital, y es visita ineludible para viajeros curiosos, que deseen conocer un mercado tradicional, a la vez que pasean por un rastro, y disfrutan al comiendo, tomando un vino, una sidra, un vermú o lo que les plazca. ','Balantang Rd, Jaro, Iloilo City, Iloilo, Filipinas','122.5814441','10.7540422',1,NULL,NULL,0),(43,'Velvet','Una marca de ropa sostenible unisex inspirada en la naturaleza cuyo propósito es motivar a las personas a conectar, proteger y disfrutar de nuestro planeta. Las prendas están hechas de algodón orgánico GOTS con detalles en corcho natural y cuero vegano. ','Carrer del Torrent de l\'Olla, 22, 08012 Barcelona, España','2.1607576','41.3990649',1,NULL,NULL,0),(44,'Wiliiamsburg','Es el sitio donde poder comprar objetos casi nuevos de todo tipo de marcas a precios significativamente más baratos que los que encontrarías en una tienda y con la garantía de que está en perfecto estado, porque son ellos mismos quienes la revisan. Su modelo de negocio se basa en los objetos de segunda mano en perfectas condiciones.','14 Dublin Rd, Belfast BT2 7HB, Reino Unido','-5.931619299999999','54.5924534',2,NULL,NULL,0),(45,'Bosque de agua','Una tienda con las mejores ofertas y la mayor variedad de frutas y verduras de la temporada. Pero, adicionalmente tiene la mejor variedad de productos bio, alimentación ecológica, frutas frescas y el más grande stock de alimentos.','Coyoacán, Ciudad de México, CDMX, México','-99.16291310000001','19.3486926',3,NULL,NULL,0),(46,'Fina filipina','Para una picada rápida, para sorprenderse con los sabores veganos, para disfrutar en pleno barrio, de una propuesta gastronómica mediterránea fusionada con toques de cocina internacional...debes probar su ya mítica fideuá, la salchicha vegana con revuelto de tofu y también su \'brunch\' (o su \'all day breakfast\', como quieras), que ya está causando sensación en la ciudad.','Carrer de Bilbao, 5, 46009 València, Valencia, España','-0.3729918','39.4859399',2,NULL,NULL,0),(48,'Nomad','La sede de ésta cooperativa está en el centro, pero se puede comprar desde cualquier sitio gracias a su tienda online. Tienen productos de alimentación como patés vegetales o barritas de cereales entre otros muchos, además de cosméticos, juegos para niños, agendas...todo de comercio justo. ','Xi\'an, Shaanxi, China','108.9540936','34.2658138',4,NULL,NULL,0),(49,'Mercadillo Tosantos','Es un centro neurálgico de la capital, y es visita ineludible para viajeros curiosos, que deseen conocer un mercado tradicional, a la vez que pasean por un rastro, y disfrutan al comiendo, tomando un vino, una sidra, un vermú o lo que les plazca. \r\n','29620 Torremolinos, Málaga, España','-4.4994767','36.6225541',5,NULL,NULL,0),(50,'Wear the change','Una marca de ropa sostenible unisex inspirada en la naturaleza cuyo propósito es motivar a las personas a conectar, proteger y disfrutar de nuestro planeta. Las prendas están hechas de algodón orgánico GOTS con detalles en corcho natural y cuero vegano. ','Rosengård Centrum, 213 65 Malmö, Suecia','13.0431483','55.58600009999999',6,NULL,NULL,0),(52,'Alphaville','Es el sitio donde poder comprar objetos casi nuevos de todo tipo de marcas a precios significativamente más baratos que los que encontrarías en una tienda y con la garantía de que está en perfecto estado, porque son ellos mismos quienes la revisan. Su modelo de negocio se basa en los objetos de segunda mano en perfectas condiciones.','75 Sloane St, London SW1X 9SG, Reino Unido','-0.1592614','51.4969372',6,NULL,NULL,0),(53,'La Rústica','Una tienda con las mejores ofertas y la mayor variedad de frutas y verduras de la temporada. Pero, adicionalmente tiene la mejor variedad de productos bio, alimentación ecológica, frutas frescas y el más grande stock de alimentos.','Kapelanka 56, 30-347 Kraków, Polonia','19.9258237','50.0324022',5,NULL,NULL,0),(55,'El perro gamberro','Para una picada rápida, para sorprenderse con los sabores veganos, para disfrutar en pleno barrio, de una propuesta gastronómica mediterránea fusionada con toques de cocina internacional...debes probar su ya mítica fideuá, la salchicha vegana con revuelto de tofu y también su \'brunch\' (o su \'all day breakfast\', como quieras), que ya está causando sensación en la ciudad.','Street 2004, Phnom Penh, Camboya','104.8711124','11.551662',6,NULL,NULL,0),(56,'Suralia','La sede de ésta cooperativa está en el centro, pero se puede comprar desde cualquier sitio gracias a su tienda online. Tienen productos de alimentación como patés vegetales o barritas de cereales entre otros muchos, además de cosméticos, juegos para niños, agendas...todo de comercio justo. ','Carrer de Padilla, 43, Barcelona, España','2.1679153','41.412669',1,NULL,NULL,0),(57,'Mercadillo Nou Barris','Es un centro neurálgico de la capital, y es visita ineludible para viajeros curiosos, que deseen conocer un mercado tradicional, a la vez que pasean por un rastro, y disfrutan al comiendo, tomando un vino, una sidra, un vermú o lo que les plazca. ','Distrito de Nou Barris, Barcelona, España','2.1794589','41.4459814',62,NULL,NULL,0),(58,'Wowhills','Una marca de ropa sostenible unisex inspirada en la naturaleza cuyo propósito es motivar a las personas a conectar, proteger y disfrutar de nuestro planeta. Las prendas están hechas de algodón orgánico GOTS con detalles en corcho natural y cuero vegano. ','C. Pintor López Mezquita, 14, 18002 Granada, España','-3.6080153','37.1764689',65,NULL,NULL,0),(60,'Magpie','Es el sitio donde poder comprar objetos casi nuevos de todo tipo de marcas a precios significativamente más baratos que los que encontrarías en una tienda y con la garantía de que está en perfecto estado, porque son ellos mismos quienes la revisan. Su modelo de negocio se basa en los objetos de segunda mano en perfectas condiciones.','Rue George, LaSalle, QC H8P 1C3, Canadá','-73.6049317','45.4307157',63,NULL,NULL,0),(61,'Mercadillo Fuenteheridos','Es un centro neurálgico de la capital, y es visita ineludible para viajeros curiosos, que deseen conocer un mercado tradicional, a la vez que pasean por un rastro, y disfrutan al comiendo, tomando un vino, una sidra, un vermú o lo que les plazca. ','21292 Fuenteheridos, Huelva, España','-6.6618074','37.9032603',64,NULL,NULL,0),(62,'Viva Chapata','Para una picada rápida, para sorprenderse con los sabores veganos, para disfrutar en pleno barrio, de una propuesta gastronómica mediterránea fusionada con toques de cocina internacional...debes probar su ya mítica fideuá, la salchicha vegana con revuelto de tofu y también su \'brunch\' (o su \'all day breakfast\', como quieras), que ya está causando sensación en la ciudad.','C. Rioja, 52, 41001 Sevilla, España','-5.9965983','37.3909362',64,NULL,NULL,0),(63,'Lasting','La sede de ésta cooperativa está en el centro, pero se puede comprar desde cualquier sitio gracias a su tienda online. Tienen productos de alimentación como patés vegetales o barritas de cereales entre otros muchos, además de cosméticos, juegos para niños, agendas...todo de comercio justo. ','3 Downing St, London SW1, Reino Unido','-0.1278107','51.503258',6,NULL,NULL,0),(64,'Mercadillo Valle de Mena','Es un centro neurálgico de la capital, y es visita ineludible para viajeros curiosos, que deseen conocer un mercado tradicional, a la vez que pasean por un rastro, y disfrutan al comiendo, tomando un vino, una sidra, un vermú o lo que les plazca. ','Valle de Mena, Burgos, España','-3.2784825','43.1085141',3,NULL,NULL,0),(65,'Circular project','Una marca de ropa sostenible unisex inspirada en la naturaleza cuyo propósito es motivar a las personas a conectar, proteger y disfrutar de nuestro planeta. Las prendas están hechas de algodón orgánico GOTS con detalles en corcho natural y cuero vegano. ','Via Paolo Sarpi, 4, 20154 Milano MI, Italia','9.1806629','45.48184319999999',4,NULL,NULL,0),(66,'El templo de Susu','Es el sitio donde poder comprar objetos casi nuevos de todo tipo de marcas a precios significativamente más baratos que los que encontrarías en una tienda y con la garantía de que está en perfecto estado, porque son ellos mismos quienes la revisan. Su modelo de negocio se basa en los objetos de segunda mano en perfectas condiciones.','Carrer de Muntaner, 87, 08036 Barcelona, España','2.1569333','41.388376',2,NULL,NULL,0),(67,'Mercadillo Alhaurín','Es un centro neurálgico de la capital, y es visita ineludible para viajeros curiosos, que deseen conocer un mercado tradicional, a la vez que pasean por un rastro, y disfrutan al comiendo, tomando un vino, una sidra, un vermú o lo que les plazca. ','29130 Alhaurín de la Torre, Málaga, España','-4.5598636','36.6598945',5,NULL,NULL,0),(68,'La modernista','Para una picada rápida, para sorprenderse con los sabores veganos, para disfrutar en pleno barrio, de una propuesta gastronómica mediterránea fusionada con toques de cocina internacional...debes probar su ya mítica fideuá, la salchicha vegana con revuelto de tofu y también su \'brunch\' (o su \'all day breakfast\', como quieras), que ya está causando sensación en la ciudad.','Calle de Fuencarral, 15, 28004 Madrid, España','-3.7014533','40.4210638',4,NULL,NULL,0),(69,'Avenida','La sede de ésta cooperativa está en el centro, pero se puede comprar desde cualquier sitio gracias a su tienda online. Tienen productos de alimentación como patés vegetales o barritas de cereales entre otros muchos, además de cosméticos, juegos para niños, agendas...todo de comercio justo. ','13 Rue des Rosiers, 75004 Paris, Francia','2.3594262','48.8570453',3,NULL,NULL,0),(70,'El puerto','Es un centro neurálgico de la capital, y es visita ineludible para viajeros curiosos, que deseen conocer un mercado tradicional, a la vez que pasean por un rastro, y disfrutan al comiendo, tomando un vino, una sidra, un vermú o lo que les plazca. ','C. Romería del Rocío, 37, 29640 Fuengirola, Málaga, España','-4.6237107','36.5476727',4,NULL,NULL,0),(71,'Clo','Una marca de ropa sostenible unisex inspirada en la naturaleza cuyo propósito es motivar a las personas a conectar, proteger y disfrutar de nuestro planeta. Las prendas están hechas de algodón orgánico GOTS con detalles en corcho natural y cuero vegano. ','5 Rue de l\'Université, 75006 Paris, Francia','2.330899','48.856445',3,NULL,NULL,0),(72,'Flamingos Vintage Kilo','Es el sitio donde poder comprar objetos casi nuevos de todo tipo de marcas a precios significativamente más baratos que los que encontrarías en una tienda y con la garantía de que está en perfecto estado, porque son ellos mismos quienes la revisan. Su modelo de negocio se basa en los objetos de segunda mano en perfectas condiciones.','Rue Belliard 15, 1000 Bruxelles, Bélgica','4.3690612','50.8422302',1,NULL,NULL,0),(73,'El huerto de Lucas','Una tienda con las mejores ofertas y la mayor variedad de frutas y verduras de la temporada. Pero, adicionalmente tiene la mejor variedad de productos bio, alimentación ecológica, frutas frescas y el más grande stock de alimentos.','C. Ingavi 36, Santa Cruz de la Sierra, Bolivia','-63.18194259999999','-17.7849114',5,NULL,NULL,0),(74,'Distrito vegano','Para una picada rápida, para sorprenderse con los sabores veganos, para disfrutar en pleno barrio, de una propuesta gastronómica mediterránea fusionada con toques de cocina internacional...debes probar su ya mítica fideuá, la salchicha vegana con revuelto de tofu y también su \'brunch\' (o su \'all day breakfast\', como quieras), que ya está causando sensación en la ciudad.','Av. Corrientes 144, C1043AAO CABA, Argentina','-58.36943179999999','-34.6029198',5,NULL,NULL,0),(76,'La Tribuna','La sede de ésta cooperativa está en el centro, pero se puede comprar desde cualquier sitio gracias a su tienda online. Tienen productos de alimentación como patés vegetales o barritas de cereales entre otros muchos, además de cosméticos, juegos para niños, agendas...todo de comercio justo. ','Cl. 80, Medellín, Antioquia, Colombia','-75.55312119999999','6.2726248',4,NULL,NULL,0),(77,'Motores','Es un centro neurálgico de la capital, y es visita ineludible para viajeros curiosos, que deseen conocer un mercado tradicional, a la vez que pasean por un rastro, y disfrutan al comiendo, tomando un vino, una sidra, un vermú o lo que les plazca. ','Belo Horizonte, Minas Gerais, Brasil','-43.9386685','-19.919052',3,NULL,NULL,0),(78,'Pour Toi','Una marca de ropa sostenible unisex inspirada en la naturaleza cuyo propósito es motivar a las personas a conectar, proteger y disfrutar de nuestro planeta. Las prendas están hechas de algodón orgánico GOTS con detalles en corcho natural y cuero vegano. ','C/ de la Portaferrissa, 4, 08002 Barcelona, España','2.1720384','41.383113',6,NULL,NULL,0),(79,'Kilombo Vintage','Es el sitio donde poder comprar objetos casi nuevos de todo tipo de marcas a precios significativamente más baratos que los que encontrarías en una tienda y con la garantía de que está en perfecto estado, porque son ellos mismos quienes la revisan. Su modelo de negocio se basa en los objetos de segunda mano en perfectas condiciones.','Santa Mónica, California, EE. UU.','-118.4911912','34.0194543',4,NULL,NULL,0),(80,'Green Zone','Una tienda con las mejores ofertas y la mayor variedad de frutas y verduras de la temporada. Pero, adicionalmente tiene la mejor variedad de productos bio, alimentación ecológica, frutas frescas y el más grande stock de alimentos.','Colorado Mills Mall, Lakewood, CO 80401, EE. UU.','-105.158425','39.73220389999999',62,NULL,NULL,0),(81,'Bunny\'s Deli','Para una picada rápida, para sorprenderse con los sabores veganos, para disfrutar en pleno barrio, de una propuesta gastronómica mediterránea fusionada con toques de cocina internacional...debes probar su ya mítica fideuá, la salchicha vegana con revuelto de tofu y también su \'brunch\' (o su \'all day breakfast\', como quieras), que ya está causando sensación en la ciudad.','Siberia, Rusia','99.1966559','61.01370970000001',63,NULL,NULL,0),(82,'Santa Rosa','La sede de ésta cooperativa está en el centro, pero se puede comprar desde cualquier sitio gracias a su tienda online. Tienen productos de alimentación como patés vegetales o barritas de cereales entre otros muchos, además de cosméticos, juegos para niños, agendas...todo de comercio justo. ','Sacramento St, Fair Oaks, CA 95628, EE. UU.','-121.2666961','38.64346099999999',65,NULL,NULL,0),(83,'Ecolóxico','Es un centro neurálgico de la capital, y es visita ineludible para viajeros curiosos, que deseen conocer un mercado tradicional, a la vez que pasean por un rastro, y disfrutan al comiendo, tomando un vino, una sidra, un vermú o lo que les plazca. ','Carrer Torcuato Luca Tena, 15, 07005 Palma, Illes Balears, España','2.6634609','39.5767057',64,NULL,NULL,0);
/*!40000 ALTER TABLE `comercios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filtros`
--

DROP TABLE IF EXISTS `filtros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filtros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filtros`
--

LOCK TABLES `filtros` WRITE;
/*!40000 ALTER TABLE `filtros` DISABLE KEYS */;
INSERT INTO `filtros` VALUES (1,'Artesanal'),(2,'Km0'),(3,'Vegano'),(4,'EcoFriendly'),(5,'Circular'),(6,'Justo');
/*!40000 ALTER TABLE `filtros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filtros_comercios`
--

DROP TABLE IF EXISTS `filtros_comercios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filtros_comercios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_comercio` int(11) NOT NULL,
  `id_filtro` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comercio_idx` (`id_comercio`),
  KEY `fk_filtro_idx` (`id_filtro`),
  CONSTRAINT `fk_comercio` FOREIGN KEY (`id_comercio`) REFERENCES `comercios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_filtro` FOREIGN KEY (`id_filtro`) REFERENCES `filtros` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filtros_comercios`
--

LOCK TABLES `filtros_comercios` WRITE;
/*!40000 ALTER TABLE `filtros_comercios` DISABLE KEYS */;
INSERT INTO `filtros_comercios` VALUES (1,1,1),(2,1,2),(8,4,1),(26,18,4),(27,18,6),(28,18,5),(29,18,3),(31,20,5),(32,21,2),(33,21,4),(34,21,6),(35,22,2),(36,22,3),(37,22,4),(38,22,6),(39,23,6),(40,23,4),(41,24,1),(42,24,2),(43,24,4),(44,25,3),(45,25,4),(46,26,5),(47,27,4),(48,27,2),(49,27,6),(50,28,3),(51,28,4),(52,28,2),(53,29,6),(54,29,1),(55,30,2),(56,30,4),(57,30,6),(58,30,1),(59,31,3),(60,31,4),(61,32,5),(62,33,4),(63,33,2),(64,34,3),(65,35,6),(66,35,2),(67,36,1),(68,36,4),(69,37,3),(70,37,4),(71,38,5),(72,39,2),(73,39,4),(74,39,6),(75,40,3),(76,41,6),(77,42,1),(78,42,2),(79,43,3),(80,43,4),(81,43,5),(82,44,5),(83,45,2),(84,45,4),(85,46,3),(88,48,6),(89,48,1),(90,49,1),(91,50,3),(93,52,5),(94,53,4),(95,53,6),(98,55,3),(99,56,6),(100,56,4),(101,57,1),(102,57,6),(103,58,4),(104,58,2),(106,60,5),(107,61,1),(108,61,2),(109,61,6),(110,62,3),(111,62,5),(112,63,5),(113,63,6),(114,64,2),(115,64,6),(116,64,4),(117,64,1),(118,65,3),(119,65,4),(120,65,5),(121,66,5),(122,67,1),(123,68,3),(124,69,6),(125,69,4),(126,70,1),(127,70,6),(128,71,6),(129,71,4),(130,72,5),(131,73,4),(132,73,2),(133,74,3),(134,74,2),(137,76,2),(138,76,6),(139,77,1),(140,77,4),(141,78,4),(142,78,5),(143,79,5),(144,80,4),(145,80,2),(146,80,6),(147,81,3),(148,82,6),(149,82,4);
/*!40000 ALTER TABLE `filtros_comercios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fotos`
--

DROP TABLE IF EXISTS `fotos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fotos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idComercio` int(11) DEFAULT NULL,
  `nombre_img` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_foto_comercio_idx` (`idComercio`),
  CONSTRAINT `fk_foto_comercio` FOREIGN KEY (`idComercio`) REFERENCES `comercios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fotos`
--

LOCK TABLES `fotos` WRITE;
/*!40000 ALTER TABLE `fotos` DISABLE KEYS */;
INSERT INTO `fotos` VALUES (12,18,'1651755894295-001_cuerpomente.jpg'),(14,20,'1651755992633-011_vedette.jpg'),(15,21,'1651756302580-021_alianzaalimentaria.jpg'),(16,22,'1651756411215-031_veganheaven.jpg'),(17,23,'1651756560109-041_srperro.jpg'),(18,24,'1651756626002-051_cocol.jpg'),(19,25,'1651778992442-002_hummus.jpg'),(20,26,'1651779059455-012_remake.jpg'),(21,27,'1651779196741-022_mundorural.jpg'),(22,28,'1651779293981-032_labiotika.jpg'),(23,29,'1651779457374-042_deco2000.jpg'),(24,30,'1651779990408-052_mercadomedieval.jpg'),(25,31,'1651780087722-003_coshop.JPG'),(26,32,'1651780189425-013_fustam.jpg'),(27,33,'1651780290756-023_cosasdecomer.jpg'),(28,34,'1651780414319-033_freedompizza.jpg'),(29,35,'1651783203692-043_elsurco.jpg'),(30,36,'1651783391149-053_mercadillofuerteventura.jpg'),(31,37,'1651783516165-004_thegoodstore.jpg'),(32,38,'1651783604775-014_eixraval.jpg'),(33,39,'1651783696948-024_onlyorganics.jpg'),(34,40,'1651783836151-034_dolcevegana.jpg'),(35,41,'1651783953096-044_beanthere.jpg'),(36,42,'1651784077277-054_elrastro.jpg'),(37,43,'1651784170677-005_velvet.jpg'),(38,44,'1651784239312-015_wiliam.jpg'),(39,45,'1651784362141-025_bosquedeagua.jpg'),(40,46,'1651784478137-035_finafilipina.jpg'),(42,48,'1651786570325-045_nomad.jpg'),(43,49,'1651786935915-055_tosantos.jpg'),(44,50,'1651787034798-006_wearthechange.jpg'),(46,52,'1651787209900-016_alphaville.jpg'),(47,53,'1651787358357-026_larustica.jpg'),(49,55,'1651787795916-036_elperrogamberro.jpg'),(50,56,'1651787923696-046_suralia.jpg'),(51,57,'1651787996667-056_noubarris.jpg'),(52,58,'1651788133784-007_wowhills.jpg'),(54,60,'1651788464894-017_magpie.jpg'),(55,61,'1651788518395-027_mercadillo_fuenteheridos2.jpg'),(56,62,'1651788601070-037_vivachapata.jpg'),(57,62,'1651788601071-037_vivachapata_2.jpg'),(58,62,'1651788601076-037_vivachapata_3.png'),(59,63,'1651789389132-047_lasting.jpg'),(60,64,'1651789733234-057_valledemena.jpg'),(61,65,'1651789871442-008_circularproject.jpg'),(62,66,'1651789957647-018_templosusu.jpg'),(63,67,'1651790016145-028_mercadillo_alhaurín.jpg'),(64,68,'1651790077041-038_lamodernista.jpg'),(65,68,'1651790077042-038_lamodernista_2.jpg'),(66,69,'1651790135660-048_avenida.jpg'),(67,70,'1651790213671-058_elpuerto.jpg'),(68,71,'1651817561087-009_clo.jpg'),(69,72,'1651817700152-020_vintagekilo.jpg'),(70,72,'1651817700154-020_vintagekilo_2.jpg'),(71,73,'1651818696080-029_elhuertodelucas.jpg'),(72,74,'1651820667902-039_distritovegano.jpg'),(73,74,'1651820667908-039_distritovegano_2.jpg'),(76,76,'1651820935712-049_la tribuna.jpg'),(77,77,'1651821008809-059_motores.jpg'),(78,78,'1651821112423-010_pour_toi.jpg'),(79,79,'1651821170199-019_kilombovintage.jpg'),(80,80,'1651821251205-030_greenzone.jpg'),(81,81,'1651821366765-040_bunnysdeli.jpeg'),(82,82,'1651821482243-050_santarosa.jpg'),(83,83,'1651821563344-60_ecoloxico.jpg'),(84,4,'061_panaderiagriega.jpg'),(85,1,'062_tiendadesofia.jpg');
/*!40000 ALTER TABLE `fotos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter`
--

DROP TABLE IF EXISTS `newsletter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_filtro` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usuario_newsletter_idx` (`id_usuario`),
  KEY `fk_filtro_newsletter_idx` (`id_filtro`),
  CONSTRAINT `fk_filtro_newsletter` FOREIGN KEY (`id_filtro`) REFERENCES `filtros` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_newsletter` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter`
--

LOCK TABLES `newsletter` WRITE;
/*!40000 ALTER TABLE `newsletter` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seguidores`
--

DROP TABLE IF EXISTS `seguidores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seguidores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario_seguido` int(11) NOT NULL,
  `id_seguidor` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_seguidor_idx` (`id_seguidor`),
  KEY `fk_seguido_idx` (`id_usuario_seguido`),
  CONSTRAINT `fk_seguido` FOREIGN KEY (`id_usuario_seguido`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_seguidor` FOREIGN KEY (`id_seguidor`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seguidores`
--

LOCK TABLES `seguidores` WRITE;
/*!40000 ALTER TABLE `seguidores` DISABLE KEYS */;
INSERT INTO `seguidores` VALUES (1,3,1),(2,3,2),(3,2,3),(5,1,2),(8,2,1),(10,1,3);
/*!40000 ALTER TABLE `seguidores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(150) NOT NULL,
  `email` varchar(60) NOT NULL,
  `nombre_usuario` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `puntuacion` int(11) DEFAULT 0,
  `feed_check` tinyint(4) DEFAULT NULL,
  `ubicacion_check` tinyint(4) DEFAULT NULL,
  `activo` int(11) NOT NULL DEFAULT 0,
  `foto_usuario` varchar(150) DEFAULT NULL,
  `rol` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Sandra','Altamira','saltamira@gmail.com','SandyAlt','12345678',9,NULL,NULL,1,'1.jpg',0),(2,'Teresa','Almucena','talmucena@gmail.com','TereAlmu','12345678',36,NULL,NULL,1,'2.jpg',0),(3,'Cleopatra','Szamud','cszamud@gmail.com','Cleosza','12345678',81,NULL,NULL,1,'3.jpg',0),(4,'Marc','Sala','msala@gmail.com','Marcasd','12345678',150,NULL,NULL,0,'4.jpg',0),(5,'Andreu','Pellicer','apellicer@gmail.com','AnPellicer','12345678',65,NULL,NULL,1,'5.jpg',1),(6,'Carlota','Garrigós','cgarrigos@gmail.com','CarlotaG','12345678',23,NULL,NULL,1,'6.jpg',0),(62,'Irati','Medrano','imedrano@gmail.com','Irati24','12345678',4,NULL,NULL,1,'7.jpg',0),(63,'Carmen','Ortega','cortega@gmail.com','Carmencita','12345678',12,NULL,NULL,1,'8.jpg',0),(64,'Ernest','Balaguer','ebalaguer@gmail.com','Ernesto5','12345678',56,NULL,NULL,1,'9.jpg',0),(65,'Thiago','Salinas','tsalinas@gmail.com','Thiagosal','12345678',15,NULL,NULL,0,'10.jpg',0);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valoraciones`
--

DROP TABLE IF EXISTS `valoraciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `valoraciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valoracion` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idComercio` int(11) NOT NULL,
  `votado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_usuario_valoraciones_idx` (`idUsuario`),
  KEY `fk_id_comercios_valoraciones_idx` (`idComercio`),
  CONSTRAINT `fk_id_comercios_valoraciones` FOREIGN KEY (`idComercio`) REFERENCES `comercios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_usuario_valoraciones` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valoraciones`
--

LOCK TABLES `valoraciones` WRITE;
/*!40000 ALTER TABLE `valoraciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `valoraciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-06 18:07:23
