<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateUsuariosTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('usuarios', function(Blueprint $table)
		{
			$table->integer('id', true);
			$table->integer('id_perfil')->index('`fk_usuarios_perfiles1_idx`');
			$table->integer('id_persona');
			$table->string('nombre_usuario', 45)->nullable();
			$table->string('password', 45)->nullable();
			$table->timestamp('create_time')->nullable()->default(DB::raw('CURRENT_TIMESTAMP'));
			$table->dateTime('update_time')->nullable();
			$table->integer('perfiles_id_perfil');
			$table->primary(['id','id_perfil','id_persona','perfiles_id_perfil']);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('usuarios');
	}

}
