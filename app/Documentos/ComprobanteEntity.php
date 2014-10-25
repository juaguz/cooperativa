<?php
/**
 * Created by PhpStorm.
 * User: Eri
 * Date: 14/09/14
 * Time: 20:49
 */

namespace Documentos;

use Illuminate\Database\Eloquent;

class ComprobanteEntity  extends Eloquent{
    protected $table;

    /**
     * @param mixed $table
     */
    public function setTable($table)
    {
        $this->table = $table;
    }

    /**
     * @return mixed
     */
    public function getTable()
    {
        return $this->table;
    }







}