# MySQL

Create new MySQL user

```SQL
create user 'USERNAME'@'localhost' identified by 'PASSWORD';
```

## Performance

### Trounleshoot slow queries/high CPU

### Live troubleshooting

`SHOW FULL PROGRESSLIST;`

or to filter rows:

```SQL
select * from INFORMATION_SCHEMA.PROCESSLIST where db = 'somedb' order by Time desc;
```

#### Slow mode

```SQL
show global variables like 'slow%log%';
```

`sudo -i mysqldumpslow /var/log/mysql/mysql-slow.log`
