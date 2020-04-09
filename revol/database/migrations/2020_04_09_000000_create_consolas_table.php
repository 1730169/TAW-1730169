<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateConsolasTable extends Migration
{
    public function up()
    {
        Schema::create('consolas', function (Blueprint $table) {
            $table->id();
            $table->string('numero');
            $table->integer('plataforma');
            $table->string('serial')->nullable(); //opcional

            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('consolas');
    }
}
