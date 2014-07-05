<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUsuariosTable extends Migration {
    protected $table = 'usuarios';
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
				$table -> string('nombre', 25);
				$table -> string('apellido', 25);
				$table -> string('email', 50);
				$table -> string('password');
				$table -> integer('dni');

				$table -> integer('id_perfil') -> unsigned();
				$table -> integer('id_jurisdiccion') -> unsigned()->default(1);
				$table -> string('username', 25);
				$table -> string('remember_token', 100);

				$table -> foreign("id_perfil") -> references("id") -> on("perfiles") -> onDelete('cascade');
                //$table -> foreign("id_jurisdiccion") -> references("id") -> on("provincias") -> onDelete('cascade');

				$table -> timestamps();
			});
			DB::table('usuarios') -> insert(array( array('id_perfil' => 1, "username" => "supervisor", "password" => Hash::make('admin'))));
			DB::table('usuarios') -> insert(array( array('id_perfil' => 2, "username" => "consulta", "password" => Hash::make('admin'))));
			DB::table('usuarios') -> insert(array( array('id_perfil' => 3, "username" => "carga", "password" => Hash::make('admin'))));

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
