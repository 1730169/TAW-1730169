<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Registro_torneo;
use Faker\Generator as Faker;

$factory->define(Registro_torneo::class, function (Faker $faker) {
    return [
        'name' => $faker->firstNameFemale,
    ];
});
