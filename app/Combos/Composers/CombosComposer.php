<?php namespace  Combos\Composers;


use Combos\Entities\ComboTipoDocumento;
use Combos\Entities\ComboSexo;
use Combos\Entities\ComboNacionalidad;
use Combos\Entities\ComboProvincia;
use Combos\Entities\ComboLocalidad;
use Combos\Entities\ComboDepartamento;
use Combos\Entities\ComboCompania;
use Combos\Entities\ComboHora;
use Combos\Entities\ComboMinuto;
use Combos\Entities\ComboSinoEtitie;
use Oficios\Entities\TiposOficios;


class CombosComposer   {

    public function compose($view)
    {

        $comboTipoDocumento = ComboTipoDocumento::orderBy('descripcion','ASC')->lists('descripcion','id');
        $comboSexo          = ComboSexo::orderBy('descripcion','ASC')->lists('descripcion','id');
        $comboNacionalidad  = ComboNacionalidad::orderBy('descripcion','ASC')->lists('descripcion','id');
        $comboProvincia     = ComboProvincia::orderBy('descripcion','ASC')->lists('descripcion','id');
        $comboDepartamento  = ComboDepartamento::orderBy('descripcion','ASC')->lists('descripcion','id');
        $comboLocalidad     = ComboLocalidad::orderBy('descripcion','ASC')->lists('descripcion','id');
        $comboCompania      = ComboCompania::orderBy('descripcion','ASC')->lists('descripcion','id');
        $comboHora          = ComboHora::orderBy('descripcion','ASC')->lists('descripcion','id');
        $comboMinuto        = ComboMinuto::orderBy('descripcion','ASC')->lists('descripcion','id');

        //$comboSiNo  = [''=>'','1'=>'Si','0'=>'No'];
        $comboSiNo          = ComboSinoEtitie::orderBy('descripcion','ASC')->lists('descripcion','id');

        $comboTipoOficios = TiposOficios::orderBy('descripcion','ASC')->lists('descripcion','id');

        $view->with('comboTipoDocumento',$comboTipoDocumento);
        $view->with('comboSexo',$comboSexo);
        $view->with('comboNacionalidad',$comboNacionalidad);
        $view->with('comboProvincia',$comboProvincia);
        $view->with('comboDepartamento',$comboDepartamento);
        $view->with('comboLocalidad',$comboLocalidad);
        $view->with('comboCompania',$comboCompania);
        $view->with('comboHora',$comboHora);
        $view->with('comboMinuto',$comboMinuto);
        $view->with('comboTipoOficios',$comboTipoOficios);
        $view->with('comboSiNo',$comboSiNo);
        //Combos Si/No
       /* $view->with('comboPrimeraDesaparece',$comboPrimeraDesaparece);
        $view->with('comboEnfermedad',$comboEnfermedad);
        $view->with('comboDrogadiccion',$comboDrogadiccion);
        $view->with('comboInternadoInstitucion',$comboInternadoInstitucion);*/

    }

}