# PHP Laravel

## Migrations

`php artisan migrate:reset`

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

public function getJob()
{
    return BuildingJob::where('id', 'build'.$this->unit->id)->first();
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
