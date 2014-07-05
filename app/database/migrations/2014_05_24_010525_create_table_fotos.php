<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableFotos extends Migration {

    protected $table = 'fotos';
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if (!Schema::hasTable($this->table)) {

            Schema::create($this->table, function($table) {
                $table -> engine = 'InnoDB';

                $table -> increments('id');

                $table -> integer('id_persona')->unsigned();

                $table -> integer('id_usuario')->unsigned();

                $table -> string('path');

                $table -> boolean('difusion');

                $table -> timestamps();
            });

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
