一、数据库
	存放数据的地方
	
二、常见的数据库
	关系型数据库
		a.informix		IBM+HP		用于 军、政、运营商、银行
		b.db2	        IBM		    用于 军、政、运、银
		c.oracle     	甲骨文		用于 中大型企业
		d.mysql	     	甲骨文		用于 互联网企业
		e.sqlserver  	微软
		
	非关系型数据库
		a.mongodb		用于 大数据、爬虫
		b.redis			用于 缓存、验证、消息队列
		c.cassandra		facebook开发的，后来弃用了

三、MySQL数据库
a.安装mysql的服务端
	sudo apt-get install mysql-server
	安装中会提示输入管理员的密码（密码不要以数字开头）

b.安装MySQL的客户端
	sudo apt-get install mysql-client
	
c.安装相关的库文件
	sudo apt-get install libmysqlclient-dev
	
d.mysql基础
	1.mysql的主服务(mysqld)
		检查mysqld进程是否正常运行
		ps -ef | grep mysqld
		
	2.mysql的端口(3306)
		检查mysqld的端口是否正常运行
		netstat -an | grep 3306
		
	3.mysql的管理员
		root
	
	4.mysql的登录
		mysql -u root -p
			管理员登录本地数据库
		mysql -u root -h 127.0.0.1 -p
			管理员 根据IP 登录数据库

	5.mysql的概念
		数据库分为2部分：数据库软件、数据库数据
		常说的数据库是指数据库的数据
		数据库是有表格组成
		
	6.基础命令
		show databases;
		
		select user();
		
		select databases();		#查看当前所在数据库
		
		use mysql;				#切换数据库
		
		show tables;
		
		select * from user;		#以表格形式显示，有时候显示比较乱
		select * from user\G; 	#每一行单独显示
	
	
四、表结构的创建
	表：类似于表格，有行、有列、有名字
	a.数据类型
		数字	int              123 456
		字符	char  varchar    ‘simida’ ‘1234’
		日期	date		 '2018-11-26'
	
	b.表结构的创建
		语法：create table 表名(
			列名  数据类型，
			列名  数据类型，
			...
		);
		
	c.例子：创建表韩国(kr),泡菜名字(pname),字符类型，泡菜价格（price） 数字类型，出厂日期(ddate) 日期类型.
		create table kr(
			pname char(10),
			price int,
			ddate date
		);
		
	d.补充：
		查看表结构的命令
			desc kr;	#查看kr表格的表结构
		
		创建数据库
			create database test;
			创建test数据库
	
	
	e.约束
		主键约束；列中的数据不能为空，而且不能重复（唯一），每张表中只有一个
		唯一约束：列中的数据唯一，常作为主键约束的补充，每张表中可有多个
		非空约束：列中的数据不能为空，如果向表中新增数据，就一定要操作本列
		检查约束：列中的数据是否满足条件
		外键约束：一张表中列的数据依赖于另一张表中的数据
		
		语法：
			create table 表(
				列 数据类型 primary key,					#主键约束
				列 数据类型 unique,							#唯一约束
				列 数据类型 not null,						#非空约束
				列 数据类型 check(检查条件),				#检查约束
				列 数据类型 references 被参考表(被参考列)	#外键约束
				
			)
		
		
五、SQL语句		
	SQL:结构化查询语言
		DDL:数据库定义语言		create alter drop truncate
		DML:数据库操作语言		insert update delete
		DCL:数据库控制语言		grant revoke
		DQL:数据库查询语言		select
		
		
六、数据库的新增
	注意：
		字符类型、日期类型的数据需要加单引号
		数字类型直接使用，不需要引号
		
	1.向表中所有列新增数据
		语法：insert into 表 values(值1,值2,....);
		例子：insert into kr values('simida',230,'2018-11-24');
		
	2.向表中部分列新增数据
		语法：insert into 表(列1,列2) values(值1,值2);
		例子：insert into kr(pname,price) values('simida',230);
		
		
七、数据修改
	语法：
		update 表 set 列=值 [where 条件];
		
	注意：
		如果不增加where条件，默认修改的是整个列的数据
		如果增加where条件，修改的是指定行的列的数据
		
	例子：
		update kr set pname='paocai' where pname='food';
		update kr set pname='baicai' where price=30;
		
		
八、数据的删除
	delete		DML	可以删除指定数据，删除数据可以找回
	truncate	DDL	只能删除所有数据，删除数据后无法恢复（官方说法是不能恢复，实际可以找回，只是很麻烦，需看日志）

	delete
		语法：
			delete from 表 [where 条件]；
		例子：
			delete from kr where pname='simida';
			delete from kr		#删除表中所有数据
			
			
	truncate
		语法：
			truncate table 表名;
		
		例子：
			truncate table kr;		#删除kr表中所有数据
			
		
		
九、sakila database
	mysql官方的样例数据库
	
	a、下载sakila数据库
		https://dev.mysql.com/doc/index-other.html
	b、进入压缩包所在目录,解压压缩包
		tar -xzvf sakila-db.tar.gz
	c、进入解压后目录
		cd sakila-db
	d、登录mysql数据库
		mysql -u root -p
	e、导入数据库结构
		source sakila-schema.sql
	f、导入数据库数据文件
		source sakila-data.sql
		
		
十、数据的查询
	查询指定行、指定列、指定行的列
	
	语法：
		select 列 from 表 [where 条件];
	
	例子：
		select * from customer;
		select last_name,first_name from customer;
		select last_name from customer where first_name = 'WADE';
	
	a、where条件
		a1、比较运算符
			>
			<
			=
			>=
			<=
			!=
			<>
			
			例子：
				select * from customer where customer_id < 100;
				select * from customer where first_name != 'Mike';
				
		a2、关系运算符
			and		同时满足条件
			or		满足一个条件即可
			not		不满足条件
			
			例子：
				select first_name from customer where customer_id between 100 and 110;
				
				
		a3、区间
			between ... and ...
			前面小，后面大，包括端点
			
			例子：
				select first_name from customer where customer_id>=100 and customer_id<=110;
				
		a4、模糊查询
			当信息不完整的时候，使用模糊查询，通常和字符串类型一起使用
			like
			_		一个字符
			%		任意个字符
			
			例子：
				select * from customer where first_name like 'M%';
		
		a5、空值查询
			is null		is not null
				空没有任何数据类型，没有任何值
				不能用于比较和运算
				查询时使用 is null 或者 is not null
			
			例子：
				select * from kr where price is null;
				select * from kr where price is not null;
	
	
		a6、in
			在...里面
			
			例子：
				select * from customer where first_name in ('Mike','hegre');

		
		
		
练习：

emp表中有以下的列：
empno  员工号
hiredate 入职日期
ename   名字
sal         工资
comm   佣金
deptno 部门号

create table emp(
	empno int,
	hiredate date,
	ename char(10),
	sal int,
	comm int,
	deptno char(10)
	);


1.查询emp表中工资大于2500的人的所有信息
select * from emp where sal > 2500;

2.查询emp表中雇用日期早于1981-09-08的人的名字和部门号
#以下两种方法都行
select ename,deptno from emp where hiredate < '1981-09-08(%YYYY-%MM-%DD)';
select ename,deptno from emp where hiredate < '1981-09-08';

3.查询emp表中名字为ALLEN或者KING的人的工资和姓名、部门号
select sal,ename,deptno from emp where ename in ('ALLEN','KING');

4.查询emp表中部门为20号部门或者工资大于1500并且小于2500的人的所有信息
select * from emp where deptno = 20 or (sal between 1500 and 2500);		错误，包含端点
select * from emp where deptno = 20 or (sal >1500 and sal < 2500);

5.查询emp表中名字为KING或者部门号为30号部门的人的姓名，佣金，部门号
select ename,comm,deptno where ename = 'KING' or deptno = 30;

6.查询emp表中雇佣号为7369的人的所有信息
select * from emp where empno = 7369;

7.查询emp表中工资范围在800到1000的人或工资范围在2000到2500的人的所有信息
select * from emp where (sal between 800 and 1000) or (sal>=2000 and sal=<2500);

8.查询emp表中工资高于1500，2000，2500的任何一个的人的所有信息
select * from emp where sal > 1500;
select * from emp where sal > 1500 or sal > 2000 or sal > 2500;

9.查询emp表中名字以AL开头的人或者佣金为空的人的所有信息
select * from emp where ename like 'AL%' and comm is null;

10.查询emp表中佣金不为空的人并且工资大于800，1500，2000的所有工资的人的所有信息
select * from emp where comm is not null and sal>800;
select * from emp where comm is not null and sal>800 and sal > 1500 and sal >2000;

