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

Targets iPad 1: `@media only screen and (device-width: 768px) and (device-height: 1024px) {  }`




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

