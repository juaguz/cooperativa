<?php
/**
 * Created by PhpStorm.
 * User: fran
 * Date: 24/06/14
 * Time: 11:29
 */

namespace Correos\Entities;

class Correo extends \Eloquent
{
    protected $table = 'lista_mails';
    protected $fillable = array('id','descripcion','mail');

}
?>