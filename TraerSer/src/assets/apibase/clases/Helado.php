<?php

require_once "AccesoDatos.php";
require_once "IApiUsable.php";

class Helado implements JsonSerializable, IApiUsable
{
    //private $precio;

    private $id;
    private $sabor;    
    private $tipo;
    private $kilos;
    private $foto;

    public static function OBJHelado($sabor,$tipo,$kilos,$foto,$id=-1){
        
        $unhelado = new Helado();

        if($id!=-1){$unhelado->setid($id);}        
        
        $unhelado->settipo($tipo);        
        $unhelado->setsabor($sabor);
        $unhelado->setkilos($kilos);
        $unhelado->setfoto($foto);
        

        return $unhelado;
    }

    public function getsabor(){return $this->sabor;}

    public function setsabor($sabor){$this->sabor = $sabor;}

    public function gettipo(){return $this->tipo;}

    public function settipo($tipo){$this->tipo = $tipo;}
    
    public function getid(){return $this->id;}

    public function setid($idhelado){$this->id = $idhelado;}

    public function getkilos(){return $this->kilos;}

    public function setkilos($kilos){$this->kilos = $kilos;}

    public function getfoto(){return $this->foto;}

    public function setfoto($foto){$this->foto = $foto;}

// Traer Todos
    public static function TraerTodosLosHelados()
	{
        $objetoAccesoDato = AccesoDatos::dameUnObjetoAcceso(); 
        $consulta =$objetoAccesoDato->RetornarConsulta("select Idhelado,sabor,tipo,kilos,foto from helados");
        $consulta->execute();	

       $salenhelados = $consulta->fetchAll(PDO::FETCH_CLASS, "Helado"); 

      foreach ($salenhelados as $key => $value) {
            
            $savior[] = Helado::OBJhelado($value->sabor,$value->tipo,$value->kilos,$value->foto,$value->Idhelado);
        }         
        return $savior;        
    }

    public function TraerTodos($request, $response, $args){

       $loshelados = Helado::TraerTodosLosHelados();  
       $newResponse = $response->withJson($loshelados, 200); 
        return $newResponse;
        
    }

// Objeto JSON    
    public function jsonSerialize() {
        return ["id"=>$this-> getid(),"sabor"=>$this-> getsabor(),"tipo"=>$this-> gettipo(),"kilos"=>$this-> getkilos(), "foto"=>$this->getfoto()];
    }

// Alta
    public function CargarUno($request, $response, $args){

        $params = $request->getParsedBody();    
        //var_dump($params);

        $altahelado = Helado::OBJHelado($params['sabor'],$params['tipo'],$params['kilos'],$params['foto']);

        $altahelado->InsertarElHeladoParametros();

        echo "helado adentro de una patada<br><br>";

        $newResponse = $response->withJson($altahelado, 200);  
        return $newResponse;
    }

    public function InsertarElHeladoParametros(){

        $objetoAccesoDato = AccesoDatos::dameUnObjetoAcceso(); 
        $consulta =$objetoAccesoDato->RetornarConsulta("INSERT into helados (sabor,tipo,kilos,foto) values (:sabor,:tipo,:kilos,:foto)");
        $consulta->bindValue(':sabor',$this->sabor, PDO::PARAM_STR);
        $consulta->bindValue(':tipo', $this->tipo, PDO::PARAM_STR);
        $consulta->bindValue(':kilos', $this->kilos, PDO::PARAM_INT);
        $consulta->bindValue(':foto', $this->foto, PDO::PARAM_STR);
        $consulta->execute();		
        return $objetoAccesoDato->RetornarUltimoIdInsertado();
    }

// Traer uno    
    public static function TraerUnHelado($id) 
	{

	    $objetoAccesoDato = AccesoDatos::dameUnObjetoAcceso(); 
        $consulta =$objetoAccesoDato->RetornarConsulta("select sabor, tipo, kilos, foto from helados where idhelado = $id");
		$consulta->execute();
        $elHelado = $consulta->fetchObject('Helado');
        //var_dump($elHelado);

        $heladoBuscado= Helado::OBJhelado($elHelado->sabor,$elHelado->tipo,$elHelado->kilos,$elHelado->foto,$id);    

		return $heladoBuscado;		
	}

    
    // no se por que no puedo tomar el dato del args
    public function TraerUno($request, $response, $args){        
        
        $id = $_GET['id'];
        
        $elhelado=Helado::TraerUnHelado($id);        
        
        $newResponse = $response->withJson($elhelado->jsonSerialize(), 200);  
         return $newResponse;        
    }  
    
    //ver el hardcode con id 799 
    // primero modificarlo, y luego borrarlo

// Borrar Uno
    public function BorrarHelado()
    {
            $objetoAccesoDato = AccesoDatos::dameUnObjetoAcceso(); 
           $consulta =$objetoAccesoDato->RetornarConsulta("
               delete 
               from helados 				
               WHERE idhelado=:id");	
               $consulta->bindValue(':id',$this->id, PDO::PARAM_INT);		
               $consulta->execute();
               return $consulta->rowCount();
    }

    public function BorrarUno($request, $response, $args){       
      
        $ArrayDeParametros = $request->getParsedBody();
        $id=$ArrayDeParametros['id'];
             
        $eshelado= new Helado();
        $eshelado->setid($id);
        $cantidadDeBorrados=$eshelado->BorrarHelado();

        $objDelaRespuesta= new stdclass();
       $objDelaRespuesta->cantidad=$cantidadDeBorrados;
       if($cantidadDeBorrados>0)
           {
                $objDelaRespuesta->resultado="algo ha borrao!!!";
           }
           else
           {
               $objDelaRespuesta->resultado="no Borra nada!!!";
           }
       $newResponse = $response->withJson($objDelaRespuesta, 200);  
         return $newResponse;
    }

// Modificar Uno
    public function ModificarHeladoParametros()
	 {
			$objetoAccesoDato = AccesoDatos::dameUnObjetoAcceso(); 
			$consulta =$objetoAccesoDato->RetornarConsulta("
				update helados 
                set sabor=:sabor,
                tipo=:tipo,
                kilos=:kilos,
                foto=:foto                         
				WHERE idhelado=:id");
			$consulta->bindValue(':id',$this->id, PDO::PARAM_INT);
            $consulta->bindValue(':sabor',$this->sabor, PDO::PARAM_STR);
            $consulta->bindValue(':tipo',$this->tipo, PDO::PARAM_STR);
            $consulta->bindValue(':kilos',$this->kilos, PDO::PARAM_INT);
			$consulta->bindValue(':foto', $this->foto, PDO::PARAM_STR);
                    
			return $consulta->execute();
     }
     
     public function ModificarUno($request, $response, $args){            

        $ArrayDeParametros = $request->getParsedBody();
      //  var_dump($ArrayDeParametros);    	

       $heladomod = new Helado();
       
       $heladomod->setid($ArrayDeParametros['id']);

       $heladomod->setsabor($ArrayDeParametros['sabor']);
       $heladomod->settipo($ArrayDeParametros['tipo']);       
       $heladomod->setkilos($ArrayDeParametros['kilos']);       
       $heladomod->setfoto($ArrayDeParametros['foto']);

       //var_dump($heladomod);
       
       $resultado =$heladomod->ModificarHeladoParametros();
       $objDelaRespuesta= new stdclass();
       
       $objDelaRespuesta->resultado=$resultado;
       return $response->withJson($objDelaRespuesta, 200);	
     }
        
} // Helado