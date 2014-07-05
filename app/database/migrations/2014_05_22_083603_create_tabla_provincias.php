<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTablaProvincias extends Migration {

    protected $table = 'provincias';
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
                $table -> string('descripcion');
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