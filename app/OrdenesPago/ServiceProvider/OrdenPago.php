<?php namespace OrdenesPago\ServiceProvider;
use OrdenesPago\Managers\OrdenesPagosManager;
use OrdenesPago\Repositories\OrdenPagoRepo;

/**
 * Created by PhpStorm.
 * User: juan
 * Date: 18/10/14
 * Time: 17:05
 */

class OrdenPago {
    /**
     * @var OrdenPagoRepo
     */
    private $ordenPagoRepo;

    function __construct(OrdenPagoRepo $ordenPagoRepo)
    {
        $this->ordenPagoRepo = $ordenPagoRepo;
    }


    public function save($idOrden,$idTipo,$monto,$concepto,$fecha){

        $ordenPago = $this->ordenPagoRepo->newOrdenPago($idOrden,$idTipo);
        $ordenPago->importe = $monto;
        $ordenPago->concepto = $concepto;
        $ordenPago->fecha = $fecha;
        $ordenPagoManager = new OrdenesPagosManager($ordenPago,[]);
        $ordenPagoManager->save();
        return $ordenPago;

    }

    public function  generateTxt($data){

        $fichero  = storage_path();
        $fichero.="/impresora/test.txt";
        $fecha  = $data["fecha"];
        $tipo_comprobante = $data["tipo_comprobante"];
        $idComprobante    = $data["idComprobante"];
        $contenido        = $data["contenido"];
        $espacios         = str_repeat(" ",33);

        $contenido        = str_replace("\r\n","",str_replace("<br>","\n".$espacios,$contenido));
        //$contenido        = str_replace("\r\n","",$contenido);
        $fecha            = str_replace("<br>","",$fecha);


        $actual  = "                                 $tipo_comprobante Nro.:$idComprobante             $fecha\r\n";
        $actual .=str_repeat(" ",33).$contenido;
        $actual .=str_repeat("\n",18);
        $actual .= "                                 $tipo_comprobante Nro.:$idComprobante             $fecha \r\n";
        $actual .=str_repeat(" ",33)."$contenido";
        file_put_contents($fichero, $actual);

    }



    public function render($data){
        $this->generateTxt($data);
        return \View::make('comprobante',$data);
    }



}