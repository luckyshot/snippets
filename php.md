# PHP

## Dates

`date_default_timezone_set('Europe/Madrid');`

`date('Y-m-d H:i:s')`
2021-04-30 23:59

`date('j M H:i')`
30 Apr 23:59

`date('D H:i')`
Fri 23:59

### UTC date to local

```PHP
$utc_ts = strtotime($row['created_at']);
$local_ts = $utc_ts + date("Z");
$local_time = date('j F H:i', $local_ts);
```

## HTTP codes

```PHP
header('HTTP/1.0 401 Unauthorized');
echo '<h1>Unauthorized</h1>';
die();
```

## Weekly schedule on/off

```PHP
$schedules = [
    [
        'weekdays' => [1, 2, 3, 4, 5],
        'time' => [
            [7,30],
            [23,00],
        ]
    ],
    [
        'weekdays' => [6, 7],
        'time' => [
            [8,00],
            [23,59],
        ],
    ],
];
$schedule_status = 'off';
$date = time();
foreach($schedules as $schedule){
    if (in_array(date('N', $date), $schedule['weekdays'])){
        if(
            date('G', $date) * 60 + date('i', $date) >= $schedule['time'][0][0] * 60 + $schedule['time'][0][1]
            &&
            date('G', $date) * 60 + date('i', $date) < $schedule['time'][1][0] * 60 + $schedule['time'][1][1]
        ){
            $schedule_status = 'on';
        }
    }
}
```



# PHP Laravel

## Migrations

`php artisan migrate`

```PHP
public function up()
{
    Schema::create('flights', function (Blueprint $table) {
        $table->id();
        $table->string('name');
        $table->string('airline');
        $table->timestamps();
    });
}

public function down()
{
    Schema::drop('flights');
}
```


## SQL query styles (Eloquent, Raw)

```PHP
// Eloquent

$users = Users::select('count(*) as user_count, status')
    ->where('status', '<>', 1)
    ->groupBy('status')
    ->get();


// Raw Expression (careful with SQL injections)

$users = DB::table('users')
    ->select(DB::raw('count(*) as user_count, status'))
    ->where('status', '<>', 1)
    ->groupBy('status')
    ->get();


// Raw Statement (careful with SQL injections)

DB::statement("UPDATE `users` SET `status` = 'paused';");
```


# MySQL

create new mysql user

`create user 'USERNAME'@'localhost' identified by 'PASSWORD';`


# SQLite

```PHP
$db = new SQLite3('database.db');
$db->exec("CREATE TABLE IF NOT EXISTS logs (id INTEGER PRIMARY KEY, `action` VARCHAR(50), `value` VARCHAR(50), `created_at` DATETIME);");


$db->exec("INSERT INTO logs VALUES (NULL, 'mode', 'on', datetime('now'));");


$res = $db->query("SELECT * FROM (
    SELECT * FROM logs WHERE `action` IN ('mode') AND datetime(created_at) >= datetime('now', '-48 Hour') ORDER BY created_at DESC, id DESC
    ) ORDER BY created_at ASC, id ASC;");

while ($row = $res->fetchArray()) {
    echo $row['value'];
}

```

