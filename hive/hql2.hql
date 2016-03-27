--此文件为常见的hive查询语句

--单个查询语句中创建表格并加载数据
create table tablename1
as select name,salary,address
from tablename2
where var="aaa";


--case...when...then 语句
--由于hive中并不支持记录级别的更新，因此sql中的update ...set  ... where ...语句不能使用，而下面这条语句刚好能够完成此功能
select name,salary,
   case
      when salary<5000.0 then "low"
      when salary>=5000.0 and salary<7000.0 then "middle"
      when salary>=7000.0 and salary<10000.0 then "high"
      else "very high"
   end as index from table1;

