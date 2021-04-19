# Xavi's snippets

This is a list of code snippets that I tend to use a lot while coding. I made it so I don't need to be constantly searching for them all over the place.

## CSS

`filter:brightness(1.2);`


### Animation

```CSS
.fire {
    animation: pulse 2s infinite;
    display: inline-block;
    transform-origin: 50% 100%;
}
@keyframes pulse {
    0% {opacity: 0.66;transform: rotate(-10deg);}
    50% {opacity: 1;transform: rotate(10deg) scale(1.1)}
    100% {opacity: 0.66;transform: rotate(-10deg);}
}
```

### Media queries

`@media only screen and (min-width: 600px) { }`

Targets iPad 1: 

`@media only screen and (device-width: 768px) and (device-height: 1024px) { }`


## JavaScript

### Bookmarklets

`javascript:void( /* code here */ )`

Go to another page

`location.href='https://example.com/add?url='+encodeURIComponent(location.href)+'&text='+encodeURIComponent(document.title)`

Open a popup window

`var bWindow=window.open("https://example.com","Window title","height=300,width=600");setTimeout(function(){ bWindow.close() }, 5000)`


## HTML

Common `<header>` tags:

```HTML
<link rel="icon" href="favicon.png">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
<meta name="theme-color" content="#000000">
<meta name="apple-mobile-web-app-title" content="App name">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="default">
<meta name="mobile-web-app-capable" content="yes">
```


## PHP

### Dates

`date_default_timezone_set('Europe/Madrid');`

`date('Y-m-d H:i:s')`
2021-04-30 23:59

`date('j M H:i')`
30 Apr 23:59

`date('D H:i')`
Fri 23:59

#### UTC date to local

```PHP
$utc_ts = strtotime($row['created_at']);
$local_ts = $utc_ts + date("Z");
$local_time = date('j F H:i', $local_ts);
```

### HTTP codes

```PHP
header('HTTP/1.0 401 Unauthorized');
echo '<h1>Unauthorized</h1>';
die();
```

### Weekly schedule on/off

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


## SQLite

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


## Bash

```BASH
nano ~/.bashrc

alias serveron="sudo service apache2 restart;sudo service mysql start;htop"
alias ll="ls -la"
alias _update="sudo apt update;sudo apt upgrade"
```

`sudo nano /etc/apache2/sites-enabled/000-default.conf`
