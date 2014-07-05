<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableTiposPersonas extends Migration
{


    protected $table = 'tipos_personas';

    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {

        if (!Schema::hasTable($this->table)) {

            Schema::create($this->table, function ($table) {
                $table->engine = 'InnoDB';

                $table->increments('id');

                $table->string('descripcion');

                $table->timestamps();
            });

            DB::table($this->table)->insert(
                array(
                    array('descripcion' => 'victima')
                , array('descripcion' => 'responsable')
                , array('descripcion' => 'buscado')
                , array('descripcion' => 'solicitante')
                , array('descripcion' => 'titular')

                )
            );
        }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop($this->table);
    }
}