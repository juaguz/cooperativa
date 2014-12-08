<?php
/**
 * Created by PhpStorm.
 * User: Eri
 * Date: 08/12/14
 * Time: 14:18
 */

class ImprimirController extends BaseController{

    public function imprimir(){
        $fichero  = storage_path();
        $fichero.="\impresora\imprimir.py";
        $command = escapeshellcmd("python ".$fichero);
        shell_exec($command);

    }

} 