<?php

class Time {

    static $sFecha;
    static $sFormato;
    static $oFecha;

    function __construct($sFecha)
    {
        $this->oFecha =  new DateTime($sFecha);

    }

    public static function fecha() {
        self::$oFecha =  new DateTime(self::$sFecha);
        return self::$oFecha->format(self::$sFormato);

    }

    public static function FormatearToMysql($sFecha) {
        if(!empty($sFecha)){
            if(strpos($sFecha,"/") > 0)
                self::$sFecha = str_replace('/', '-', $sFecha);
            else
                self::$oFecha =  new DateTime($sFecha);

            self::$sFormato = "Y-m-d";
            return self::fecha();
        }
    }

    public static function FormatearToNormal($sFecha){
        if(!empty($sFecha)){
            self::$sFecha = $sFecha;
            self::$sFormato = "d/m/Y";
            return self::fecha();
        }
    }

}
 