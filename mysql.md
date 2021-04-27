# MySQL

Create new MySQL user

```SQL
create user 'USERNAME'@'localhost' identified by 'PASSWORD';
```

## Performance

### Troubleshoot slow queries/high CPU

### Live troubleshooting

`SHOW FULL PROGRESSLIST;`

or to filter rows:

```SQL
select * from INFORMATION_SCHEMA.PROCESSLIST where db = 'filterbydatabase' ORDER BY COMMAND, TIME DESC;
```

### Slow mode

```SQL
show global variables like 'slow%log%';

SET GLOBAL slow_query_log = 'ON';
SET GLOBAL slow_query_log_file = '/var/log/mysql/mysql-slow.log';
```

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

