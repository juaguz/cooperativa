<?php


namespace Correos\Managers;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Input;
use Oficios\Entities\Archivos;


abstract class BaseManager {

    protected $entity;
    protected $data;
    protected $errors;

    public function __construct($entity, $data){

        $this->entity = $entity;
        //$this->data   = array_only($data,array_keys($this->getRules()));
        $this->data   = $data;
    }

    abstract public function getRules();

    public function isValid(){
        $rules        = $this->getRules();
        $validation   = \Validator::make($this->data,$rules);
        $isValid      = $validation->passes();
        $this->errors = $validation->messages();

        return $isValid;
    }

    public function getErrors(){

        return $this->errors;

    }

    public function subirArchivo($id,$nombre_campo,$id_persona=null){


        if (Input::hasFile($nombre_campo))
        {

            $ext = Input::file($nombre_campo)->getClientOriginalExtension();

            $nombre = md5(rand()).".$ext";

            $ruta   = 'archivos/'.$id;

            $ruta   = ($id_persona!=null) ? $ruta.'/'.$id_persona : $ruta;

            Input::file($nombre_campo) -> move($ruta, $nombre);

            return $ruta.'/'.$nombre;

        }
    }


    public function save($archivo=False,$nombre_campo=null){


//       if(!$this->isValid()){
//            return false;
//        }

        $this->entity->fill($this->data);
        $this->entity->save();
        if($archivo){
            foreach ($nombre_campo as $key =>$index){
                    $path = $this->subirArchivo($this->entity->id,$index);
                if(!empty($path)){
                    $data = array("id_usuario"=>Auth::user()->id,"id_oficio"=>$this->entity->id,"path"=>$path);
                    $archivo = new Archivos();
                    $archivo->fill($data);
                    $archivo->save();
                }
            }

            return $path;
        }
        return true;
    }
} 