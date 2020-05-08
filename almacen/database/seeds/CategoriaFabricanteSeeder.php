<?php

use App\CategoriaFabricante;
use Illuminate\Database\Seeder;

class CategoriaFabricanteSeeder extends Seeder
{
    public function run()
    {
        factory(CategoriaFabricante::class, 25)->create();
    }
}
