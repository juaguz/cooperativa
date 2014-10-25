<?php
/**
 * Created by PhpStorm.
 * User: fran
 * Date: 19/06/14
 * Time: 13:02
 */
namespace mails\Entities;

class Mail extends \Eloquent
{
    protected $table = 'lista_mails';
    protected $fillable = array('id', 'descripcion','mail');

}
?>