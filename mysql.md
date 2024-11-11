# MySQL

### Export/Dump

`/usr/bin/mysqldump --single-transaction --routines --add-drop-table --disable-keys --extended-insert database_name | gzip > file.0.sql.gz`

### Import/Restore

`mysql -u root -ppassword database_name < file.sql`

or a `.sql.gz` file:

`zcat /path/to/file.sql.gz | mysql -u 'root' -p database_name`


## Data manipulation

Date interval: `TIMESTAMPDIFF(MINUTE, created_at, NOW())`

## Useful queries

### Daily reporting

Day: 

```sql
GROUP BY DATE_FORMAT(date, "%Y-%m-%d")
```

Month: 

```sql
GROUP BY DATE_FORMAT(date, "%Y-%m")
```

### Most relevant weighted results based (MATCH AGAINST)

```sql
SELECT *, (
	(1.2 * (MATCH(title) AGAINST (:keyword IN BOOLEAN MODE))) + 
	(0.8 * (MATCH(description) AGAINST (:keyword IN BOOLEAN MODE))) + 
	(1.0 * (MATCH(tags) AGAINST (:keyword IN BOOLEAN MODE))) 
) AS relevance
FROM :table
WHERE 
	MATCH (title, description, tags) AGAINST (:keyword IN BOOLEAN MODE) 
	ORDER BY relevance DESC 
LIMIT 0,5
```

###  Computing Average/Median value ignoring outliers/extremes

```sql
-- Exclude outliers while trying to get the average
SELECT AVG(price) FROM transactions WHERE ABS(price - (SELECT AVG(price) FROM transactions) < 3*(SELECT stddev(price) from transactions));
```

## Variables

```sql
SET @store_id = 30,
    @date_start = '2022-02-10 13:30:00',
    @duration = 1 * 3600;
SELECT description
FROM orders
WHERE store_id = @store_id
AND created_at >= @date_start
AND created_at < DATE_ADD(@date_start, INTERVAL @duration SECOND);
```


## Settings

Create new MySQL user

```SQL
create user 'USERNAME'@'localhost' identified by 'PASSWORD';
```

## Performance

### Troubleshoot slow queries/high CPU

### Latest queries

```sql
SET GLOBAL log_output = "FILE";
SET GLOBAL general_log_file = "/var/log/mysql/mysql.log";
SET GLOBAL general_log = 'ON';
```

### Currently active queries

`SHOW FULL PROGRESSLIST;`

or to filter rows:

```SQL
select * from INFORMATION_SCHEMA.PROCESSLIST where db = 'filterbydatabase' ORDER BY COMMAND, TIME DESC;
```

### Slow mode

```SQL
show global variables like 'slow%log%';

SET GLOBAL slow_query_log = 'ON';
SET GLOBAL long_query_time = 2;
SET GLOBAL slow_query_log_file = '/var/log/mysql/mysql-slow.log';
```

_(`long_query_time` is in seconds, start with 2 and run a `mysqldumpslow`, adjust accordingly)_

**Remember to turn it off once done:**

```SQL
SET GLOBAL slow_query_log = 'OFF';
```

See summary:

`sudo mysqldumpslow /var/log/mysql/mysql-slow.log`

Live changes:

`sudo grc tail -f /var/log/mysql/mysql-slow.log`

Save report:

`sudo mysqldumpslow -t 20 /var/log/mysql/mysql-slow.log > top_ten_slow_query.sql`


## SQL Mode

```sql
SELECT @@sql_mode;
SET sql_mode = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
```
