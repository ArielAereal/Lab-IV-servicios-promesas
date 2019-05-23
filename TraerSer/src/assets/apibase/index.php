<?php

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require_once 'vendor/autoload.php';
require_once "clases/Helado.php";

$config['displayErrorDetails'] = true;
$config['addContentLengthHeader'] = false;

$app = new \Slim\App(["settings" => $config]);

$app->group('/helados',function(){

    $this->get('/traertodos/',\Helado::class.':TraerTodos');

    $this->post('/agregaruno/',\Helado::class.':CargarUno');
    
    $this->get('/traeruno/',\Helado::class.':TraerUno');

    $this->put('/modificaruno/',\Helado::class.':ModificarUno');

    $this->delete('/borraruno/',\Helado::class.':BorrarUno');    

});

$app->get('[/]', function (Request $request, Response $response, $args) {    
    
    $response->getBody()->write("GET => Helados, helados, fríos helados Slim");
    return $response;
    
});

$app->run();

?>