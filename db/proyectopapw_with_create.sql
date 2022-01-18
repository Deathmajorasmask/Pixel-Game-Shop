CREATE DATABASE  IF NOT EXISTS `proyectopapw` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `proyectopapw`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: proyectopapw
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.36-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrador` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `clave` varchar(10) NOT NULL,
  `contraseÃ±a` varchar(10) NOT NULL,
  PRIMARY KEY (`id_admin`),
  UNIQUE KEY `clave_UNIQUE` (`clave`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` VALUES (1,'Deathlink','Password');
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articulo`
--

DROP TABLE IF EXISTS `articulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articulo` (
  `idarticulo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descipcion` varchar(250) NOT NULL,
  `unidades` int(11) NOT NULL,
  `categoria` int(11) NOT NULL,
  PRIMARY KEY (`idarticulo`),
  KEY `categoria_idx` (`categoria`),
  CONSTRAINT `categoria` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulo`
--

LOCK TABLES `articulo` WRITE;
/*!40000 ALTER TABLE `articulo` DISABLE KEYS */;
INSERT INTO `articulo` VALUES (21,'Atari 2600','Consola Retro de compaÃ±ia Atari',20,1),(22,'Nintendo 64','Retro de Cartuchos',10,1),(23,'Halo 4','Bungie Studios',50,2),(24,'Mando Xbox','Mando Xbox One compatible con PC',10,3);
/*!40000 ALTER TABLE `articulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrito`
--

DROP TABLE IF EXISTS `carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito` (
  `idcarrito` int(11) NOT NULL AUTO_INCREMENT,
  `precio_unitario` float DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `Id_articulo` int(11) NOT NULL,
  `Id_usuario` int(11) NOT NULL,
  `Id_estado` int(11) NOT NULL,
  `Id_administrador` int(11) NOT NULL,
  `Id_TipoPago` int(11) NOT NULL,
  PRIMARY KEY (`idcarrito`),
  KEY `arti_idx` (`Id_articulo`),
  KEY `usu_idx` (`Id_usuario`),
  KEY `admin_idx` (`Id_administrador`),
  KEY `estado_idx` (`Id_estado`),
  KEY `TP_idx` (`Id_TipoPago`),
  CONSTRAINT `TP` FOREIGN KEY (`Id_TipoPago`) REFERENCES `tipo_de_pago` (`idtipo_de_pago`),
  CONSTRAINT `admin` FOREIGN KEY (`Id_administrador`) REFERENCES `administrador` (`id_admin`),
  CONSTRAINT `arti` FOREIGN KEY (`Id_articulo`) REFERENCES `articulo` (`idarticulo`),
  CONSTRAINT `estado` FOREIGN KEY (`Id_estado`) REFERENCES `estado` (`idestado`),
  CONSTRAINT `usu` FOREIGN KEY (`Id_usuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito`
--

LOCK TABLES `carrito` WRITE;
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Consolas'),(2,'Videojuegos'),(3,'Joysticks');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentario` (
  `idcomentario` int(11) NOT NULL AUTO_INCREMENT,
  `texto` varchar(250) NOT NULL,
  `valoracion` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  `articulo` int(11) NOT NULL,
  PRIMARY KEY (`idcomentario`),
  KEY `articuloS_idx` (`articulo`),
  KEY `usuario_idx` (`usuario`),
  CONSTRAINT `articuloS` FOREIGN KEY (`articulo`) REFERENCES `articulo` (`idarticulo`) ON DELETE CASCADE,
  CONSTRAINT `usuario` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado` (
  `idestado` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`idestado`),
  UNIQUE KEY `idestado_UNIQUE` (`idestado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagen`
--

DROP TABLE IF EXISTS `imagen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagen` (
  `idimagen` int(11) NOT NULL AUTO_INCREMENT,
  `URL` varchar(250) NOT NULL,
  `articulo` int(11) NOT NULL,
  PRIMARY KEY (`idimagen`),
  KEY `articulo_idx` (`articulo`),
  CONSTRAINT `articulo` FOREIGN KEY (`articulo`) REFERENCES `articulo` (`idarticulo`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagen`
--

LOCK TABLES `imagen` WRITE;
/*!40000 ALTER TABLE `imagen` DISABLE KEYS */;
INSERT INTO `imagen` VALUES (13,'https://upload.wikimedia.org/wikipedia/commons/b/b9/Atari-2600-Wood-4Sw-Set.jpg',21),(14,'https://images-na.ssl-images-amazon.com/images/I/81LA7mj5EuL._SL1500_.jpg',21),(15,'https://upload.wikimedia.org/wikipedia/commons/0/02/N64-Console-Set.png',22),(16,'https://upload.wikimedia.org/wikipedia/commons/0/02/N64-Console-Set.png',22),(17,'https://store-images.s-microsoft.com/image/apps.56698.65836138375483356.d1034d7b-8f8b-4453-99c9-f114455e8e51.f7ec0c0d-6bd0-4c52-ba05-fa67ab535ddd?q=90&w=480&h=270',23),(18,'https://store-images.s-microsoft.com/image/apps.56698.65836138375483356.d1034d7b-8f8b-4453-99c9-f114455e8e51.f7ec0c0d-6bd0-4c52-ba05-fa67ab535ddd?q=90&w=480&h=270',23),(19,'https://assets.xboxservices.com/assets/df/f1/dff191d8-d9bf-4e9b-8443-8cbf10ffbbab.jpg?n=Accessories-Hub_Content-Placement-0_999666_Emrys_788x444.jpg',24),(20,'https://assets.xboxservices.com/assets/df/f1/dff191d8-d9bf-4e9b-8443-8cbf10ffbbab.jpg?n=Accessories-Hub_Content-Placement-0_999666_Emrys_788x444.jpg',24);
/*!40000 ALTER TABLE `imagen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_de_pago`
--

DROP TABLE IF EXISTS `tipo_de_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_de_pago` (
  `idtipo_de_pago` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`idtipo_de_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_de_pago`
--

LOCK TABLES `tipo_de_pago` WRITE;
/*!40000 ALTER TABLE `tipo_de_pago` DISABLE KEYS */;
INSERT INTO `tipo_de_pago` VALUES (1,'Paypal'),(2,'Efectivo'),(3,'Debito/Credito'),(4,'Monedero Virtual'),(5,'Pendiente');
/*!40000 ALTER TABLE `tipo_de_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `idUser` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nameUser` varchar(255) NOT NULL,
  `imageUser` mediumblob NOT NULL,
  `Active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `apellido` varchar(25) NOT NULL,
  `email` varchar(35) NOT NULL,
  `clave` varchar(10) NOT NULL,
  `contraseÃ±a` varchar(10) NOT NULL,
  `telefono` varchar(10) NOT NULL DEFAULT 'xx-xxxx-xx',
  `dereccion` varchar(250) DEFAULT NULL,
  `imagen` blob,
  `Active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (9,'Zajim','Majorasmask','zajim_link@gmail.com','Link','Password','8118586146','Shawarma',_binary 'ÿ\Øÿ\à\0JFIF\0\0H\0H\0\0ÿ\Û\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(ÿ\Û\0C\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((ÿ\Â\0X\Î\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ú\0\0\0\0ú”€\0\0‰\0 HD€@\0\0\0$\0H\0&$\0\0J$6\ç\\ü\Ò\å9·\ïö:³›\éN£\è\Ït7 \0$\0\0\0	\0	yğŒ¾pyˆ\Í\ç\0‹bt I€•\áa\Ï\êò·iK…©ûš¼›;U‹±\×$Vµ“i\Ù|\ê\Ç^=•¯\æ³\è1\ÏôyI‰\0I	\0\"`–<h\Ï\ã#\'ˆ \0‘lN‚	D€kx÷G…ô¾ôÕ¹w\İ`§c™\Í\æ¬yõô\í;š6eÙ¢(^Á7h\Ó^\Ö\îQ¹U«ºì´§wk\çİ¥Ï°#¢’A <\ãFo8<\Äe\Ç\0\0\0\0Z¤H\0j7\n¸\í/uò®móù\Ö\ìp\Û—J»L™2‰cÉ™\â<LFL£Y\ì^\Õ,ûU›\Ì\Í#Œ1\Ù\î>q\Óútpy\ê\Ç/$\0\0\0\0\0\0\0¶\'AHpòkYw\×]¬>¯\à\Å>½\ÖÙ‰U¡\ï8J0C,{‰ŸD\Ô\á\Ë\'ŸU\ìLu;.±ô¹lŒ€@\0\0\0\0\0btH\"µ¨44ú\'\Ìy·\İ}·&¡‘\Şd\Ë\æªW(^G¤EX²V\ÃyÙ£\Å#$À”LI$±{õ.RÁxú\Z\Ï[„$\0\0\0\0\0\0$´\'DH¹lç¥–ÿ\0L¢q™F#:\ëMš›I¿g\Ã\Z\ã§Mµó\ÍM±—5µ\Õû±[8‘V?^°J\ÆøaŸ¿q;n—\çŸCôù£ \0\0\0\0\0À¶\'@\Z²·\è7\ÒXõ§\àé¿•¬N\×ªÖ¯¶vz›\ê\í)Y\Óg/Xñ\í7²f§”l;-A1\ßKM\Z|\é\à\Øø™¬b\ÍZÌ«Ø­f\ZÏ üóµ\ì\Çw(\î\æ\0\0\0\0\0\"`¸\'@Æ?9\Ûòœ]*\ãµ]\îk=a6´lĞ„\ÌE\í‡oZ\İ)\æ„\å›]\×vd\ÖÅ½OI\Ü\Ù&\0\ĞkºMQOg\Ë\ï¢Ù™)gH¿¬\ÙKQ\Ör]õ\ì¦\'\Ñ\â H\0\0\0\0\0Ij1\á›gÇˆ¬\êó|\Ã==\Ñõ“Ÿ¶µ\ÊŞª‹²§\Æ/^frt÷p.ª\î¢ûo½9\Îfõ\ß\íµ•\ë^†–\Íõª–)K\Ú–\nÆ“Y»«k\ì*Q\Ü\ã<\çK\Êôwk÷|\çMjvòG…!‚@\0\0\0`yD\Ì1e;¿Ú©¥>\'\è_3‹hñû\Å\ÏÙ“&K\ÜnL\İx¬|\Ç\'Q\Ï\Ú:¾ª¥\\\ÏE_±Z´l6jW»WM¦]†Áhú.K¥‡?¿ù\ç=\ÔöZ,t÷N{™ä»­\Ö[\ã\Ö<<²&! \0\0\0dò\É)Áš‘ ¼­[|{\rº¼Ş„úñ”§¿œ¹j¿Iâ¯–—w\É-_°k\ão\Ë\ÙSg+\ç\ì\é\ïŸ%ki´µ~Y\Ïuüı^\Ëg\Ñg®\ç\ç\ß@\áy:1ù\Ö6\Şk0ûè†h³¾®)$g×£7¤\àœş“ƒ\ÖI™\Ç\ëĞ‰ \È\0\0\ã8¶ük¬~ñ\Æ]\íº;š\ÓÖ‹m›~‰m÷;Í±\ë6™1sôÇ¨˜F,\Ã\ìXvÏ\àş±Jkkqƒ6Z¸Û‰\ç½a†›½•K5±w7¾¾JóblÁ\ë,&&@$\0\0\0¤\0„€9~¢¬OÆ±gñ\É\èöû¾W¶ŠÓ±¸_:™s-YD\ÄÄ€„IH#ˆ\î8Lm‹u¤»ö[\'\éYey\0\0\0\0\0\É\é\Â3F1&&h\0!	J¾\Å^}ñzx~­ò~\Û^o¡Bbb`L¡ñ\Ñ5{I‚%	 p]÷Ï±»G¼\Ò\á¦û\è\ß<ú\'o9Ó˜	G”{`ò‹>kAg\Æ$G¸òB=z<2ûMy³)¢”\æD€A\ë\Ú~6ªñz}ı†¸t\rF\Ú ÀS¸‰Ãšb` \">s\Óòø_><›,§Yô¿Ÿv\İ\ØZó]¾Y¼\ã#\ÔD÷\ê\âÇ´\Õõbfpz\ÊO™‘$\0)=de†lúZ·«\â÷\ê!?\Óõ¼—fó\ë\ß úş¸s{{|5«\ØÁ\Õ.x0\Ø\×\å-±\ä\0’ÜœMm~\ãUÍ§«\Ôv‘^o½>Jş³%×¢bP™\0\0$‚Q!\0\0\0\0G”r?7û\'Æ¹ºw^ùÓ£;\ß2ú\Ïv¦^ÿ\0\â=o?G\ĞXòŞ˜ız€˜&\0\Ã\ÌDú\É;\Zi¢¡“0\ßhz™¯F=.p\0\0H\0\0\0‰\0\"pyV\ÌVğ‹^k‘—Ç’^\Ì_\'úÿ\0)–ÜŸÒ¾kõ,tõòÿ\0ª|SH\Új~•ò\ì¶\ï6ºŒ\Ñ=tò=F™e+–5:\ÜU¿›&zf\ßa±¦_3·§\Ür\ß\Ï\Ğ8ş÷«‰u\ä ’	‰‚a\"&	„‚Ä„€‚šÇ¦u=[”\ÖõœŸ¤˜I,y\Ê~›\Íô¼÷\æ# \Øi>1÷_e­şƒ\ì1Ù®ØŠ>®%3\æbgiOz<ú£|¾]½\Í\çšıv\î\'\Ğ\æD¬‰\0\0\0 \0‰\0‰‰\0DÁ0\'ºÚ­fV\İF—w\Ú\Ù\æy)õ\ï_\İm—ØœgIK\ì9İ·´üW¾·O“ªH­ı O¬{É‹Ye®\rF\ßPd¡­\éf›˜—E\0D€0J$‰  L‚&@HÇ§÷8Ø‰\ÊÀa©±\'…\å>Ë¡\Û/œt\ÚZ›\ç\Üú\Ô\ï8z¼ø\É\ê·\Çc\Î³\Î‰·»†™J&a‹ \â3õ:ª\Î\æ\ï¼\ß\Ú\'H\0A \0‰\0\0\0\0\"@ƒK—~](\0\0\Z^S\è¼Ş¸rš\å»m\ëq÷Ñ™óŸu²#ir•û\Ò\ä\êò\Ù~bRD•u=†#&çŸ‹GX\Ğ\Ş\Û=€°”€\0M;”aTr\è\0\0	 KŠ©\Ûñ;ñ\ìz\ïŸuu\ÓmZ\ÔcÑ®¡\Ğ\ÄN›sZ¼¶(ôŠ»J¸­;(5lO,b\Î\ÛN_}\ç^z½o\Í\ítsı.5Wk\Ñe`	H$H	Fı\n«m\0%€˜\çG\Õ\àıOó\'3\ÒówÈ­¡0T±\î¡s¿\ÙD¦\È\×ü\ÏJuø®\Û+\ä\Ø\ëo\Õ\Ê\à\Ş\èúüş\Â\ß;\Òóõ\ÆÆ†;N\éª\Ù\í_B@D‚\0$E+Ô¡Pr\è\0\0$\0hù¿ q{sT\íø}•©×¢yû’OI\Ó|ÿ\0l\î\êõ±\İ\Ê\Ô\í\èZ:Nª6^W¡‹`Dky>ó\çûò\İ\íx\ê-–aD\á\Ë2¹kG¶Ş™¢W„H\0‰+¸a­c\ÉÉ H‰\0\0A kvuf8y\Üiú¸:¿\Ù\á\Õjbs\Ù	#”\ê×’·š?K‚:-\ÔpÙœ\â\êÁ÷œ&œş:\ÎO¡¾{\Ñ\Ï\Ù(‘^Æ¾\Ñ\Ó<ú\é¢$BD$!b`\Ğ\çó\ë–\áYD¤„„HLI‚f\Øb¾|~\\3\Ñ\Å\Ú\\\àz:÷¬yi²=ú&i\Æw:\í”\"\\\ågwª\æım\Íj£elõû\ì\Û|÷ö1\èb\ËE70{Æ•ıVÓ§9‰X\0\0\0«Åªœö‘€‰$‰\0\0«hS¹ª\Û\ZN_\èZı1\ã\ÛJ[sVË\Ì\Öİo¸¶ß£\á:l÷İ¢q\èk¥\ÓŞœ\ÌLtğv7õ\\\Ç?oqK\ì\Ï;\rnÊ·Q½J¶µ‹¢7z=\Æ\Ô\É\Ö\"@‰\"@A0’9>³•\Ê\Û)\×\ì0¸„H\"Q$ÀB`§o\ÕBÚ9®\à\ä&:ü|}\ëSs\Ãı’˜\Ön0l/øsõ«\ØLq[ú¹ú^? ¯[s½¿3\Ô\ÌXô*ÚªU\Ùiw‰gÁ®\â&:) \0$N§m\áwº[\ï^}Z€„\0mx4œ\×i‹L6Ÿ>ú*8ı\Æüö?:~^üÙ¹XÛ›\èQƒ>a\Êj÷zN=·Ï¾ƒM¤e\ĞV³\ä\Ñï´›¸–<‹E\ÛZ]\×E\Ñ\0$H\Ë\ë:W—k{v\Şs¸DÚ‘‡<ó\ë)Eº(\ÔŞ˜²‰˜DŠ7µ–\ËsI«\Ë~&­ö¤¸¤:¼ş³kN\ï\'¡-ª\å>KLx\Îö2Å¢bk \nw*[\0ñr¶+\Æñ\ÑDH‰\00I„\ï8üoPsmoo\ÎÚš\î^=ÚŠ7‡:\Şj+|›]C|ñ\îôñ\Ïôz\Æ~l›S	¬ÀTË™0&%	!0\0‘)q®‰Ú„—e¢\ŞtRE\à\0!!›\étt\0\ã\è&\×L˜\è§M³šfó\é1ª¥\Ñ`‹j·ZrwZ¥{SO8ı\ç¥\íŸ=–Ñ¾V±j\0H€\0H„¤\çºNöh\Ş¸±\Ş7c¢‚	 $\"Djvô\á\È<ú\á\é\0À¹²\Ğúšô-f\Â\Õ÷‡4Lyöß¬¸©{›\r6òcl‹@ ˜<\ã\ËM7šÍŠ%0À#M¹\Ô\'\çI–¶\Ş\"mGi^³¬\ÙôfDØ„‚	$p2\â\á\è&=>£\Ñ\ïßŒˆ±f–[V÷ªù­Z:›IÁnº[¢~\ÇJ(&\0(R\Şk\â\Öls·¤yõ51#U´\×t½³\ç·[\"k\ïzH\Ò\0@Lƒ‘¤q\ì¸\0L‡¼\â,f-\\™	ªIiõ\ÅmŸnDÚ’ôH \0\Ö\Ğ+|›@²-D‚€kd¦‘7~‹\çƒ|oH“Hÿ\Ä\01\0\0\0\0\021 !0\"#4@3$AP%5`ÿ\Ú\0\0ÿ\0ö{µı)ñB\ïùP¿\åBn)\n†ª	¿\è5E\ÃR\âMJX\Ù+*°tó42`Q\Ê\Z™\áTµñ\Ìhw‚uW.rµhG\éIUh\â4ê¢ª’¡•Q²Dô<¢•®§@\ê>ªö¸8~\å»U®«…j\ár®\\\å\å¾\é%%.)T˜CÔ|ˆ=jò´‘hô\æ5\ËCl¨•°p¢‘ñ1O¿w’\â\\®Ë…j\ár®\\­tô\×S}LF¢X$³£YPQ–G-\Z\Õ\Õ\æWM¹=\íbuP]J‡/òú”5\Ú43/¨rPü©ªd§PL\É\Ù\ê%x¹s•ªÜ®WeÂµp¹W-}3\ÔGj+hjQZŠy\nÁ6&œ\à\Ğê,…GN\ç(\âc2$\0\éB2Ê¥—rf\İ\Za]&\İFQH\èŸKR\Ù\Ûİª\İ\ç_6®*\å\ÎV«r¹]—\n\Õ\Â\å]\ê›§‘I†N\ÕV\ÙiA«\Ğ}L…$95qŠ&³°\íj„m\n§B¾œ±Á5›\n<5\ŞZ\â\ÓEX\'Ì¢%\\®\\®«…Ê¹s•ªÜ®WeÂµp´\İë­ªe$¾i<’\" \0^\æÇ°±¡¡jS\Ü\Z\Z\ÒNOg†\Ü\æ\ê™\ã77pc‘\n†°Êµİ•ªÜ¹W.W\n\Õ\ÆW.rµ[—*\ì¸V­=D€+\êeDlt\ÎkYvºc\â6Fİ¡^@\0=\ÛC\ç7!ı²7T\×nj¤¨ú†İ•ªÜ¹W.W\n\Õ\ÆW.rµ[•\Ê\ì¸^[\é–h\âµw\ÔC\Ñcª4Drÿ\0i\ä’3\î;6|œ¿\ßpøJs]O(©†\ì­V\åÊ¹r¸V®2¹]•ªÜ¹We®\ßD°2T\ì.)Ÿ¹\íD\í\ì{¶ˆÛ´\'»{ó”ø\Z\è”nkN\æª	zuW+²µ[—*\å\Ê\áZ¸\Ê\å\ÎV«r\å\\µô\ãõ*7•,\'\\øüŠ¨—¦Ø›\ÒfZ­\ß(ß«Ö¿>\Í~y3Ã“ÿ\0²–N¼+²µ[—*\å\Ê\áZ¸\Ê\åvV«r\å]\é\Å\æ5XŒ\r{÷\çú61ÕŸ\'©_°u4l¿J7I»Ycˆ\È\Zw\Ş5\rv\àŸ\á\êQ«0©~J\åvV«r\å\\¹\\+W\\®\Ê\ÕnWw\Ï<T\íª\Ä\Şğ6”ƒ9´43^´²¿{ ø\Â\Ğ\Z	\Ğ=\åÎ\å+İ©h\èAOn\İ)*\âé»²\É£X\Úu\n†N“\íE\\®\Ê\Õn\\«—+…j\ã+•\ÙZ­ZwTŠ\Ç&\áOsñºx)ii\ã\Ø\Ç\Ñ	/N(&|\ßS&¨¬wƒ¥sªŸ“Š™»\å©~\çk\ZöteQ»\'\rÍÚµAbgŠº)©x\Ê\åvV«r\å\\¹\\+W\\®\Ê\ÕÇ£ûµ\êi:o\Ô\î\ÔLş›2w4§l#\í\ÂN¥}¿è§…»¤¡fúŒª¢\ëD\ÇnlÇ§6NøJ˜t‘Kñ­ÂŸğµq•\Ê\ì­V\åÊ¹r¸V®2¹]—–÷\Í#bˆ¸½õ\îQ\ÒT¿ãª¦ğ\É½ù?–…[üªH7GL5’W\ït\é\â\èÃK:ucX)d\ÊF\ïdn\Ş\Çÿ\0r®ñ&\Ê\áZ¸\Ê\åvV«r\å\\¹\\+W\\®Z\éİ¸,V \Ë%D\ÙS]!ÔŸ*¡\ÚvU\Óô\Ã÷I\ÔÁlCl8k<FÑ¹\Ô1ï“²©H\Î&ŸI½¨“Ô±p\ï5|®«Œ®Wej·.UË•Âµq•Ëœ\Ü\àœB*¾¤C’øZ\ê£øÒª\ì\'R|¹aTûŒ~V\ï·\Â\Â\à\éA?\í*vbŒE\Z’®\×üŒD²³D1\'jaÿ\0\ÚX\àö\Ö7Xœ~,¶·ûp\íL÷.W\n\Õ\Â*\åvV«r\å\\¹\\+Wxrİª\×vVªº†Q\ÅQQ%Di{\êi\ä‚D\ãş\"\×HI\Ğ4h›â«¥Û‹<\Z–\ÙE^©W\ÉÕ¬T™S‰±‰òTT¨h*^£¡™£\èªW\Ğ\Ô))&Œ}$Ì£šD\çD|=²\r\ê5‘\Î\íóa7ò®\\®ªÜ®Wej·.UË•Âµp´\Õ*õr|‰•0\Ö\×\ÏU=,4\Íş@\à\êå®­w\\\â›ATR™Œ‹pv³\é¥x!\ÆK¸\ÏY°\Ò\Ã\Ù[¾)£ÿ\0×!ñ‡! …õ¬İ”¾w\áô“ÀX\ã\Õ\å\\¹\\+W\\®\Ê\Õn\\«—+…j\Ñp¹W«²µZ±·n\Ä\Ï\r\\½\Åƒ«:.hU0õ±\ZHºòıbu}F\ê:\Z#1Lazda‰óº£lÿ\0\"«ÿ\0%b‹ù\r+•5T ùZ«şø\ã’Yi0oôcR¿jczC…Ê¹s•ªÜ®WeÂ·.UÀ\r@j\r\ÑX¸GÊ½\\‚µ ¥\Ù)\ã†¡8\è‹6W‰T)ç­¦Q\âZIƒ\Í	U\Óõ\Ô/\ê28W\n¢F\ÅZ§TøU4K\é?¨\ÙõÇ©úõ4\ØkN8´\ÑÊ‡\êê¡†*x\å™ÓªF¶-mV®*\å\Ê\áZ­\Ê\å¦\àA¨7E \í\áX¸GÊ½\\‚¨‰²\Å4n†]F\Æùr¨Å””Sµ%\n©\"|TM\êMI\â6F^£ŒCQ–\"Öˆ)b\èS²9b\Ôá˜‹\Üş9ñ“€\Å›\ÅJ\ÂN¨‘\Õ\n3\Ôl4 +U«…Ê¹¨\rğ¢\r\Ñi\ê\åp¬<#\å^®\Ëù\r/Ä¦\ÜN‚\nv?¥\ÜØ–3^ƒ–\à\í.\Ä\é\é9®r´=\Â—ò:T\Öjü.\éhòªü\Õ½Y¶*Hö¶\"e}\Ê\ä¡­Aº-?Bô<¡\áX¸\\«\Õ\É\íGU ¨<ª°¦HÇ¹W`\ÓE6‡\ÈÊ§wnN”…%\\\ÚC@Q3cr«ü\åO§Ô²7\È\èfRµ¡«Aú·+\Ğò¸V+Qò¯W,F•¦öşeûs£F\'L£’4Øœ™Y\îªü\å„\Õ\Ä\æXC6\Ò~½\Êõ\Ê\áX­GÊ½Tü©G!UøuC\âı\Z\ÍTõ-¥i/|q°2?\Ñ\Õn\Ä-V\år½r¸V.òª>tã‚©œ\ÆW\àr	0ÿ\0Ñ—òUw÷Q·|ş\ÍV\à·ù\ßä¸‚|er¹\åª\ÕnW+\×+…a\áH5–§\Â÷/\â\Ò\î\ìL<:\Z™‹ij!ô2*ÿ\0\ì\Â|\Õú7¿\Î\â	$\ár®\\ € †vy\Ú3\n\Õj*\åz\åp¬: 4\Ëcfˆº‹\ïúv&F\è\áF\í\ÍFŸ\êVï¾µAÀ ÿ\0;ü\î B*\åvCPƒH;<\ì\Z\è= ­V’®W¡\å\0SZAªnÊµ€ø\Å1\Z-n+¿—\íÁı+:WO\ÑWZ¸\\«•\È [H;<\í\ZûnW †¡vy\Ø5\Ó<a›1E„x­Xˆ4Ó´‡79\É\n9\ïLÒ¶†\ç²?¬<k\\ö	Y\ZAÙ¡\Ø5\Ğ~\ÔYª\Ú=\Éc\Û\\°\ï¨¥¸n!›šQµ\ÚHO|ò}lÕ‡m\Ë\Z\×\Ñ&‹u\"¤ñ\Ô/\ä\Ú:·\Äz}c\\€¸ø5µ1¡­\Æş\İX;u¨ÿ\0¡\ÜkM\â\Åi\ĞZ¿‘k\n\Â1\'°\Æö\È\Îù¥d1\Ìù+Pğ©c\Ôÿ\0 ~\êÜ°Vı¯\Ü\Ô-\ã]şwm<.V%\Ó\Ö\Çø”ºšv°…;v\'AúX_ÓŸ¦\æ>—mUkav\ÇI\"›\Üƒvüa8\è\Ú(º¿°\ç’\â	\Ô\"®W šAš€\ät\Û\é™ø”Ÿ‹#\Äq¹Ï¨jQI€º\Ú9:´\Ò\Æ\ÙYOS-\"FJ\Å4ñ@%ªš¡EbCÆ©]¿T0õ\ê¿fô<¡\á\0A \ìó´k\Øö‡±ñMøÿ\0Èª6S\à˜oAW3©D<Œ\ßc\'\ÒF\\!‘EOnÎ–<œtm3ò\Âb\é\Ò~\ÎÁ®\Ñ\ë\Çiõd\Ğ\ÊX\ÅFX…?\Ò\Öarm©\ï‚>£ò®v\Ú(©úxQu\æÿ\0¡–x\âF¾%ÿ\0!“¥‰\Ñ\âTr-Y36·<j\ê©\ãÕ³÷4n1°1¹b\ßü\Ùús\á¸,Z»÷\ÜCD\Ó\Ë*\î¤ôZB‘‘µT.R²GuTup=\Z˜\Z£)-Ii;©b\Ú3\ÅF\ê\0\ç@p\â\ÖSşó\Ü\×;»\\N«ğò¸?î’©³Å¹¯2ºeª\Ş\ÊXwv\ÈÁ$z\É¢5SM¼~\íQ\ßQ\è\Ä0öTÓ½¨øT5{‘À7Lúa¢§òwK%SPjb\İM[»÷Zw?\Ó_K\ÔNk^L¨^\é#\í\Üt€»o\ÔmM!Ã¶xúŒw\ÜQ\Ìø\Ù\rDs~Ó\ÖÀ4‡Õ‰S\í\Ê7˜¤oNv>œ¢\É\Î- ‚)2\é\èDû{ªÁŠrtGj|òSGMW\rHız\Ï\ÅöUAôÒª	ú2\ä\èXQ§RS¹¦M˜\Ö\Ò\Ü\êc\ê\Ãü1\Û\ÅT\ÅĞ›š%MSCV·ñ½•‰\â ´•‡\Ôuc\ì–H\Zd2ƒ\ã?d\Í\ÙRšI`š™R¿§;d‘Š9™\'\êVş?·‹\Êc\ÌrFñ#;KLe®j‹ò»%ª†¢µF\í¯‹\âù£\éLF¢Š^µ3š›$‘¨¥l£ôk¿\Úö‡±\ì1H°¹¶»¹\à\Æ\àA~NU5S¬[–©`?Ü˜\ÒóÜ›fXSô—\"\İKj }o\ãû±875A§”Mwô¾¶¾JJ\Ç\ã5M]U6UC\î`qm€7\â\Ø\Ë\Â\Ä[ºR»eW`Œ\Ã(”{ªÿ\0£\ßWBeC?F^\â5¸-®\Íñ™\êb\Æ\È\Î\ìˆ\Üi\â\'o±\à\ë‚XıµŸ\ïªg\ÔB2\Ã\ç\êGİ@H\Ï¥\Ü\è\ã\r=\ZJ°÷kI\ÛD\í“{fnøcvøı\ÎøO‰Á\Ózc‹M;g·•‰\Ñ}3“d|1¶(»dpt\Ë	?o´X#\Û†{X\ï”\Í\ß\"xfŒÁ*ŠG\Äúj†T7µ\Ín!Fi_‚E¾§9&%&\"\Õ-D\Òç„ƒ\Ù#öÂ\Ê3ö}®ø\Ô{dfñ÷<:¶œTG\ä\ÒZ\è1¦=¯“DÙ¢ §úX2Ä§x\02ÿ\0qQ\Í\"`,hcsª¶¤t¿\Ñ\ÛQ\íªñ7ºQ¡\×ü•ˆRuP:\ç A\Ï\ê*µ!7”(¤Ç*4—*ß¥[ÙººgC\rÿ\0QU>S\Î\ÆS q\Û\'¶°}{¾Ü¹TRE9“™©\ĞN\Ô|-\Í[›\í`\Ïn´¹a‡ZYVF‘ª\á\ëÁEN`)¿º°\éL\Ë%£\Û\Ù\ícú2{ª›º&\æö–1\Êjh\ä‚#¬k\nv“\çQV\ÓT!P\Ä\Ø[Pİµ\Z¶‘\Û\és—û+ŠmªŒü=¸“6USI\ï‡\à\ê™\ÛN\Èk\Ù$‰õ\Ó<ıUB¤­UKA(›\èª$‘M\ÙWY\Ñw\×T*:¾³±\ngºH\è\ê$PGÑ‡9ü)Nú¬£vÊŸn\'úV¹Dı\íö\Íñv-a;r2}±;|S\Ì\È\Zq&(+£•ı˜Ò­Rµ}\Õ?Oò~On\æ\Ó\ÉÕ‹Û³¤øß±À\ê=h{CQ\0 §WGÓ«D\è)ZYM‹rIÕƒ<X|\Ñ;{\È\ÔP\Æ;¥?·fÚ…›ó\Ø\ç!3\nö•YK%o\ĞS•$‹·–øy\âQ\ï¦[L‰š\í\î„M›š\ÚW—3ÙˆGÔ¤\Êv!\ç²htC\Âl\î	“5İµ\Íñ›\Çm\\}jpuZù£Œ\ÅM\Øi)Ë˜Æ°w\ÉñŸ°“ı»v¡—a\ì–\rWG1jcƒ\ÆOh{\"s‚@ñ\Û%<2\â?}oô4\îoe´\Ê\Æ\í¬\Î)K\\3’0õ#\nc\Ë\Ç7)†Ê t1Jú²7|t\Ö>Ç™öbmûİŒqa`\î\Â@FQ<±\Í!ÁWŒ\ãŸD#ô\ãûr=´Nøzñ[;£˜µ2F¿²H\Úõ$Nb†M„yU,\ê@Ã¹¹1Å¦9Cÿ\0No4\Ï\Ôvk²o^(?\ÃôG9	\ì1´¦¡m\ØõM¦\ãJ\èµ4\Ú\ítd\ŞÊ¯\ÊC÷·7·s)\ßÔ‡\ÕX\Íô:@Q\ÎPpwm_Æ¥4\ísN\á\ß<z¨\çC\Èô\Örû£:3¡õ\Æ6³\Ö\Ù“U®U±u\"c·›¢xµQ¼°\Ç ¦»:y4\ì‡\Å_®_zBC*¨\\\×O\'¦x²}Hp\î¯ş¬\à~ö\ä|O\ë¬nÚ¯HA€ì¨¦ò%j\nwDñi“Zc™®\î®\Z\Óg¶8B’üÿ\0ÿ\Ä\0(\0\0\0\0\0\0\0 !01@A2Q\"BPaÿ\Ú\0?ÿ\0Šˆ\Â2!Á¯5–_…A±b?	\é,¡\â\Z¯—\âƒb\ÊZW1«%\n\áeù±\î‘GK‹\á8We—\çJÏª^L\Ûğ1~\Ù|’\å%j^d¬K\ëT‡Ö•\Ğÿ\0C\å•w\æ‹m‰pb¿z>9—^[1G\ìg¡-}\ÇÁşõ\Éøø÷bÇ¹–—CˆbÕ´tFZ\äü|¿\Ë/H\Ã\Ü\ÇÁj\åCvZ,ˆ\ÛIJı\Ã\\!-®\Ï}ˆœ\İô92Öz\È\ÆDlK\í™eÂŠ(¯uG\Ñ(\Ú\Z\ìO­i›¨’Õ›Jò\Å\Óº‡\Ù\\\âHŸ]x¬¾+J¦ø%cU\Â>\Äe÷\Æ\ÍÅ—¥\Å\Ñ\'R~“tŒ’¾\Í\Å\éEW\Z6›J\Ó\âföEóJ\Ïü\'ø”Q^|µFwL\Â\îD£\\R²¶ˆ\É\ë\Ëf\ãql¦a{dfVavA\î±\Æı´Q±*$\ïL\ëË´\ÚW	;F\î©_Ğ†¬¥¤\å¦ï‚¢lD¢×£v‹¢İ«u«\éWÀK[\'\í\Ö&¥\è]\Ènõö5ñ2\ã¿\ìŒY\\X¥«/ƒ\Ä\Í\r½˜gõ¥E\Ã,mòwL¯ƒ%¹Qø²2Ü¯”¦¢AÚ²FE¶D«+\à\ç‡ûgN¸dmG¡\ä“û#\ÛõU§ù\ìÀú­Zó¾\É\Çk1Or­d·*%®Œû\×?£\ïWğ\'\r\è\î,†U/z\Î‘\íD\Õc\ÎşŠ”\ÌXœ]½šğ\äÅ»\Ğñ\É\Ù\É$b\È\å\Ó\Ó\"¸\èòm‘õ\Ñ]‹G\Î\Ë\Ñ)¨ûX¾Œ°µÑR\Õ\Ç_d\Ö\èÿ\0S\\}ğ|\Ñ\ïÁ<nR³:¸ˆ“¨Ø³»\×/\ä`}W£\ç5­\Çj$­QD}i“ş\ÈCg\'\ÎôkTÆ´CZ×ò½Z\Z\ÑHjõkÄ‡£ä¸´V¨|kŠ\Zğ¯^ù&5ÁhÖ”=xPø¡ózÿ\Ä\0)\0\0\0\0\0\0\0\0! 01@A2\"QBPaÿ\Ú\0?ÿ\0Jg\Òsªµ)\Ã\ì+µşK«1¾\Ñù_\Ğ_\Ér/›Qù!\È|¿\ì&¼?#Ãª\Ğs0‹ˆÿ\0$\ã>\í •ú…«ş(”	Ğš\â\Ã!Q®\ß~\0öªR`E­\nCSŸ7•00‰´û\n‡\ÈÕ‡x.xoh¼‘1n¸:T*\ë{ğ*Dªô/´\ãu7it g<Î¨Ú©P›* X2v&·)Í‹‹|wKc”§µ¬l 5¨A°0˜2¡vu!\Òp€õr¾9ı¹«GHQ¤&ˆ	£İš .\Â#\Õİƒ*£=¡”U,ò\Ôt \ÔQ±P\á~ş‚v²2\Çh&UAŒ&Œ·—@U:\Ù7” \"õ\ÇI™\ÂkpƒP\åp‘p%„\êB1`\Û\0š!TUşª\Ù9Ş•6ó\Ôo»\ØDA¸!~@2«}U>\ÓZ€r-\à­õT~Ê‡\ì\â\ï”6V\éS\í|aúø\'´·dm®p¨ıÂ£‰o‚ş\Õ\Úx÷¼˜UU¸Q\à\Ö_Ú«õMv\ÒWj²ø\Ã÷ğª¶Bø\Ş\ÕcˆO\Za.°ªö¾+ jğ\é³KŠ\Ñ&J®=\Şl\Ñg³ &ˆ\à:¤t¿+“*‚´©F›¦\àM\Ûp>\İ\êğ©\ÔÓ‚œ\Ğğœ\Ò\Óğ€¼Bkÿ\0¾sµŒ*\Ô\\…5\è\ä;\Ø\éU\îÑ½E\Äz\Ş\ØNw6™rª\İ.„„\á\Âx\\\İ\éTl\ì¢\nM“ \ï\ØÍ©*¢\ít\ï<	¦B{b\ív“)\É~4Ş—j¯Wï®…\Ús\"ô\êQÚ(	B’\ÃS\ß8\ØŞ·\Ô\ák\á……¤öGVaÍƒu[¤£z{\êŒp\Âke©º;Op\"òòša\ÙU;s¼‰®¾*g6Jüb\ì\éT\ï`³L\ïª  o*v\Êiƒcf?Jsµnaõ†,\r\áb\æa‘º§\Öò¦Ğ…\çˆİ†\ã\Ö\ÙSr‡B\í\È\Ü{\à;ˆS¸ZŸ[Ÿ\ß	CiC}>­ÿ\Ä\0D\0\0\0\0\0!1a \"AQq02R#@Bb‘¡±Á3r‚Ñ’¢\áğ4CPS$csñpƒ²ÿ\Ú\0\0?ÿ\0\à[/eK\\—ùzŸ¿\Ë\Õø\İm6«y¶~‹\Ñ\Ôi<7ÿ\0±d¤`¤z•šo­tG\Ù÷UŠ µ\Ü¶®WŞ¶#\Âû\Ğcı^/\\¹HY¨8¨r\Élú”>«\á*\â\ãúUŠ\ìs›\Éz¹ô\Ï\Ş\Ç\ËDÂ³T—\Ñã½ªF·¬´‚2õK–j \à²R\Õ!f \â¡İ¿¤{[Ì¨¤\×\Ô9\\ÍŠ\ÌW¥ª÷su\Ê\å\n\æ\Ç2»\Íø.øş´^&|Æ“A·3s·\Ç\rM\Ä+5ÅŸ{w¨ß‚\ÊZ¤b³P\å’¤,\ÔT\Æ‡¶ö”i\Ô}Zo¥lô“ò_\æğjµCú”\Ü3[2\îKs>kkk£e§\Î\å³N9¯a^)«ñ\ÉOTŸ‚À.F\Í\ìğş\Ê\Õ3\åÃ´\ÙY¨8¨r¿#-R1Y¨rƒ‚\ÉHRkk±š¤´q…\Z\êƒÿ\0_ô½w*€+\ËG\Í^÷’\îüoÑ´@[U\îÊ¥\Û?U²<ô_r\Ùk\È/\Â(n;ó[`“Á_Lpø+\Ì\è´\Ãp~ñ\ØB‡,”Œ…šƒŠ‡+ğR0R\Õ#š‡(8,”…!g\ÙHoV\î,¹z*Œx÷®(u\Ímø\0õ\Üù®\ëG5{¾\Z\"qÔ—-\ìo\ÍañVb\í\êY²ğ¢«G5³\İ\á£\ï)i‚¬?f¯\×VB‘Š\ÍC”’¤,\ÔT9_‚‘‚–©¬\Ô9AÁd¤+»3QşC‰N«TËŠ÷¾Š_pQL(n\Õ^\'r¢‹Õª˜\î4óOY¨\Óô*\Ş>!uUc­\Ü|J* \à®ÁKTŒVj\nƒ‚\ÉHÁKVj*¯Á]‚–©¬\Ô9AY-È“‚5=sKgº7¯¹Rnb†A_{\'D7»¼¨\nJ´ş÷\ÓP\'r\Z\Ò\ŞğÁc¡\×Uo\ÍA\ÅC”\Ø)j‘Š\ÍC”JB³PqP\å~\n\ìµH\Åf¡\Ê—¥¨\Æ~c©\è’\à\îó°½;\Ç%\ÛZ«y\á¢tXn;\Ï\r\Ïtw}B\í\Ø\Æ7;\ë :™‡Œ\nq\Ş8PpW`¥ªF+5AY))j\ÍA\ÅC”\Ø)j‘Š\ÍC•ı†\Üù8…nË›²\à\\7	Ü°¼«N\ï}53\Üq::¡úµ b\ë”\Æ\ìE\á7è‰¹÷k5PpW`¥ªF+5AÁd¤`¥«5W\à®ÁKTŒVkk±\ê\ÛŞ«w–õ¬Ô“‚¶|´f„ş#\Íú\r†‚2Õƒ¥\Íó\Z½rmOk\Ú¬\ÔT9AÁ]‚–©¬\Ôd¤)j\ÍA\ÅC”\Ø)j‘Š¿\Å\íe\âÀû©\Ç>:¶}‘Š’º\Çy\'ó_»£4Jk8}Qv\æ \ÑÌª¯g}†w`¤j]\Ş)\Z\ïÓ \Æ8„\æŒ--Y¨8¨rƒ‚»-R1Y¨*\n\ÉHÁKVj* \à®ÁK{U\ZV\Ï±]]-÷¸¨\Z—wÁ}\ÕıÀ²Ü‹‡y\æ\0`‰*JhİŠ\'Š¿º}G&“‹ö‘ª\Ş\á\ïe¯ºï®‡F(:\Z\â|JF\nZ³PqP\å’–©¬\Ôd¤`¥«5PpW`¥º\ÑCª`ñ\ÑZ­_kyOÄ¦‰{\Şu\æıãŠ’‹Ï’û°j²<Õ\ç\rk{¬ğ+#ECúTû,ú¨NˆÆ¡\İ@W®¯\ÙÅ¿¶‡4\âÓ ‚¯\ïˆğ˜\ÑY‡‰T\ÜxAR0RÕšƒŠ‡(8+°R\Õ#š‚ ¬”Œµf \â¡\Ê\n\îÂ“=šl“\Ìÿ\0\ëD\ê\ä¥]ôP1İ¥¡T©\Å^¤\è%\í}Sƒ6=ú`w…\í9©L©¸\ì \îu\Ú3ûh¦xˆUw:~+%#-Y¨8¨rƒ‚\ÉKTŒVj\n‚²R0RÕšƒŠ‡v¨ş\ëD§Ty\æJ²\ÜZ o\Ğ\êò\ä§O’¥O\ÍY\Z*W¨=0HÌ¡80J”]Fæ¦³†\'‰ÔŸf§\Õ;+Õƒå „\nş®Šgš{|LŸşª²R0RÕšƒŠ‡(8,”µH\Åf ¨+%#-Y¨8¨:\×/ğ\ãº\Ë\ß\ÏpV[\æt=\Ş¹ &\ä)·©I§¼D¹8\îcT”\Úmß‰\à@Û›f\È\\\ï(\0­û\îo=Rx^9£˜@\ï^ö‚\İÏ¼\'t†r*¼\ÒT9d¤`¥«5PpY)j‘Š\ÍAPVJF\nZ³[Z™+MR\ß\Åww÷VXNn\ã¢\ïŠy\â\í\çš’£G^\ìw÷T¿*w¼t[w\âT¿T\éxŒù\r\07ñp\Ë4\Ö7£j«g€½CQ\ŞJúş¥µA\ŞP)Í™‘\"\n\Í\Z\äR¯\r\é\Ó\ÃöC’h÷WC#û\Ù+5Y))j\ÍA\ÅC”JZ¤b³PT’‘‚–\è¹A\ÅYrƒ‚5\\n\Ü8§>¡¼\î5€¹\ÇpA•®º`h¦8™ù\è{¶‹ñMk¦\Îø\àƒZğ\Ğ.ƒr–™Ÿº	­=\Æ\í;EC¹»^JŸˆ\ï\åR\Ú>-\ËıG7ƒE\Ê\êlÑnº\Ï\ã_\éôV\Ş96­›Ÿs¾\Ê\Ó<\Â\â\İ\ëˆ(³…É¶\äN@.Ÿ’‘Š\ÍA\ÅC–JF\nZ®\ÅA\ÅC”JZ¤,\Ôd¤`¤+MY¨8£\Ö\à¾¥\Íf\rº‘Z\îÿ\0uÿ\0N\È\ã\Å6?\ãñ:)\ÏFCDõb0_ƒüÁ<=…®Œ4Zi\Î2\ì“\Ş}‘*üw¡^ »\Øud¸†\ï\ë\Ñ\Ó\ÅK¾\Z®oŸOş\Ô|Sƒ¸…eÿ\0›U—ñ\Ñ\è\Ú\\M÷&¸õm!¶o½<b”ŒVj\n‡,”Œµf \â¡\Ê%-R1Y¨*\n\Él©n\n\ÓVj*Ë”ŒL€- ¹+±\Ñm\İ\Ê]¸4Ø¼XŸª§L\á\írVú+\Í7p\Ä\æ8X« 9¨>¯\ápñh¹f¬´9\ï\à\Õ\é_FV­;\àÌ©S\Ê\Êÿ\0,\ï\ã[m¨\Ï)^‚«_’„\İARkœx=)ß¥«ª \0\Í@7¾pP/U-R1Y¨8¨r\ÉHÁKUØ¨8¨rƒ‚\ÉKTŒVjõFJ[‚´ÕšƒŠ²\å:C{¸ó\ĞJ“½I\ÅJm.Nc\Úrôl»&!×²\×5:ƒ?úöUCj»¡\Ø\èiº\Óp”º8)v‡>£¬´bQoEÿ\0¦\è“·¹m7¬w&Ò¨zº\0†˜Üª\n?‡kg’©N£%¥¾\ĞUi°¸R£yƒò\ĞñÁ\îú\èqs¢›@œ\ÔShcT2[K÷+„^}¬9(8,”µH\Åf ¨r\ÉHÁKUØ«ñP{v%-ÁZj\ÍA\ÅYr}\Z½\Ç\'Ò©\Şm\Êõ\'COúv ”,´9\Ş#¢Ì®\ÚT¬·høŠ³ qM,q}\'	ˆW`®Â ù\é}j‚\ßV%­\İ)”÷5À.‘7™û Hªpk?¿¢}JŸ‹Y\Öİ¢¸÷ÎN?u±H\Ü}´\Ò=¤)·\\£PpY)j–¬\Õ\êke\Ê‚\ÉKpVš³PqV\\›\Òˆ\Ùw$\é\àŠ”)¾ğñ%T\ï²\éã‡\Çy›ArTq”F\âd\Z°\ì1R\îöÒ›\É\èYl¸\á\n\ÍO\Ä}\î\Ó\Ò?0ú\r“±-¼S£	\ÕGtl·\îTŒUø¨*¥š‡(v%-ÁZj\ÍA\Å:•^\ë„*”İ‹$/$©@û;M\ätƒ´1\Z:\ÊLy¢\ï¼!Yô\İM\Öó\Ø]M\Îó·üWO6¡\è½¢{\İ\â¯q{·¹\Ûôôcÿ\0\È\Ğ\ëF\á7’sK/—#J”õ-»J\ë½ZF+5P\ìJ[‚´ÕšƒŠ}Gh9§\ì‚+¢\Õ\Ü}¼ô\á½lôªmiû-¾‘Uÿ\0ô[\"ş$\Ïm\Ò9 \Ñ\\\ï†ı\×P\İıÿ\0\Ùx\Ìùz½¦©¬Õ—(v%-ÁZj\ÍU\ÆÁúi\Ø@¸!6¯ˆHõ.“ùş\ÃEzğˆM\è’f£ş¥5ƒˆõK\Õ\ê\å#iªF+5P\ìJ[‚´\ÕW’††:¨–µ46	o©Wÿ\0\Èt7ò®Š\ßx…ş¡z¿#-Wb¯\ÅC´AÁ]‚´\Õ#š‡(v%-Á8·‚´:£=˜•^‹\Í\æ¯J£*\Zq\"\×hÛ³hoZö–Æ©÷\İõ\Ğ\ÎK¢ò?N\Ê\ë%-R\ÜVj*²Wj\Ùrƒ‚»iªF+5e\Ê‚\É]Q\ÃEjÂ­2š*{$±ü»¶y+»	*\×NŠh—Šv›\äB\è\Ç2>Zn\Ñ_‚\Ê\ÓTŒUø¨rƒ‚\É\\§±ƒŠ²\åv\n\ÓTŒVjË”J»xTw\×E/1òTkqØ¨¥Wñ¨›\Ï?P‡n®97zg-6²˜ôeıc~\áqiR\Üµf \â¡\Ê7+°R;y¨8«.PpW`¤)\Ô\é‰µò\ÑI\Şø\Z\ÓX6@³X{¼|sLƒx\Ômš­c·`\å¦\æˆ\ì]R¡†¶ò«tš¢ñpğ·pMå¡Ÿ•\ÈÓª$+i£²\Ñ>©-Y«û?\ÆÏ¦€\îõ\Ñ\î‡P\ÇFuô\Éö\'w-Hpp*\êo»mM7\Û\É\Êö–xå©Ÿ\ã?²®\ïv>:FL?oö:u|ú\è\'=4ó§÷C£ô‡l\àÇ\ÙKÂ»Zôi\Ğ$tj§‹ ƒX €T©\ï}A¦£¸6?¿‡ûÊµ-\îm\Üô47‚·J?\ãû\è4kK\Øƒ¼ \êni\Ş;ú®²Ğ½ 4ú?ü{\İ\Í@VŠ\è´ü7üÿ\0¦š¯\â\èøzü–\Ö%iª[Š¨\ßd›Mó^ESœ,…’¨°~ÿ\0uÓ«‘u:E£œ*o\àoEıı]Mü\Ì!K¤·ª­»ƒ¹kut\ÇY[À7s]oHuº›†\æò\Ñ\n>\ékt©\Ó\Şüıf~\nF\n\ÓTŒTU—(Ü²\Ğ+´mSÇ’ı%Qüƒ\èœ÷wZ$¢\à&¥W\\9ªô›y\ê\Éq\âQTß¼‹\ÑmA!Y¬MZ?i¼ø \êno¢j½­\æTR/\ï\ÙCq\ÏNz*;S¡£\ØfÓ¾Şµš‡b¬¹q\n\å:Å®\Ò ª´]‹$*_”!\Ñ\ÛŞ«%\×\×˜\à\ß\n®Á‹©¸|´9¦\ÓmSwQş/¤\Ç\çV€—øœd\ê[>Z	\àº\ß	=Ç½Shı½j{N½»…—òTÿ\0(N®Eª§\Ú;¹i©OÙ›M\ä‹w:\î\Ã-5\Ï¢c\â÷\Õk¼°T\ény¿—û\ÛÀ<Â¡ı+»Sà¢¡xı]\Ò\çr0Zö›®A¼.Ôšc\ÓS¼g’kø8kÀP4\×Í°ª6\rn!T¬#~ÿ\0\ì¸À\ÔQ¬ño+\İ*ğ¬¼HV©m3†ğ¥·r[5‹‡¿z‡°Z\È\Âï†¹_Z˜ıK\Ñ\Ôc¹Òªµ»F\æ5\íN¥A\Ëê‰’[\ÇŸN´ñg\ë\å\Î0´\î\à\î·\îuodüQ}&Ã·*\nºªñk=\ë\Ñ|\n‡ˆwLUxk®ƒz¼5Ü®[R\Şj\í6†«˜pp…b¨’8c\Ícè¸`¢\×ş#q\Ï?^k=–m{»lT|\ÕÛ·oWâºº§kq\â¡\ÂB¸üt\ì\ìşU¹ÿ\0\"¡û9:\íq\Ö4ÁQu—g½uNšu\é\ßM\Ùp\Ì+5ö\\.\'\×j?‹¿§e\ÖSüA»Ä¯`«/m\Ç=h7M7Y÷M\ázf\Ù÷…\áKLŒµ®\ï‹\ÚsB«¤Á\Íã’µH[§½›\Ç%°o\àqõ¢N\ä\É\Æ;>½ƒó¾€ö\âxÀ­›\Õ\ãE\ãgˆR/	\Ú&™°ì—§\ïŒ?¦°{p\Õu”üÂµo÷\\\ïJÁñÑ»k\ÂqõŠ¿—µ³ş›»¿¶‹.ü7üœ#’¹\ÊĞ¸ñ¶¦Ë\êM;Ù½Ÿ²a¨\æ\ï\İ\Ís\Ä.-Ş#xös\nÈ‘½¥E_J\Ï\æSI\Ó\Äo¬\ï/¯jX\ï#À¢\×w…\ÇE‡ŸHß˜Õ¼(|¾Ÿ\áH¼iª\İ\Äj\Õn\éµñÑ³ß§´3\É\n¬¼·hr\Ğ\Ù\îºã’¿\ÒP\×ªmúöÂ°\ä\í\r¨\ÜZƒÛÖµKiœT·\rüƒ\êu^(>Õ–	>zO§»¼9\ænrPš\ã\ŞÀóW…ÿ\0#?™Kôõ#Í¿^Øµ\İ\Óru7b\İ‰À\Ş\İ~±˜{Mû Eàª¿•¿}>– Ÿ¼£J˜\ê©o\âU_Ë¦\Û{FjO\ÒtT§\Çhiœ\Ä/L.ñ·\î¤ y¯o\×7¼\Ìs\Zn\"ğšñ\ç¯ÿ\0m\ß\"œÆº\ÓF>ke”\Ûó[uvi\Õ¶U§˜b\Ûiø8ó\Ğÿ\0wká¢“³¬\Ñ1Å»Š;œ1i\İÛc\ë\ê\ì›Û¢\Üw\Ë^Ağ\Ôe6\âS5ƒ­\Õ\ïn›¤ƒ¹	\İv†?ˆPúˆ\Ü3\É·\Û?+ıB£c\Ò0\Ëtõo\ï·\æ5\Ù]¾\ÎË¹jT\é${­E\Æ÷œN­AÁ\çë¡™Hù\ë=‡º÷9ö\ÏoBk¸‰\í\Ø\í\Î\Ù?e\×7¸\îöG@{;ÁZ\ï5¯V\éş	ş]\rc{\Î0i·º\Ñ\Z\Õ\\0.1¢ \àï¶³œ;Í¨\\#\ÛYğ’\Ş\Ú\Ãû\ßT\æŒwsBE\Î„i»ô#Eºxğâ¥·‹N\íb\×	iÜ¶o¤p?d\ê‡\nc\æu=#\Ú\Õ\è˜]™¸-·\Ã|-\ÓX\î5$©Ÿy\ßUgÀlÿ\0~]µQ\Æıü;n`x(7<bVpt5<wJ-p‡ˆ\Ğ\Ã\ÔWO‚–88du]Møc2O\"“\r‘HWh$ğ«\ÇV=\å5\ç\å€VZ j557;Ó‡ŒOÃ¶¦\ï-şş}¸¨\ÜF#ˆM#³\éÿ\0½e/\ÅÌ¾£R\ê•\ê*\ê\îó‚±a\æ\Õ\é)´t¦½˜JN\â#M\"Ö-h³hZ\á(D“\n\Ñ\ïd\éb\'€TÇº©;ƒ£\ãwl\\1f×¨1»ƒ¥¼\Úe\Â\ân+Ñ¹µwµEşW«\äs¼#K›\áv¥¯ûi!8¾û\Î)µ\Z\"É”ZAN;N2cM™U3‚p\ÅÉ®\ÄöÎ¦}“½¡\Şf\ĞA\Ã­{\Zy„úv\Z-¸&Î‡·\Ä\Ùşş:•\Ä/Á?½+š\ÑÁ·«,•T{\ß\Õ\ÅRwJ\'\Ş?B©³‰Ÿ‚\Z\Ïùv\Í~\ê‚<Â²{w\Ó\Ü/o$\àL˜\0 \Â\Ç0œ\'FËƒ[_Œ~W2pvz\Õ–8\Ú\Ä.\ë?‰¾\Î­†6\ÕO_\éÿ\0	ı\ÑcÀ‰»z\ëiWA\nöŠc\Ş)”\ælˆÔ¦}ñû#\î\ì\éo‹>\ÜöÄ·¼Í ƒ›Û²§‘T†û_ek…úx\Ğc\Çx„«U9\\®¥Püak˜N«<Z4Q9\Ç\Ç]ù	M>#kL`w\ŞÁ\Ã>\Ùô¼\å¢GjZp7 +	\"\ã\Íw	\æ\ã¡\çsö†‹\Õ&œC@T|ô\ÓˆN¥\Ìhğu\à\ïCİ»Pa÷{»fT\Üñdÿ\0\à®Ô¼l¬a]®\æxÅ¡÷ûiŠğÿ\0˜©e1<Mú)»ƒ£Kr\'\ë©#Z,0Zq\Üµ½a\Ä\Úø\ê»¬¿¾Ëyö¯Œ[´<´Á\ÃV[‚¹_z\àuYPb\ÃòY\ë=ƒ†ˆ\ßÁ1\ïoÕ“E“\Él44d;\nG\Å-ûêŠ»…\Î\å\ÛxIn˜8j\ËqW\è\â%§!{\Â\â³Öš”\ÚO^o!Û—x\r¤©¤}Œ9vµ3‡\rKğR5/\Å_¢B‘¥şğ´¤,ıU\Í\â!\0xj¶¯‡[ûZn\â\Ò5nW\Üu ©m\ãFJFŠO\àc\ã¦®õGÎ±¤q§w–\îÒ‘÷£\å¯}\á]©~<W²R\Ú1‹w7,ıN¦pUVTı.\ä{G	\ç\Ø\ßz»Sv‡³ƒ´A]\Õu\Êó:·b³\á\Úsg\İH\Õ-\â˜\ãŒ_Ï³¬\Ş,(=\Ëi\\u[\ï·\é¢T\Â\ÓqPÿ\0Š»²¤r#\é¢uj³µñş\Ïh»[Æ›»Í¼iƒ‡ciª\åŸÆ‰÷¾\ÇM“©ù™ôÿ\0\ßiT{\ç\Ôz\Ú_©¼TO—ciº6¯R5\Úx<jg¦÷£\ä{Jö\Ğşü½K¬£\Ş\á\ÅA6]À«”{M\ÃE\Êû³£tIWh£ÿ\0jÿ\Ä\0+\0\0\0\0\0\0!1QAaq ‘¡±0Á\Ñ\áğ@ñP`ÿ\Ú\0\0?!ÿ\0\ì” 4?\â«\Z\ĞA}•¦f\Å\ß8_š:DŸ\í\Ñ\n\êzÿ\0\à j\È*38†Ş¢ø…Sÿ\0&\ÉM©n+\É\Ö<%\äk\Ù\ç1ƒº€9Jûc\×R\Zhø\îsùÿ\0X‹Y]…‘\r¾SN\Ò2†¶¦ªr£‘¡ÿ\0Gs\Òô4|\Æ=h½u*\rw;¸÷™\è\Ş\è©qØ‰É•ZIlşS\Ş ¬‰\Î*|\Ûc\Îz\ÑVjQL4ôƒ©A¼Y{¨–\åD\ê\æ\Ò5ˆkj^O¬u\ßô¢N\åuû\\Ğ§\Ó\äq\í,ù”zLzt]ñ9dX%œ®ß¼ş\Ç\æ\ç•5Bó?ŒÁ\Î|,¶.“ó´\0\0Q,1\çNPO‘ùmA2?Z\âJpÛ¦TI%4À§7½\Ê¬½\ÜN\'W4\í#(\Ñ~‰ús7ñ9\É\ë¹\É&±$\nŸ ~\Ó\Óş\ç\Ä-U¹¯Ì·zo\ßI\Û=_™vl÷w\í¤1‚	g\İ¨\ë©\å¬\åá¸¯–VGšÅ¤:S\Ñ\ÈyM\Ñ\Ø\â»\Â\Î^\Ó\r\ä¼)\nó\ßò¦x7Z÷LBå–‹®\Â©«%2µ!$„\np Ü†óe\î\âtq:¹§hG\Ñ@g\Ì\Ó\Ú\åÿ\0\È<¢“ƒ¤z\İûOj¸ø\Ñ\Z8]ÿ\0\'ñX]^·\å¯a_¸®`órÿ\0Aov^$°Z\ÏR¦\È:\ÆV9@\Å%6\ØF‚?B®\'º6T¨\ïÏ€¼\ÚGòx\éus´‹9en¢BN®`\ã\r`«%ZŠ$\Zh§\r\Ège\î¢tq:¹xúGT\'?á§´S³\ëñ­\è%|¶™‹ù\Å;\Õ\ÎZ›c06\êó•sË«2¾cÁQ«Ø³ô¿%U\ß\'\Şhb›%q˜\r`RP\Ğ1b«¿\ædZ¯·j¨\ï/¥_.¤\âÈ“DÀÓ—Yø\â:¦Fr\â\'@˜Àƒ\ÕA\é\æ^\ê\'O«˜8\Ä\ry2-VJjÔ„’SšiÁƒ{\Ğge\î\âtqa¿\Ó\Ìc¡\ëµ>&`Ø€<_!·ó-7\Í3©\\\İğM,4°wk\Õ\à+’µy8Z²\\ªÁT>Gö\à\é5±‰uo\Ô<\ã\Î\\H\r!\Ê\"¸µ:õ%•”0#¼3›üô—jÔW’‰[Q+¡\ZiÀƒ\ÕÁ•—º‰/z`Ù@\Ë*²Qµy(’J\èFŠp \Şôò\æ^\ê+]\Òf@¯(ôS´7we\ï×§\îaš\ê\ê34¾ó\ZC\Ø9²\ÒÚÇ‚&Aø!  Ğ€ÿ\0öºòÙ·€_š¯\nğ 7¿\Â’}¢hŠ%†£¼¸¨Y\éÜƒMµµ\Õy(•$¯!0sˆªl½\ÔKòb^üÀ³\ry2Ê¬”m^P’JhF8oz¦\Ìdú6`:0Y`øÅ»ü@–\Ë9`\ÇÁö\ÕË€]\Ş\\.m#°ü\Ã0¡¤¹\è\à-µûY\ÎVoOGVt\æáª’ı\ÓfW`Ô‚\rYZ‘ªòQ+j&\Ò0v\ê\àôó+wr^ô\Ñf\Z@22\ÔQ\ÊòQ$\ĞE80oz¡eGÀ1õP\Ëû\Ú\n]µ\É3‘ñ1rø-<·\Æj\î«q\àG£«\Ø\Ú1ËŠUóS¦ï¤¢\Ò0}_\ÊHz_}W\ÏOIfh22\ÔSU\ä¢T“¥M4\âG«ƒ/wñ%\ïsš,Àƒ]FU’™W”$“¤M4\àCiôX’“ú{y\Ë!š\ŞP`}/ˆ”2°5õe\ÌP\Ö\rdjk±ü\èq¥\ÄZ\Ó\Ösş\éË«À¾\Ä?Ş1SVu8ôøùO\îø\n]9»&F(ø\Ò†³\Ì4Ğ‘kR5^J%mD•ƒ°ƒ\ÕÁ\è\æ­\ÔN–%\Ë\Ì@\Ò‘–¤9^J$’°9\ÑôiZ½~![\Æó»øğ\é:÷\Ö\í®	yq&\×CôN~÷ûnÑ¤\ßc¬Y]9\ëlQİ\Ñ%°z^\è# ø\ï\áù\Ü:z\í\çû\àÜ‘\ê‚1÷¾\Ñ/zi³h22\ÔS*ò„©$Œ\âG«ƒ\ÑÌ½\ÔII{\ÓE˜0\Ã@A‘kQL«\ÊTdañí‘¯W±\Î\"u\ìr‹\ã{\Ş\0œn77€\ë+Wƒ*\ç\Ö_\"²ùE»Cÿ\0¿\Ë0´\n!\é‚2\æL\ËF~_\ÄzV\r\á	\Ë\ÕG^¡\Ú\';O\ÍÇµJ#—\ß\Ìø]Nnzp1¹w › ³…ñ\Íş½h–Õ{\Ü\æ\r˜0A¡,­E2¬\Ì%mD¬X;=\\k\İÄ¼I{\ÓM˜‘¦„‹ZŠ6¯%x‹\ß\Èaó\\\\Áş6ˆÿ\0<˜ò\å4·7ğŠp\äÀØ•°\îf:=l½\Ë#\Üüb·}	}ŞŸ™rı©bixy@,\Îø\ÑQô9½ \0PD€)Š\ËV^Ÿ‡\Ç”]O.\\I$m\é\æpÃ®z^’ó\ÖfVüÁ‡\â%ù¨—½´Á³P\ä Èµ¨¦U\ä¢V\ÔIX;Hõ| ôs/uó%\ïMbœ„jÔ„s\Ì~ƒ\æb4öE¢Ù¶g\Ö\ïA˜µ\İ,\ÇqÛ™€xV\Ği¹w–g\Ö_¤»5XûE[¨/»5´[*£TCwBœ\Ï^sbµg#š\Êø8\Ú%v„PQ76v•F‡\á‚ šp]\Í÷\åÀš\æ__Óƒ\è\ç\Ëó—\Ğò~Fe\ç*%\æKŞš,À†\Z22\ÔS*\Ì\ÂT’V\Ò=\\e\î¢^$½\éf\Zrexu<j¥XOkYlyKVc¯Y³Ë\Ä:¶¯\n\è\'ØŒ\Ï\È\Ø\âó­p<\æÍ´°r²ğ,K\È> ¿;\Ä~NP¤\Û\r»ÿ\0a”|ƒ\ë\àÁ7;}L\Ë:úg5şr\á\Ê7“³\Ên‹©³.\ï\Ü}ø.–/D`\ß\Ğ|\ĞE2\éÊ‰~z%\ïsšlÁ˜\Z2\Ê\ÔS*Ì¨•µV\ÂW£™{¸—‰/Şš,Á‚\r\r\Ãr\å5Ck›?\àúK-ñÀ©Ñ¿Ş’‡¢ y\ÛO8GËŠºp\Ï!W\0s—B\Ï\Ş\Î 	\ä\"6¢\ÜÁ¯p”\0Ú£›ƒ\ê%…\ï\Üï–ûV\ß\Õ[I· =˜9´k\Â\ï\Òó¹“vA&fCı\â+ñ\í0ôS/9q/«	r\Ñf0Ğ–V¤eY•¶¢Vl¤z¸=\Ë\İD”—,1\"a¨\áu5YH™‹¹%\Í4ƒË«¡3Øµ[V\ëÁ¶´ó„h½?\ä[¹Cš7ó5\ÌC/S®\Şd§Pw\ëÿ\0a—\ÏÙ‹Kt&¬`˜¦·ø\â\ç«:86•G¡3o\èO–Iu˜Ô§\"\Ô`_/[jªtk\ß\İ\é\ïi3\Õú9\ÅU-ıñ—m\í“\êş§0–\Æ\á\è¦^r¢_UArÀ³h2Õ¨¦U™Q*IX°v\ê\àôs/uR^÷9]bo™‹B¶w…½G.e¤õ{)G všQH­`T4Ü¾n¾£\ï€n“\È\å\í.u,M’œÅ¤V\ŞP1õ•8\r#\Ö’ _ \Z¼?â‰¯¼°Î‚ :@‚f•±û\Í~÷3ñª\Z>ò¯üğn_À?V1i\á¹~%*#Ë»¶,Q\×ù\"‡:#o\Ã\éBÎ«\ÌYP¤#Ls•¶€=/\ï3sW÷?1=ú`\ì`\Öa\è¦^r\â[UD¹h¼Ñ  \Ë+QL«2\âV\ÔJóf\Ò=\\e\î¢N~v£œÀ\Æiˆ\Âë¬µK\Ê´\æü¡‚\æ\Ã\îüLN\Ş\Õwuœ\Ã‘\è@GdV\ÜşqQu} ‹X\Ë!n\íù\åC³.½£»@<Wši,[\'–{¦”]N\Í%g+ø½´c{,ª¼*\â\æ¡òF­È†L„¥XºpùA\Æ\Úõš\Å\Ã\ÎC¬Ó„%›v\ŞU\ÈK%)o•¾z`\ì`×Ÿ¢™t\åÄ¾¬%û\ÓE˜‘¦„Œµ\ÕfTJÚ‰X°vz¸=\Ë\İ\Å\ĞÄ¼‰\Ôs&˜0ND\èÁü°·¨\â/QÀ£§\É>óS´\Í\ècƒl¼\åj@PLu’ûğ»Mu\Ó\í[©ù$\æ¹\ìkø‡S\ÜöHÄ¹Î”\Ö\Í\Ì@J†O\ãH\0PE¶o\n\ÆwMùQ\İwt\"¯{ú:\ÂM\ê>XYš;?°tijÜƒ“\ËX,Z%M#È¯N\Z¿Ö±“¿»0m»\ß,±½¡ƒ¿XÂ›†Ü·^’¾\İEu[÷‰\ÑD÷éƒ±ƒ\í\ĞkjeÓ—Zª%\ËğBB½HÊ³*%mD¬UÒ„¨ùÆ­B6‡+wò£ifiÂ­S/Q\Ä\Ï\é\éƒÇ´\Ö\í=ı\"¿Q\\L\ê=¡ºj`ƒeuw¨uĞ»^ğš‚\Õrı P«Kƒb\êÃ£\Úğ\Õ{= Z-[\Ç)\'¤\0PQ)»?¸›K\Õu€\nnhM)QT\çóEB\ÎØ•\Ù{X5?2­ÌŒ7F®÷	\Ùc\İ\ÂÎ±Fº¢#\\¿•‰[\äı‰k-\0•w8=†Ÿ˜6×Œ¼e\Ä\è¢{ôÁ\ØÁ\ë\àôS.œ¸–\ÕQ.UK\ÂQL`§$--	G€o&V\î%\äO2`Yƒ\Z\"*Ù‚E^\İ{\Íx5u\ëÛœ\ì&f\ähmÂ‰\ÕUıM\Üy\Úş86Ö‰‚ó÷eet)Ùšù–\Ë,wÑ¾sJV\æa+±{\ÉñÆ‰E“m\Ëo9Mù¦~ºŒ8:¡\î\"½D\Ã\ç˜3ºw¡\éÀto{?~\0 \0•\å	s›,-øù•½ÀC¼{s}.h{\"¿j\nµTË³.\'E®\ç*»JTs¼n`šk²Ä¡ô‡¨\äÁ¼™\Üq&£ifi\È\Ö\Ï)PZ4s\ä}~fnÅ‰\ì´!®X†\îl—ºòv9z88\rû¾Ò©N†‹³\Ú*\Çi-©ı¼\å—É³ °”Ş›ù‚\n¥Àv¶~\ĞyKk0Qu{lq5\Â-DW$\ÚéŒSºº{\ËO)\ZÁ\ïTş)T\Ğ+X”>qRCˆBQõğ3ƒU¼W“+wò\'S´À³4\Ä9­³3/r\îr}{±“©l~cŸ\Í\Ë3\Í\Ñ+„š\ã[Š2\è!\Ê71Ril}\Ø\Ä<A\æ0§°_¼e…X{Ï²kò\0÷˜õ™\Ô/·†#±¨¼ƒ6Ö‘|\Ì2‡\ítƒ¦€r€f¥‘)§Á‹ª\Ş\r\ä\Ê\İÄ¶´§™0,Á‚\r\Æû¿\nT\æôš„ûÆ†|&~\Í‡iı7Šz\×_„F\Õ-ª«Ÿ¬\ï‡Xq–h¾Èµuoˆö=ÿ\0\Í{TJ\Ù\çšb`gQÉƒy2·q7P:¦˜2ºò¦„÷—>=\"+ v?\Ä\í:8U8¾lP•”Z\ï-%@òÿ\090f‰\È\Z\r1³˜f^£‰[1)§\àÁê·ƒy2·q&§™	[o=´\Ó\ZŠ­®]f­¤öq\í_\â\Í÷ünw»:Á\è‡Õ¦ğMÀ4Ñ–+„\æ$Y\Ùp’\ÑxF`b¹\ZUd\ê¸Û¼œJ\Ù\Ú%4\ãcª\äÁ™\Çú\Ğ[\Óg”öh\è\ËEuñ,\Øğı¼bÚ¸4µU6\Ä2»°»›\Ü\æ¾\ßEõO›Àf\ë\"ó¯\ĞÙ¼¡\Ì\æ\n˜;\ËÚƒ¢‰\î„Á\ØÁc%\n®-™\rL—Y”mÁ}–\nõ\\Ë¼œ³š|\Ó80z\à\ŞL\î8\×9\âetzp\Ñj»\"S\ï1°÷Ÿm\ZYNHòô\ÛD\ë\Íß  RƒV}	óWƒ‹\Æ\ï`zY¦õ\ë…s•L±F£Í–¨>\ä@hNšÀÁ½\îP¥W\Ôº®“¸K›©^1®‹\ì°Wª\ãwdà­˜€\Ó\Z“cYÉ„\Çqº£¤S\İÁwg¼üK@¿P\"_¿\ÄE}¼\Ó\ÌSş\r\Öòõ} \04§\rGT}\áH\Ğ\Ë\Èn«¸ò\'U´Á\ÆˆŠ¶¢8[…Ü¹…Mg9F\ßW@Â‹òÂ´\\óz1¹R\Í\ÉM¸\ìPú‡\ï‡lú¬}ø*f†\ç\Ë\ßğƒ€V\Ï· \ìo.†z‰\Ù?_F­\Z\È\ïC©\È\É\Ş\Z=(?\Æ%m\à\æpi0§p—r”‰k¤Á¢\ã¢)T¹^:Œ\Å>köp\î¡\è8\0¢‘\ç08u\àN÷¨Y*uÛ•\è\Í)?dıÀ{qüø´œù\Ô\ìıŸ3¸S\ß¼À®=Ï¿ş\Z€Ö·¶5\Ã\Ô	e\\\Åwz”¾Kó*ş€÷ği2\Ãh\âB(œ\Í2¢\Ãö½e+	s\Ï/\ãI¿Sÿ\0‚°–n¨O3>Ç¼VŠtQ\áh–ÖñŸ\Ï)Jnobd_s\Şh\ä³\è\nNaş\Ö!\Ğ\ãi\Ó\Ö\0\0€9M‚4†?1\Å\åM\Ø~oı»L†³–CC’\Üe\Ä\èy\Ä\Û	A\ä¯\Ú\æ+ú\ÖPM¯Š&\è¸zÙ¡•.òÿ\0™±\æv8b\Ó6iŸ\è\×Xw®ûx´ õ=K‘(š\Ó\ï¯1§8E NŠôşğ%­÷_{ÿ\0H©Ë•k¬\çô%º\Üğ\Ä‚\á\ìÅ”\\6\'²\ÍRŸ_÷^ó[ø\Ö\'di\é\r°FR\Ê;¬Nø°\Ùt–÷Ü´a\åiBo¦®Ë“¬`ûE³…G¾c\Ú0ö\ìŸõ\Ù\\\Ö\ëÀ£Vkzõ\áµ4¼šûp¼Œ§•£\×\ãıXºg8´•\ê¶Xtm+‰©ª¬\Ê<¹ yŒ»ıws“\éPQU/kv¿÷¤BW\nn_\ÌL°v0:\ËYºvx¾µ\åÿ\0ŸYö\ÄZ\Îr=\ï¬½\Ì\Í\ÂŞ«q@WBVzò\ã“Ò¿\Ôõ¦RQ·\ÒÀù^²\Ñò_yöbwqF»l\â\Ôõ‘\İş4ò–n‹\æ3ô59`Fœ:–\áš\È>j~|\ç\èSeüy\Ã?ğR¯:H?`x\'*J7w†ûşø\nµ¬Hghi\àS¹\ä.q\\\r/\ÏoŸ\Z‰Z\Â~s\Å\áÿ\0¡¨\Ø\r>¨{J=§\äû=?ğ ­M\Â\æ\Ç\àù\í-[•¼½\âPÕ“\Ê,Z\\Y\Îşa[ª€\Äû®f.ü.y¾°Ox~ğ\ï^1š_ceu-k©Ÿxx±o\Úğw\Âı«4•]6&$–\ìl\Ü÷-R\Ãi\á7\çr~>:ôO\Ú\"€‰„yA@ˆ™”)`F?x<\èW®°»/\ÃiY+\ï\r*\î\í\è\Â\Ã\'¦½ô†KVp¹b¼t7ğ\ëœT\ç0\è\ævƒ	™¾f\áø‰R4‡&ÎŸ\îØ³¼±÷?EØ¶˜\í W`y@ª<£³®?.²¸:„M}m”/Ÿ\nU»{/\í\Û\èş†\rkw“\0\n0!²U§R\0\êwL(7W\ÔşÒ¢#¶³·\ÃşÛ‹œ\Ó\éS¯v?3U_$A¿^.W¶o\â4\Ûd\È*?Ï“\Ö\Zı\Ôó‚Hš9x¹t~ƒğ„À±\É\ÍyÁt=M³¤ \ä¯KıC\ĞÁb‘¾ÿ\0N\ã\Èşyğ×Ÿ\ÓsiB,y\Z\é³¦;ğ@\Û\ÜWr^‘9‘`yğ«±¹\è{š1ñ¦§\Ë4ğ\á{\Ú\'\Üø–ŒVù\Ğ\Z\Ö\Øv/\æZ{È¾h\ãM®\åş…U\ê£Ôši§\ÓA,\Ò5.bö\à\ÎY?gIº¼2(·Ÿ”{kT:;?Y}¯\á;eƒ“++a£5©@¨\\L\rÉ“F\Û}-=\":†™¤;\ÊN\í û2„Q©\áşoRg\Õ\Åu\ç\Ğ<\Ò\Ñ\ÖÑœ¢<ıo\n€\é;\0!\ï¨™Ÿ‹¤M–\Ç\ã\ÃPj§ù\ÔxX²jvs’IÏ˜ôÏ—\æµ\×Jä´\Ã\Ó\Ñ~Ï´c›òÿ\0\'÷¶ıjE\Û\í?n\Z˜\×[œÈ–\Ù\Øø•¬üƒ¬(Ö¸d\Ûx1h·H$*K\ç‡{3+ıt³\Öıfõ¦‘h\ÄĞƒ\ËbV‰\Ù\å7=§\ÏF%±Zš=\Çø¿•·\ëö6#CmW¹\É\ábu;\ÜÏ¿¯€*\Ò\ç\Ñ\×\æ; ,Iü\íøğ\àş,«D_¯\Ò\İ<+&œİ¢£Z§Z[\Û ¹\ß\Ì}øX\Z¼aûq16zk~\Ó\á\ËûHLI¢sÿ\0_Ï×£ıykÁ\Z§³¬ÀE\è\Ù\Û\Ç\ê^·\Ùù€ú^n3ù\İ0byIö„¨;#œ\Î.\ÄT¹\ï\Ğ\Ş6nn\ï\Ú\0i/¦¸ı\ß\Ã$QŸ¶›—)ıi\\_?›ı\î\ìúıô—\Ç\í›p\Ì\Ù\é\ê\äı¼d\æ!Hó—‚Ì–ø?\ävˆ,#…	\Óö:õ\âz(Wœ¸Z¾B¨5”\ç/\Ù\á-°s\Å(\íõµ;=\Î^õ#õ\ZŠË‰e3<c\×\Üñšv\Ï#\ë\àÊ•¹ö5}b¡\Î?Ç‡úón\íôW‰\Öy:5=3\ëõ·o\×	\Ğ+\Õõ\ÖÀyÚ¯“\ÎZL}\Î\å-Ÿ‰ ÷‰\0‚\Ç\Ì\Û\êÛ·\r/×\Î\ZµA\âDm¥\ç\ÂŞ½õ ıµñdf\ì,~±ş°5ñ_Ym ,v\ïù‹Œ2\Ö\ÃF5_u\å97g€ƒmŠ\Ğ\ì\Æ6õS\Ä(E¥s%®\Ë\íuM·ø\Û\çÀW’.ap\ßósö—¥‡\"7V\0Ã¬`\î\rüøÁm¨c¤\Ì÷\ïšÎ«\ä4ø}a\ÙO™_Xİ«\ÜFA\Ğı\î\Óş6²ù¸.\×oeüMI~\àt\Â(³Zû“­”»\Â@\Ù\×n³;EÁ·_\Èã«ò™@x\r\ĞÙ¶ô%2}U¾„şñx0G y*s\'\êõ+6‡\Õa÷=>°\Û\ï©õ\ÌMto\æù\Ê[[‹\Ş\Ö{.B\Óf\Ì;j#I¨\íÅº\ë;’“·\æ‚=8ù	®÷\á÷™\Şf°j5Vvx:\ëú[û¼‰2$Æœ\ë†&[¹1$7K¬F¡	¹ú®\'\ìNÏ¤\éx=§q\×o\É_Zı`–¾\×K2}qÿ\0|€òSû\ÕWW\í?Œ‹\ÉöŸ§\Æ+b½C\æ\Ù!\Öûœz\Ëz9üø(9½Cö\ãb~òşñù}VUMT\İ‹ÏµÊ¶´gF\á v\0\Åq»\Ê6zN¢£ç¼ö±õñy¹A\ÑE\êú¨%9\"3³\ÒòöH6Y§\Özs¯\\¢£ec\Ó\Å\í0‘e°\Zªü:\'À\ë.yÁŒoPû\Æ/¼¬\Ò\"\ï-Î‡§\×ö.$´µW·€yc\×ñL=o\Ûö¨(z(\æi;²~<¾µAÎ¿¾%\Å\Ù4úıjy\Ï\İ\Ç!\îüF\Ñ4¨‹·‹-º\î\Ï\é¾Ò¯tÂ“c\\Ü¶k5\'ök¨Šg_/	u•mwcŠ«{º9H/$\ç\Z31\İ\èJÓ˜7ğ.\Â\Ï?\Út¸w/ÛeöFOo¬c–Ş—\ê\æ°Æ£\0^|ş«:#øÎµ+\Ş\ï\ÌqMY\é\Ì\Ös™ù<-´w\'F_Y£K@Z³ñ\é÷›$	§\Ìğ÷\Æô¿\×\áúW\ÍxÅ©ª\æ~\Ó!\ÖÇx\İß™¸4e\"¡\Ø\r~ªYN“&\æ‡vOf=†œ\á’aúºªƒ½»0\Ô8´90ù\á\\}ûGó\çÀ¶E\×\ÚOnU4òvgHUŞ¼oOüğşzø\Éô1qu+\îc\í\à²y=>g\Û\Ó\ëWÿ\0\"2p-\Z±\0U\åÛS\r\ê@-g\Ä\Ë[wŒq;ÛˆóO/\Ï\Õúƒ×…ı~ó?Gg±=^£°y9û0l³$\Ï@h€J\Öş1#ú\î>RÂ˜\é¯1\ìşuú¸ƒ\æ²ıAMµ%Ìœu3¤[\ç\æ6‰V©œ¸z\Îw\Ğ|(o\ï»._%…÷!ws6ˆ \Ë\Ğef›‚ú¿eT§lÀ>‚\ÙBü>°\ïú\ë\ëòiõ*ğ\éĞ°[P‘\Í_ÈŠAI\Ãöe¥³ \éy\ÃEr=Á©‰w.²9—¬\'\Ğ\ëŠ. |œû\\¬9ø5\Ã9\Æõ^šy}Z¯*ex\ÖSalğ‡t§rxz\È7‚´~8\Ö9ø~\ä´\Ã)\Æ\İÿ\0\Ê	\èŞ¢.¾\Ëó\á­?;ş>SS\êUú€Ÿ—\Ãls\à,‚\Æ\\vN|-F­H\' ğ¦\ßoÚ¸q™7—¥gù7!\ê\ß\Ã\Ñğ4ë‘‹\Íju\ç}¼¾ :_y~2\Î\Ş\r[)]R.|½H€%Œ}|õ9{Á;@<m\Îbœlÿ\0§üJûL\ÉÉ§‡\n\Òş#Ş½ş¥œÏ³¾\×ô4p\Ì(6~^ò`Ñ£‡C5vr|ğ² \âjB;\åÑ˜:Â˜«\ê\neùŒ\r\Üùø­D\Õ k\ïô\è@zJ3’ş†\Õ06oÀøs\\¨¾¿¢úpr< ƒô:?­sŒlÿ\03b³\ÂxMn¾SƒÓœ\0Ma\×l¾~›Yh\ëñ\ã\Å\\B9…aò¿¿¬\Ì\Õ:&\Ï\r\Ñû}\Ï2e\Ìm4ü}g©=x–9WX|\Å|¾¡\èŸ-ıüW\á\0‡‰8]ÿ\0²ö\ã\ã¿\Óö°÷!\Ò.›ó–†\Ïş‡5÷ğjš5â»‡\Õõ%³¢:˜ù¿Ğ¾*ğ\à5z~Nùgª1¤Z*~‹ªzƒ—s˜\Íñ&¬û~\Ş\ç\İ4ğûşüÿ\Ú\0\0\0\0\0\0€\0@\0À \0L\0\0	\0\0\0\0\0\0\0	£³8\0@\0a@³,\0X%$…c\Æh@\0c\0\ç)G\Ş@€\r\ã(haœ%73ŒB’\Ò]ôy\0ÍˆŸqªañF/(=¶\ßm%ŸYG	·\Z™\Ñ<J¶(])GŸIö\ÒqôMx³¯ÿ\0±\á)\Îxl”uö\İ}7^p@ød\\·„O7·Vcj-W\Ûm\×\Òe\0±ó\ëjT/\ÊT\r†\ä\ÛT}ö}u\0\r\ë@@ùy\'l\èó,¨Íˆ_A×”@Ç\ë\ÛAˆµUO\Ï Šh¤Ú€4´|ğ0sñıTl\ïÂ—w\"?‚\È-¬[d@\ËkTˆ\"%—ùaXuj:¹+\Ê(ˆ`BÀ4ğ\ÎZöã›±\å¿Ì‹cB` \0\r(aJr\ãK‹q\Çr¬€ğ\0RN\èÀ\Ö-\ïTK¼}!L‚\×ş¢\ä\r\ëFş÷µÿ\0 \Ùo!\r“fùÁ\0\0\ĞTÁ\Ñø\ßñ\êLÁHA \0°M_ów\âôº€\0@\0\0‚%VMı\Æ\ÊŞ¾_|¾@EaF \È\'QÁ\Ó\ê¶\Ü\ä‹B\0\0C\0\0€(F4©³\ÍL·/¬B\İ\0AB,\0\Ç\0²\00±Ÿ¬Oˆ\Æ\Â\Ë?\ÄH\0À\0 \0\0\0\0F•ú\ïœú\é÷F¢ó ‘B$€<\'^¨[…\ç\Ó-}atŒ4 À‹w\ÙÎŒ\nvL®#`\É\0\0%\0$o†„¢¿\àM$¨\Ñfb„\0‚\0Mh‚…ö˜”jk€dC\ÕX¡ÀC1@Za\ç«\ÂK†\È\ÊZy\"¯µ\0\0\0\0\'Hª4„\Ò)\éñ$®ˆKWl´ \"6	‚’\Â?‹ğ\í•\í‘;nû”\0\0“\Â`<\èxvUı÷BúbÜ€\0\"\0\ni\Í@†\Èr0\Ï\îÚ¡\"Š:  \rWÂŠ†]°Ë‡¦·ÿ\0\á\0c\é„\0\00S¤ª\Ó\è$‚Kÿ\0²\ÉS¢HÁx\ã\Ã)!X=\\G†pİ·[+›J\È`@0’\Í\0\á\çi\Ãv?Ø¬¬{:›\ÕÏ¯\0\ß<óÀ¢şÿ\0†\'‚u\ï£?\Âÿ\Ä\0!\0\0\0\0\0\0\0\0!1 0AQa@q‘ÿ\Ú\0?ÿ\0b‡¦—¹\Ê`œ÷\Ê#ù–}?\n\'\Ö² S,ä¹¸Ñ¦.¡lWÒ¦’É°©G	PX¨’ŸHz1¹\áB2«\ìä±·P„µ\î.T¦ª^°ƒ¦r¹S\ïuP+\àÀ}¡/\ärÎ”\Ë\Ös\ßpi†Üƒ\ä	\ÙR\Â\åøœ‰j÷?2€üc’Í³T4\0Aº‡\äI\Ì\×sï¸,r­¢7a¶/“ôƒö$\ØK/\íA4\Ú\0*\ZO³9\r·\r!´tQ+a²’¡¯ZE±.y8\ÃmGòY¨¾El5¸¶\ÜZ\ë«‚0y¶Gn ¯ıû\n¸À—±Kû.¥WØª\Æ_\ÈQõD»\0ò=ÁmJ\\+ˆ\Å\Ô0`¼+\âÁH.j \â\Ü\ÒÊ¶#¢+Ø¿²\ëSV0YŒ¹£$$$;mù. .;,)ŠB;eF)eJF¾\Ã\rDV\Â(@c\è‚\ÉK1\ØPY©¨ô®¥\'ó\ã\ÑQZ|ˆŠŸ¢/\r’¦–e,”1Ø•GŒ\ŞE6E·	ƒ»–,$²\Òìµ–a$€”x]ƒ€û\0aXŸX\Ü\Ã7\áb4›¢\Z\Ó@\ë $PJQ‡Šh@Ÿ¸ª¾\Ô\Æ\Ë ‘7}…HG\àM„1pf\0ÔµD\n—¾Õ¡ú”¦cH·*sP:p\Å-l[oüv¤\Ü\ì@ñ”¥Ä«%E\ÍK‹{Á[ü³‘ÿ\0DXqøAš#¬\èS)\ç¼\ÑPh}f\Ç\È\ìÓ©£ª\çØš}‡r1Íªq——`¤\Ûx_2ni‘TzM\ß÷%Fœ‡p$ß¥%\åJøo½|{Ÿ‚n¿s\Ùz´˜©şÍ„\\°A\ì£\Ì\Ó\èF-lÀÃ±Ä±¾kYS2,ô¼»‚¢ôC+Fvªû*H6#¸–¯¹@-`§\Í\Ù^DLıOŸF\áõG0\Ø\"ıEW¨š}ELşÃ¿5º‰^Cƒgp›‡áŠ°r˜A)”h9­©—D6yªn%,•\çH²‘>KYQZ(®\r—ƒNnø\Ì\n|\î*_³}vE™­j ”À7R\îuP!X£+Uøoü\İSò0Q²‰Q\î¥9¥ó$O\0³\"Ÿ%C \Ä1ú@A¦v)<Fs/u;À³\ÉRx‹È¢\nKœË¢\ŞM\ê4ñÕ–Mù+¶oA‰*\ÔK‰Q\È:gÔœ\îtqöÁß’ñ1ğv@8a\Óq\ãÿ\Ä\0#\0\0\0\0\0\0\0\0\0! 1A0Q@aqP±ÿ\Ú\0?ÿ\0…(\Ú=\ä\rY\ß\Şş*\Î\ÒKi\n‡Ü‰M’\Ú&µªo\Â\å\Ë~>°š¨õ&\Ñ\r§Q?½•ğKy¨b\ØeK\ã­8®-ı¡:£sıx‹Q:Ä\ëh‹°³Hº\\_¹£7´\Û zÅ¸õYé¬Ÿœ>\é –`X\'\rh•pLRæ¡²9\0böˆ¸Ÿô‰\Úõ\Ú ll\î\r“´4\Ïğ_QeF\Ü{™mI{¢¨L_o\È\ÚD5\Zici±\ì;•\Óôÿ\0Ï²ù\ÄE$^¯\Üt\Ô\ÒFG&™£H)D:\í¿]7iYp\İ\êˆA¨\Ø\ÜU+U+ò\í#JN ÷4n¥\Â*\ï\è\Â\ëe\r`{+qq»\"[¤%éš”7´R¬H\ßÆ¸i¥#Laˆ¦¦\æ)º\'«\ÂP„AbS´ğJ‹xWÎ†“¹®z‹bE;!h\È\ÍJı\æ\îA”+\ïq]Ik\ß7\íùšù\\¾/L½\Åx\î+\à\å\ÍıøÔ©\\»‰PD­ep+G\0¡„<+\ê)\ËıÊ²¾\0\"ºY¼©wü\Z-\Òh¥šqY¢Z\ê0@–ø][A\Û4\ÑU0GuYRØ®¿Ã«\ÂX\'pS¨§\î=FdÀ\éC/$bû7+t\Â6bºsbFY¾\î˜F/\àÏ¤*÷*\à–Pf\Ê\È	_rµaƒ­?Ò‹\'S­‘*Q\Í0Î¾fµ2–’¯\0¬™leLÔ²tŸ.\î\çq5-7\r\ê{¢#öƒ\Ó\á\İ\ç\Ù(YÀL\Z²§Q^ğ»%\àSd«¾ù\ì<\Æ+¥û:\ËÀŠ(÷\ì‚\í\ÇÀ\Ò9’\ì \ÇZ\Í\Ë\É(€w.b)…„v9\Ñlú\ìO²”|Ğ\áAÂ©.Võu¨´œ\î¼0r\\G¨5ÀQE\r7\0\Ù\ZZ\Ê\È\îQÍ¨›H\ä\â%T&\àS\ZµšÃ³\0ƒ+s\Úş\Ï\Ø\î\ÍÁ©g\Ù@\Å*\ã·©\Æ6¹ö1F°ƒ\ZJ\'{\'If \âŞ¯\à´üPZÈˆ\æ$\Ó\Ì#ñ\ëplø!´q°´£™W¸\Ö]n\rñ\é9T<#7‚\nAƒ\Ø4\Ü\áF\Èyy/0®œ>$2#\ŞŠ‹,\'¼ÿ\Ä\0(\0\0\0\0\0\0!1AQaq‘¡ğ±Á\á\Ñ ñ0ÿ\Ú\0\0?\ß2\ç§]	£Ò¿\Ø\Ï\Ìô\ÇO¬\ì~fÒ§\İc<\Ï›x\ï“3\Ï\çş9\æ\é\Óx\Ì\Â:\\\ŞbT¬Nzºş:¤zxJ•Ò§3õ=f\ĞùšG£4­%N\×\Ò\ç´\çüš6şCY´\ìTxœ\Î\İ7gŸ\Äô\èúOn»ô©¾føŸ®™k§§O™•3\ë)\í<F\0ªQ¬Ò¦µ\ÇOöo\Ôù\é\Úo:·4\é¼Z. {\áJ×€ô½G<µ}&\Ü8\İ7\é…®ôr‚_÷~ğ\ë´ô³™Û¥t\Ìü\Íúz\Î&ı	sh\Ï\Ä\Äß¡\×>½,‹®\n$½\ê\0	|Y3³¬.IHôô\é¬<O\ÜüF{Cy\Ş\æóŠ¾¯\ÄÖ¿§gšw˜Ÿ‹¸o®<6x—2Æ£C|€\î))l´¦Oôù]H}ñÀ<«œ|/È˜ô°-\Ñ<1\Ù\Ğ\é\ë+ˆ÷™Ÿµ4š\ÏY™\æ0 v•=zzôh/ù\n`DnfHš\Ú5i@{\ÂPÀıú\Ïk[²\Ç\ßhÍ—Á™\éú~ú{\Îg¿NÙ¦k=ú\ï\r:kpªS\è\Ï\Ä6]\îg¸\"Q™‘Xœ™ˆTšº¸¸³Š­\Ñ(½\è£‡n&,\à…\Ün\í\ÓrºŸ¨\×&\0¾¶V\"v…Oi{³q\Ñ|—4!\Ù!Ò¡ë¬®fghúô\ßyó\ŞyúÔ¯0®X4um#µqSa±‰©­\ä—õ{şeB[\ÊqüüJ–\Ñ\Êwû\ï÷\îĞ¨`{ı÷Œ’\ËÇ¬P‚\İ:|O?ñ¼\æ<o÷ı\é\Ó†\Â\è®ş.M\Åõ\Ù\Ü@\ÈıÔ¡\ì|¶PO5W\ÒY 1¤?Ü†n\Şs|Ÿ’X·\ËX,\Öú\â‰V¸\ê{Á\\[ğn>|\é	 €G³\r\îª/\Â\îo\İZ\ìYQc\0L¬+\àhüÇ’\Z\ÔıY¦‘™b7s=\'·OM&»M§¶½v\èƒTÎ\åûc\Ë+€V‰*\Õ\×o÷Ìª›\ÈŸ¨\ÄÄ«´ÂŒ“µ£\ÄrKú>óoS\îß‰C(rŸ~±«?~!\n¨`~ıc\Ùi]w^šO\Ätƒ@æ¦÷Ğ›\ÕYË¨\ä+š\É\×6=\ÖS€óŞ³t™E}(|E,Ò·\Ê\Ë-ú>\á[c_)\éƒfúm\0\0\0*ŒJ)\İ-—Á«¡\\	E\Ûü6\Úÿ\0\é\âµõ§\ë÷1‰9D\0\\L\à)°°t 4)ß“gã‹‰v2\æ\Ğwk}¥:¥ö?~#AZ5µğ\ï5\Ä\\V²h/u»¶Gsyk Á)¶?Jñ7=#\Ä|Má®¤Z3U¦\ÃZ\ÌW¡w4Q\ÕU\ë\0\éó01³\ÄJô—\ßh–u›\Ö78ôı@4NRõ—„|¨FŠMˆ6´xûñ67ô{şc1m\êq÷\âP§¾óh}>ş 5\Ö\ã¼›ñ	ù„\æ7\Ä\Õi/¨BX\Û-;°·q0\r”ŒyOyX›\ä¿D\n-qQñŸ˜¸‹\ÑTzÚ¡€+f\Å\Ô_c˜7°|\î_oYDÁp\Ş\Ö\äø¨r\Úºÿ\0¦dM\\\ä}\\úi\\\Ä;ªX#Ç®{œ~`²\Ñû‹\Ê:…“tt\Öe4ü	z¯;E\Ë<\ï˜ \Óz›CxÁ¦œ<ù…5=‹,8M\éM0ˆ-7\äi\ã¦+®>À/ªBö^b\Ê&:»ú¾ó™\ÖS´\0*§¾ñÉ  T\Ğ\Ñw•YcAş\ÅNğ¾ûA`ò¾ûÊ©¼Ÿ\ÏÔ°;¢	ŒôWÕ“÷\ëj­?‘\Ğı_|\Æv‹\Ô\ãùø”-­\ç¾ğ\Ğk\Ó~št\Ä\ßM\ã\â ˆ–iQúİ¶«Ë«\åQ‹©À\Í\ïH)\Ï\\³¢¹\ÓNItM\Ş\n¶ı!švAXx(¹z2l\ß_˜\Ø\â”Ú¼r²\êT°\ê®\Æ\Ç¯c1\Z\ç)\"\ë¶Á\Ûó\Ò\ç\æX g¯^8ñ.Sc\n+\ç±ñ~#S[,\î\åó3hl€eş|\ÅTT‘2\Ziw7jX)qR½{GU©•§u=#6…aÿ\0;DRtht³“Ù¤ø\'\í•\ÃN\ĞM¢kù]D\'û5¾½¢\0{…\rFSˆO\"Á¥MĞ…I ~ıb-W£\Çóñ>•÷÷[oS·\ßhC9©;\Ç\"ƒ®\×°\â\ZÕ•^–\Ï±+\Ò_}¢6ëŸ¾òªo\',\ë\"\\xxE$\Ğ=\ã\'*\Ñ\ã\ï\ÄÔ—ô}\æ3¶Ş¤0q:™Ÿ¹§›OI¾\Ó“irzıH\Ğ~W`XÇ“m]‡Á¥n\å¶\Ø\\YÎ ŸŸ®c:¢D\è)]\Å\Ïl¿˜9,›\Å\r\r\İ\åI\\\Øew^f9ñ.\Õ\âZ\Üò{ôr)­[\ïÁ¬ €\Øgı»¶\Ó»\ÅV«¨\ÆŠ½\ßı—\ÙjúŸÚ•(W“‡Ÿ×«qk\ËN\Ş?Î½\n\íÁòs\Ü\Ñ1 F\ZN\Çnq\İÈo(´	‘\âK5t[œo}F,ZV&¸)³\Ä’\İ\"\'\ë/¾ó;ˆt\å/x&€µûôšOˆ÷û\ï\'kG\ç\âw?W\Şc1-e%]\r\Çß¬LZ@:gFUeˆ(-–>ûA\İ\Ë\ï\îUM\Ï\ä\Æe/X&3\Ñ\\;\ÙM¿X‰•\èñ‘ˆ\Ùûÿ\0;t¹˜\Ç\n\ä(—Ä¿Ñ¬¬ÚµŠ6•h¦İ·\Æ\ê/­Wÿ\0	V)“a\ì:÷ù”€\í\Örü¯–k\Ô`66#ú\ÚR¼ß—ÿ\0a–\ÇB--\0e8¾\ÒÈ„1k8ùfğcW™‹­¯¶aN%#üô\×|Ê­!ñ=%\"\ê:¾É\Ér\ê*ºp­)\á\ÔNc5\Ä	°<\Ü:`Ğ«óZ>4G™^,n‰OA}öˆŸ¬¾û\ÍeSH\"^ò\èPt\ï*!C\ß\ï¼f­óñ?ô¯¬mI\êp}ö˜¸FS\ï\Ö&ò izª\Ë\Zö\n=%÷\ÚµºÊ«Kr†j\\4`¼@4PÀ÷û\ïUkGƒ\ï´\n\Ö\Æ\Ñ\é\ë\×=ı¦\æ\ì@}Ø£©ijC6¡«2\æ]\Õ3Áú0B\ä»ûD»+J¬ß—\à\Û9„:\Î\Û\Õóú%A\r°-\Ü{¶\ã_%¸\0\r‰jœ\â‰cº\Äc]•\ßc·™÷I¾\'\æjlÚ‡\ì+Á{\ÄÁ\Ø\ÒD\Ëşô1£ng\âinA\í¦¥>Fe›O\Z÷\\£	\Çz`Au­\Îzû”\ÎÀS\Ì\Ö\Ò\Ù\ã\×÷fŸQõ—\ßy\ï\"q\é\ßFR\r¨iÿ\0}\â$m\èñü›¿£óùŒ¬µ”\àû\í˜§x†3\Ñ\\\n\Z8eX± ñ²ûú>e÷÷*¦\Æ\çòX\Ñ{Á1Ÿ\"üG¼M.³î²¦ŒzsJ\nr>Ä¦\ÅM¢kjšõ‚\n°\×P\ËkT\ï˜E\ãMª\è+/\Ö\0†\r‹±Ëµú\æ8{M±U*i¦³õF¼fXfš\ÍülxÀ-*4[ò\\x¸\0\0\0Æ”C1ƒ§X\à\æ`08OiÙši·L$<\Í4g‚U¸\íf=1Oe—ı€\í½¦h\â\Ø\Ëot&°\ævš\Ökilñ\ëû‰@ğ¾ûDO\Ö_}\æ\"csH\Ê\Ö9˜\Â\Ì!MiZ<?s~£\ï\î0gZŸ~’­\Î\á\ß\ï¼C\è®ˆ{Ê±ce\Ú%‹\êûQ-\ÖëŸ¾ò®-S\ï\â¾µ&X\Úg:W˜\í7¯y¯CXTL\ï´rûŠ&-(n\ØøW‰B\é<\Õû™\ç¦\Ğ\Ì\ÆÁşKF°½ıû*·%mµh\ï\Ú+\â\Z\×ğ\æ\Ö;¹G·\É\Ğ\æ 1¬\×Q\ÓÎ¥\ïDg8\Û\ê…ş	u´+:œT\ç`ı\Ôÿ\0Mß‰\Û\à½\Úúfw% ¤4c(\Ü64óPNw\ÅU8³\ÔFl0i\Ï\Ş`h.k5´¶xõı\ÅD³Dıe÷\Şbw‰Ç¤#u§x`5õ}\âm6=\ã4m\à~ı&s\ß\Õ÷˜\Ë]\êp}ö„D§s¼M÷\Ö‚tj1~!–lo¾\Ğ6\Ü+•f\Æ\á\0±œ§2‰\ë\×\Ì\'¼\Ù\é\Úú`iGCQ\Ü\Â0€gKTpj»¥\ä›Ã­²\Ô\Ö<M_BS\Ûòp\Ë\Ö\Zg÷ß‰dVùkG‹t\àfQ›{õù¼G˜¶\ã»A\Z\ÛJıF\"\Ù&W\åc)~Ú­ö+\Ş\\Ò‘=0{\Ëy—\Ş\0,ùÇ„6‰F\â&\Ô\ïw„\æ\Î\İ+\Zë–²#\ï\nÆ†Gš›:`®K\Âq~ƒ\Ş§øıb‡­A,…ó@z‘~Œ 7qü˜\Â\ì9ˆ\àP\ÔÚ»\ß\ÌJz\ï´A5½\æ°\Æ\ç\rô2’\èP4\ï#C\Ş3FŞ\È`¿W\ß1–º\Ô\ãùŒ\ÓS¿\ßx†3\äDv0Ê¬¼/ûû‰!²\Ç\ßhš¹\×?}\åT\Ø\Õ\r¢q\ÍÂ®=¥L\Æ\î\ZC˜! òğ]bT\Âœn{£}¥{e”µN/.¬$\0AŠ\"‚gIµÀ:A k±\Ë\Ø\Êö·TNTù™¦Åª\ÍcğA\Ísp*qXz_ @.ˆ<˜ıQ\Û\Ş*\Ù\ĞppCh\ÊøOú\Å\ã#¹e óŒ %9–üüK‰«•ÀWóTOA¸¤3Sñ·\ry†tÿ\0\ØnCyš\ÖP´€ğ({zÉ¦SÕ‚|“A›\âAıô¸\Èy§\È]\èd&¹”­ş&Áù@.k5ƒ\Z\ß\ÌT¿~³Xe”üÀ²¡”¸`4/÷\â\0\Ê¾ñ«\Ñû·\âKô~1µ5©÷\é˜†§x€P4F¥W\é7§¯\î$†\Ë} ¬¾û\Íy‡R\êT\í3™\ï5—op\Òş€ùƒT_°±£\Øm”\Ä\èT—Œ«€\ÖT\ĞQ\Ú\Æ=˜\áÒ·ù\Şh^¿˜$Ü½¸„.\ÉrŸù¼Å³dn›xı\Ê=±¿Ï˜©\Z^\ã\Ùf]» š·¬©œ\Ô\ï»ôK\ÕùZ\Òm+Ÿtşüw<½=ŒùfN\Ï\îó-ô£·ô-ÀÁÀb½¢\02‚\ÄMùh\Ğ)¯\Ü\ê\Ô\×z<Ã¼F\äî²½ô„¼¬+;œ8=cr¶¶p\Üì™¿i½\Û\èh\Ğ-ØŸ‚Ÿ\Ë\Ú,÷=\Ü÷y»wˆOyˆ`\Òj# ÀÓ˜´&!©µcgû=÷\Ú%»\Êû\ï5–Zœ@\ZC)\Ş-\Ì .ÿ\0}\å‡+\Ñ\ãùøš\å}ı\Äµ©\Ä#´Ôˆc^ğ4R«/şş\à¨é¾\Ñ{/¦&±šObzÌ‹†õ4+½\'€€ˆ\0*®„`gAµô¿ó\Ş ø\ï\ìF:¯]\r‰f\0Ô¾J\Åò\Ê\í\0M­qQB\Ö\İ\ç9\ï\ÌRQU[{\ï\İ\à_\æ¡ı9CÚ˜l\îË»Ÿ\Ëk|°Y\0>ŠA2ˆj \Z\Ï#Êˆ\æC\éÌ£Š‹t@ƒä”,ñÆ†\ÏgG\Ì\ÒØºƒ•\ÜF\ãpƒs*ó¬d<\Ş\çBQªûf\ï\íg´ó6\ßAı\æój†=QúEWS\ì\0ú!ƒò_Xš\Ê\Ô6…LCR5\Ş\Ñ\Ï\Şb4_}§\êŸ\ìJ\Â%¶\Ùr\ìjŸ\È\0\Ä5/\ïöhZ\ïİ¡\Ğ\èıúË¨\ÛÀñüüMu”8•F­\ÄL3¸\Ö\r`yU—…ÿ\0r\â‹4\ÍNz3¿M%\Ê\Ùw£c—¶\ì\ÕûùX³±\è^ò\ï:¤oÿ\0?3»\Ü?Šš¤\"øUù‚»²ª\ZN\È\ä\î·ä©€q\Ç·\î\\<Ä«Aù~ †b¯±zúK9Z»{tÎ€O7[Šeñ+&µ»³ò\Å*\×ƒı\Ş/æ›”h(ô\ÌNs\\†}D³Ó§yp!y\ì°ö<†(¨õñsC¸W¥QK\âr½\êbz\Ò{Ü³Ÿ\ÕÑªd5š¡,·\ãùø‡\Ò/÷ó\âö8†6™]‡0t£_}¦±x]¾ó#°\Ç\ßiB«\í\ÌF\î ¨jÀhX•C£\Ş3FŞ~!€ß¨ûû‰ekR5µÈ†3\äD j=”Ö›\Ì\Ïy¶cR…\ä‚¯0OSE‚Í§\Z\Îi\ÌGG|½‡Y´»jˆv\\§°Š%º}ao\ËµWÌ«ñs\r\0c°1’\0×¢\à;e®\0\İ\ÈGp*\â\ì`ù™\Ã	òôb©E\áW1¦\ç\Ë w`?¨v\Ô\Ó\ê\ÇÙŒõ6ö€†ıö\Ìy¬QXª¼!§u\ŞhK{Kûr\Øb\åPğÒ¼\Æ\Ír»•\æ8‚AL\Şı;J•A£\É\É,C´\Ã@|>X…?\ìTD€ˆ\ÜŸVa\ÕqŒx\É+z/\İ&„}{\Ä,\æÒ¡¬j\"\Ò4\Ì\×ôŸ¿˜(tñ÷hƒ]\Ñ/	–¤\0J\ZŸ~³qA\ép„\à{ı÷ˆÑ·£\Çóñ$CZ\Ê^	TÄ™Hš\×kƒ\Ğ.)(2ÎÁ‰¹	CR6\í	VCÀ\Ş\í¡jóIyUW\Ûb£\Ğ\Çc—\â\\%»P\×\Ä\"K–\Ö¤ö\Û\åEu<«\Z^jó\ì{Í¦w¬±\Øğí–­\ä=U?yÑŸ\Ù	\\W\Æñ.ô\r\×\àğ\Úr\ÔCõ>T˜\æjR¸¯Ÿ\ì\î\â¯.+º¼­·\Ì\Æx>!†j*O\r¬.tÒ‡\ËB\âıš{b\àÏ‡÷\İ\"›}¬†mN3¨E\éZ§£[˜Ö¦Z\Ú3Çˆ‡òKj\\\Õ\Ñğo\Ò2•‹UºŞŠ\Ş\ê|ö=\Ú]Šg»¡x¿¿…(4{ı÷Œ’½#÷h`ü—\Ö%\Öè”†\Î\ävX\Éz\ÄpkY‰\ÚÀñ¡\ØD\î¾ş\åÍ­R\0bO¿X4Z¦ŒF\åz<?@ı_|\ÄFe·iS\Ò%ZõˆT\Ñ\Ş	¯\'xöğ-¤K\r¤¾•’Éº/›\Ğ3¤/F¨A8=—\ï—7\Z|\Õ\Şğf¹t7•\ã;P!H\Åğ¸€\0UjÇ¯õ\ÕeM…ò[ô\ê´\ï\ã½Æ³Sê¿¨v\Ü×ƒš1—N\Ú\ÊÏ¢\êVó5!ìŒ¦D½ _sù	¿Z\è¦^\ÏÀe\æ\ê1`ok\Øõ>\Ğ^]d2½ğÃ²\Ö)\É\åºó\âö\Ùh{:üNó4vÅ§sóp!ª=±ğkmª{¤Ub÷±\î\Çg\Û\äş­\á…+	*û\Êh´S¡K\Ë\Ä:aV[\Î\Ëíƒ¼2‰p‘]\Ç=Œz\ë¢a\î;~¢R´«¸\ëÚ½c‚Ü°m¬\ÉrBUVş†ˆ\Ñ\ß\ï¼\ìÁ\âşüBA¡£÷\ë.%{^?“Cô>ù‰eÀ¹Œ\Ù5?Ÿ©ŒV¢	\äk÷‰¯\é?0P;G)ú>Üºw	\Ä\0\Är‡\ßı†¦€ñ÷õ\0\èœ¾ñ“•\èğŸ‰¡~¯¾b-E©\Û\ï´*¨^ˆT.~±,\Ó\åD(edv\Å<\0exvƒoJ—:¹tW¡ˆª®·Âµè–ƒ\Ú\Î\Õ\äµ\ãChbNn¡\çRx.\'+Ÿ\0¿²z\Ø\×\ËW\íqQt€¬z7w½ÿ\0ŸÌ³±h*µA\Í\Ç+k]ªô¨.ƒ\Ş~aƒ W,\ìN÷Jø\0˜˜\È˜]\Ê>VT\îû=\Â=|«;¦\Ûù¿mš­¥¯cg¬³¾­0òZz-„\ï8¡÷\Üş \à04€\0\İ†3{0L\İ[šd­\\\æó(ğ\n5«‡d\ì\Ù\ËCFk\Ô8rY\â\"°«{|=˜R)«x#g~B\ç\Ğ*µ­!5@9YKT6n–\ë3\Ã)¯8-\Òû”V(~ûÁÙƒ\Åıø…B‡ı\×ó%kG\äĞ&´\í\ÚT;?‘­$\Ís@p<Ë±x±)ôWl\î \Ğ\Ê}ú\Í\Í\ÅÊ®£\ßıüËW£÷o\Ä0[õq;\ï`ŒMo)÷o\Ä3js\ï¼LUµ\ÂuÇ©ş\Ê\ì0\ém?‘Qv˜–qŸ¾ğ\çE×ø³«ÿ\0‘P\Ùğ¶?Q\Ç1¡Ï\Ü5uo\Ì\Ö\á\éU‡€Ïš™¿¹€T4{–Sxl´\Ò\n¤\Ş98\Ê=\Ït \Êe\'4\ÊV\Ú\ãXô\ÖòrwGO£YŒQ¢F\Ø\èñÏ4\Ì \0\0\n\Ø6!\0&õ¤\Äjˆü\n©UôR½D½£:¿\ÔÀZL¼.(x¶÷‹ »,öÿ\0qzf½ÀµüD´ğWu‡´l—„¨\àßœ?]Köa±pWF‚\Ú]h†¨B•Ÿ–½\å\ØlO\åÿ\0¨\'N€W„¼ò¡¼‰µ­9Sº\çÓˆ\ê\ë\Üp…´4wÿ\00\áüˆa\Â5oÿ\0±š]¯İ¡© \î+&R>Š\\ı\æ€ty—±võš‹4‰İ‹\ï\î3¸û´¬\Æ5;Àd)8«–\rf”BF\Ô\Ê\æhsë¾¿˜\×Vµ8şA¡×»\ï¼L\\\ë÷\âi!ÀÖ³+°\\zş\à\Ñ6„ca™\Æ\'³GI9{¿¤\ZA\ì\ë\æ`wpz¢§\å\ÑÁû\ï	€À.–\ã0˜†\Å­\ÊòcJÍŠ}\ïX‹~Wt½ù›ñ«±¥ÆšF‚D2V¤,ù\r\Ú‰\0B6;–\Ñ=cH;§œe†\åW*%-y†D\Z³r“f˜7\àSe¾¤\Zû”\Õ\ÍVuWPm½\n=\í\ï	 –\Z\Ì\ØoU5\é3\ê\äÉ¶\Õ-¯Ay\ÈöS(ª[¨Ëº„\ï0ªº9nc¦“\Ø?œ™]s`89sÁÉ™@z_q—|¬Q§Iÿ\0S»V\íFWö\İ#\×\Ëz½¥÷R#Ÿ–m\Ü6\" Û£[}\Ú9Có\rk)÷hbô\Z>ıa\Ãß»B\r¡À÷—\Ï÷oÄ¸@–\\	X\×5\"+©Ô‰@\î*e(\Ù\â*avŠ¶i\Ôb5\0¾k¦¯F¢µ£\ÛüüO·ı1‰­\ê½¿F@ûŸ}\ã¡\ïm¡­fˆ\à?Ø¬«W¨8>H*\ØP*Á\Ü\'ƒ7{µ÷IAk;7\æb£\Ü2\ÊM!µ¯\â	wr^Š\Ç:Â¨\r\r%`)[\İ|A/v\ê\Ónqy¶%c\È\Ù6\Ç\"€jT½…Wm³‘\ÆcC\Ø,zs\"f\Ç>§N \Òv©“¢Ày\Ì4\0G1—\ïpñZ\Ò\Û}%¥À\ë0\r5^eo_j`¼\ŞJõ„X\Z\Ù|´P®o§‡\Z>cK@\0ğ‡\Ş\0e¢»ª\ÄYJ¨dAR¬\Ó/r=Æ¥\ÍJw¨\0€\é\n\0\ã´\Ê<\îˆ8“ZV@\èkÖŸv†4\îPl ÷ûñ8\ZRS¢Lœ†\Ìh‡;AXç„\ÆûGI‹\ÖoÒº(q\Üÿ\0c!Z\Ñ\ãùøš\ìü\Æc[\Ô\ã\ÏoÄ¤*\ØLYÎ±¥\Ì\â\à¢<½\Ö\İ\ÅK\ÇX„ºkß¼\Ğ÷~b4«\à–|v¼\rSØ†ƒ^Àü€¾%Ç° ƒ-\Z{ŸX\êò\Ğ\ä${!5°»G–QXv¼Á@\n\n£ªë†«ğ§Cq{ÁPô¡\03fœ\ïÄ¶™\ê\Ø?½^\ás¬²9™%§<@Ã²®\ÏZ\É\ï6jKŠn\ÓMduÖ˜oªHì‡¸ô‚Á‰Ü¢¯\â¥\Ä\à7k˜b*wG3:&£\Ç!§¹Çˆ‹eµ#÷C,ñ\Ói¼ñ?1™ÿ\0³i¼\ÇA£A{ıø‚SC§w\ßxˆV´x?É¹¿»\Ş1%½Nóñd^\ï¾ñ0N\ë_¿‰(y~\íıñ\à­_‡h¡¢ª¯…µ\rpü/û1-Åœ	ûˆ\ÓW0•=¦4ªô‚\nú?”S¾H€P+[½«xš¥°/p84›kª˜@\r5I|\ÕBv\Úi\ÓXsIJ\Êe‚>j\n\Ë.µp‹r‘şE-„F\à-Q\×Ì¢®\0ªSˆqv£-B»\åk•T-\Z\êoJÖ–dôKBZ7mM»…\ÌbP\r\n\"”\ÚR\î‹ñ7›sÕf§M\ç0²ç™¿Nñ„-\Ô`\Ó\åA)¡Ó»\ï¼d+Z<?B\ß\Ù\ïùef§İ¿–Ciš_ßˆ\Ë£UlÊ¸z\Å~Cx¨ >¿ù,ñ\Ó\Ğÿ\0R°IuU€úiö\á\ë7“6ó\ÆO\\sôjÇª\Ğl\Ş\ÖS\Å\ã\İföpÊ«\Ş}:Ü©\é\Ó=n·\í,ÁU``]l½j\åV5€\ÖZz·\íFğŒP´üT¨\éÿ\0á——\Ó\Òo\Öæ“½\î˜\é\È\ê\"’şÿ\0`Ñ ¼\\2\Ú\é÷1­hñüüM\Ï\İùü\ÆVY”\ãùø‚2¶\îª\ã>ªvµÁø™+À\ÛõQ9\n\ÕM\ÓŞµ”]röEß¾³iñ¶½4\é]úzôõ\'™Pp{Lr–\Ú[ÿ\0S`]£–¸|AG€q¦1^À‚z\Îı	s_¿üz\ËûS¿B3\ÌP»H:Ğ¦µ\İf\Î.\n\×:]\ÜC•\è…@…\ì±q;±o÷\Ì\×e\r¿´S™±\Å_ßˆe¼.;¾û\ÆCµ£÷i¡~\Ï\Ìf5½Nóñd¹Lœ\Û#\ìüM\Ù™\ŞDXne±¼Âe‹\æg>:zõ*m;O?óR¦ı,¾Ä¨\Ä];\Ñ~v·{¸~Lß¼ı÷›hM\åÍ¥Å›ô¸\Õ^+¼\ÔAsqÔ»„aWC2\Ğ\Ëh\Ê*Sz‹6z\æ]N\Ş\çŸ¨…\Õ9KƒJ\Ø2…M\è?\Ùq¿iA\n€l\äQ1\ÒÖ ı@±§P~ÿ\0f…¯•÷\âo;‘’v´{s\ãñFıg\×ó’Ü§\×I\"&¯\éP\ÙV¥J\æB\î´I\ì\ØóD6…\ï§\ëÿ\0_\Ì(¹–µ‹Aº3T¦šË³z \Ç	šol\Ãr`­\áHŸ&ı|uñÑ™ÿ\0^{?€„²\İWş\á¢ôõ‚?oS\×ş6tš\Ô,\ïqeÁ¶»C\ĞX¯]´–b\ï®\"\Zõ§\Ï\Ä5s\ï¼\Ø\×\ÈûñhŒ¾ñ\"\Åhñ\\ò’¯³ø”^-\ÃF)pyi´_‚ba«\ZO\ÜC¬)­¢[¼ˆµNI÷hV4\äo¼2Š;¾û\ÇCµ£ÁşM%\ÓhŸ\ÔMù¯Ê¨Ly\İL«Ã¸§\É\Ş-~c\Ã<Ã§üL\â…\"X\ß\êÏ©P[\Ä-J­R\ßù4Œ!°£TŸ‰¸~ğŸ˜ğÿ\0-\î¯#w\à\Ï\ÔP\Ëù–ˆkY–Å”.˜©£Á|Â¤qIYvh„ıuñ,kgA&§0L08•Si«û¡ôj\âRªÙŠ·\ÕÌ˜ˆ/0\Óñ9œM\æıvÀ\Ô\Õ\ß\Ó÷<†º§\ßy†–²Ÿ\ÈCê¼\ÍB÷€C\ç\ßyt”\Ñ\ã\Çh\Ô[¦¥\0‡=\"ªğ·{h>•Ó›öüGô²\ì(c½ª9W®q\Ğÿ\0\ã\æ;\Çf­F\íf<«\Ä#\0Tqa10=GõQJ\r#B\×\ì\ÕÑ¸¦Ì¨+ n\î\ÍcZ\Êvÿ\0%C\Ë\İ÷\Ş%º|ˆA\ãJF\Â]\Çò]Ï´ºû\ÄÁj2\á³\Ü\Ú)if:\È\Çi•\Şm6\Öz\Ï\\L\Â\çy\ë*\'†+\×\ï1vt–\Ùx\á±´\Æ\Ò\áT\Ôe¨|\Ï×ˆ€¬×‡X\ßhP„¬G\Òxcó\Ğ\Ğ*¾c\'&`\Ì!öİ¡º*\ïgˆf¼ˆXª_[C 4˜\Ëg‘ôtŒa\Å_\"^E\É9\Òy÷‹Ÿ\ì\Şo	\ã¡WU;<±0kzE\Øj\×t\í1û¹š)\Óı\Õ4Gg†sn¦ƒ\ßhğ\ê?u—8\Öh–vEÖ…7š,ÿ\0¥Jš\ÌJŒ\ÄtŸ•4„>™²%DWE[¹€PF‹¬€1\Ú‰\Ú}\'\Ì\Ík˜\"yMüJ¢O\äkdÿ\0±s¬K\êÀ\ì+;\Ä(¬ ¬­x\n\Û\Æ`\â\Íó=g&(ˆ\nvG\"~òI°#Gbˆ÷”–^“ö˜\Ôõ­<Dùÿ\0’(-@W+L°vq¶SÈ\Ñ]i=ŒŸ()\ìWCCøg\î}#\æ?\Ş3~·/§½\Ï_øØ¹¼¹}=z\ÉÒ¹\\Oh\Öó\Ö9K´qZøt\ï/hª\ÅkPXkıH\ãÎŠZ®„\ãJ^4¦cª‚kE€8h+¯7+ „KS@±ğR\Ò{ô/0¢€3¶Ÿ\ä³\íl0‰€<»úO\î±\Òjtö¾›Fo<ÿ\0\Ç3ñ\æzMú\âm}ø¹\ã¦ğ¨‚\Ô\rXWh\Ì\Ä\ËÀ·\ì%\"‚œ<{\âc\r}ˆ÷! %º—¡(S^¯ıJ1j³{…³Üª{IZ•˜\Ğr`\ÏÏŠOnŸ©¿M\æı5¨\Òj\ìª\Ø2\é+Kfö?\'ğ‚\å€\0*´ª\Ú`£Z¼\Ê\Ås\ŞôK-\ëPœ¤\Óy¬÷\È\é=\çşM·\ê==\æñóI\ï6˜Œ;Oxt\Ì\Ş4f\Ìw‚X*lf:ºš	ks6Á¨\ÈÎ²c&Y	™Zwû\ï\ÍlÊˆø!³\ßø€\én<Y€W¨n\îo6_„dbn•;”–¿¯b3Ù‰](Iğ¡1;[½\Ï\İO™ÿ\0\åÀ€>\ÍÀÂµ¥ˆnÉ¾Ö¿\r&°\ê\äø!D\Ôö\Üıd[š\Ö\Óo76‰\ŞôW\Õtm9™™ùÿ\0‡\âf_\Û\é\æ}\Ök3õ‹ø—¯Lô\ÏU!·{³N\Öùñ`¸¯¬ \íaw\éı”¬É—ƒ\âh0d\Ò «yôıF²/N_Ü´?¼zµD¼\Âö 4Y»\ç\Ú\Î\Ä\nû\è°(Ÿ\r…¯°\Ìı…ö€!zq’¯_€—\Õ\åK`Õ·öÚ¨Nh¢m¼:‹\n‘ \Í3FngL`§©?2\Â\Ş\n…\àj½‹b¬øJ“\ë\n\İöK\é\Ë7Y^\í³\Ä&@«\ÊaU|OöR±vQğ!ğBÔµ~ ¿§¼¯?ñS\ÇM5g9\ÏFvó§F\çˆkW6\Ã?ÎºLó;•\0¤˜÷_\ÌD\Şx»DEşµ õOÄ¢Áj\ÔZĞó2]\â=\æ3?0¦X#\ï.,75­}t¼\Ù;?Z\Ê3j©¾e±“.\ï~ü\æ\0”¸Ì¢¶\è\ÄI”Í \äfy›V\Ñ7jÌ—”5w«†\Æñˆ\Ç—\ÌTğ¥\çªk\â\ZK\ï-S®‡ó1¡ağx¥„f\"ñ[\ÅWPN¨|Vq\çiŠ˜÷\ëñ.?\Z\Ë\Ú›\Îğ˜ç§™—\Ó\Ò$\Ñ5\á\Ñ]™\Ì,¸pi=¦³öx#ñ?\Zi6\è\ã|À7^\èôK¤(Cõ¤Zõ\Ã(4\r^\í\å›\Íeµ\Ú@\ÓT®mĞ—yğ°c‰¼!}.(¼^{@@n&Ò©\Â›~\åk’E*	¥€C¡|¡\ê\0\0€\ÅM\çzŸ¹±7\ï6š\Æ³=;M¦g\æo\Ò\æc+\Öi\×I¶gi™¬\ÒZ,µ§a–<\àq`Mc\Ë?\ìw@õú\\\Íh:ö«\é\éX),rT\Ún>•\ÇA\ê„\Í[{¹“¸i™E&JUZ•z({ Ëš\Ï2ù\éw§Gû5\Ü=Gv“ó(\Ê\àö¿iJ¢iE£M´‡\Ö\Î\í„=iê™„ö•=\rj{\Í\æı6›À³\æ.zÍ¦&¯Bz\Î3?\í\ÑY\â”7Wb<\Ó\àR\ì:{¥¸ÁˆÜ—*®\ëUy\Ë4\Éø…\Ø}\Ñ\r\Ø]w7úÀkKvM\êû:\Æ¼G©˜Ynö\Ğz1¼[d\Ş\Å{!¶ûV¥\ìRü–A	ËŠ?¸œ\ìµi\è7\ntc\å\æ,Z\í1\ç\Í\ã/\Ì\Øq4³™ˆ\İ8\Û_k‹x4V4\Ğik\Ã:\ät†C\Î\åj©©{”°\éqœN\Ûôù\é\ïÿ\0\Îı?t\æ_\\M\'˜|ø\êp’ôD¬­\à\çp\Ğ\ÕÎ›\çY\ã£\Ü\ÄÉ‡q_ˆšú\ìÿ\0\"\ÅNı\Ãa\á\Ì`…J5³f:‡¥0š\å!«d\Ğø;q³Z\ìh| \Z\ŞúI\Ü\ÉÙŒ“!j\íš„šOù!\ì|À‚F\Ş\Ü\Ô÷eL‰‘ö—M\'B`-¸\ß\Ä\Û\Z/´\æ\\.\"Ö‚{\æ#\ít\04\Z·Y¸8oõ¡\ÌXfšV\î,jG\ÃHšw\r\æzg¡™\é.´›ù˜—6\Şm\Ğé„\ÆÑ‹7ı	ùŸ^—Quı¬vª9§©´ñ.x›Æ²:8{À€˜j»k\á\ÛG\"%‘\Ñ[ú\ËxA¤Pš=ò\åö~1Õ™tO®t`E¹_G_\ÌZ\0xf¢:&œù–\Ë^U{“W¨\Æ)6µ\á\É\â¢K,Ğ¿ƒ\"w,†\È\0W§Z\éø©\ÔyM!u\n³:ª®Sa\Ô\å\Òf§,]^Œ0R\Ô:\Ç3ººİ•\È#\é¼\Ìy\èG\Ö\\fg†zöœO\Ôo½Ã´÷›\ÏY\æTõ…\ÕôüOnš¾w\é]µzõ\Îfv\ëùŒ\Ì=% \í\àhï£³*‡U2\"\rW#¬9¤l\"n&ñ\êJ·l\í\ËÏ¤Ş|O8\è*ˆ\ÔÓ¤kRŠ`qx;\0\ì\Ã\Å{\Ù\æ§À–Ÿµ9³®›Mô˜š\Ê\Õ\Í-3­´y\n&\Â\ÒP}4H2œ-y\Ö\Õ\İk­¸¨a\âz\Ü\îY9\ç¦ÿ\0\ì\Ó\Ìt\é´ô\é´Ó©´c¬\æw\ÏM\çn›\Î0t\Õ\ë¯`¹¸™\ïF~Wşo1›ôN2³m=g¸\Î\Ğ\Ùµ;Æ·Q•]«\ìü9‚½(\á8xL\ßyb€O\Óñ.\Ë\ìüO\ÜXx\Ó({•\âı!1†GÔ–w\çº\Ï\Ô\Î\Ú\Ç)Ì‰\Üpğ’\Â\ÉWÕŸU‡0#†\ç\ë¦Ø\Ée\Ï\Z¡\î·g6À³\Ï<\Â\Ä7‘Wm®j©v\\‰«z!œ‹{eISf¯\İmÜ³¼tº\èt\Æ\Ú\Í\Ş:yOHOI\æm‰\\ô<M&ò\Ú\ïóAò\Äh`\í¬*f.z\ÏXÀD¢‡Dvy ‘n³¼5}\ÍNO(\êŒm\Ã\àğp<4\Í\Ò2P\ÔO\ÓQ6\é>4‡V·?Àú‘\Í_\r©!oW9\ÕO¬ß¢#‡g\İ[b\ï}Ê©\Ôñ”\r\ã]1ôv/\ÜH\Èe²\Ù5\â\'˜ ),NÏ˜\Å\ë›q«V\Â\äSprÎ‹°È5º¦$z(q/gò\Ó\Ş/\Æ¡Lš\ë§\ÏOI¯ü\ï¤\Ûõ\Óyß®ó\ç¦õúœ0ı ¾³Oøz6\è\ë4:p2ı¸\Æò\ëóÀª\æ`’°¤\æ\æ\"&g`ò\è=ó¼~:b7q!˜()òhù\Ö,ñ\î©{;\Âvbwc«HxÊ‡\nW»{³\ÌÛ¡«\å²~l\ã´\"O4©@òYæ™€@0»\ÏÔ§4‚ o’?\â#Ø®³#i\Ü9Á1\È\ë*\Â\ÇS•e;\é\Ş:Mzm\æq™¼Û¼ß¦g‰¤\Şf\æ\Úÿ\0Á£Smÿ\0´Y·Nzkÿ\0;\Ï\Ì\ÒiL\à{?®^õ\ã\á{\'\Í0¥Ÿ\Û&ü\'ÿ\0\Æõ\Äj9\ÖTkğ\Ïh\ïœ\Ã¦t¤\Â#‘³&£*d\å_\Ôñ·OX€2®Õª\Ê:r[£‡t@\Ú\0x?\È…1\íc\è\r€Erûò|\ZòK¡÷\æ8¢\Ïu>©~|š½A\Èew˜µ6ø\Øz¨÷e\êœU\Âdf&#´õ˜\Òq\×óySõÑš²[<M	\é\Ñø\êt\í=#\æö¹BW£¸óÆ†Uù„§³dñ5lºjÿ\07Q1\×Eû\ÜÖ°nk<1\Ä$\ä[\ä®\Õ,\Ü8\Ú.•—ªú2z\Ñ¿\Û\ŞhŠÁ\ë1#@¾/ÿ\0RHdñGLşe‹x®\Ğ„‡E´\Å)`F\áú\çh\ï±\Åø?E\Ã‰X4ú.s³dH¨\ï\ï•ò,\ßk¤V \ì“mù›\Îg£q\íP†³\Ş\ì÷\æT:7PR\îÅŸñ¿O3\Ì·OX“] Ü¾\ê¿ ”Vù‰\Îq\ä¼&\æ&vÆ¸|>‡\ã=5\é\â°ùQ_\Î\×\Ìø;.H\Èc\Ëˆš„=ò\×\Ã)‘W\Z\Õ`­V\Ş\ì#\Íò/\ê\"`{\åøµ„\ÜŠ¥ª«\Æ7Œ‹nw<1²º@\0\0`ª¶\r¢”²=`‚f+:AWR~OkW¤\Ó]zv„¬\Ü^k\ä\Ô\ê0Úˆ5t÷\ZÀ\Ã\ÛCŠ“}¡´÷fØç™ó÷1ÿ\00³\ë?3Y·Oz_FP\ØYZ\ã¼A\Îe¯W‘u\â˜2¦ Á¢œ½8œ›\ïÓ™\æ=KÀMûT`Ã¼\Õ\Z¯7yõ\Ö=6€sH-h[W°\Ô\ä†z¸7jfu\"•\åÊƒ±FB\ØD9T	\ÍJóeøˆ\r2Ç‡gŞ \éXm^\ë<t3LÌ–Á¸vk]v‰ ‰H(£dDNI¦“H\í¬\æoö~&“i\æúx¹£-_g\Ò¤p1\×Ì¿ù\éC4c« ^\È[_¤]\á)+%y#¢ZBrZ[“G\ßy·ü&g´^µ ZøDfô¸idf\Õ\r°Şš2qJôH„(šº64\ì~uŒû¬©£+¬=S÷;J¥\åağI]5Vi»Á\äG)&\'§_n¸Û¦º\Ìú\ÆFùC÷*_óƒû\éÄ©ù˜Œ\ÇLu4\é¼`q\ãY#\Û\È%»R£qøº<9\Şf\Å\Ó\È\ÜrW–]a·\ä\á\Üõ\ë\âb£¡”#4©š\êõœî§–ƒ¶×¬>òE`V®Æ¯bP\è»\Ôj÷\×\×şvWC\à„L¸n\Ì0ñ‡={\Æ<~Àô\æ\ï4‰=i}W8yô4q\È\ÍI™¹*f\æg¿[ß¡\æ\Z\í-ø\'‡’y›t\ëß©µÂ¦i\Õ6€\ÙÎ•xc\Ü\í\Ùh¥w\Êy–Ş‡ys†ù4{\çD—˜KO°\Ñ\Ôt\á^h\n¼†Ztù&óÁk~Ø†‰2Qe#xõŒ+YóvÀÁ\â_\Øbô2\Ãİı†^\È8†¦\Ö<˜=A„\Ä\r\éAFô\ç\0ñIø‡LP\0\Å\ßÄ·\Ê/%{\Ì\Ûó\Øöj=’Ïº}£}º{MM\í\Òç·´üô\ï¼}j:\å\n‡Otú\Ï\ÏLt®:k\×I·O´Qß¹µh˜a*HF\é«+Qô\Ö\æQ¥\ßX`P-^\î)Q©\ë\Ş!e·G\åh\îAš¡2\ä\íZ\'&“CÚ½\ßV~@\æn\Íñ¤p\äg¬g\'s¸Æ›ƒI&e¡­°\n\éQªCx‚42]öŒ©\Úe{º¯x\é\ç7«ò|B’™¼z¤&\Ğ\Ù^Ñ”Y\îJ`¶\Üyo¯¤x6¿ÀKûT·¯ò<©H»ÿ\0©.M	/pO”\èo\ÓlFß§£?\Ù\éÒ–2\"¾\"38\ë¿ü“y]O! -\Ş;Ø›ÀCˆ\Üø•)Dg@;\Ú^¨ó‡	ˆ¡aC‘}ˆx¹™BÙ€\Ã\Ó‰Št\'º?0J\îhz¥~%Àó~‰¥­¬¸˜2Rö7/¨\ĞjMn\0\n\"Š%Ş–k\n%\ÕkY[»Õh‚E¢\Z\ã] \ïNR7^œ\Í9·½”«½u^Jõ0ŸÙ¢;šµ\äØ„\è1ü\ÙQ\ä\é\é6\Ò3Ì©]ºzFzD)|NÇ–X	D,F\ì\æk7ÿ\0³®Ó´´÷ˆ…\ØÄ‡\Ëm.7b•›;ÈœD`\Zn\éi]\äšüC«ˆ2y\Ù2f\É!¡¶h\ér\àÛ–#\ÂLƒ\Ä%ô\ZK\Ù+Òœ¹qö5xPƒ9u.!h4©Ÿ\Ê\Ç;¡µ¼(eY¤\Âğ\Í^z˜\Í\ã.:Ğ‹b/ZûËš\Ã\Zøşµ\Õó€_\È&“˜ğzOIó=#N™†³\Öm\Ìl)QŒ\İ^UŠü\İ{Àa\æWK—/¡\Ò\á5\ë|@£[Eõ‚y¦ ¹\Èòt¨ˆ\é1›\ßú’¥\Ñ\Ø‚\'tfƒ\ÙOq\'xi-p¥qõ\Ã\ÚyÓĞ˜µ&«eqviKNÓœª\à-h±^\Ê\0ùó\æS\ÌTøñÒ{Ÿùa³¢¾ÿ\0ckoy¥ş\åt\Ş\ÊÇ¹H¯€¿\Êy€/`†\Ş¸FMr>)÷\'yrº{Fc\İ7\ÇOi\åX=c\Õl÷wö›\ÃBk©=\ç¼\ßşx\é¿~:z£Z;v*1Z¾“w-<( -‘±Ç‹Æ± WCX\Ñò\ÙY¥\Ø/€#Iƒå›ü*Zh\Ét7Œ\Ã\æe\ÙğµP­-[\á›Sƒü\Ú@³¡;F˜…\á±¦V´\rµ¨µ.ak‡»ô«.9\Ì[­\ÜOh\Èš/\ZK¼\á‚\ãVTz¾\ÖBI$:\ÖÓ‰Ì¸\ÕÁ“Bö†§šûdü?b»7–eO^¯¾½3Y\é\Ì\Ğé¿ˆBbo\èı¹\é)øF\Zº\ÏZ=a\ë(	¸…>\Ğ•(q5™•5™šô\Ög¦óyƒ2®\à|\â\å\Ê@2V È—6ŒyG\é\Z·ñ,¸Xı\\\Ú©/{™õ%CU\ì\Ã\nŒjh®ƒÀ®\Ä\êIşø6©kÀq½_œL\Ï3~˜)^°¡`¿‹o\ÂS\é¤\Ús5„\Ûüœ\Æ	ğB~D)ŒÍ¿J<t\ÒI(\Z¨C¸„©\Ç>/Gr\çy\âfTñ=§\Ä;t\ç¨8Z±%%m\ìz4Œ,Ö´^¤.NOy\ë7³yë›C¥E€}óE8÷Œ\ÙU–##…0\Ë\"«0#G\Ä\æ9Š¯\Ğ6Š\rWƒvÂH„®\Î#Çšµ\ê<\Â\á£aI\Ğ\Ñ;\Ø0™¡\Â{\Ù9¹÷\ÏJ\\Ãq/‹‰ÿ\0H#“G\'‰p»¾Ÿ*\Ğ«\Ú`FWı¦\×3<A\Â…§\ê™w“{™Œ\âo3\Ó\ã®!*.ZV\×\ÙöCD\Ä6Ê™8\ï¢h7\è\â†óö&‘‹5\Û_& ¡\ïr~:\\\æ3dZ«\Åy¡Cˆ\æ&l–&G½¢Æ´¡$˜g¾§\Ä{\Å\Â`\Ğpù\ê;<(\Åú\é^fı\ât\áC4²¦ù1\Ú¸™7\ë>J\ÉJ\ì\Ê\ĞL\Z*\ë=N¤\Şmü›\Ê\êc\Ò€}\×ÿ\0pbº\ÃÃ¨ğ\ê9—Ëƒ±Jº;Ÿ \Úxé›C§\Ä\ÅGš\Ì\ï\Üa\Øg=…}AõFjÀD\á\è%T}¼A.&‰\ÇJˆ \Ùr¥ºº¯ú –‰Š”g1J}\ÏòR[µom˜#¤Û¥K¯£¦_Ñ ıô®œôQÆµÙ¿!\ÅSÈ¸MGi\r£ª\à5X\Z‚N\îÙŠ\æi3R¦Ñ’­kS\É>³µ4O±\Ó3\Ö‚\îùS/­~zfg¥\ã\ÓCq»ò«\Ã\ramR&n\\\Òc®Œõ\é\æ>a\Z\";\Ë*ğ\Ô›\Ì@\n«\İ\ÈmÆ„f\Ó¢¹tñ\Êa\"iÑ±RÅ›C³úÈƒq\âº\å\ÆA?g‡t\í/³K\â\\UúC=j0\ß‹y}\å#JÇ¾¿0ü\Îz½;t\'\ãşR\Â?qW\è@\ĞD|2\æ\Ú\Æ *ıœ7~­\à\ï4\é\ë4„\ÎĞ™¬ö›\í=f¡÷G\å=…Ïµ\é\Ş\Z{ªm?yM¨O\ä\ËS\Ñ0ÿ\0{F_S†&V¶ü«P•\ç2\åò\Æ\è-\ß0fe|òO=²\æóXNzoüzúM\ãÒ”mş¡û\ëq— \"wˆ\Ï\Ë\áA\ï\"&s7Œó1\Ä||\Ï\×û6›Ê¿|õ‡K~K\Æ3“g\Ò\ZT\ÅS£\ã¥K‚OX%\Ìù\Õo‡O˜\áDGJ©•JW)Ï˜‚³\ï2\áw¯\íV}ø‰\"67RŠ\İ:\ê°‘\Ûr™˜s.~g¬ñ/§‰‹\è\Ï=7‡ö&9ˆ\íDöa\å@\'„‡M \Çd\Ş®[>À\Ûuÿ\0\Ë1<\Îı£\é\ÓõË´ô~\ÏC1¾½\åv\×!\Ú¤\æi?\Øux\rO^eŠõy•k+\Å\Ü\ïùƒˆfóP¦ør½„4okç©§œš‰(=\ß\ì2ts1	¯BWBw\ŞN&ıH5\Z}ÿ\0\ß ¦\×\î!ÿ\0\ZU\ÜBŞš\ÛzLNg§\Ä\Ş\\q7¶m\ï6›\á•Æ‰ğYòŠm·I¼\Ä4\èWAlA;\Êq¯\ÈQå¯´ó16ÎŒ@joI0°(||vIø‰g\ÕV\r$\ÏYx*=°Š]\Â8¸}y—}fŒ7,\ÔG³ş\Ë<\ïn,Œ¹·húÍº\\ß¦óg\Ã÷O\Ö&.Š4üøš.\\©m\â÷;\İ$¢0A;\è\Òy›ÿ\0!Ö¦º½)\æzÆ²\"\İ\ï_5µ@| şú\é	¼¹\ë÷™ ­ÅŠ\ëı—\râ®“\Îıw\Ì\Ğ\Ô\×\İ)\ë\ì¢æ¹ãˆ“XYÛ·L\Â÷\ÖhG¶4˜Pı\ÇK2~ß˜0‘7—6D\æ\Íú\\f%I»ı;0\ßX\È6ÁäŒ˜…’ºz\Ë\Ñ\Óôÿ\0\ÃÓ¦\Óy\Ì\ÇD4ŒM\Û\Ë#¦\İk3zLIGxSHG\Z\íX•\åKc\ÙP\"\ì\Ü\Ò\ÏXK\n\Ä\Zû–W\ãU\êm\'¿\Æw™™Ÿ\Ê\ç\Ä,JK:•4®&Ø‰4•„\Ş{÷ó\É-™š½ò\rK~¹Ÿ™\Ìxz÷/¥Z*ô?\â:\æ|Ù»v›JŒ\r(w’ï‡³/\íLBzM\ã7\Ì:y—0¥\0£½zÍºš\Ü=€\ç0\í4S¬¾†\ÓN\ÉY†Z‹œˆUfiA²UY\Ç\r«34Y”£a¨òJ—\ä\Â]N#ÿ\0*y\é)©şOò$F\Âg’©\Ú!\Ñ÷\Ş\r\î~?\àÌ¿\Ñ\Ğ÷…ˆ˜L¥\Í8\Ú3\Ës\Æ½t9ÿ\0‡‰\ÅÃ§f*>\nF\Ø%#‘®.g\\ûO\ÏQ\ÚwC\ÌO¤\Ò[€£_5*dE/00t@\"	¥s4®³¸\r»»\êx\ÄeqjGz\êx±š)cbC\Êj¯~ı<K7—\Ñ\Ò,üD-VM«üüC™kã¹¨úB4¡{=9\é\é\Ñ|)\0\Í\é\é\ã\Ò2¢Öƒ’6B‚£+In€Õ¬«\Ò\Ş!§M\'ÿ\Ù',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video` (
  `idvideo` int(11) NOT NULL AUTO_INCREMENT,
  `URL` varchar(250) NOT NULL,
  `articulo` int(11) NOT NULL,
  PRIMARY KEY (`idvideo`),
  KEY `articuloFK_idx` (`articulo`),
  CONSTRAINT `articuloFK` FOREIGN KEY (`articulo`) REFERENCES `articulo` (`idarticulo`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` VALUES (9,'https://www.youtube.com/embed/jFu4iOw4pQU',21),(10,'C:\\Users\\Usuario\\Desktop\\PIXEL GAME SHOP\\Directorio\\mi-padre-es-un-elfo-de-sra-rushmore-para-el-corte-ingles.mp4',22),(11,'img/Directorio/mi-padre-es-un-elfo-de-sra-rushmore-para-el-corte-ingles.mp4',23),(12,'https://youtu.be/fGmFqVEbwwk',24);
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'proyectopapw'
--

--
-- Dumping routines for database 'proyectopapw'
--
/*!50003 DROP PROCEDURE IF EXISTS `acepCarr` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `acepCarr`(idC int,cant int)
BEGIN
update  carrito
set precio_unitario =cant,
Id_estado=2
where idcarrito=idC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addarticulo1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addarticulo1`(Aname varchar(50),Adesc varchar(250),Aun int,Cat int,img varchar(250), ida int)
BEGIN
insert into articulo (nombre,descipcion,unidades,categoria)
values(Aname,Adesc,Aun,Cat);
select @var_name := idarticulo from articulo  order by idarticulo desc limit 1;
insert into imagen (URL,articulo)
values(img, @var_name);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addarticulo2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addarticulo2`(Aname varchar(50),Adesc varchar(250),Aun int,Cat int,img varchar(250),vid varchar(250), ida int)
BEGIN
insert into articulo (nombre,descipcion,unidades,categoria)
values(Aname,Adesc,Aun,Cat);
select @var_name := idarticulo from articulo  order by idarticulo desc limit 1;
insert into imagen (URL,articulo)
values(img, @var_name);
insert into video (URL,articulo)
values(vid, @var_name);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addarticulo3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addarticulo3`(Aname varchar(50),Adesc varchar(250),Aun int,Cat int,img1 varchar(250),img2 varchar(250),vid varchar(250), ida int)
BEGIN
insert into articulo (nombre,descipcion,unidades,categoria)
values(Aname,Adesc,Aun,Cat);
select @var_name := idarticulo from articulo  order by idarticulo desc limit 1;
insert into imagen (URL,articulo)
values(img1, @var_name);
insert into imagen (URL,articulo)
values(img2, @var_name);
insert into video (URL,articulo)
values(vid, @var_name);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addCom` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addCom`(tex varchar(250),val int,usu int,art int)
BEGIN
insert into comentario(texto,valoracion,usuario,articulo)
values(tex,val,usu,art);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddUser`(NPuser VARCHAR(25), NLuser VARCHAR(25), Pemail VARCHAR(35), 
Pnick VARCHAR(10), Pass VARCHAR(10), tel VARCHAR(10), Pdire VARCHAR(250), userImage BLOB)
BEGIN
	INSERT INTO usuario(nombre, apellido, email, clave, contraseÃ±a, telefono, dereccion, imagen, Active)
    VALUES(NPuser, NLuser, Pemail, Pnick, Pass, tel, Pdire, userImage, '1');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `buscar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar`(bNombre VARCHAR(50))
BEGIN
select articulo.idarticulo, articulo.nombre, articulo.descipcion, articulo.unidades, categoria.idcategoria as cid, categoria.descripcion as categoria, imagen.URL as img
from ((articulo INNER JOIN imagen ON articulo.idarticulo = imagen.articulo)
INNER JOIN categoria ON articulo.categoria = categoria.idcategoria) WHERE articulo.nombre = bNombre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `carrito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `carrito`(id int)
BEGIN
select cr.idcarrito,cr.precio_unitario as precUn, cr.cantidad,
cr.Id_articulo,a.nombre as articulo,a.descipcion as Adesc, ct.idcategoria,
 ct.descripcion as categoria ,cr.Id_estado,e.descripcion as estado, i.URL as img,cr.Id_TipoPago, tp.descripcion as TP,
 cr.Id_usuario
from carrito as cr 
inner join articulo as a on cr.Id_articulo = a.idarticulo
inner join categoria as ct on ct.idcategoria=a.categoria
inner join imagen as i on i.articulo=a.idarticulo
inner join estado as e on e.idestado=cr.Id_estado
inner join tipo_de_pago as tp on cr.Id_TipoPago= tp.idtipo_de_pago
where cr.Id_usuario=id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `compra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `compra`(idC int)
BEGIN
update  carrito
set Id_estado=4
where idcarrito=idC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllPrd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllPrd`()
BEGIN
select a.idarticulo, a.nombre,a.descipcion,a.unidades,c.idcategoria as cid ,c.descripcion as categoria, i.URL as img 
from articulo as a 
inner join categoria as c on a.categoria=c.idcategoria
inner join imagen as i on i.articulo=a.idarticulo
order by a.idarticulo ,i.idimagen desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllUsers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllUsers`(pActive tinyint)
BEGIN
	SELECT idusuario , nombre, apellido
	FROM usuario 
	WHERE (Active = pActive OR -1 = pActive);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetImageUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetImageUser`(INpIdUser int)
BEGIN
	SELECT imagen
	FROM usuario
	WHERE idusuario = INpIdUser;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getonePRD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getonePRD`(ida int)
BEGIN
select a.idarticulo as id_Art,a.nombre as articulo,a.descipcion, a.categoria as idCAT, c.descripcion as cate ,i.URL ,i.idimagen as idM from articulo
as a inner join imagen as i on a.idarticulo=i.articulo
inner join categoria as c on c.idcategoria=a.categoria
where a.idarticulo =ida
union
select a.idarticulo as id_Art,a.nombre as articulo,a.descipcion, a.categoria as idCAT, c.descripcion as cate,v.URL,v.idvideo as idM from articulo  
as a inner join video as v on a.idarticulo=v.articulo
inner join categoria as c on c.idcategoria=a.categoria
where a.idarticulo =ida;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getPeti` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPeti`()
BEGIN
select cr.idcarrito,cr.precio_unitario as precUn, cr.cantidad,
cr.Id_articulo,a.nombre as articulo,a.descipcion as Adesc, ct.idcategoria,
 ct.descripcion as categoria ,cr.Id_estado,e.descripcion as estado, i.URL as img,cr.Id_TipoPago, tp.descripcion as TP,
 cr.Id_usuario, us.nombre, us.apellido
from carrito as cr 
inner join articulo as a on cr.Id_articulo = a.idarticulo
inner join categoria as ct on ct.idcategoria=a.categoria
inner join imagen as i on i.articulo=a.idarticulo
inner join estado as e on e.idestado=cr.Id_estado
inner join tipo_de_pago as tp on cr.Id_TipoPago= tp.idtipo_de_pago
inner join usuario as us on us.idusuario=cr.Id_usuario
where cr.Id_estado=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getprodbyCt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getprodbyCt`(cate int)
BEGIN
select a.idarticulo, a.nombre,a.descipcion,a.unidades,c.idcategoria as cid ,c.descripcion as categoria, i.URL as img 
from articulo as a 
inner join categoria as c on a.categoria=c.idcategoria
inner join imagen as i on i.articulo=a.idarticulo
where c.idcategoria=cate
order by a.idarticulo ,i.idimagen desc
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUS`(id int)
BEGIN
select nombre, apellido  , idusuario ,dereccion from usuario
where idusuario=id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inicio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inicio`()
BEGIN
select c.Id_articulo, sum(c.cantidad) as cantidad , a.nombre as articulo, a.descipcion as Adesc, i.URL , ct.descripcion as categoria
from carrito as c
inner join articulo  as a on a.idarticulo=c.Id_articulo
inner join imagen as i on a.idarticulo=i.articulo
inner join categoria as ct on ct.idcategoria=a.categoria
group by c.Id_articulo
order by cantidad desc
LIMIT 3;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListCom` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ListCom`(idA int)
BEGIN
select c.idcomentario,c.texto,c.valoracion ,u.nombre,u.apellido
from comentario as c
inner join usuario as u on u.idusuario=c.usuario
where c.articulo=idA;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `logAD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `logAD`(Pclave varchar(10),Ppas varchar(10))
BEGIN
select id_admin from administrador
where clave=Pclave && contraseÃ±a =Ppas;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `logUS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `logUS`(Pclave varchar(10),Ppas varchar(10))
BEGIN
select idusuario from usuario
where clave=Pclave && contraseÃ±a =Ppas;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modcantCar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modcantCar`(idC int,cant int)
BEGIN
update  carrito
set cantidad =cant
where idcarrito=idC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_comp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_comp`(idP int,idC int,cant int,TPP int)
BEGIN
insert into carrito(cantidad,Id_articulo,Id_usuario,Id_estado,Id_administrador,Id_TipoPago)
values(cant,idP,idC,1,1,TPP);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Puedo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Puedo`(ida int, idu int)
BEGIN
select Id_articulo from carrito
where Id_articulo=ida and Id_usuario=idu;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoveUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RemoveUser`(pIdUser INT)
BEGIN
	UPDATE User
    SET Active = 0
	WHERE idUser = pIdUser;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-04  8:37:47
