--格式化数据库
drop database gdelt cascade;
--创建数据库
create database if not exists gdelt
comment "create database of project3: GDELT Project"
with dbproperties ("creator"="wanggaobin","date"="2016-04-05");


--创建表格
create table if not exists  gdelt.events(GLOBALEVENTID int,
SQLDATE int,	
MonthYear int,
Year int,
FractionDate float,
Actor1Code string,
Actor1Name string,
Actor1CountryCode string,
Actor1KnownGroupCode string,
Actor1EthnicCode string,
Actor1Religion1Code string,
Actor1Religion2Code string,
Actor1Type1Code string,
Actor1Type2Code string,
Actor1Type3Code	string,
Actor2Code string,
Actor2Name string,
Actor2CountryCode string,
Actor2KnownGroupCode string,
Actor2EthnicCode string,
Actor2Religion1Code string,
Actor2Religion2Code  string,
Actor2Type1Code string,
Actor2Type2Code string,
Actor2Type3Code string,
IsRootEvent string,
EventCode string,
EventBaseCode string,
EventRootCode string,
QuadClass int,
GoldsteinScale float,
NumMentions int,
NumSources int,
NumArticles int,
AvgTone	 string,
Actor1Geo_Type int,
Actor1Geo_FullName string,
Actor1Geo_CountryCode string,
Actor1Geo_ADM1Code string,
Actor1Geo_Lat float,
Actor1Geo_Long float,
Actor1Geo_FeatureID int,	
Actor2Geo_Type int,
Actor2Geo_FullName string,
Actor2Geo_CountryCode string,
Actor2Geo_ADM1Code string,
Actor2Geo_Lat float,
Actor2Geo_Long	float,
Actor2Geo_FeatureID int,	
ActionGeo_Type int,
ActionGeo_FullName string,
ActionGeo_CountryCode string,
ActionGeo_ADM1Code string,
ActionGeo_Lat float,
ActionGeo_Long float,
ActionGeo_FeatureID int,
DATEADDED  int,
SOURCEURL  string)
comment  "events data"
row format delimited fields terminated by '\t' 
stored as textfile
tblproperties ("creator"="wanggaobin","create-at"="2016-04-05");
--向表格中tran表格中导入数据
load data local inpath "/home/wanggaobin/data/GDELT/*" into table gdelt.events;
