--数据导出
--导出到分布式文件系统中
insert overwrite directory '/tmp/file'  select * from tablename;

--导出到本地文件系统中
insert overwrite local directory '/home/wanggaobin/file'  select * from tablename;

