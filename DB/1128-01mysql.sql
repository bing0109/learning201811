
排序
	语法：
		select 列 from 表
		where 条件
		group by 分组条件
		having 分组后过滤
		order by 排序条件;
		
	顺序（从小到大）
		order by 列;
		order by 列 asc;
		
		例子：
		select * from city order by country_id;
		
	
	逆序（从大到小）
		order by 列 desc;
		
		例子：
		select * from city order by city_id desc;
		
		
分页（limit）
	开发语言中基本都会涉及
	
	例子：
		查询city表中前8行数据
		select * from city limit 8;
		
		查询city表中9-19行数据
		select * from city limit 8,11;
			从第8+1个开始，去11条数据；
			
			
	







作业：
表T1存在于SQLSERVER中
T1(stked char(6),hname nvarchar(128), hpercent decimal(6,2))
stked - 股票代码
hname - 股东名称
hpercent - 持股比例（%）



1、请写出提前每只股票的第一大股东名称的SQL语句

select hname from t1
where stked in (select stked from t1 group by stked)
order by hpercent desc
limit 1


select * from t1
order by stked, hpercent desc



2、请写出提前每只股票的第二大股东名称的SQL语句



















