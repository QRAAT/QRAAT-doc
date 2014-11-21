/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXIST `auth_project_collaborator` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupID` int(10) unsigned NOT NULL COMMENT 'References GUID in web frontend, i.e. `django.auth_group.id`.',
  `projectID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `groupID` (`groupID`,`projectID`),
  KEY `projectID` (`projectID`),
  CONSTRAINT `auth_project_collaborator_ibfk_1` FOREIGN KEY (`projectID`) REFERENCES `project` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `auth_project_collaborator` VALUES (9,2,1),(10,4,2),(11,6,3),(12,8,4),(13,10,5),(14,12,6),(15,14,7);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXIST `auth_project_viewer` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupID` int(10) unsigned NOT NULL COMMENT 'References GUID in web frontend, i.e. `django.auth_group.id`.',
  `projectID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `groupID` (`groupID`,`projectID`),
  KEY `projectID` (`projectID`),
  CONSTRAINT `auth_project_viewer_ibfk_1` FOREIGN KEY (`projectID`) REFERENCES `project` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `auth_project_viewer` VALUES (8,1,1),(9,3,2),(11,5,4),(10,7,3),(12,9,5),(13,11,6),(14,13,7);
