<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEstadosOficiosTable extends Migration {
    protected $table = 'estados_oficios';
	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
    public function up() {
        if (!Schema::hasTable($this->table)) {

            Schema::create($this->table, function($table) {
                $table -> engine = 'InnoDB';
                $table -> increments('id');
                $table -> string('descripcion');
                $table -> timestamps();
            });
            DB::table($this->table) -> insert(
                array(
                     array('descripcion' => 'Vigente')
                    ,array('descripcion' => 'Cesado')
                )
            );
        }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down() {

        Schema::drop($this->table);

    }

}