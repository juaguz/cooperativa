<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreatePersonasTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('personas', function(Blueprint $table)
		{
			$table->integer('id_persona', true);
			$table->string('nombre', 45)->nullable();
			$table->string('apellido', 45)->nullable();
			$table->string('nro_doc', 45)->nullable();
			$table->string('direccion', 45)->nullable();
			$table->string('localidad', 45)->nullable();
			$table->string('telefono', 45)->nullable();
			$table->timestamp('create_time')->nullable()->default(DB::raw('CURRENT_TIMESTAMP'));
			$table->dateTime('update_time')->nullable();
			$table->integer('usuarios_id');
			$table->integer('usuarios_id_perfil');
			$table->integer('usuarios_id_persona');
			$table->integer('usuarios_perfiles_id_perfil');
			$table->string('taller', 45)->nullable();
			$table->integer('id_sexo');
			$table->primary(['id_persona','usuarios_id_persona','id_sexo']);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('personas');
	}

}
