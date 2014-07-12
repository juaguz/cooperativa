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
			$table->string('nombre', 45)->nullable();
			$table->string('apellido', 45)->nullable();
			$table->integer('id_perfil')->nullable()->index('`fk_usuarios_1_perfil_idx`');
			$table->integer('id_tipo_documento')->nullable();
			$table->string('nro_documento', 45)->nullable();
			$table->string('usuario', 45)->unique('`usuario_UNIQUE`');
			$table->string('clave', 45)->nullable();
			$table->timestamps();
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
