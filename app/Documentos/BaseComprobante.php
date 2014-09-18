<?php
/**
 * Created by PhpStorm.
 * User: Eri
 * Date: 14/09/14
 * Time: 20:46
 */

namespace Documentos;

use Illuminate\Database\Eloquent;
use Illuminate\Support\Facades\View;
use Documentos\ComprobanteEntity;

abstract class BaseComprobante {

    protected $table;
    protected $idComprobante;
    protected $tipoComprobante;
    protected $descripcion;
    protected $comprobanteEntity;
    protected $fechaMovimiento;
    protected $idSocio;
    protected $monto;

    function __construct(ComprobanteEntity $comprobanteEntity)
    {
        $this->descripcion = $this->setDescripcion();
        $this->table = $this->setTable();
        $this->tipoComprobante = $this->setTipoComprobante();
        $this->comprobanteEntity = $comprobanteEntity;
        $this->comprobanteEntity->setTable($this->table);
    }


    abstract public function setTable();
    /**
     * @param mixed $tipoComprobante
     */
    abstract public function setTipoComprobante();

    /**
     * @param mixed $descripcion
     */
    abstract public function setDescripcion();

    /**
     * @param mixed $fechaMovimiento
     */



    public function mostrarDocumento(){
       $idComprobante = $this->getIdComprobante();
       dd($idComprobante);

    }

    /**
     * @param mixed $idComprobante
     */
    public function setIdComprobante($idComprobante)
    {
        $this->idComprobante = $idComprobante;
    }

    /**
     * @return mixed
     */
    public function getIdComprobante()
    {
        return $this->idComprobante;
    }



    public function guardarComprobante($fechaMovimiento,$idSocio,$monto){
        $this->comprobanteEntity->fecha_movimiento = $fechaMovimiento;
        $this->comprobanteEntity->id_socio = $idSocio;
        $this->comprobanteEntity->monto = $monto;
        $this->comprobanteEntity->tipo_comprobante = $this->tipoComprobante;
        $this->comprobanteEntity->descripcion = $this->descripcion;
        $this->comprobanteEntity->save();
        $id = $this->comprobanteEntity->id;
        return $this->setIdComprobante($id);

    }






} 