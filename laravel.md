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
