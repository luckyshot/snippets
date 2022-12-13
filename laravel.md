# PHP Laravel

[snippets](https://github.com/luckyshot/snippets/) / [php](php.md) / laravel.md

## Environment

```php
if (!in_array(config('app.env'), ['local', 'test'])) {
```

## Migrations

```bash
php artisan migrate:fresh
php artisan migrate
php artisan make:migration create_flights_table
```

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
    Schema::dropIfExists('flights');
}
```


## Models

`php artisan make:model UserUnit`

```PHP
protected $table = 'user_units';

public function user()
{
    return $this->belongsTo('App\User');
}

public function unit()
{
    return $this->hasOne('App\Unit', 'id', 'unit_id');
}

// Many-to-Many
// Access intermediate table with "echo $order->pivot->created_at;"
public function products()
{
    return $this->belongsToMany(Product::class, 'order_product')
        ->wherePivot('quantity', '>', 0)
        ->withTimestamps();
}
```


## Controllers

`php artisan make:controller UserController`

```PHP
<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\User;

class UserController extends Controller
{
    /**
     * Show the profile for a given user.
     *
     * @param  int  $id
     * @return \Illuminate\View\View
     */
    public function show($id)
    {
        return view('user.profile', [
            'user' => User::findOrFail($id)
        ]);
    }
}
```


## Routes

```PHP
use App\Http\Controllers\UserController;

Route::get('/user/{id}', [UserController::class, 'show']);
```

Run `php artisan route:list` to view all named routes.

## Views

```PHP
return view('dashboard', ['name' => 'Victoria']);
```

```PHP
echo $name;
```


## Commands

See available commands (both from Artisan and the ones you've created):

`php artisan list`

To run cronjobs via Laravel:

`app\Console\Kernel.php`

```PHP
use App\Console\Commands\EveryMinute;

protected $commands = [
    EveryMinute::class,
];
```

To run a command in console: `php artisan EveryMinute`


## Model Events

```php
    protected static function boot()
    {
        parent::boot();
        static::created(function ($model) {
            // ...
        });
    }
```

- `retrieved`
- `creating`
- `created`
- `updating`
- `updated`
- `saving` (both creating and updating trigger this)
- `saved` (both created and updated trigger this)
- `deleting`
- `deleted`
- `restoring`
- `restored`


## Miscelaneous

### Global variables

```PHP
use Config;

Config::set('user', User::where('token', $token)->first());

echo config('user');
```

### Disable CSRF

`app/Http/Middleware/VerifyCsrfToken.php`

```PHP
protected $except = [
    '/user/my_function'
];
```


### Full URL with parameters

`\URL::full()`



## SQL query styles (Eloquent, Raw)

```PHP
// Eloquent

$users = Users::select('count(*) as user_count, status')
    ->where('status', '<>', 1)
    ->where('created_at', '>', date('Y-m-d H:i:s', time() - 8 * 3600))
    ->groupBy('status')
    ->get();


// Raw Expression (careful with SQL injections)

$users = DB::table('users')
    ->join('other', 'users.unit_id', '=', 'other.id')
    ->select(DB::raw('count(*) as user_count, status'))
    ->where('status', '<>', 1)
    ->groupBy('user.status', 'other.id')
    ->get();


// Raw Statement (careful with SQL injections)

DB::statement("UPDATE `users` SET `status` = 'paused';");

$results = DB::select('select * from users where id = :id', ['id' => 1]);
```


## SQL performance

Use `->toSql()` to output the generated SQL code.

Use `->with(['products','users'])` to eager load if you know you are going to access those related tables.

Add https://github.com/barryvdh/laravel-debugbar to your dev environment for easy optimizations.


### Measure query performance

This gives us the query, the bindings, and the time the query took to run

```PHP
\DB::listen(function($sql, $bindings, $time) {
    var_dump($sql);
    var_dump($bindings);
    var_dump($time);
});
```

```php
DB::connection()->enableQueryLog();

// Run queries...

$queries = DB::getQueryLog();
$last_query = end($queries);
dd($last_query['query']);
```


## New Laravel Jetstream + Livewire/Blade + Cashier Paddle

```sh

# Install composer 
# Installation steps... https://getcomposer.org/doc/00-intro.md#installation-linux-unix-macos
# Make it globally available
sudo mv composer.phar /usr/local/bin/composer

# Dependencies and libraries
sudo apt-get install php-curl

# Laravel new project
composer create-project laravel/laravel newproject.com
cd newproject.com

# Jetstream
composer require laravel/jetstream
php artisan jetstream:install livewire --teams

npm install
npm run build

# Database migrations
nano .env
php artisan config:cache
php artisan migrate:refresh

# Publish the Livewire stack's Blade components:
php artisan vendor:publish --tag=jetstream-views

# Configure virtual hosts...

# Install NVM to update Node.js version
https://github.com/nvm-sh/nvm#installing-and-updating
nvm install v18.0.0
nvm use v18.0.0

# Run Vite for live reload
npm run dev

# Cashier Paddle
composer require laravel/cashier-paddle
echo 'PADDLE_SANDBOX=true' >> .env
php artisan vendor:publish --tag="cashier-migrations"
sudo apt install php-intl

# Create Paddle sandbox account... https://sandbox-vendors.paddle.com/

```
