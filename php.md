# PHP

### HEREDOC string

```php
echo <<<HEREDOC
This is a heredoc string.

Newlines and everything else is preserved.
HEREDOC;
```

### Match items via Regular Expressions (regexp)

```PHP
function regex($regex, $string)
{
    // regex flags: http://php.net/manual/en/reference.pcre.pattern.modifiers.php
    preg_match_all(
      $regex,
        $string,
        $matches,
        PREG_SET_ORDER // formats data into an array of items
    );
    return $matches;
}
```

### CURL

```php
function curl( $url, $custom = [] ){
	$user_agent = [
		'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36',
		'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/601.2.7 (KHTML, like Gecko) Version/9.0.1 Safari/601.2.7',
		'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11) AppleWebKit/601.1.56 (KHTML, like Gecko) Version/9.0 Safari/601.1.56',
		'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36',
		'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36',
		'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0',
		'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36',
		'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36',
		'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.71 Safari/537.36',
		'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko',
		'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko',
		'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.13) Gecko/20080311 Firefox/2.0.0.13',
		'Mozilla/5.0 (compatible, MSIE 11, Windows NT 6.3; Trident/7.0; rv:11.0) like Gecko',
		'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; Trident/5.0)',
	];

	// http://php.net/manual/en/function.curl-setopt.php
	$options = [
		CURLOPT_RETURNTRANSFER => true, 	// return web page
		CURLOPT_HEADER         => true, 	//return headers in addition to content
		CURLOPT_FOLLOWLOCATION => true, 	// follow redirects
		CURLOPT_ENCODING       => "", 		// handle all encodings
		CURLOPT_AUTOREFERER    => true, 	// set referer on redirect
		CURLOPT_CONNECTTIMEOUT => 120, 		// timeout on connect
		CURLOPT_TIMEOUT        => 120, 		// timeout on response
		CURLOPT_MAXREDIRS      => 10, 		// stop after 10 redirects
		CURLINFO_HEADER_OUT    => true,
		CURLOPT_SSL_VERIFYPEER => false, 	// Disabled SSL Cert checks
		CURLOPT_HTTP_VERSION   => CURL_HTTP_VERSION_1_1,
		CURLOPT_COOKIE         => ( array_key_exists('cookies', $custom) ? $custom['cookies'] : null ),
		CURLOPT_USERAGENT      => ( array_key_exists('user_agent', $custom) ? $custom['user_agent'] : $user_agent[ array_rand($user_agent) ] ),
	];

	// Headers
	if ( array_key_exists('headers', $custom) AND is_array( $custom['headers'] ) ) {
		$options[ CURLOPT_HTTPHEADER ] = $custom['headers'];
	}

	// Post data (put as PHP array, this converts to JSON)
	if ( array_key_exists('post', $custom) AND is_array( $custom['post'] ) ) {
		$options[ CURLOPT_POST ] = true;
		$options[ CURLOPT_POSTFIELDS ] = $custom['post'];
	}

	if ( array_key_exists('userpass', $custom) ) {
		$options[ CURLOPT_USERPWD ] = $custom['userpass'];
	}

	$ch 		= curl_init( $url );
	curl_setopt_array( $ch, $options );
	$rough_content = curl_exec( $ch );
	$err 		= curl_errno( $ch );
	$errmsg 	= curl_error( $ch );
	$header 	= curl_getinfo( $ch );
	curl_close( $ch );

	$header_content = substr( $rough_content, 0, $header['header_size'] );
	$body_content = trim( str_replace( $header_content, '', $rough_content ) );
	preg_match_all( "#Set-Cookie:\\s+(?<cookie>[^=]+=[^;]+)#m", $header_content, $matches );
	$cookiesOut = implode( "; ", $matches['cookie'] );

	$header['errno'] 	= $err;
	$header['errmsg'] 	= $errmsg;
	$header['headers'] 	= $header_content;
	$header['content'] 	= $body_content;
	$header['cookies'] 	= $cookiesOut;

	return $header;
}
```

### Random item from array

```PHP
echo $items[array_rand($items)];
```

### File modified date

```PHP
echo date('jS F Y',filemtime(__FILE__));
```

## Dates

`date_default_timezone_set('Europe/Madrid');`

`date('Y-m-d H:i:s')`
2021-04-30 23:59

`date('j M H:i')`
30 Apr 23:59

`date('jS F Y')`
1st April 2021

`date('D H:i')`
Fri 23:59

Full documentation: https://www.php.net/manual/en/datetime.format.php

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

## Only run locally

```php
// Only run locally
if ('127.0.0.1' !== $_SERVER["REMOTE_ADDR"]){
	die('Only local');
}
```


# OB Cache

```PHP
ob_start();

// ...

$buffer = ob_get_clean();
echo $buffer;
```


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



## Benchmarking

Simple and short:

```PHP
$benchmark_time = microtime(1);
$benchmark_string = '';
function benchmark($string = '')
{
    global $benchmark_time, $benchmark_string;
    $return = $benchmark_time ? substr(sprintf('%f', microtime(1) - $benchmark_time), 0, 4) . 's ' . $benchmark_string : date('Y-m-d H:i:s');
    $benchmark_time = microtime(1);
    $benchmark_string = $string;
    return '🟣'.$return;
}
```

```PHP
echo benchmark('Get orders') . PHP_EOL;
// ...
echo benchmark('- Add new') . PHP_EOL;
// ...
echo benchmark('End') . PHP_EOL;
```

```
🟣2021-04-26 20:13:46
🟣1.43s Get orders
🟣0.01s - Add new
🟣0.00s End
```

## Generate slug

```php
/**
 * replaces strange chars and generates a slug based on the provided string
 *
 * @param string $string The title of a story
 * @return string The URL-friendly version of it
 */
protected function generateSlug( $slug )
{

	// lowercase
	$slug = strtolower( $slug );

	$slug = trim( $slug );

	$slug = substr( $slug, 0, 95 );
	// remove accents
	//$slug = $this->removeAccents( $slug );

	// only alphanumeric
	$slug = preg_replace( '/[^A-Za-z0-9-]+/', ' ', $slug );

	$slug = trim( $slug );

	// spaces to -
	$slug = str_replace( ' ', '-', $slug );

	// multiple --- to one -
	$slug = preg_replace( '#-+#', '-', $slug );

	return $slug;
}
```

## Simple REQUEST parameter to COOKIE Authentication Token

```php

public $params = [
        'auth_token' => 'TOKEN',
        'auth_token_duration' => 31536000,
];

public function authenticate(){
	if (@trim($_REQUEST['auth_token']) === $this->params['auth_token']) {
	    $_COOKIE['thermo_auth_token'] = $this->auth_token;
	    setcookie('thermo_auth_token', $this->auth_token, time() + $this->params['auth_token_duration'], '/');
	}
	if (@$_COOKIE['thermo_auth_token'] !== $this->params['auth_token']) {
	    setcookie('thermo_auth_token', '', 0, '/');
	    return false;
	}
	return true;
}

```
