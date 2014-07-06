<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateSociosTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('socios', function(Blueprint $table)
		{
			$table->integer('id', true);
			$table->integer('id_persona')->index('`fk_socios_personas1_idx`');
			$table->integer('hsocio')->nullable();
			$table->integer('nro_socio')->nullable();
			$table->integer('vacon')->nullable();
			$table->timestamp('create_time')->nullable()->default(DB::raw('CURRENT_TIMESTAMP'));
			$table->dateTime('update_time')->nullable();
			$table->integer('personas_id_persona')->nullable();
			$table->integer('personas_usuarios_id_persona')->nullable();
			$table->integer('id_tipo_socio');
			$table->date('fecha_socio')->nullable();
			$table->primary(['id','id_persona','id_tipo_socio']);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('socios');
	}

}
