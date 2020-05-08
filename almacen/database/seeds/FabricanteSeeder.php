<?php

use App\Fabricante;
use Illuminate\Database\Seeder;

class FabricanteSeeder extends Seeder
{
    public function run()
    {
        factory(Fabricante::class, 25)->create();
    }
}
