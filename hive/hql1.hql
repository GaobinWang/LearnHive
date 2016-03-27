--该文件包括创建数据库，创建表格，删除表格，删除数据库等操作；
--ps:hive中sql文件的注释符为--

--创建数据库并查看数据库描述
--创建数据库
create database if not exists learnhive
comment "create database learnhive"
with dbproperties ("creator"="wanggaobin","date"="2016-03-27");
--查看数据库描述
describe database extended learnhive; 

--创建表格并查看表格描述
--使用指定的数据库learnhive,也可以不使用该语句
use learnhive;
--创建表格
create table if not exists  trandata(tran_type int  comment "transaction type" ,
rent_netid int comment "the id of rental location",
tran_date int comment "the date of rent bike  in format YYYYMMDD",
tran_time int comment "the time of rent bike  in format HHMMSS",
exte_card int comment "the unique id of user",
rent_num int comment "rent_num",
car_num  int comment "the id of bicycle",
rent_uptime string comment "the date and time of upload rent  data",
return_netid int comment "the id of return location",
return_uptime  string comment "the date and time of return data ", 
user_cost string comment "the cost of this transaction",
return_date int comment "the date of return bike in format YYYYMMDD",
return_time int comment "the time of return bike in format HHMMSS",
tran_flag  int comment "the result of this transaction")
comment  "this is the transaction table ,every row represent that one user rent and return a bike"
row format delimited fields terminated by ',' 
stored as textfile
tblproperties ("creator"="wanggaobin","create-at"="2016-03-15");
--复制表结构
create table if not exists trandata_test like trandata;
--查看表格描
desc trandata;  --部分信息
describe extended trandata;  --全部信息
--向表格中导入数据
load data local inpath "/home/wanggaobin/project_bicycle/bicycledata.csv" into table trandata;

--修改表格和删除表格
--表格重命名
alter table trandata_test  rename to trandata_final;
--删除表格
--drop table if exists trandata_test;
--修改列信息
alter table trandata_final
change column  tran_flag  flag  int
comment "change column name"
after user_cost;
--增加列
alter table trandata_final  add columns(
test1 int comment "test1",
test2 int comment "test2");
--修改表属性
alter table trandata_final set tblproperties("note"="just  do it");



--修改数据和删除数据库
--修改数据库
--alter database learnhive set dbproperties("edited-by"="gaobin")
--删除数据库
--drop database if exists learnhive; --删除一个空的数据库
--drop database if exists learnhive  cascade; --删除数据库及其内部表格




