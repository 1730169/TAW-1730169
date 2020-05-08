<?php

use App\CategoriaProducto;
use Illuminate\Database\Seeder;

class CategoriaProductoSeeder extends Seeder
{
    public function run()
    {
        factory(CategoriaProducto::class, 25)->create();
    }
}
