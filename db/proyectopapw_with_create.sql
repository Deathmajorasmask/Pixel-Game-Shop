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
  `contraseña` varchar(10) NOT NULL,
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
INSERT INTO `articulo` VALUES (21,'Atari 2600','Consola Retro de compañia Atari',20,1),(22,'Nintendo 64','Retro de Cartuchos',10,1),(23,'Halo 4','Bungie Studios',50,2),(24,'Mando Xbox','Mando Xbox One compatible con PC',10,3);
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
  `contraseña` varchar(10) NOT NULL,
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
INSERT INTO `usuario` VALUES (9,'Zajim','Majorasmask','zajim_link@gmail.com','Link','Password','8118586146','Shawarma',_binary '�\��\�\0JFIF\0\0H\0H\0\0�\�\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(�\�\0C\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((�\�\0X\�\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0���\0\0�\0 �HD�@\0\0\0$\0H\0�&$\0\0�J$�6\�\\�\�\�9�\��:��\�N�\�\�t7�\0$\0\0\0	\0	y���py�\�\�\0�bt I��\�a\�\��iK�������;U���\�$V��i\�|\�\�^=���\�\�1\��yI�\0I	\0\"`�<h\�\�#\'� \0�lN�	D�kx��G����չw\�`�c�\�\�y��\�;�6e٢(^��7h\�^\�\�Q�U��촧wk\�ݏ�ϰ#��A <\�Fo8<\�e\�\0\0\0\0Z�H\0j7\n�\�/u�m��\�\�p\��J�L�2�cə\�<LFL�Y\�^\�,�U�\�\�#�1\�\�>q\��tpy\�\�/�$\0\0\0\0\0\0\0�\'A�Hp��kYw\�]�>�\�\�>�\�ى�U�\�8J0C,{��D\�\�\�\'�U\�Lu;.���l���@\0\0\0\0\0btH\"��44�\'\�y��\�}�&���\�d\�\�W(^G�EX�V\�y٣\�#$��LI�$�{��.R�x�\Z�\�[�$\0\0\0\0\0\0$�\'DH�l瞥��\0L�q�F#:\�M��I�g\�\Z\�M��\�M��5��\���[8�V?^�J\��a��q;n�\�C��� \0\0\0\0\0��\'@\Z����\�7\�X��\�鿕�N\��֯���vz�\�\�)Y\�g/X�\�7�f��l;-A1\�KM\Z|\�\�\����b\�Z̫حf\ZϠ��\�\�w(\�\�\0\0\0\0\0\"`�\'@Ə?9\��]*\�]\�k=a6�lЄ\�E\�oZ\�)\�\�]\�vd\�ŽOI\�\�&\0\�k�MQOg\�\�ٙ)gH��\�KQ\�r]�\�\'\�\� H\0\0\0\0\0Ij1\�gǈ�\��|\�==\������\�ު���\�/^frt�p�.�\��o�9\�f�\�\�\�^���\����)K\��\nƓY��k\�*Q\�\�<\�K\��wk�|\�Mjv�G�!�@\0\0\0`yD\�1e;�ک�>\'\�_3�h��\�\�ٓ&K\�nL\�x�|\�\'Q\�\�:����\\\�E_�Z�l6jW�WM�]��h�.K���?��\�=\��Z,t�N{�仭\�[\�\�<�<�&! \0\0\0d�\�)��� ��[|{\r��ބ�񔍎����j�I⯖�w\�-_�k\�o\�\�Sg+\�\�\�\�%ki��~Y\�u���^\�g\�g�\�\�\�@\�y:1��\�6\�k0�荆h���)�$�gף7�\�����\�I�\�\�Љ \�\0\0\�8��k�~�\�]\�;�\�֋m�~�m�;ͱ\�6�1s�Ǩ�F,\�\�XvϏ\���Jkkq�6Z��ۉ\�a����K5�w7��J�bl�\�,&&@$\0�\0\0�\0��9~��OƱg�\�\����W��ӱ�_:�s-YD\�Ā�I�H#�\�8Lm�u����[\'\�Yey\0\0\0\0\0\�\�\�3F1&&h\0!	J�\�^}�zx~��~\�^o�Bbb`L��\�5{I�%	 p]�ϱ�G�\�\��\�\�<�\'o9Ә	G�{`�>kAg\�$G��B=z<2�My�)��\�D��A\�\�~6��z}���t\rF\� �S��Úb` \">s\���_><�,�Y���v\�\�Z�]�Y�\�#\�D��\�\�Ǵ\��bfpz\�O��$\0)=de�l�Z��\��\�!?\����f�\�\� ���s{{|5�\���\�.x0\�\�\�-�\�\0�ܜMm~\�Uͧ�\�v�^�o�>J��%�עbP�\0\0$�Q!\0\0\0\0G�r?7�\'ƹ�w^�ӣ;\�2�\�v�^�\0\�=o?G\�X�ޘ�z��&\0\�\�D�\�;\Zi���0\�hz��F=.p\0\0H\0\0\0�\0\"pyV\�V��^k��ǒ^\�_\'��\0)�ܟҾk�,t���\0�|SH\�j~��\�\�6��\�=t�=F�e+�5:\�U��&zf\�a��_3��\�r\�\�\�8����u\� �	��a\"&	��Ą���Ǧu=[�\������I,y\�~�\����\�#�\�i>1�_�e����\�1ٮ؊>�%3\�bgiOz<��|�]�\�\��v\�\'\�\�D��\0\0\0� \0�\0��\0D�0��\'�ڭfV\�F�w\�\�\�y�)�\�_\�m�؜gIK\�9ݷ��W��O��H�� O�{ɋYe�\rF\�Pd��\�f���E\0D�0J$��  L�&@Hǧ�8؉\��a��\'�\�>ˡ\�/�t\�Z�\�\��\�\�8z��\�\�\�c\��\������J&a� \�3�:�\�\�\��\�\�\'H\0A \0�\0\0\0\0\"@�K�~](\0\0\Z^S\�޸r�\�m\�q�љ��u�#ir��\�\�\��\�~bRD�u=�#&矋GX\�\�\�=�����\0M;�aTr\�\0\0	 K��\��;�\�z\�uu\�mZ\�cѮ�\�\�N�sZ��(�J��;(5l�O,b\�\�N_}\�^z�o\�\�ts�.5Wk\�e`	H$H	F�\n�m\0%��\�G�\�\��O���\'3\��wȭ�0T�\�s�\�D�\�\��\�Ju���\�+\�\�\�o\�\�\�\�\����\�\�;\���\�Ɔ;N\�\�\�_B@D�\0$E+ԡPr\�\0\0$\0h���q{sT\��}��עy��OI\�|�\0l\�\���\�\�\�\�\�Z:N�6^W��`Dky>�\���\�\�x\�-�a�D\�\�2�kG�ޙ�W�H\0��+�a�c\�ɠH�\0\0A kvuf8y\�i��:��\�\�\�jbs\�	#�\�׏���?K�:-\�pٜ\�\����&��:\�O��{\�\�\�(�^ƾ\�\�<�\�$BD$!b`\�\��\�\�YD���HLI�f\�b�|~\\3\�\�\�\\\�z:��yi�=�&i\�w:\�\"\\\�gw�\��m\�j�el��\�\�|��1\�b\�E70{ƍ��Vӧ9�X\0\0\0�Ū������$�\0\0�hS��\�\ZN_\�Z�1\�\�J[sVˏ\�\�ݍo��ߣ\�:l�ݢq\�k�\�ޜ\�Lt�v7�\\\�?oqK�\�\�;\rnʷQ�J����7z=\�\�\�\�\"@�\"@A0�9>��\�\�)\�\�0��H\"Q$��B`�o\�Bڝ9�\�\�&:�|}\�Ss\����\�n0l/��s��\�Lq[����^?��[s��3\�\�X�*ڪU\�iw�g��\�&:) \0$N�m\�w�[\�^}Z��\0mx4�\�i�L6�>�*8�\����?:~^�ٹXۛ\�Q�>a\�j�zN�=�Ͼ�M�e\�V�\�\�ﴛ��<�E\�Z]\�E\�\0$H\�\�:�W�k{�v\�s�Dڑ�<�\�)E�(\�ޘ���D�7��\�sI�\�~&�����:���kN\�\'�-�\�>�KLx\��2Ţbk�\nw*[\0�r�+\��\�DH�\00I�\�8�oPsmoo\�ښ\�^=ڊ7�:\�j+|�]C|�\���\��z�\�~l�S	��T˙0&%	!0\0�)q��ڄ�e�\�tRE\�\0!!�\�tt�\0\�\�&\�L�\�M��f�\�1��\�`�j�ZrwZ��{SO8�\�\�=�ѾV�j\0H�\0H��\�N�h\���\�7c��	 $\"Djv�\�\�<�\�\�\0���\����-f\�\���4Ly�߬��{�\r6�cl�@ �<\�\�M7�͊%0�#M�\�\'\�I��\�\"mG�i^��\��fD؄�	$p2\�\�\��&=>�\�\�ߌ��f�[V����Z:��I�n��[��~\�J(&\0(R\�k\�\�ls���y�51#U�\�t��\�[\"k�\�zH\�\0@L���q\��\0L��\�,f-\\�	�Ii�\�m�nDڒ�H \0\�\�+|�@�-D��kd���7~�\�|oH�H�\�\01\0\0\0\0\021 !0\"#4@3$AP%5`�\�\0\0�\0�{��)�B\��P�\�Bn)\n��	�\�5E\�R\�MJX\�+*�t�42`Q\�\Z�\�T��\�h�w�uW.r�hG\�IUh\�4ꢪ���Q�D�<����@\�>���8~�\�U���j\�r�\\\�\�\�%�%.)T��Cԏ|�=�j�h�\�5\�Cl���p���1O�w�\�\\�˅j\�r�\\�t�\�S}LF�X$��YPQ�G-\Z\�\�\�WM�=\�buP]J�/���5\�43/�r�P���d�PL\�\�\�%x�s��ܮWeµp�W-}3\�Gj+hjQZ�y\n�6&�\�\�ꐝ,�GN\�(\�c2$\0\�B2ʥ�rf\�\Za]&\�FQH\�KR\�\�ݪ\�\�_6�*\�\�V�r�]�\n\�\�\�]\���I�N\�V\�iA�\�}L�$95�q�&��\�j��m\n�B����5�\n<5\�Z\�\�EX\'̝��%\\�\\���ʹs��ܮWeµp�\�뭪e$�i<�\" \0^\�ǰ���jS\�\Z\Z\�NOg�\�\�\�\�77pc�\n��ʵݕ�ܹW.W\n\�\�W.r�[�*\�V�=D�+\�eDlt\�kYv�c\�6Fݡ^@\0=\�C\�7!���7T\�nj����ݕ�ܹW.W\n\�\�W.r�[�\�\�^[\�h\��w\�C\�c�4Dr�\0i\��3\�;6|��\�p�J�s]O(��\�V\�ʹr�V�2�]��ܹWe�\�D�2T\�.�)��\�D\�\�{��۴\'�{��\Z\�nkN\�	zuW+��[�*\�\�\�Z�\�\�\�V�r\�\\��\��*7�,\'\\������؛\�fZ�\�(ֿ߫>\�~y3Ó�\0��N�+��[�*\�\�\�Z�\�\�vV�r\�]\�\�\�5X�\r{�\���61՝�\'�_�u4l�J7I�Yc�\�\Zw\�5\rv\��\�\�Q�0�~J\�vV�r\�\\�\\+W\\�\�\�nWw\�<T\�\�\��6��9�43^���{��\�\�\Z	\�=\�Ώ\�+ݩh\�AOn\�)*\�黲\��X\�u\n�N�\�E\\�\�\�n\\��+�j\�+�\�Z�ZwT�\�&\�Os�x)ii\�\�\�\�	/N(&|\�S&���w���s������\�~\�k\Z�teQ�\'\r͍ڵAbg��)�x\�\�vV�r\�\\�\\+W\\�\�\�ǣ��\�i:�o\�\�\�L��2w4�l#\�\�N�}�觅���f����\�D\�nlǧ6N�J�t�K��q�\�\�V\�ʹr�V�2�]���\�#b����\�Q�\�T�㪦�\���?���[��H7GL5�W\�t\�\�\�ÝK:ucX)d\�F\�dn\�\��\0r��&\�\�Z�\�\�vV�r\�\\�\\+W\\�Z\�ݸ,V�\�%D\�S]!ԟ*�\�vU\��\��I\���lCl8k<Fѹ\�1��H\�&�I���ԝ�p\�5|����Wej�.U˕µq�˜\�\��B*��C��Z\��Ҫ\�\'R|�aT���~V\�\�\�\�\�A�?\�*vb�E\Z��\���D��D1\'ja�\0�\�X\��\�7X�~,���p\�L�.W\n\�\�*\�vV�r\�\\�\\+Wxrݪ\�vV���Q\�QQ%D�i{\�i\�D\��\"\�HI\�4h�⫥ۋ<\Z�\�E^�W\�լT�S����TT�h*^����\�W\�\�))&�}$̣��D\�D|=�\r�\�5�\�\��a7�\\��ܮWej�.U˕µp�\�*�r|���0\�\�\�U=,4\��@\�\�宭w\\\�AT�R����pv�\�x�!\�K�\�Y�\�\��\�[�)��\0׏!�! ���ݔ�w\����X\�\�\�\\�\\+W\\�\�\�n\\��+�j\�p�W���Z��n\�\�\r\\�\���:.hU0��\ZH���bu}F\�:\Z#1Lazda����l�\0\"���\0%b��\r+�5T �Z���\�Yi0o�cR�jczC�ʹs��ܮWe·.U�\r@j\r\�X�Gʽ\\�� �\�)\��8\��6�W�T)筦Q\�ZI�\�	�U\��\�/\�28W\n�F\�Z�T�U4K\�?�\��ǩ��4\�kN8�\�ʞ�\�ꡆ*x\�ӪF�-mV�*\�\�\�Z�\�\�\�A�7E�\�\�X�Gʽ\\����\�4n�]F\��r��Ŕ�S�%\n�\"|TM\�MI\�6F^��CQ�\"ֈ)b\�S�9b\�ᘋ\��9��\��\�J\�N���\�\n3\�l�4 +U��ʹ�\r��\r\�i\�\�p�<#\�^�\��\r/Ħ\�N�\nv?�\�ؖ3^��\�\�.\�\�\�9�r�=�\���:T\�j�.�\�h��\��Y��*H��\"e}\�\���A�-?B�<�\�X�\\�\�\�\�GU��<���HǹW`\�E6�\�ʧwnN��%\\\�C@Q3cr��\�O�Բ7\�\�fR���A��+\��V+Q�W,F����e�s�F\'L��4؜�Y\��\�\�\�\�XC6\�~�\��\�\�X�GʽT��G!U�uC\��\Z�\�T�-�i/|q�2?\�\�n�\�-V\�r�r�V.�>tォ�\�W\�r	0�\0ї�Uw�Q�|�\�V\��\�丂|er�\�\�nW+\�+�a\�H5���\��/\�\�\�\�L<:\Z��ij!�2*�\0\�\�|\��7�\�\�	$\�r�\\�� ��vy\�3\n\�j*\�z\�p�: 4\�cf����\��v&F\�\�F\�\�F�\�VﾵA���\0;�\� �B*\�vCP�H;<\�\Z\�= �V��W�\�\0SZA�nʵ��\�1\Z-n+���\���+:WO\�WZ�\\��\� [H;<\�\Z�nW ���vy\�5\�<a�1E�x�X�4Ӵ�79\�\n9\�LҶ�\�?�<k\\�	Y\ZA١\�5\�~�\�Y�\�=\�c\�\\�\�����n!��Q�\�HO|�}lՇm\�\Z\�\�&�u\"��\�/\�\�:�\�z}�c\\���5�1��\��\�X;u��\0�\�kM\�\�i\�Z���k\n\�1\'�\��\�\���d1\��+P�c\��\0 ~\�ܰV��\�\�-\�]�wm<.V%\�\�\�����v���;v\'A�X_ӟ�\�>�mUkav\�I\"��\��v�a8\�\�(���\��\�	\�\"�W �A��\�t\�\�����#\�q�Ϩ�jQI��\�9:�\�\�\�YOS-\"�FJ\�4�@%���EbCƩ]�T0�\�f�<�\�\0A \��k\�����M��\0Ȫ6S\��oAW3�D<�\�c\'\�F\\!�EOnΖ<�tm3�\�b\�\�~\���\�\�\�i�d\�\�X\�FX�?\�\�arm�\�>��v\�(��xQu\��\0��x\�F�%�\0!���\�\�Tr-Y36�<j�\�\�ճ�4n1�1�b\��\��s\�,Z��\�CD\�\�*\���ZB����T.�R�G�uTup=\Z�\Z��)-Ii;�b\�3\�F\�\0\�@p\�\�S��\�\�;�\\�N���?��Ź�2�e�\�\�Xwv\��$z\���5SM�~\�Q\�Q\�\�0�Tӽ��T5{��7L�a���wK%SPjb\�M[��Zw?\�_K\�Nk^L�^\�#\�\�t��o\�mM!öx��w\�Q\��\�\rDs~ӎ\��4�ՉS\�\�7��oNv>��\�\�- �)2\�\�D�{���rtGj|�SGMW\rH�z\�\��UA�Ҫ	�2\�\�XQ�RS���M�\�\�\�\�c\�\��1\�\�T\�О��%MSCV���\� ���\�uc\�H\Zd�2�\�?d\�\�R�I�`��R��;d��9�\'\�V�?��\�c\�rF�#;KLe�j��%����F\�\���\�LF��^�3��$���l��k�\����\�1H�����\�\�\�A~NU5�S�[��`?ܘ\��ܛf�XS��\"\�Kj �}o\���875A��Mw����JJ\�\�5M]U6UC\�`qm�7\�\�\�\�\�[��R�eW`�\�(�{��\0�\�WBeC?F^\�5�-�\��\�b��\�\�\�\�\�i\�\'o��\�\��X����\�g\�B2\�\�\�Gݎ@H\��\�\�\�\r=�\ZJ��kI\�D\�{fn�cv��\��O��\�zc�M;g����\�}3�d|1�(�dpt\�	?o�X#\��{X\�\�\�\"xf��*�G\��j�T7�\�n!Fi_�E��9&�%&\"\�-D\�焃\�#��\�3�}��\�{df��<:��TG\�\�Z\�1�=��D٢���X2ħx�\02�\0qQ\�\"�`,hcs���t�\�\�Q\��7�Q�\����RuP:\�A\�\�*�!7�(�Ǟ*4�*ߥ[ٺ�gC\r�\0QU>S\�\�S� q\�\'��}�{�ܹTRE9���\�N\�|-\�[��\�`\�n��a�ZY�VF��\�\��EN`�)���\�L\�%��\�\�\�c�2{���&�\���1\�jh\�#�k\nv�\�QV\�T!P\�\�[Pݵ\Z��\�\�s��+�m���=��6USI\�\�\�\�N\�k\�$��\�<�UB��UKA(�\�$�M\�WY\�w\�T*:���\ng�H\�\�$PGч9�)N���vʟn\'�V�D�\��\��v-a;r2}�;|S\�\�\Zq&(+�����ҭR��}\�?�O�~On\�\�\�Ջ۳��߱�\�=�h{CQ\0��WGӫD\�)ZYM�r�IՃ<X|\�;{\�\�P\�;�?�fڅ��\�\�!3\n���YK%o\�S�$����y\�Q\�[L��\�\�M��\�W�3وGԤ\�v!\�htC\�l\�	�5ݵ\���\�m\\}jpuZ���\�M\�i)˘ưw\�񟰞���v��a\�\rWG1jc�\�Oh{\"s��@�\�%<2\�?}o�4\�oe�\�\�\�\�)K\\3�0�#\nc\�\�7)�ʠt1J��7|t\�>Ǟ��bm�݌qa�`\�\�@FQ<�\�!�W�\�D#�\��r=�N�z�[;���2F��H\��$Nb�M�yU,\�@ù�1Ŧ9C�\0No4\�\�vk�o^(?\��G9	�\�1����m\��M�\�J\�4\�\�td�\�ʯ\�C��7�s)\�ԇ\�X\��:�@Q\�Ppwm_ƥ4\�sN\�\�<z�\�C\��\�r���:3��\�6�\�\��U�U�u\"c���x�Q��\� ��:y4\�\�_�_zBC*�\\\�O\'�x��}Hp\���\�~�\�|O\�nگHA�쨦�%j\nwD�i�Zc��\�\Z\�g�8B���\0�\�\0(\0\0\0\0\0\0\0 !01@A2Q\"BPa�\�\0?�\0��\�2!��5�_�A�b?�	\�,�\�\Z��\�b\�ZW1�%\n\�e��\�GK�\�8We�\�JϪ^L�\��1~\�|�\�%j�^d�K\�T�֕\��\0C\�w\�m�pb�z>9�^[1G\�g�-}\����\����bǹ��C��bմtFZ\��|�\�/H\�\�\��j\�CvZ,��\�IJ��\�\\!-�\�}��\��92�֎z\�\�DlK\�e(�uG\�(\�\Z\�O�i�����՛J�\�\���\�\\\�H�]x��+J��%cU\�>\�e�\�\�ŗ�\�\�\'R~�t���\�\�\�EW\Z6�J\�\�f�E�J\��\'��Q^|�FwL\�\�D�\\R���\�\�\�f\�ql�a{dfVa�vA\�\���Q�*$\�L�\�˴\�W	;F\�_І���\�lD�ףv��ݫu�\�W�K[\'\��\�&�\�]�\�n��5�2\�\�Y\\X��/��\�\�\r��g���E\�,m�wL��%�Q��2ܯ���AڲFE�D�+\�\��gN�dmG�\��#\��U��\����Z�\�\�k1Or�d�*%���\�?�\�W�\'\r\�\�,�U/z\��\�D�\�c\����\�X�]����\�Ż\��\�\�\�$b\�\�\�\�\"�\��m����\�]�G\�\�\�)��X����юR\�\�_d\�\��\0S\\}�|\�\��<nR�:����س�\�/\�`}W�\�5�\�j$�QD}i��\�Cg\'\��kTƴCZ׍�Z\Z\�Hj�kć�临V�|k�\Z�^�&5�h֏�=xP���z�\�\0)\0\0\0\0\0\0\0\0! 01@A2\"QBPa�\�\0?�\0Jg\�s��)\�\�+��K�1�\��_\�_\�r/�Q�!\�|�\�&�?#ê\�s0���\0$\�>\�����(�	К\�\�!Q�\�~\0��R`E�\nCS�7�00���\n�\�Շx.xoh���1n�:T*\�{�*D���/��\�u7it�g<ΨکP��* X2v&�)͋�|wKc����l�5�A��0�2�vu!\�p���r�9����GHQ�&�	�ݞ� .\�#\�݃*�=��U,�\�t \�Q�P�\�~��v�2\�h�&UA�&���@U:\�7��\"�\�I�\�kp�P\�p�p%�\�B1`\�\0�!TU���\�9ޕ6�\�o�\�DA�!~@2�}U>\�Z��r-\��T~ʇ\�\�\��6V\�S\�|a��\'��dm�p��£�o��\�\�x���UU�Q\�\�_ګ�Mv\�Wj��\���B�\�\�c�O\Za.����+ j�\�K�\�&J�=\�l\�g� &�\�:�t�+�*���F��\�M\�p>\�\��\�ӂ�\��\�\����Bk�\0�s���*�\�\\�5\�\�;\�\�U\�ѽ�E\�z\�\�Nw6�r�\�.��\�\�x\\\�\�Tl\��\nM��\�\�ͩ*�\�t\�<	�B{b\�v�)�\�~4ޗj�W�\�s\"�\�Qڝ(	B�\�S\�8\�޷\�\�k\�����GVa̓u[��z{\�p\�ke��;Op\"��a\�U;s����*g6J�b\�\�T\�`�L\� �o*v\�i�cf?Js�na���,\r\�b�\�a���\��Ѕ\�݆\�\�\�Sr�B\�\�\�{\�;�S�Z�[�\�	CiC}>��\�\0D\0\0\0\0\0!1a \"AQq02R�#@Bb����3r�ђ�\��4CPS$cs�p���\�\0\0?�\0\�[/eK\\��z��\�\���\�m6�y�~�\�\�i<7�\0�d�`�z���o�tG\��U���\���W޶#\��\�c�^/\\�HY�8�r\�l��>�\�*\�\��U�\�s�\�z��\�\�\�\�D³T�\�㽪F����2�K�j�\�R\�!f�\�ݿ�{[̨�\�\�9\\͊\�W���su\�\�\n\�\�2�\��.���^&|ƓA�3s�\�\rM\�+5ş{w�߂�\�Z�b�P\����,\�T\�����i\�}Zo�l���_\��j�C��\�3[2\�Ks>kkk���e�\�\�N9�a^)��\�OT���.F\�\���\�\�3\�ô\�Y�8�r�#-R1Y�r��\�HRkk����q�\Z\��\0_��w*�+\�G\�^��\��oѴ@[U\�ʥ\�?U�<�_r\�k�\�/\�(n;�[`��_Lp�+\�\�\�p~�\�B�,�������+�R0R\�#��(8,��!g\�HoV\�,�z*�x��(u\�m�\0�\���\�G5{�\Z\"qԗ-\�o\�a�Vb\�\�Y��G5�\�\�\�)i��?f�\�VB��\�C����,\�T9_������\�9A�d�+�3Q�C�N�Tˊ���_pQL(n\�^\'r���ժ�\�4�OY�\��*\�>!uUc�\�|J*�\��KT�Vj\n��\�H�KVj*��]����\�9AY-�ȓ�5=�sKg�7��Rnb��A_{�\'D7���\nJ���\�P\'r\Z\�\���c�\�Uo\�A\�C�\�)j��\�C�JB��PqP\�~\n\��H\�f�\����\�~c�\�\�\���;\�%\�Z�y\�tXn;\�\r\�tw}B\�\�\�7;\�:���\nq\�8PpW`��F+5AY))j\�A\�C�\�)j��\�C���\��8�n˛���\�\\7	ܰ��N\�}53\�q::��� b\�\�\�E\�7艹�k5PpW`��F+5A�d�`��5W\��KT�Vkk�\�\�ޫw����ԓ��|�f��#\���\r���2Ճ�\��\Z�rmOk\��\�T9A�]����\�d�)j\�A\�C�\�)j���\�\�e\����\�>:�}����\�y\'�_��4Jk8}Qv\�\�̪�g}�w`�j]\�)\Z\�Ӡ\�8�\�--Y�8�r���-R1Y�*\n\�H�KVj*�\��K{U�\ZV\��]]-���\Z�w��}\����܋�y\�\0`�*Jh݊\'���}G&�����\�\�\�e���ﮇF(:\Z\�|JF\nZ�PqP\�����\�d�`��5PpW`��\�C�`�\�Z�_kyOĦ�{�\�u\��㊒�ϒ���j�<՝\�\rk{��+#EC�T�,��N�ơ�\�@W��\�ſ��4\�Ӡ��\����\�Y��T\�xAR0R՚���(8+�R\�#�������f�\�\�\n\�=�l�\��\0\�D\�\�]�P1ݥ�T�\�^�\�%\�}S�6=�`w�\�9�L��\� \�u\�3�h�x�Uw:~+%#-Y�8�r��\�KT�Vj\n��R0R՚���v��\�D�Ty\�J�\�Z�o\�\��\�O��O\�Y\Z*W�=0H̡80J�]F榳�\'�ԟf�\�;+Ճ堄\n���g�{|L�����R0R՚���(8,��H\�f��+%#-Y�8�:\�/�\�\�\�\�pV[\�t=\�� &\�)��I��D�8\�cT�\�m߉\�@ۛf\�\\\�(\0��\�o=Rx^9��@\�^��\�ϼ\'t��r*��\�T9d�`��5PpY)j��\�APVJF\nZ�[Z�+MR\�\�ww�VXNn\�\�y\�\�\����G^\�w�T�*w�t[w\�T��T\�x��\r\07�p\�4\�7�j�g��CQ\�J����A\�P�)͙�\"\n\��\Z\�R�\r\�\�\��C�h�WC#�\�+5Y))j\�A\�C�JZ�b�PT����\�A\�Yr��5\\n\�8�>��\�5��\�pA���`h�8��\�{����Mk�\��\��Z�\�.�r����	�=\�\�;EC��^�J��\�\�R\�>-\��G7�E\�\�lюn�\�\�_\��V\�96����s�\�\�<\�\�\�\�(��ɶ�\�N@.������\�A\�C�JF\nZ�\�A\�C�JZ�,\�d�`�+MY�8�\�\���\�f\r���Z\��\0u�\0N\�\�\�6?\��:)\�FCD�b0_���<=���4Zi\�2\�\�}�*�w�^��\�ud��\�\�\�\�\�K�\Z�o�O�\�|�S���e�\0�U��\�\�\�\\M�&��m!�o�<b��Vj\n�,���f�\�\�%-R1Y�*\n\�l�n\n\�Vj*˔�L�- �+�\�m\�\�]�4ؼX���L\�\�rV�+\�7p\�\�8X� 9�>�\�p�h�f��9\�\�\�\�_F�V�;\�̩S\�\��\0,\�\�[m�\�)^��_��\�ARk�x=)ߥ���\0�\�@7�pP/U-R1Y�8�r\�H�KUب8�r��\�KT�Vj�FJ[��՚���\�:C{���\�J��I\�Jm.�Nc\�r�l�&!ײ�\�5:�?��UCj��\�\�i�\�p��8)v�>���bQoE�\0�\���m7�w&Ҩz�\0��ܪ\n?�kg��N�%��\�Ui��R�y��\���\��\�qs��@�\�ShcT2[K��+�^}�9(8,��H\�f��r\�H�KUث�P{v%-�Zj\�A\�Yr}\Z�\�\'ҩ\�m\��\'CO�v��,�9\�#��̮�\�T��h���� qM,q}\'	�W`� �\�}j�\�V%�\�)���5�.�7�� H�pk?��}J��Y\�ݢ��Ύ�N?u�H\�}�\�=�)�\\�PpY)j��\�\�ke\��\�KpV��PqV\\�\��\�w$\�\���)���%T\�\�㞇\�y�ArTq�F\�d\Z�\�1R\���қ\�\�Yl�\�\n\�O\�}\�\�\�?0�\r��-�S�	\�Gtl�\�T�U��*���(v%-�Zj\�A\�:�^\�*�݋$/$�@�;M\�t��1\Z:\�Ly�\��!Y�\�M�\��\�]M\����WO6�\��{\�\�q{��\���c�\0\�\�\�F\�7��sK/�#J��-��J\�ZF+5P\�J[��՚��}Gh9�\�+�\�\�}��\��l���mi�-��U�\0�[\"�$\�m\�9��\�\\\��\�P\���\0\�x\��z����՗(v%-�Zj\�U\���i\�@�!6��H�.���\�Ez���M\�f���5���K\�\�\�#i�F+5P\�J[��\�W����:���46	o�W�\0\�t7�\�x���z�#-Wb�\�C�A�]��\�#��(v%-�8���:�=��^�\�\��J�*\Zq\"\�h۳hoZ���Ʃ�\��\�\�K��?N\�\�%-R\�Vj*�Wj\�r���i�F+5e\��\�]�Q\�Ej­2�*{$����y+�	*\�N��h��v�\�B\�\�2>Zn\�_��\�\�T�U��r��\�\\�����\�v\n\�T�Vj˔J�xTw\�E/1�Tk�qب�W�\�?P�n�97zg-6���e�c~\�qiR\��f�\�\�7+�R;y�8�.PpW`�)\�\����\�I\��\Z\�X6@�X{�|�sL�x\�m��c�`\��\��\�]R����t���p�pM塟�\�Ӫ$+i��\�>�-Y��?\�Ϧ�\��\�\�P\�Fu�\��\'w-Hpp*\�o�mM7\�\�\����x婟\�?��\�v>:FL?o�:u|�\�\'=4��C��l\�ǝ\�K»Z�i\�$tj�� �X �T�\�}A���6?���ʵ-\�m\��47��J?\��\�4kK\��� \�ni\�;���н 4�?�{\�\�@V�\��7��\0���\�\��z��\�%i�[��\�d�M�^ES�,����~�\0uӫ�u:E��*o\�oE��]M�\�!K�������kut\�Y[�7s]oHu���\��\�\n>\�kt�\�\���f~\nF\n\�T�TU�(ܲ\�+�mSǒ�%Q��\��wZ$�\�&�W\\9���y\�\�q\�QT߼�\�mA!Y�MZ?i���\�no�j��\�TR�/\�\�Cq\�Nz*;�S��\�fӾ޵��b��q\n\�:Ů\� ��]�$*_�!\�\�ޫ�%\�\��\�\�\n�����|�9��\�mSwQ�/�\�\�V����d\�[>Z	\�\�	=ǽSh��j{N�����T�\0(N�E��\�;�i�OٛM\�w:\�\�-5\��c\��\�k��T\�ny���\��<¡�+�Sࢡx�]\�\�r0Z���A�.Ԛc\�S�g�k�8k�P4\�Ͱ�6�\rn!T�#~�\0\���\�Q��o+\�*�HV�m3��r[5���z��Z\�\��_Z��K\�\�c�Ҫ��F\�5\�N�A\�ꉒ[\��N���g\�\�\�0�\�\�\�\�uod�Q}&÷�*\n����k=\�\�|\n��w�LUxk��z�5ܮ[R\�j\�6����pp�b��8c\�c踏`�\��#q\�?^k=�m{�lT|\�۷oW⺺�kq\�\�B��t\�\��U��\0\"��9:\�q\�4�Qu�g�uN�u\�\�M\�p\�+5�\\.\'\�j?���e\�S�A�į`�/m\�=h7�M7Y�M\�zf\���\�KL���\�\�sB���\�㒵H[���\�%�o\�q��N\�\�\�;>��󏾀�\�x���\�\�E\�g�R/	\�&��엧\�?��{p\�u��µ�o�\\\�J��ѻk\�q������������.�7���#��\�и���ˎ\�M;ٽ��a�\�\�\�\�s\�.-ލ#x�s\nȑ��E_J\�\�SI\�\�o�\�/�jX\�#��\�w�\�E��Hߘռ(|��\�H�i�\�\�j\�n\��ѳߧ�3\�\n���hr\�\�\�㒿\��P\���m��°\�\�\r�\�Z�ہֵKi�T�\r��\�u^(>Ֆ	>zO���9\�nrP�\�\���W��\0#?�K��#Ϳ^ص\�\�ru7b\���\�\�~��{M��Eિ��}>�����J�\�o\�U_˦\�{�Fj�O\�tT�\�hi�\�/L.�\��y��o\�7�\�s\Zn\"��\��\0m\�\"�ƺ\�F>ke�\��[u�v�i\��U��b\�i�8�\��\0wkᢓ����\�1Ż�;�1i\�۞c\�\�\�ۢ\�w\�^A�\�e6\�S5��\�\�n�����	\�v�?��P��\�3\��\�?+�B�c\�0\�t�o\�\�5\�]�\�˹jT\�${�E\���N�A�\�롙H�\�=���9�\�oBk��\�\�\�\�\�?e\�7�\��G@{;�Z\�5�V\��	�]\rc{\�0i��\�\Z\�\\0.1��\�ﶳ�;ͨ\\#\�Y�\�\�\��\�T\�wsBE\��i���#E�x�⥷�N\�b\�	iܶo�p?d\�\nc\�u=#\�\�\�]��-�\�|-\�X\�5$��y\�Ug�l�\0~]�Q\���;n`x(7<bVpt�5<wJ-p��\�\�\�WO��88du]M�c2O\"�\r�HWh�$��\�V=\�5\�\�VZ j557;Ӈ�Oö�\�-��}��\�F#�M#�\��\0�e/\�̾�R\�\�*\�\��a\�\�\�)��t���JN\�#M\"ց-h�hZ\�(D�\n\�\�d\�b\'�TǺ�;��\�wl\\1fר1�����\�e\�\�n+ѹ�w�E�W�\�s�#K�\�v����i�!8��\�)�\Z\"ɔZAN;N2cM�U3�p\�ɮ\��Φ}���\�f\�A\��{\Zy��v\Z-�&·�\�\���:�\�/�?�+�\����,�T{\�\�\�Rw�J\'\�?B�����\Z\��v\�~\�<²{w\�\�/o$\�L�\0 \�\�0�\'F˃[�_�~W2pvz\��8\�\�.\�?��\����6\�O�_\��\0	�\�c���z\�iWA\n��c\�)�\�l�Ԧ}��#\�\�\�o�>\��ķ�͠��۲��T��_ek��x\�c\�x��U9\\��P�ak�N�<Z4Q9\�\�]�	M>#kL`w\��\�>\���\�GjZp7 +	\"\�\�w	\�\�\�s���\�&�C@T|�\��N�\�h�u\�\�CݻPa�{�fT\��d�\0\�Լl�a]�\�xš��i����\0��e1<M�)���Kr\'\�#Z,0Zq\����a\�\��\�����ˎy���[�<��\�V[��_z\�uYPb\��Y\�=���\��1�\�oՓE�\�l44d;\nG\�-�ꊻ�\�\�\�xIn�8j\�qW\�\��%�!{\�\�֚�\�O^��o!ۗx\r���}�9v�3�\rK�R5/\�_�B����,�U\�\�!\0xj���[�Zn\�\�5nW\�u �m\�FJF�O\�c\���Gα�q�w�\�ґ��\�}\�]�~<W�R\�1��w7,�N�pU�VT�.\�{G	\�\�\�z�Sv����A]\�u\��:�b�\�\�sg\�H\�-\�\�_ϳ�\�,(=�\�i\\u[\�\�T�\�\�qP�\0����r#\�uj�����\�h�[ƛ�ͼi��ci�\�Ɖ��\�M������\0\�iT{\�\�z\�_��T�O�ci�6�R5\�x<jg����\�{J��\����K��\�\�\�A6]���{M\�E\�����tIWh��\0�j�\�\0+\0\0\0\0\0\0!1QAaq ����0�\�\��@�P`�\�\0\0?!�\0\� 4?\�\Z\�A}��f\�\�8_�:D�\�\�\n\�z�\0\� j\�*38�ޢ���S�\0&\�M�n+\�\�<%\�k\�\�1���9J�c\�R\Zh�\�s��\0X�Y]��\r�SN\�2����r����\0Gs\��4|\�=h�u*\rw;���\�\�\�q؉ɕZIl�S\� ��\�*|\�c\�z\�V�jQL4�A�Y{��\�D\�\�\�5�kj^O�u\���N\�u�\\Ч\�\�q\�,���zLzt]�9dX%��߼�\�\�\�5B�?��\�|,�.��\0\0Q,1\�NPO��mA2?Z\�JpۦTI%4��7�\���\�N�\'W4\�#(\�~��s7�9\�\�\�&�$\n� ~\�\��\�\�-U��̷zo\�I\�=_��vl�w\�1�	g\��\�\�\�ḯ�VG�Ť:S\�\�yM\�\�\�\�\�^\�\r\�)\n�\��x7Z�LB喋�\����%2�!$�\np ܆�e\�\�tq:��h�G\�@g\�\�\�\��\0\�<����z\��Oj��\�\Z8]�\0\'�X]^�\�a_��`�r�\0Aov^$�Z\�R�\�:\�V9@\�%6\�F�?B�\'�6T�\�π�\�G�x\�us��9en�BN�`\�\r`�%Z�$�\Zh�\r\�ge\�tq:��x�GT\'?᧴S�\���\�%|����\�;\�\�Z�c06\��s˫2�c�Q�س��%U\�\'\�hb�%q�\r`RP\�1b��\�d�Z��j�\�/�_.�\�ȓD�ӗY�\�:�Fr\�\'@���\�A\�\�^\�\'O��8\�\ry2-VJjԄ�S��i��{\�ge\�\�tqa�\�\�c�\�>&`؀<_!��-7\�3�\\\��M,4�w�k\�\�+��y8Z�\\��T>G�\�\�5���uo\�<\�\�\\H\r!\�\"��:�%��0#�3����jԍW��[Q+�\Zi��\������/z`ف@\�*�Q�y(�J\�F�p \���\�^\�+]\�f@�(�S�7we\�ק\�a�\�\�34��\ZC\�9�\�ڍǂ&A��! �Ѐ�\0����ٷ�_��\n� 7�\��}�h�%�����Y\�܃M��\�y(�$�!0s��l�\�K�b^���\ry2ʬ�m^P�JhF8oz�\�d�6`:0Y`�Ż�@���\�9`\���\�ˀ]\�\\.m#��\�0���\�\�-��Y\�VoOGVt\�᪒��\�fW`Ԃ\rYZ���Q+j&\�0v�\�\���+wr^�\�f\Z@22\�Q\��Q$�\�E80oz��eG�1�P\��\�\n]�\�3��1r�-<��\�j\�q\�G��\�\�1ˊU�S�濫\�0}_\�Hz_�}W\�OI�fh22\�SU\�T��M4\�G��/w�%\�s�,��]FU��W�$��M4\�C�i�X���{y\�!�\�P`}/��2�5�e�\�P\�\rdjk��\�q�\�Z\�\�s�\�˫��\�?ޞ1SVu8���O\��\n]9�&F(�\���\�4Ё�kR5^J%mD����\��\�\�\�N�%\�\�@\����9^J$��9\��iZ�~![\����\�:�\�\��	�yq&\�C�N�~��nѤ\�c�Y]9\�lQݎ\�%�z^\�#���\�\��\�:z\�\��\�ܑ\��1���\�/zi�h22\�S*�$�\�G��\�̽\�II{\�E�0\�@A�kQL�\�Tda�푯W�\�\"u\�r��\�{\�\0�n77�\�+W�*\�\�_\"��E�C��\0�\�0�\n!\�2\�L\�F~_\�zV\r\�	�\�\�G^�\�\';O\�ǵJ#�\�\��]Nnzp1�w �����\���h�Ձ{\�\�\r�0A�,�E2�\�%mD�X;=\\�k\�ļI{\�M�����Z�6�%x�\�\�a�\\\\��6��\0<��\�4�7��p\��ؕ�\�f:=l�\�#\��b�}	}ޟ�r��bixy@,\��\�Q�9� \0PD��)�\�V^��\��]O.\\I$m\�\�pîz^��\�fV���\�%�������P\� ȵ��U\�V\�IX;H�|��s/u�%\�Mb��jԄs\�~�\�b4�E�ٶg\�\�A��\�,\�qۙ�xV\�i�w�g\�_��5X�E[�/�5�[*�TCwB�\�^sb�g#�\��8\�%v�PQ76v�F�\� �p]\��\���\�__Ӄ\�\�\���\��~Fe\�*%\�Kޚ,��\Z22\�S*\�\�T�V\�=\\�e\�^$�\�f\Zrexu<j�XOkYlyKVc�Y�˞\�:���\n\�\'،\�\�\�\��p<\�ʹ�r��,K\�> ��;\�~NP�\�\r��\0a�|�\�\��7;}L\�:�g5�r\�\�7��\�n���.\�\�}�.�/D`\�\�|\�E2\�ʉ~z%\�s�l��\Z2\�\�S*̨��V\�W��{���/ޚ,��\r\r\�r\�5Ck�?\��K-���ѿޒ���y\�O8Gˊ�p\�!W\0s�B\�\�\� 	\�\"6�\���p�\0ڍ���\�%��\�\��V\�\�[I� =�9�k\�\�\��vA&fC�\�+�\�0�S/9q/�	r\�f0Ё�V�eY���Vl�z�=\�\�D��,1\"a�\�u5YH���%\�4�˫�3ص[V\�����h�?\�[�C�7�5\�C/S�\�d�Pw\��\0a�\�ًKt&��`����\�\��:86�G�3o\�O�Iu�ԧ\"\�`_/[�j�tk\�\�\�\�i3\��9\�U-��m\�\���0�\�\�\�^r�_UAr��h2ը�U�Q*IX�v�\�\��s/uR^�9]bo��B�w��G.e��{)G�v�QH�`T4ܾn���\��n�\�\�\�.u,M��ŤV\�P1��8\r#\���_�\Z�?≯��΂ :@�f���\�~�3�\Z>���n_��?V1i\�~%*#˻�,Q\��\"�:#o\�\�B�Ϋ\�YP�#Ls���=/\�3sW�?1=�`\�`\�a\�^r\�[UD�h�Ѡ \�+QL�2\�V\�J�f\�=\\�e\�N~v���\�i�\�띬�K\��\����\�\�\��LN\�\�wu�\��\�@�GdV\��qQu} �X\�!n\��\�C�.���@<W��i,[\'�{��]N\�%g+���c{,��*\�\���F�ȆL��X�p�A\�\���\�\�\�C�ӄ%��v\�U\�K%)o��z`\�`ן��t\�ľ�%�\�E������\�fTJډX�vz�=\�\�\�\�ļ�\�s&�0ND\������\�/Q���\�>�S�\�\�c�l�\�j@PLu���Mu\�\�[��$\�\�k��S\��HĹΔ\�\�\�@J�O\�H\0PE�o\n\�wM�Q\�wt\"�{�:\�M\�>XY�;?�tij܃�\�X,Z%M#ȯN\Z�ֱ���0m�\�,�����X�ܷ^��\�Eu[��\�D�郱�\�\�kjeӗZ�%\��BB�Hʳ*%mD�U҄��ƭB6�+w��i�fi­�S/Q\�\�\�\�Ǵ\�\�=�\"�Q\\L\�=��j`�euw�uл^�\�r� P�K�b\�ã�\��\�{= Z-[\�)\'�\0PQ)�?��K\�u�\nnhM)QT\��EB\�ؕ\�{X5?2�̌7F��	\�c\�\�αF��#\\���[\����k-\0�w8=���6׌�e\�\�{��\��\�\��S.���\�Q.UK\�QL`�$--	G�o&V\�%\�O2`Y�\Z\"*قE�^\�{\�x5u\�ۜ\�&f\�hm\�U�M\�y\��86֏����eet)ٚ��\�,wѾsJV\�a+�{\��ƉE��m\�o9M��~��8:�\�\"�D�\�\�3�w�\��to{?~\0�\0�\�	s�,-�����C�{s}.h{\"�j\n�T˳.\'E�\�*�JTs�n`�k�ġ�\����\�q&�i�fi\�\�\�)PZ4s\�}~fnŉ\��!�X�\�l���v9z88\r��ҩN���\�*\�i-���\��ɳ� ��ޛ��\n��v�~\�yKk0Qu{lq5\�-DW$\�錍S��{\�O)\Z�\�T�)T\�+X�>qRC�BQ��3�U�W�+w�\'S���4\�9��3/r\�r}{���l~c�\�\�3�\�\�+��\�[�2�\�!\�71Ril}\�\�<A\�0��_�e�X{ϲk�\0����\�/��#����6֑|�\�2�\�t���r�f��)����\�\r\�\�\�Ķ���0,��\r\���\nT\������Ɔ|&�~\��i�7�z\�_�F\�-����\�Xq�h�ȵuo��=�\0\�{TJ\�\��b`gQɃy2�q7P:���2�����>=\"+ v?\�\�:8U8�lP��Z\�-%@��\090f�\�\Z\r1��f^��[1)�\��귃y2�q&��	[o=�\�\Z���]f���q\�_\�\���nw�:�\��զ�M�4і+�\�$Y\�p�\�xF`b�\ZUd\�ۼ�J\�\�%4\�c�\����\��\�[\�g��h\�\�Eu�,\����bڸ4�U6\�2�����\�\�\�E�O��f\�\"�\�ټ�\�\�\n��;\�ڃ��\��\���c%\n�-�\rL�Y�m�}�\n�\\˼���|\�80z�\�\�L\�8\�9\�etzp\�j�\"S\�1���m\ZYNH��\�D\�\�ߠ�R�V}	�W��\�\�`zY��\�s��L�F�͐���>\�@hN����\�P�W\�����K��^1���\�W�\�wd୘�\�\Z�cYɄ\�q���S\��wg��K@�P\"_�\�E}�\�\�S�\r\���}�\04�\rGT}\�H\�\�\�n���\'U��\�����8[�ܹ�Mg9F\�W@���´\\�z1�R\�\�M�\�P��\�l��}�*f�\�\�\����V\���\�o.�z�\�?_F�\Z\�\�C�\�\�\�\Z=(?\�%�m\�\�pi�0�p�r��k���\�)T�^:�\�>k�p\�\�8\0��\�08u\�N��Y*uە\�\�)?d��{q�����\�\���3�S\����=Ͽ�\Z�ַ�5\�\�	e\\\�wz��K�*����i2\�h\�B(�\�2�\���e+	�s\�/\�I�S�\0���n�O3>ǼV�tQ�\�h�֎�\�)Jnobd_s\�h\��\�\nNa�\�!\�\�i\�\�\0\0�9M�4��?1\�\�M\�~o��L���CC��\�e\�\�y\�\�	A\�\�\�+�\�PM��&\�z١�.��\0��\�v8b\�6i�\�\�Xw��x���=K�(�\�\�1�8E�N����%��_{�\0H�˕k�\��%�\��\���\�\�Ŕ\\6\'�\�R�_�^�[�\�\'di\�\r�FR\�;�N��\�t��ܴa\�iBo��˓�`�E��G�c\�0��\��\�\\\�\���Vkz�\�4���p�����\�\��X�g8��\�Xtm+����\�<� y���ws�\�PQU/kv���BW\nn_\�L�v0:\�Y�vx��\��\0�Y�\�Z\�r=\���\�\�\�ޫq@WBVz�\�ҿ\���RQ�\���^�\��_y��bwqF�l\�\���\��4�n�\�3�5�9`F�:�\�\�>j~|\�\�Se�y\�?�R�:H?`x\'*J7w�����\n��Hghi\�S�\�.q\\\r/\�o�\Z�Z\�~s\�\��\0��\�\r>�{J=�\��=?���M\�\�\�\��\�-�[���\�PՓ\�,Z\\Y\��a[��\���f.�.y��Ox~�\�^1�_ceu-k��xx�o\��w\���4�]6&$�\�l\���-R\��i\�7\�r~>:�O\�\"���yA@���)`F?x<\�W���/\�iY+\�\r*\�\�\�\�\�\'���KVp�b�t7�\��T\�0\�\�v�	��f\���R4�&Ο\�س���?Eض�\� W`y@�<���?.��:�M}m�/�\nU�{/\�\�\���\rkw��\0\n0!�U�R\0\�wL(7W\��Ң#���\��ۋ��\�\�S�v?3U_$A�^.W�o\�4\�d\�*?ϓ\�\Z�\��H�9x�t~�����\�\�y�t=M�� \�K�C\��b���\0N\�\��y�ן\�siB,y�\Z\��;�@\�\�Wr^�9�`y𫱹\�{�1����\�4�\�{\�\'\����V�\�\Z\�\�v/\�Z{Ⱦh\�M�\���U\�Ԛi�\�A,\�5.b�\�\�Y?g�I����2(���{�kT:;?Y}�\�;e���++a�5�@�\\L\rɓF\�}-=\":���;\�N\��2�Q��\��oR�g\�\�u\�\�<\�\�\�ќ�<�o\n�\�;\0!\������M�\�\�\�Pj��\�xX�jvs��IϘ�ϗ\�\�J䏴\�\�\�~ϴc���\0\'���jE\�\�?n\Z�\�[�Ȗ\�\��������(ָd\�x1h�H$*K\�{3+�t�\��f�����h\�Ѓ\�bV��\�\�7=�\�F%�Z�=\�����\��6#CmW�\�\�bu;\�Ͽ���*\�\�\�\�\�; ,I�\���\���,�D_�\�\�<+&�ݢ�Z�Z[\���\�\�}�X\Z�a�q16zk~\�\�\��HLI�s�\0_Ϗף�yk�\Z����E\�\�\�\�\�^�\����^n3�\�0byI���;#�\�.\�T�\�\�\�6nn\�\�\0i/���\�\�$Q�����)�i\\_?��\�\�����\�\�p\�\�\�\�\���d\�!H�̎��?\�v�,#�	\��:�\�z(W��Z�B�5�\�/\�\�-�s�\�(\���;=�\�^��#�\Z�ˉe3<c\�\��v\�#\�\�ʕ��5}b�\�?Ǉ��n\��W�\�y:5=3\���o\�	\�+\��\��yگ�\�Z�L}\�\�-������\0�\�\�\�\�۷\r/ם\�\Z�A\�Dm�\�\�޽� ���df\�,~���5�_Ym�,v\����2\�\�F5_�u\�97g��m�\�\�\�6�S\�(E�s%�\�\�uM��\�\��W�.ap\��s����\"�7V\0ì`\�\r���m�c�\���\�Ϋ\�4�}a\�O�_Xݫ\�FA\��\�\��6���.\�oe�MI~�\��t\�(�Z�����\�@\�\�n�;E��_\�㫁�@x\r\�ٶ�%2}U����x0G�y*s\'\��+6�\�a�=>�\�\��\�Mto\��\�[[�\�\�{.B\�f\�;j#I�\�ź\�;���\�=8�	��\���\�f�j5Vvx:\��[���2$Ɯ\�&[�1$7K�F�	���\'\�NϤ\�x=�q\�o\�_Z�`��\�K2}q�\0|��S��\�WW\�?��\����\�+b�C\�\�!\���z\�z9��(9�C�\�b~����}VUMT\��ϵʶ�gF\� v\0\�q�\�6zN��珼����y�A\�E\���%9\"3�\���H6Y�\�zs�\\��ec\�\�\�0�e�\Z���:\'�\�.y��oP�\�/��\�\"\�-·�\���.$��W��yc\��L=o\���(z(\�i;�~<��Aο��%\�\�4��jy\�\�\�!\��F\�4����-�\�\�\�үtc\\ܶk5\'�k��g_/	u�mwc��{�9H/$\�\Z31\�\�JӘ7�.\�\�?\�t�w/ێe�FOo�c�ޗ\�\�ƣ\0^|��:#�ε+\�\�\�qMY\�\�\�s��<-�w\'F_Y�K@Z��\���$	�\���\���\�\��W\�xũ�\�~\�!\�Ǟx\�ߙ�4e\"�\�\r~�YN�&\�vOf=��\�a������0\�8�90�\�\\}�G�\����E\�\�OnU4�vgHU޼oO����z��\��1qu+\�c\�\�y=>g\�\�\�W�\0\"2p-\Z�\0U�\�ێS\r\�@-g\�\�[w�q;ۈ�O/\�\���ׅ�~�?Gg�=^��y9�0l�$\�@h�J\��1#�\�>R\�1\��u���\��AM�%̜u3�[\�\�6�V���z\�w\�|(o\�.�_%��!ws6��\�\�ef����eT�l�>�\�B�>��\��\�\��i�*�\�а[P�\�_ȊAI\��e����\�y\�Er=���w.�9��\'\�\�.�|��\\�9�5\�9\��^��y}Z�*�ex\�Sal��t�rxz\�7��~8\�9�~\�\�)\�\��\0\�	\�ޢ.�\��\�?;�>SS\�U����\�ls\�,�\�\\vN|-F�H\' �\�oڸq�7��g�7!\�\�\�\��4둋\�ju\�}���:_y~2\�\�\r[)]R.|�H�%�}|�9{�;@<m\�b�l�\0��J�L\�ɧ�\n\��#޽���ϳ�\��4p\�(6~^�`ѣ�C5vr|�\�jB;\�ј:��\�\ne��\r\����D\� k\��\�@zJ3����\�06o��s\\�����pr<����:?�s�l�\03b�\�xMn�S�Ӝ\0Ma\�l�~�Yh\��\�\�\\B9��a�����\�\�:&\�\r\��}�\�2e\�m4�}g�=x�9�WX|\�|��\�-��W\�\0��8]�\0��\�\�\����!\�.��\���5��j�5⻇\��%��:���о*��\�5�z~N�g�1�Z*�~��z��s�\��&��~\�\�\�4�����\�\0\0\0\0\0\0�\0@\0� \0L\0\0	\0\0\0\0\0\0\0	��8\0@\0a@�,\0X%$�c\�h@\0c\0\�)G\�@�\r\�(ha�%73�B�\�]�y\0͈�q�a�F/(=�\�m%�YG	�\Z�\�<J�(])G�I�\�q��Mx���\0�\�)\�xl�u�\�}7^p@�d\\��O7�Vcj-�W\�m\�\�e\0��\�jT/\�T\r�\�\�T}�}u\0\r\�@@��y\'l\��,�͈_Aה@ǐ\�\�A���UO\� �h�ڀ4�|�0s��Tl\�w\"?�\�-�[d@\�kT�\"%��aXuj:�+\�(�`B�4�\�Z�㛎�\�̋cB` \0\r(aJr\�K�q\�r���\0RN\��\�-\�TK�}!L�\����\�\r\�F����\0�\�o!\r�f��\0\0\�T�\���\��\�L�HA \0�M_�w\����\0@\0\0�%VM��\�\�޾_|�@EaF�\�\'Q�\�\�\�\�B�\0\0C\0\0�(F4��\�L�/�B\�\0AB,\0\�\0�\00���O�\�\�\�?\�H\0�\0 \0\0\0\0F��\��\��F����B$�<\'^�[�\�\�-}at�4 ��w\�Ό\nv�L�#`\�\0\0%\0$o����\�M$�\�fb�\0�\0Mh�����jk�dC�\�X��C1@Za�\�\�K�\�\�Zy\"��\0\0\0\0\'H�4�\�)\��$��KWl� \"6	��\�?��\�\�;n���\0\0�\�`<\�xvU��B�b܀\0\"\0\ni\�@�\�r0\�\�ڡ\"�:��\rW�]�ˎ����\0\�\0c\�\0\00S���\�\�$�K�\0�\�S�H�x\�\�)!X=\\G�pݷ[+��J\�`@0�\�\0\�\�i\�v?ج�{:�\�ϯ\0\�<�����\0�\'�u\�?\��\�\0!\0\0\0\0\0\0\0\0!1 0AQa@q��\�\0?�\0b����\�`��\�#��}?\n\'\�� S,乸Ѧ.��lWҦ�ɰ�G	PX���Hz1��\�B2�\�䱷P��\�.T��^���r�S\�uP+\��}���/\�rΔ\�\�s\�pi�܃\�	\�R\�\����j�?2��c�ͳT4�\0A��\�I\�\�s︁,�r��7a�/���$\�K/\�A4\�\0*\ZO�9\r�\r!�tQ+a����ZE�.y8\�mG�Y��El5��\�Z\���0y�Gn����\n������K�.�Wت\�_\�Q�D�\0�=�mJ\\�+�\�\�0`�+\��H.j \�\�\�ʶ#�+ؿ�\�SV0Y���$$$;m�.�.;,)�B;eF)eJ�F�\�\rDV\�(@c\�\�K1�\��PY�����\'�\�\�QZ|����/\r���e,�1ؕG�\�E6E�	���,$�\�쵖a$��x]���\0aX�X\�\�7\�b4��\Z\�@\� $PJQ���h@����\�\�\� �7}�HG\�M�1p��f\0ԵD\n��ա����cH�*sP:�p\�-l[o�v�\�\�@�ī%E\�K�{�[����\0DXq�A��#�\�S)\�\�P�h}f\�\�\�ө��\�؎�}�r1ͪq��`�\�x_2ni�Tz��M\��%F��p$ߥ%\�J�o�|{��n�s\�z�����̈́\\�A\�\�\�\�F-l�ñı�kYS2,������C+Fv��*H6#����@-�`�\�\�^DL�O�F\��G0\�\"�EW��}EL�ÿ5��^C�gp��ኰr�A)�h9���D6y�n%,�\�H��>KYQZ(�\r��Nn�\�\n|\�*_�}�vE��j ��7R\�uP!X�+U�o�\�S�0Q��Q\�9��$O\0�\"�%C \�1�@A�v)<Fs/u;��\�Rx�Ȣ\nK�ˎ�\�M\�4�ՖM�+�oA�*\�K�Q\�:gԜ\�tq��ߒ�1���v@8a\�q�\��\�\0#\0\0\0\0\0\0\0\0\0! 1A0Q@aqP���\�\0?�\0�(\�=\�\rY\�\��*\�\�Ki\n�܉M�\�&��o\�\�\�~>����&\�\r�Q?���Ky�b\�eK\��8�-��:�s�x�Q:ā\�h���H�\\_��7�\�� zŸ�Y靬��>\���`X\'\rh�pLR桲9\0b�����\���\� l�l\�\r��4\��_QeF\�{�mI{��L_o\�\�D5\Zici��\�;�\���\0ϲ�\�E$^�\�t\�\�FG&��H)D:\��]7iYp\�\�A�\�\�U+U+�\�#JN��4n�\�*\�\�\�\�e\r`{+qq�\"[�%隔7�R��H\�Ƹi�#La���\�)�\'��\�P�AbS��J�xWΆ���z�bE;!h\�\�J�\�\�A�+\�q]�Ik\�7\����\\�/L�\�x\�+\�\�\���ԩ\\��P�D�ep+G\0���<+\�)\��ʲ�\0\"�Y��w�\Z-\�h��qY�Z\�0@��][�A\�4\�U0GuYRخ�ë\�X\'pS��\�=Fd�\�C/$b�7+t\�6b�sbFY�\�F/\�Ϥ*�*\��Pf\�\�	_r�a��?ҋ\'S��*Q\�0ξ�f�2���\0��leLԲt�.\�\�q5-7\r\�{�#��\�\�\�\�\�(Y�L\Z��Q^�%\�Sd���\�<\�+��:\���(�\�\�\��\�9�\�\�Z\�\�\�(�w.b)��v9\�l�\�O��|Ѝ\�A©.V�u���\�0r\\G�5�QE\r7\0\�\ZZ\�\�\�Qͨ�H\�\�%T�&\�S\Z��ó\0�+s\��\�\�\�\���g\�@\�*\��\�6��1F��\ZJ\'{\'If�\�ޯ\��PZȈ\�$\�\�#�\�pl�!�q����W�\�]n\r�\�9T<�#7�\nA�\�4\�\�F\�yy/0���>$2#\���,\'��\�\0(\0\0\0\0\0\0!1AQaq�����\�\� �0�\�\0\0?\�2\�]	�ҿ\�\�\��\�O�\�~fҧ\�c<\��x\��3\�\��9\�\�\�x\�\�:\\\�bT�Nz��:�zx�J�ҧ3�=f\���G�4�%N\�\�\�\����6�CY�\�Tx�\�\�7g�\��\��On����f�����k��O��3\�)\�<F\0�Q�Ҧ�\�O�o\��\�\�o:�4\�Z.�{\�J׀��G<�}&\�8\�7\����r�_�~�\�����ۥt\��\��z\�&�	sh\�\�\�ߡ\�>�,���\n$�\�\0	|Y3��.I�H��\�<O\��F{Cy\�\�󊾯\�ֿ�g�w����o�<6x�2ƣC|�\�))l��O���]H�}����<��|/ȝ���-\�<1\�\�\�\�+������4�\�Y�\�0��v�=zz�h/�\n`DnfH�\�5i@{\�P���\�k[�\�\�h͗��\��~�{\�g�N٦k=�\�\r:kp�S\�\�\�6]\�g�\"Q���X���T�������\�(�\���n&,\��\�n\�\�r���\�&\0��V\"v�Oi{�q\�|�4!\�!ҡ묮fgh��\�y��\�y��ԯ0�X4um#�qSa����\��{�eB[\�q��J�\�\�w�\��\�А�`{����\�ǬP�\�:|O?�\�<o��\�\���\�\��.M\��\�\�@\��ԡ\�|��PO5W\�Y 1�?܆n\�s|��X�\�X,\��\��V�\�{�\\[�n>|\�	 �G�\r\�/\�\�o\�Z\�YQc\0L�+\�h�ǒ\Z\��Y���b7s=\'�OM&�M���v\�TΝ\��c\�+�V�*\�\�o�̪�\���\�ī����\�rK�>��oS\�߉C(r�~��?~!\n�`~�c\�i]w�^�O\�t�@揦�Л\�Y˨\�+�\�\�6=\�S��޳t�E}(|E,ҷ\�\�-�>�\�[c_)\��f�m\0\0\0*�J)\�-����\\	E\��6\��\0\�\����\��1�9D\0\\L\�)��t�4)ߓg㋉v2\�\�wk}�:��?~#AZ5��\�5\�\\V�h/u��Gsyk �)��?J�7��=#\�|MᮤZ3U�\�Z\�W�w4Q\�U\�\0\��01�\�J��\�h�u�\�78��@4NR���|�F�M�6�x��67�{�c1m\�q�\�P���h}>��5\�\���	��\�7\�\�i/�BX\�-;��q0\r��yOyX�\�D\n-qQ񟘸�\�Tzڡ�+�f\�\�_c�7�|\�_oY�D�p\�\�\���r\���\0�dM\\\�}\\�i\\\�;�X#Ǯ{�~`�\���\�:���tt\�e4�	z�;E\�<\���\�z�Cx���<��5=�,8M\�M0�-7\�i\�+�>��/�B�^b\�&:�����\�S�\0*���ɠ�T\�\�w�YcA�\�N��A`��ʩ��\�԰;�	��WՓ�\�j�?�\��_|\�v�\�\����-�\���\�k\�~�t\�\�M\�\� ��iQ�ݶ�˫\�Q���\�\�H)\�\\���\�NIt�M\�\n��!�vAXx(�z2l\�_�\�\�ڼr�\�T�\�\�\��c1\Z\�)\"\��\��\�\�\�X g�^8�.Sc\n+\��~#S[,\�\��3hl�e�|\�TT�2\Ziw7jX)qR�{GU���u=#6�a�\0;DRtht���ٍ��\'\�\�N\�M�k�]D\'�5���\0{�\rFS�O\"��MЅI�~�b-W�\���>���[oS�\�hC9�;\�\"��\��\�\ZՕ^�\��+\�_}�6럾�o\'�,\�\"\\xxE$\�=\�\'*\�\�\�\�ԗ�}\�3�ޤ0q:������OI�\��irz�H\�~W`XǓm]���n\�\�\\YΠ���c�:�D\�)]\�\�l��9,�\�\r\r\�\�I\\\�ew^f9�.\�\�Z�\��{�r)�[\�����\�g���\��\�V��\���\���\�j��ڏ�(W���׫qk\�N\�?ν\n\���s\�\�1 F\ZN\�nq\�ȏo(�	�\�K5t[�o}F,ZV&�)�\��\�\"\'\�/��;�t\�/x&�����O���\�\'kG�\�\�w?W\�c1-e%]\r\�߬LZ@:gFUe��(-�>�A\�\�\�\�UM�\�\�\�e/X&3\�\\;\�M�X��\����\���\0;t��\�\n\�(�ĿѬ�ڍ��6�h��ݷ\�\�/��W�\0	V)�a\�:����\�\�r���k\�`66#�\�R�ߗ�\0a�\�B--\0e8�\�Ȅ1k8��f�cW�����aN%#��\�|ʭ!�=%\"\�:�Ɏ\�r\�*�p�)\�\�Nc5\�	�<\�:`Ы�Z>�4G�^,n�OA}������\�e�S�H�\"^�\�Pt\�*!C\�\�f����?���mI\�p}���FS\�\�&� iz�\�\Z�\n=%�\���ʫKr�j\\4`�@4P���\�UkG�\�\n\�\�\�\�\�\�=��\�\�@}أ�ijC6��2\�]\�3��0B\���D�+J�ߝ�\�\�9�:\�\�\���%A\r�-\�{�\�_%�\0\r��j�\�c�\�c]�\�c���I�\'\�jlڇ\�+�{\��\�\�D\���1��ng\�inA\��>Fe�O\Z�\\�	\�z`Au�\�z��\��S\�\�\�\�\�\��f�Q��\�y\�\"q\�\�FR\r��i�\0}\�$m\������������\��\���x�3\�\\\n\Z8eX��������>e��*�\�\��X�\�{�1�\"�G�M.���zsJ\nr>Ħ\�M�kj���\n�\�P\�kT\�E\�M�\�+/\�\0�\r��˵�\�8{M�U*i���F�fXf�\��lx�-*4[�\\x�\0\0\0ƔC1��X��\�\�`08Oiٚi�L$<\�4g�U�\�f=1Oe���\���h\�\�\�ot&�\�v�\�kil�\���@��DO\�_}\�\"cs�H\�\�9�\�\�!Mi�Z<?s~�\�\�0gZ�~��\�\�\�\�C\��{ʱce\�%�\��Q-\�럾�-S\�\���&X\�g:W�\�7�y�CXTL\�r���&-(n\��W�B\�<\���\�\�\�\���KF����*��%m�h\�\�+\�\Z\��\�\�;�G�\�\�\� �1�\�Q\�Υ\�Dg8\�\��	u�+:�T\�`�\��\0M߉\�\�\��fw% �4c(\�64�PNw\�U8�\�Fl0i\�\�`h.�k5��x��\�D�D�e�\�bw�Ǥ#u�x`5�}\�m6=\�4m\�~�&s\�\���\�]\�p}��D�s�M�\��tj1~!�l�o�\�6\�+�f\�\�\0���2�\�\�\�\'�\�\�\��`iGCQ\�\�0�gKTpj��\�í�\�\�<M_BS\��p\�\�\Z�g�߉dV�kG�t\�fQ�{���G��\��A\Z\�J�F\"\�&W\�c)~ڭ�+\�\\ґ=0{\�y�\�\0,�Ǆ6�F\�&\�\�w�\�\�\�+\Z떲#\�\nƆG���:`�K\�q~�\����b��A,��@z�~� 7q��\�\�9�\�P\�ڻ\�\�Jz\�A5�\�\�\�\r�2�\�P4\�#C\�3Fޏ\�`�W\�1��\�\���\�S�\�x�3\�Dv0ʬ�/���!�\�\�h��\�?}\�T\�\�\r�q\�®=�L\�\�\ZC�!���]�bT\��n{�}�{e��N/.�$\0A�\"�gI��:A�k�\�\�\�����TNT���Ū\�c�A\�sp*qXz_�@.�<��Q\�\�*\�\�ppCh\��O�\�\�#�e�󐌠%9���K����W�TOA��3S�\ry�t�\0\�nCy�\�P���({�z�ɦSՂ|�A�\�A���\�y�\�]\�d&�����&��@.�k5�\Z\�\���T�~�Xe�������`4/�\�\0\����\���\�K�~1�5��\����x�P4F�W\�7��\�$�\�}����\�y�R\�T\�3�\�5�op\�����T_���\�m�\�\�T����\�T\�Q\�\�=�\�ҷ�\�h^��$ܽ��.\�r���ųdn�x�\�=��Ϙ�\Z^\�\�f]�������\�\��K\��Z\�m+�t��w<�=��fN\�\��-����-���b��\02�\�M�h\�)�\�\�\�\�z<üF\��􄼬+;�8=cr��p\�썝��i�\�\�h\�-؟��\�\�,�=\��y�w�Oy�`\�j#��Ә�&!��cg�=�\�%�\��\�5�Z�@\ZC)\�-\� �.�\0}\�+\�\����\�}�\���\�#�Ԉc^�4R�/��\�鏾\�{/�&��Obz̋��4+�\'���\0*��`gA����\� �\�\�F:�]\r�f\0ԾJ\��\�\�\0M��qQB\�\�\�9\�\�RQU[{\�\�\�_\��9Cژl\�˻�\�k|�Y\0>�A2�j�\Z�\�#ʈ\�C\�̣��t@�䝎�,�Ɔ\�gG\�\�غ��\�F\�p�s*�d<\�\�BQ��f\�\�g��6\�A�\��j�=Q�EWS\�\0�!��_X�\�\�6�LCR5\�\�\�\�b4_}�\�\�J\�%�\�r\�j�\�\0\�5/\��hZ\�ݡ\�\���˨\�����Mu�8�F�\�L3�\�\r`yU���\0r\�4\�Nz3�M%\�\�w�c��\�\���X��\�^�\�:�o�\0?3�\�?���\"�U�����\ZN\�\�\�䩀q\��\�\\<īA�~��b��z�K9�Z�{t΀O7[�e�+&����\�*\���\�/曔h(�\�Ns\\�}D�ӧyp!y\��<�(���sC�W�QK\�r�\�bz\�{ܳ�\�Ѫd5����,���\����\�/��\��8�6�]�0t�_}��x]��#�\�\�iB�\�\�F\� �j�hX�C�\�3Fޏ~!�ߨ���ekR5�Ȇ3\�D j=�֛\�\�y�cR�\��0OSE�ͧ\Z\�i\�GG|���Y��j�v\\���%�}ao\��W̫�s\r\0c�1�\0ע\�;e�\0\�\�Gp*\�\�`��\�	��b�E\�W1�\�\� w`?�v\�\�\�\�ٌ�6�����\�y�QX��!�u\�hK{K�r\�b\�P�Ҽ\�\�r��\�8�AL\��;J�A�\�\�,C�\�@|>X��?\�TD��\��Va\�q�x\�+z/\�&�}{\�,\�ҡ�j\"\�4\�\�����(t��h�]\�/	��\0J\Z�~�qA\�p�\�{���ѷ�\���$CZ\�^	TęH�\�k�\��.)(2ΐ���	CR6\�	VC�\�\��j�IyUW\�b�\�\�c�\�\\�%�P\�\�\"K�\���\�\�Eu<�\Z^j�\�{ͦw��\��햭\�=U?yџ\�	\\W\��.�\r\�\��\�r\�C�>T�\�jR���\�\�\��.+����\�\�x>!�j*O\r�.t҇\�B\���{b\�χ�\�\"�}��mN3�E\�Z��[�֦Z\�3�ǈ��Kj\\\�\��o\�2��U�ފ\�\�|�=�\�]�g��x���(4{�����#�h`��\�%\�蔆\�\�vX\�z\�pkY�\����\�D\��\�ͭR\0bO�X4Z���F\�z<?@�_|\�Fe�iS\�%Z��T\�\�	�\'x��-�K\r����ɺ/�\�3�/F�A8=�\�7\Z|\�\��f�t7�\�;P!H\���\0Ujǯ�\�eM��[�\�\�\�ƳS꿨v\�׃�1�N\�\�Ϣ\�V�5!쌦D��_s�	�Z\�^\��e\�\�1`ok\��>\�^]d2���ò\�)\�\��\��\�h{:�N�4vŧs�p!�=��km�{�Ub��\�\�g\�\���\�+	*�\�h�S�K\�\�:aV[\�\�탼2�p�]\�=�z\��a\�;~�R���\�ڽc��ܰm�\�rBUV���\�\�\�\��\���BA���\�.%{^?�C�>��e���\�5?���V�	\�k���\�?0P;G)�>ܺw	\�\0\�r�\��������\0\���\�����~��b-E�\�\�*�^�T.~�,\�\�D(edv\�<\0exv�oJ�:�tW�����µ薃\�\�\�\�\�ChbNn�\�Rx.\'+�\0��z\�\�\�W\�qQt��z7w��\0�̳�h*�A\�\�+k�]���.�\�~a��W,\�N�J�\0��\��]\�>VT�\��=\�=|�;�\����m����cg����0�Zz-�\�8��\�� \�04�\0\��3{0L\�[�d�\\\��(�\n5��d\�\�\�CFk\�8rY\�\"��{|=�R)�x#g~B\�\�*��!5@9YKT6n�\�3\�)�8-\���V(~��ك\����B��\��%kG�\�А&�\�\�T;?��$\�s@p<˱x�)��Wl\� \�\�}�\�\�\�ʮ�\���ˎW��o\�0[�q;\�`�Mo)�o\�3js\�LU�\�uǩ�\�\�0\�m?�Qv��q���\�Eם�����\0�P\��?Q\�1�Ϗ\�5uo\�\�\�\�U��Ϛ����T4{�Sxl�\�\n�\�98\�=\�t�\�e\'4\�V\�\�X�\��rwGO�Y�Q�F\�\��ϝ4\� \0\0\n\�6!\0&��\�j��\n�U�R�D��:�\��ZL�.(x��� �,��\0qzf����D��Wu��l����\�ߜ?]K�a�pWF�\�]h��B����\�\�lO\��\0�\'N�W������9S�\�ӈ\�\�\�p���4w�\00\���a\�5o�\0��]�ݡ� \�+&R>�\\�\��ty���v���4�݋\�\�3����\�5;�d)8��\rf��BF\�\�\�hs뾿�\�V�8�A�׻\�L\\\��\�i!�ֳ+�\\z�\�\�6�ca�\�\'�G�I9{��\ZA\�\�\�`wpz��\�\���\�	��.�\�0��\��\��cJ͊}\�X�~�Wt������ƚF�D2V�,�\r\��\0B6;�\�=cH;��e�\�W�*%-y�D\Z�r�f�7\�S�e��\Z��\�\�VuWPm�\n=\�\�	 �\Z\�\�oU5\�3\�\�ɶ\�-��Ay\��S(�[��˺�\�0��9nc��\�?��]��s`89s�ə@z_q�|�Q�I�\0S�V\�FW�\�#\�\�z���R#��m\�6\" ۣ[}\�9C�\rk)�hb�\Z>�a\�߻B\r����\��oĸ@�\\	X\�5\"+�ԉ@\�*e(\�\�*av��i\�b5\0�k��F���\���O��1��\���F@��}\�\�m��f�\�?ج�W�8>H*\�P*�\�\'�7{��IAk;7\�b�\�2\�M!��\�	wr^�\�:¨\r\r%`)[\�|A/v\�\�nqy�%c\�\�6\�\"�jT��Wm���\�cC\�,zs\"f\�>�N \�v����y\�4\0G1�\�p�Z\�\�}%��\�0�\r5^eo_j`�\�J��X\Z\�|�P�o��\Z>cK@\0��\�\0e���\�YJ�dAR�\�/r=ƥ\�Jw�\0�\�\n\0\�\�<\�8�ZV@\�k֟v�4�\�Pl����8\ZRS�L��\�h�;AX�玄\��GI�\�oҺ(q\��\0c!Z\�\����\��\�c[\�\�\�oĤ*\�LYα�\�\�\�<�\�\�\�K\�X��k߼\��~b4�\��|v�\rS؆�^����%ǰ��-\Z{�X\��\�\�${!5���G�QXv��@\n\n��놫�Cq{�P��\03f��\�Ķ�\�\�?�^�\�s��9�%�<@ò�\�Z�\�\�6jK�n\�Mdu֘o�H쇸���ܢ�\���\�\�7k�b*wG3:&�\�!��ǈ�e�#�C,�\�i��?1��\0�i�\�A�A{���SC�w\�x�V�x?ɹ��\�1%�N��d^\��0N\�_��(y~\���\�_�h������\rp�/�1-Ŝ	��\�W0�=�4��\n�?��S�H�P+[��x���/p84�k��@\r5I|\�Bv\�i\�XsIJ\�e�>j\n\�.�p�r��E-�F\��-Q�\�̢��\0��S�qv�-B�\�k�T-\Z\�oJ֖d�KBZ7mM��\�bP\r\n\"�\�R\��7�s՞f�M\�0��癿N�-\�`\�\�A)�ӻ\�d+Z<?B\�\�\���ef�ݿ�Ci�_߈\��Ulʸz\�~Cx��>��,�\�\��\0R�IuU��i�\�\�7�6�\�O\\s�jǪ\�l\�\�S\�\�\�f�pʫ\�}:ܩ\�\�=n�\�,�U``]l�j\�V5�\�Zz�\�F��P��T�\��\0ᗝ�\�\�o\�擽\�\�\�\�\"���\0`Ѡ�\\2\�\��1��h���M\�\���\�VY�\����2�\�\�>�v����+��\��Q9\n\�M\�޵�]r�Eߞ��i���4\�]�z���\'�Pp{Lr�\�[�\0S`]���|AG�q��1^��z\��	s_��z\��S�B3\�P�H:Ц�\�f\�.\n\�:]\�C�\�@�\�q;�o�\�\�e\r���S��\�_߈e�.;��\�C���i�~\�\�f5�N��d��L�\�#\��M\��\�DXn�e��e�\�g>:z�*m;O?�R��,��Ĩ\�];\�~v��{�~L߼���hM\�ͥś��\�^+�\�A�sqԻ�aWC2\�\�h\�*Sz�6z\�]N\�\����\�9K�J\�2�M\�?\�q�i�A\n�l\�Q1\�֠�@��P~�\0f����\�o;��v�{s\��F�g\���ܧ\�I\"&�\�P\�V�J\�B\�I\�\��D6�\�\��\0_\�(����A�3T��˳z \�	�ol\�r`�\�H�&�|u�љ�\0^{?���\�W�\����?oS\��6t�\�,\�qe����C\�X�]��b\�\"\Z��\�\�5s\�\�\�\���h���\"\�h�\\򒯳��^-\�F)pyi�_�ba�\ZO\�C�)��[���NI�hV4\�o�2�;��\�C����M%\�h�\�M��ʨLy\�L�ø�\�\�-~c\�<ç�L\��\"X\�\�ϩP[\�-J�R\��4�!��T���~���\0-�\�#w\�\�\�P\����kY�Ŕ.����|¤qIYvh��u�,kgA&�0L08�Si����j\�R�ُ��\�̝��/0\��9�M\��v�\�\�\�\��<���\�y����\�Cꏼ\�B��C�\�\�yt�\�\�\�h\�[��\0�=\"��{h>�ӛ��G��\�(c��9W�q\��\0\�\�;\�f�F\�f<�\�#\0Tqa10=G�QJ\r#B\�\�\�Ѹ�̨+ n\�\�cZ\�v�\0%C\�\��\�%�|�A\�JF\�]\��]ϴ��\��j2\�\�\�)i�f:\�\�i��\�m6\�z\�\\L\�\�y\�*\'�+\�\�1vt�\�x\���\�\�\�T\�e�|\�׈��ׇX\�hP���G\�xc�\�\�*�c\'&`\�!�ݡ�*\�g�f���X��_[C�4�\�g��t�a\�_\"^E\�9\�y���\�\�o	\�WU;<�0kzE\�j\�t\�1���)\��\�4Gg�sn��\�h�\�?u��8\�h�vEօ7�,�\0��J�\�J�\�t���4�>��%DWE[��PF���1\��\�}\'\�\�k�\"yM�J�O\�kd�\0�s�K\��\�+;\�(� ��x\n\�\�`\�\��=g�&(�\nvG\"~�I�#Gb����^����\���<�D��\0�(-@W+L�vq�SȎ\�]i=��()\�WCC�g\�}#\�?\�3~�/��\�_�ع��}=z\�ҹ�\\Oh\��\�9K�qZ�t\�/h���\�kPXk�H\�ΊZ��\�J^4�c��kE�8h+�7+��KS@��R\�{�/0���3��\�\�l0���<��O\�\�jt���Fo<�\0\�3�\�zM�\�m}��\��\�\rXWh\�\�\���\�%�\"��<{\�c\r}��! %���(�S^��J1j�{��ܪ{IZ��\�r`\�ϊOn���M\��5�\�j\��\�2\�+Kf��?\'��\�\0*��\�`��Z�\�\�s\��K-\�P���\�y���\�\�=\��M�\�==\���I\�6��;Oxt\�\�4f\�w�X*lf:��	k��s6��\�βc&Y	�Zw�\�\�lʞ��!�\���\�n<Y�W�n\�o6_�dbn�;����b3ى](�I�1;[�\�\�O���\0\���>\��µ��nɾֿ\r&�\�\��!D\��\��d[�\�\�o76�\��W\�tm9����\0�\�f_\�\�\�}\�k3�����L�\�U!�{�N\���`��� \�aw\����ɗ�\�h0d\� �y��F�/N_ܴ?�z��D�\�� 4Y�\�\�\�\�\n�\�(�\r���\�����!zq��_��\�\�K`շ�ڨNh��m�:�\n��\�3FngL`��?2\�\�\n�\�j��b��J�\�\n\��K\�\�7Y^\�\�&@�\�aU|O�R�vQ�!�BԵ~�����?�S\�M5g9\�Fv��F\�kW6\�?Ξ�L�;�\0���_\�D\�x�DE����OĢ�j\�ZЍ�2]\�=\�3?0�X#\�.,75�}t�\�;?Z\�3j��e���.\�~�\�\0��̢�\�\�I�͠�\�fy�V\�7j̗�5w��\��\��\�T�\�k\�\ZK\�-S���1�a�x���f\"�[\�WPN�|Vq\�i���\��.?\Z\�\��\��秙��\�\�$\�5\�\�]�\�,�pi=���x#�?\Zi6\�\�|�7^\��K�(�C��Z�\�(4\r^\�\�\�e�\�@\�T�mЗy�c��!}.(�^{@@n&ҩ\��~\�k��E*	��C�|�\�\0\0�\�M\�z���7\�6�\��=;M�g\�o\�\�c+\�i\�I�gi��\�Z,��a�<\�q`Mc\�?\��w@��\\\�h:��\�\�X),rT\�n>�\�A\�\�[{���i�E&JUZ�z({ ˚\�2�\�w�G�5\�=Gv��(\�\���iJ�iE�M��\�\�\�=iꙞ���=\rj{\�\��6����\�.zͦ&�Bz\�3?\�\�Y\�7Wb<\�\�R\�:{����ܗ*�\�Uy\�4�\���\�}\�\r\�]w7��kKvM\��:\���G��Yn�\�z1�[d\�\�{!��V�\�R��A	ˊ?��\�i\�7\ntc\�\�,Z\�1\�\�\�/\�\�q�4����\�8\�_k�x4V4\�ik�\�:\�t�C\�\�j��{��\�q�N\���\�\��\0\��?t\�_\\M\'�|�\�p��D��\�\�p\�\�Λ\�Y\�\�\�ɇq_���\��\0\"\�N�\�a\�\�`�J5�f:���0�\�!�d\��;q��Z\�h|��\Z\��I\�\�ٌ�!j\���O�!\�|��F\�\�\��eL����M\'B�`-�\�\�\�\Z/�\�\\.\"ւ{\�#\�t\04\Z�Y�8�o��\�Xf�V\�,jG\�H�w\r�\�zg��\�.�����6\�m\�鎄\�ы7��	��^�Qu��v�9����.x�Ʋ:8{���j�k\�\�G\"%�\�[�\�xA�P�=��\��~1ՙtO�t`E�_G_\�Z\0xf�:&���\�^U{�W�\�)6�\�\�\�K,п�\"w,�\�\0W�Z\����\�yM!u\n�:��Sa\�\�\�f�,]^�0R\�:\�3��ݕ\�#�\�\�y\�G\�\\fg�z��O\�o�ô��\�Y\�T��\���On���w\�]�z�\�fv\���\�=%�\�\�h*�U2\"\rW#�9�l\"n&�\�J�l\�\�Ϥޝ|O8\�*�\�ӤkR�`qx;\0\�\�\�{\�\�����9���M���\�\�\�-3��y\n&\�\�P}4H2�-y\�\�\�k���a\�z\�\�Y9\��\0\�\�\�t\��\�ө�c�\�w\�M\�n�\�0t\�\�`���\�F~W�o1��N�2�m=g�\�\�\��;ƷQ�]�\��9��(\�8xL\�yb��O\��.\�\��O\�Xx\�({�\��!1�GԖw\�\�\�\�\�\�)̉\�p�\�\�W՟U�0#�\�\�؝\�e\�\Z�\�g6���\�<\�\�7�Wm��j�v\\��z!��{eISf�\�mܳ�t��\�t\�\�\�\�:y�OHOI\�m�\\�<M&�\�\��A�\�h`\��*f.z\�X�D��Dvy �n��5}\�NO(\�m\�\��p<4\�\�2P\�O\�Q6\�>4�V�?���\�_\r�!oW9\�O�ߢ�#�g\�[b\�}ʝ�\��\r\�]1�v/\�H\�e�\�5\�\'��),NϘ\�\�q�V\�\�Spr΋�Ȏ5��$z(q/g�\�\�/\���L�\�\�OI��\�\��\�y߮�\����0� ���O�z6\�\�4:p2��\��\������\�`���\�\�\"&g`�\�=�~:b7q!�()�h�\�,�\��{;\�vbwc�Hx�ʇ\nW�{�\�ۡ�\��~l\�\"O4�@�Y晀@0�\�ԧ4� ��o�?\�#خ�#i\�9�1\�\�*\�\�S�e;\�\�:Mzm\�q��ۼߦg��\�f\�\��\0��Sm�\0�Y�Nzk�\0;\�\�\�iL\�{?�^��\�\�{\'\�0��\�&�\'�\0\��\�j9\�Tk�\�h\�\��t�\�#��&�*d\�_\��OX�2�ժ\�:r[��t@\�\0x?\��1\�c\�\r�Er��|\Z�K��\�8�\�u>�~|��A\�ew��6�\�z��e�\�U\�df&#���\�q\��yS�њ�[<M	\�\��\�t\�=#\���BW���ƆU����d�5�l�j�\07Q1\�E�\�ְnk<1\�$\�[\�\�,\�8�\�.����2z\��\�\�h��\�1#@�/�\0R�Hd�GL�e�x�\���E�\�)`F\��\�h\�\��?E\��X4�.s�dH�\�\��,\�k�V \�m��\�g�q\�P��\�\���\�T:7PR\�Ş��O3\��OX�]�ܾ\� �V��\�q\�&\�&vƸ|>�\�=5\�\����Q_\�\�\��;.H\�c\����=�\�\�)�W\Z\�`�V\�\�#\��/\�\"`{\����\�����\�7��nw<1��@\0\0`��\r���=`�f+:AWR~OkW�\�]zv��\�^k\�\�\�0ڈ5t�\Z�\�\�C���}����f؝癎���1�\00�\�?3Y�O�z_FP\�YZ\�A\�e�W�u\�2�������8��\�ә\�=K�M�T`ü\�\Z�7y�\�=6�sH-h[W�\�\�z�7jfu\"�\�ʃ�FB\�D9T	\�J�e��\r2Ǉgޠ\�Xm^\�<t3L̖��vk]�v���H(�dDNI��H\�\�o�~&�i\��x��-_g\��p�1\�̿�\�C4c� ^\�[_�]\�)+��%y#�ZBrZ[�G\�y��&g�^� Z��D�f��idf\�\r�ޚ2qJ�H�(��64\�~u�����+�=S�;J�\�a�I]5Vi��\�G)�&\'�_n�ۦ�\��\�F�C�*_��\�ĩ���\�Lu4\�`q\�Y#\�\�%�R�q��<9\�f\�\�\�\�rW�]a��\�\�\��\�\�b���#�4��\������׬>�E`V�ƯbP\�\�j�\�\��vWC\��L�n\�0�={\�<~��\�\�4�=i}W8y�4q\�\�I��*f\�g�[ߡ\�\Z\�-�\'��y�t\�ߩ�¦i\�6�\�Εxc\�\�\�h�w\�y�އys��4{\�D��KO�\�\�t\�^h\n��Zt�&��k��~؆�2Qe#�x��+Y�v���\�_\�b�2\�ݏ��^\�8��\�<�=A�\�\r\�AF�\�\0�I��LP\0\�\�ķ\�/%{\�\��\��j=�Ϻ}�}�{MM\�\�練��\�}j:\�\n�Ot�\�\�Lt�:k\�I�O��Q߹�h�a*HF\�+Q�\�\�Q�\�X`P-^\�)Q�\�\�!e�G\�h\�A��2\�\�Z\'&�Cڽ\�V~@\�n\��p\�g�g\'s�ƛ�I&e���\n\�Q�Cx�42]���\�e{��x\�\�7��|B���z�&\�\�^єY\�J`�\�yo��x6��K�T���<�H��\0�.M	/pO�\�o\�lFߧ�?\�\�Җ2\"�\"38\���y]O!�-\�;�؛�C��\����)Dg@;\�^���	��aC�}�x���Bـ\�\���t\'�?0J\�hz�~%��~������2�R��7/�\�jMn\0�\n\"�%ޖk\n%\�kY[�Վh�E�\Z\�] \�NR7^�\�9������u^J��0�٢;��\�؄\�1��\�Q\�\�\�6\�3̩]�zFzD)|�Nǖ�X	D,F\�\�k7�\0��Ӵ����\�ć\�m.7b��;ȜD`\Zn\�i]\���C��2y\�2f\�!��h\�r\�ۖ#\�L�\�%�\Z�K\�+Ҝ�q�5xP�9u.!h4���\�\�;���(eY�\��\�^z�\�\�.:Ћb/Z�˚\�\Z���\��_\�&���zOI�=#N���\�m\�l)Q�\�^U��\�{�a\�WK�/�\�\�5\�|@�[E��y���\��t���\�1�\����\�\��\'tf�\�Oq\'xi-p�q�\�\�yӞ�И�&�e�qviKNӜ�\�-h�^\�\0��\�S\�T��ҁ{��a����\0ckoy��\�t\�\�ǹH���\�y�/`�\��FMr>)�\'yr�{Fc�\�7\�Oi\�X=c\�l�w��\�Bk�=\�\��x\�~:z�Z;v*1Z��w-<(�-��ǋƱ�WCX\��\�Y�\�/�#I�囐�*Zh\�t7�\�\�e\��P�-[\�S��\�@���;F��\���V�\r���.ak����.9\�[�\�Oh\��/\ZK�\�\�VTz�\�BI$:\�Ӊ̸\���B�����d�?b�7�eO^����3Y\�\�\�鿈Bbo�\���\�)�F\Z�\�Z=a\�(	��>\��(q5��5���\�g��y�2�\�|\�\�\�@2V�ȗ6�yG\�\Z��,��X�\\\��/{��%CU\�\�\n�jh����\�\�I���6�k��q�_�L\�3~�)^��`��o\�S\�\�s5�\���\�	�B~D)��ͿJ<t\�I(\Z�C���\�>/Gr�\�y\�fT�=��\�;t\�8Z�%�%m\�z4�,ִ^�.NOy\�7��y랛C�E�}�E8��\�U�##�0\�\"�0#G\�\�9��\�6�\rW�vH��\�#ǚ�\�<\�\�aI\�\�;\�0��\�{\�9��\�J\\Ïq/�����\0H#�G\'�p�����*\��\�`FW��\�3<A\���\�w�{��\�o3\�\�!*.ZV\�\��CD\�6ʙ8\��h�7\�\���&��5\�_& �\�r~:\\\�3dZ�\�y�C�\�&l��&G���ƴ�$�g��\�{\�\�`\�p�\�;<(\��\�^f�\�t\�C4���1\���7\�>J\�J\�\�\�L\Z*\�=N�\�m��\�\�c\���}\��\0pb�\�è�\�9�˃�J�;� \�x鎛C�\�\�G�\�\�\�a\�g=�}A�Fj�D\�\�%T}�A.&�\�J� \�r����� ����g1J}\��R[�om�#�ۥK���_Ѡ�����QƵٿ!\�SȸMGi�\r��\�5X\Z�N\�ٞ�\�i3R�ђ�kS\�>��4O�\�3\��\��S/�~zfg�\�\�Cq��\�\ramR&n\\\�c���\�\�>a\Z\";\�*�\��\�@\n��\�\�mƄf\���t���\�a\"iѱRśC���ȃq\�\�\�A?g�t\�/�K\�\\U�C=j0\��y}\�#JǾ�0�\�z�;t\'\��R\�?qW\�@\�D|2\�\�\� *���7~�\�\�4\�\�4�\�Џ����\�=f��G\�=�ϵ\�\�\Z{��m?yM�O\�\�S\�0�\0{F_S�&V���P�\�2�\��\�\�-\�0fe|��O=���\��XNzo��z�M\�Ҕm����\�q� \"w�\�\�\�A\�\"&s7��1\�||\�\��6�ʿ|��K~�K\�3�g\�\ZT\�S�\�K�OX%\��\�o��O�\�DGJ��JW)Ϙ���\�2\�w�\�V}��\"67R�\�:\���\�r��s.~g��/���\�\�=7��&9�\�D�a\�@\'��M �\�d\��[>�\�u�\0\�1<\���\�\��˴�~\�C1��\�v\�!\��\�i?\�ux\rO^e��y�k+\�\�\����f�P��r��4o�k穧���(=\�\�2ts1	�BWBw\�N&�H5\Z}�\0\� �\�\�!�\0\ZU\�Bޚ\�zLNg�\�\�\\q7�m\�6�\�Ɖ�Y�m�I�\�4\�WAlA;\�q�\�Q寴�16Ό@joI0�(||v�I��g\�V\r$\�Yx*=��]\�8��}y�}f�7,\�G��\�<\�n,���h�ͺ\\ߦ�g\��O\�&.�4����.\\�m\��;\�$�0A;\�\�y��\0!֦��)\�zƲ\"\�\�_5�@| ��\�	��\��� �Ŋ\���\r⮓\��w�\�\�\�\�\�)\�\�湏㈓XY۷L\��\�hG��4�P�\�K�2~ߘ0��7�6�D\�\��\\f%I��;0\�X\�6�䌘���z\�\�\���\0\�Ӧ\�y\�\�D4�M\�\�#�\�k3zLIGxSHG\Z\�X�\�Kc\�P\"\�\�\�\�XK\n\�\Z��W\�U\�m\'�\�w����\�\�\�,JK:�4�&؉4��\�{��\�-����\rK�~���\�xz�/�Z*�?\�:\�|ٻv�J�\r(w�/\�LBzM\�7\�:y�0�\0��zͺ�\�=�\�0\�4S����\�N\�Y�Z���UfiA�UY\�\r�34Y��a��J�\�\�]N#�\0*y\�)��O�$F\�g��\�!\��\�\r\�~�?\��̿\�\�����L��\�8\�3\�s\��t9�\0��\�ç�f*>\nF\�%#���.g\\�O\�Q\�wC\�O�\�[��_5*d�E/00t@\"	�s4���\r��\�x\�eqjGz\�x��)cbC\�j�~�<K7�\�\�,�D-VM���C�k㹨�B4�{=9\�\�\�|)\0\�\�\�\�\�2�փ�6B��+In�լ�\�\�!�M\'�\�',1);
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
	INSERT INTO usuario(nombre, apellido, email, clave, contraseña, telefono, dereccion, imagen, Active)
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
where clave=Pclave && contraseña =Ppas;
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
where clave=Pclave && contraseña =Ppas;
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
