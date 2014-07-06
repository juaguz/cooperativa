<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToSociosTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('socios', function(Blueprint $table)
		{
			$table->foreign('id_persona')->references('id_persona')->on('personas')->onUpdate('NO ACTION')->onDelete('NO ACTION');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('socios', function(Blueprint $table)
		{
			$table->dropForeign('socios_id_persona_foreign');
		});
	}

}
