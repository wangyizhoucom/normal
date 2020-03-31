// Oracle					
					
// 把字符串为‘2011-09-20 08:30:45’的格式转化为日期格式					
SELECT to_date('2011-09-20 08:30:45', 'yyyy-MM-dd hh24:mi:ss') FROM dual					
					
// to_char()函数把日期转化为字符串					
SELECT to_char(SYSDATE, 'yyyy-MM-dd hh24:mi:ss') FROM dual; 					
					
// MySQL					
			字符		时间格式
SELECT DATE_FORMAT('2011-09-20 08:30:45',   '%Y-%m-%d %H:%i:%S'); 					
					
		 时间		字符	
SELECT DATE_FORMAT(NOW(),   '%Y-%m-%d %H:%i:%S'); 					


// =============================================================
// 查看SQL执行计划  explain

explain select * from table; 			
explain用来查看sql执行计划，查看该SQL语句有没有使用上了索引，有没有做全表扫描，了			
解SQL语句开销。			
1			
SeqScan(顺序扫描)			
直接对数据表堆数据进行顺序扫描，适用于选择率较高的场景；			
2			
IndexScan(索引扫描)			
通过访问索引获得元组位置指针后访问堆数据，适用于选择率较低的场景			
3			
BitmapHeapScan（位图堆扫描）			
位图堆扫描需要首先通过BitmapIndexScan(位图索引扫描)把符合条件的			
元组所在的Page(Block) ID存储在Bitmap中,然后再通过Bitmap访问堆数据,			
适用于选择率不高不低的场景,介于上面两种扫描方式之间.			


// ============================================================
操作符	         例子	                                                            结果	
  +	           date '2001-09-28' + integer '7'	                                    date '2001-10-05'	
  +	           date '2001-09-28' + interval '1 hour'	                              timestamp '2001-09-28 01:00'	
  +	           date '2001-09-28' + time '03:00'	                                    timestamp '2001-09-28 03:00'	
  +		         interval '1 day' + interval '1 hour'	                                interval '1 day 01:00'	
  +	           timestamp '2001-09-28 01:00' + interval '23 hours'	                  timestamp '2001-09-29 00:00'	
  +	           time '01:00' + interval '3 hours'	                                  time '04:00'	
  -	           - interval '23 hours'	                                              interval '-23:00'	
  -	           date '2001-10-01' - date '2001-09-28'	                              integer '3'	
  -	           date '2001-10-01' - integer '7'	                                    date '2001-09-24'	
  -	           date '2001-09-28' - interval '1 hour'	                              timestamp '2001-09-27 23:00'	
  -	           time '05:00' - time '03:00'	                                        interval '02:00'	
  -	           time '05:00' - interval '2 hours'	                                  time '03:00'	
  -	           timestamp '2001-09-28 23:00' - interval '23 hours'	                  timestamp '2001-09-28 00:00'	
  -	           interval '1 day' - interval '1 hour'	                                interval '23:00'	
  -	           timestamp '2001-09-29 03:00' - timestamp '2001-09-27 12:00'	        interval '1 day 15:00'	
  *	           interval '1 hour' * double precision '3.5'	                          interval '03:30'	
  /	           interval '1 hour' / double precision '1.5'	                          interval '00:40'	

// ===========================================================

postgresql查看索引				
select * from pg_indexes where tablename='student';				
或者    				
select * from pg_statio_all_indexes where relname='student';				
				
				
create unique index indexno on student (s_id)				
				
DROP INDEX indexno;				


postgresql:		
select '1990-01-01'::timestamp + '1 w'		
select extract(doy from now());		
select extract(month from now());  		
select extract(year from now())		
select to_char(now()::timestamp + '1 month' ,'w')		

select to_char(now()::timestamp,'W')				
				
select to_char(now()::timestamp,'d')				
				
select to_char(now()::timestamp,'dd')				


// 当前第几周比较（周的比较）			
select s_name,s_birth from student where extract(week from now())=extract(week from s_birth::timestamp) 						

// 年月日的比较
select current_date as "当前日期",					
s_birth as "出生日期" ,					
extract(year from now())-extract(year from s_birth::timestamp) - 					
case when to_char(s_birth::timestamp,'mm-dd')>to_char(now(),'mm-dd') then 1 else 0 end					
as "年龄"					
from student 					


// ===========================================================
HH	一天的小时数(01-12)
HH12	一天的小时数(01-12)
HH24	一天的小时数(00-23)
MI	分钟(00-59)
SS	秒(00-59)
MS	毫秒(000-999)
	
	
	
US	微秒(000000-999999)
AM	正午标识(大写)
Y,YYY	带逗号的年(4和更多位)
YYYY	年(4和更多位)
YYY	年的后三位
YY	年的后两位
Y	年的最后一位
MONTH	全长大写月份名(空白填充为9字符)
Month	全长混合大小写月份名(空白填充为9字符)
month	全长小写月份名(空白填充为9字符)
MON	大写缩写月份名(3字符)
Mon	缩写混合大小写月份名(3字符)
mon	小写缩写月份名(3字符)
MM	月份号(01-12)
DAY	全长大写日期名(空白填充为9字符)
Day	全长混合大小写日期名(空白填充为9字符)
day	全长小写日期名(空白填充为9字符)
DY	缩写大写日期名(3字符)
Dy	缩写混合大小写日期名(3字符)dy缩写小写日期名(3字符)
DDD	一年里的日子(001-366)
DD	一个月里的日子(01-31)
D	一周里的日子(1-7；周日是1)
W	一个月里的周数(1-5)(第一周从该月第一天开始)
WW	一年里的周数(1-53)(第一周从该年的第一天开始)
	
