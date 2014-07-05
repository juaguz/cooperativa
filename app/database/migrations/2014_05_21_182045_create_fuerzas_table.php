<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateFuerzasTable extends Migration {

    protected  $table = 'fuerzas';
	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
        if (!Schema::hasTable($this->table)) {

            Schema::create('fuerzas', function($table) {
                $table -> engine = 'InnoDB';
                $table -> increments('id');
                $table -> string('abreviacion');
                $table -> string('descripcion');
                $table -> timestamps();
            });
            DB::table('fuerzas') -> insert(
                array(
                    array('id' => 1, "descripcion" => "Policia Federal","abreviacion"=>"PFA"),
                    array('id' => 2, "descripcion" => "Policia Seguridad Aeroportuaria","abreviacion"=>"PSA"),
                    array('id' => 3, "descripcion" => "Gendarmeria Nacional Argentina","abreviacion"=>"GNA"),
                    array('id' => 4, "descripcion" => "Prefectura Nacional Argentina","abreviacion"=>"PNA"),
                ));

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
