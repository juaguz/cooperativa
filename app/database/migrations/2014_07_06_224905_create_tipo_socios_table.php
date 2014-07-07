<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTipoSociosTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tipo_socios', function(Blueprint $table)
		{
			$table->integer('id', true);
			$table->string('descripcion', 45)->nullable();
			$table->integer('socios_id')->nullable();
			$table->integer('socios_id_persona')->nullable();
			$table->integer('socios_personas_id_persona')->nullable();
			$table->integer('socios_id_tipo_socio')->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('tipo_socios');
	}

}
