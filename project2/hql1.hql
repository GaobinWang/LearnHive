--格式化数据库
drop database bicycle cascade;
--创建数据库
create database if not exists bicycle
comment "create database of project2: Hangzhou public bicycle project"
with dbproperties ("creator"="wanggaobin","date"="2016-03-27");


--创建表格
--创建tran表格
create table if not exists  bicycle.tran(tran_type int  comment "transaction type" ,
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
tblproperties ("creator"="wanggaobin","create-at"="2016-03-27");
--向表格中tran表格中导入数据
load data local inpath "/home/wanggaobin/project_bicycle/bicycledata.csv" into table bicycle.tran;

--创建sjx表格
create table if not exists bicycle.sxj(oper_type string comment "operation type,1 for down,2 for up",
net_id string comment "the id of station where this operation occur",
stall_num string comment "the id of location where bike park",
car_num  string  comment "the unique id of bike",
up_date string  comment  "the date when operation occur in format YYYYMMDD", 
up_time  string  comment "the time when operation occur in format HHMMSS",
oper_exteid string  comment "the unique id of operator")
comment  "this is the shang xia jia operation  table ,every row represent that the worker  up or down a bike"
row format delimited fields terminated by ','
stored as textfile
tblproperties ("creator"="wanggaobin","create-at"="2016-03-27");
--向sxj表格中导入数据
load data local inpath "/home/wanggaobin/project_bicycle/sxjdata_final.csv" into table bicycle.sxj ;

