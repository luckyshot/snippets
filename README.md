# Xavi's snippets

This is a list of code snippets that I tend to use a lot while coding. I made it so I don't need to be constantly searching for them all over the place.

## CSS

`filter:brightness(1.2);`

```
html {
  --colorIndigo50: #EEF2FF;
  color: var(--colorIndigo50);
}
```

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

Fetch and insert data

```JS
fetch('/clickedMessage/')
    .then(response => response.text())
    .then(data => {
        document.getElementById('fetch-target-1').innerHTML = data
    })
```

Toggle CSS class

`document.getElementById('toggle-target-1').classList.toggle('red-border')`


### Bookmarklets

`javascript:void( /* code here */ )`

Go to another page

`location.href='https://example.com/add?url='+encodeURIComponent(location.href)+'&text='+encodeURIComponent(document.title)`

Open a popup window

`var bWindow=window.open("https://example.com","Window title","height=300,width=600");setTimeout(function(){ bWindow.close() }, 5000)`


## HTML

Common `<header>` tags:

```HTML
<link rel="icon" href="/favicon.ico">
<link rel="icon" href="/favicon.svg" type="image/svg+xml">
<link rel="apple-touch-icon" href="/apple-touch-icon.png">

<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
<meta name="theme-color" content="#000000">

<meta name="apple-mobile-web-app-title" content="App name">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="default">
<meta name="mobile-web-app-capable" content="yes">

<link rel="stylesheet" href="/style.css">
<link rel="stylesheet" href="/print.css" media="print">

<meta name="description" content="Description">
<meta property="og:title" content="Title">
<meta property="og:description" content="Description">
<meta property="og:image" content="https://example.com/image.jpg">
<meta property="og:image:alt" content="Image description">
<meta property="og:locale" content="en_US">
<meta property="og:type" content="website">
<meta name="twitter:card" content="summary_large_image">
<meta property="og:url" content="https://example.com/page">
<link rel="canonical" href="https://example.com/page">

<link rel="manifest" href="/my.webmanifest">

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



## PHP Laravel

### SQL query styles (Eloquent, Raw)

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


## MySQL

create new mysql user

`create user 'USERNAME'@'localhost' identified by 'PASSWORD';`


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



## Apache

_These are the default paths, each server can (and usually should) be customized_

### OSX / Linux

`sudo apache2ctl -S`                              (tests config)
`sudo apachectl -k restart`
`sudo code /usr/local/etc/httpd/httpd.conf`
`sudo code /usr/local/etc/httpd/extra/httpd-vhosts.conf`
`sudo code /etc/hosts`
`code /usr/local/etc/php/7.4/php.ini`

ErrorLog "/usr/local/var/log/httpd/error_log"
ServerRoot "/usr/local/opt/httpd"


### Windows 10 (WSL)

`sudo nano /etc/apache2/apache2.conf`
`sudo nano /etc/apache2/sites-enabled/000-default.conf`

#### Edit through Windows c:\Windows\System32\Drivers\etc\hosts

`sudo service mysql start`
`sudo service apache2 restart`



Hide server information from headers and error pages

`sudo nano /etc/apache2/apache2.conf` (Ubuntu)

`ServerSignature Off`

Configuration errors:

`sudo nano /var/log/apacge2/error.log`


## Bash

```BASH
nano ~/.bashrc

alias serveron="sudo service apache2 restart;sudo service mysql start;htop"
alias ll="ls -la"
alias _update="sudo apt update;sudo apt upgrade"
```

`sudo nano /etc/apache2/sites-enabled/000-default.conf`
