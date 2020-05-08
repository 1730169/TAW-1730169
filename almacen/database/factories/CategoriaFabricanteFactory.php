<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\CategoriaFabricante;
use Faker\Generator as Faker;

$factory->define(CategoriaFabricante::class, function (Faker $faker) {
    return [
        'name' => $faker->firstNameFemale,
    ];
});
