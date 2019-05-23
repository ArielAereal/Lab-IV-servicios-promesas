import { Component, OnInit } from '@angular/core';

import {TraerTodosService} from '../../servicios/traer-todos.service';
import {CargarUnoService} from '../../servicios/cargar-uno.service';

import {Helado} from '../../clases/helado';

@Component({
  selector: 'app-principal',
  templateUrl: './principal.component.html',
  styleUrls: ['./principal.component.css']
})
export class PrincipalComponent implements OnInit {

  nuevoHelado:Helado;
  todosHelados: Helado[];

  constructor( protected servicioTraerTodos: TraerTodosService, protected servCargarUno: CargarUnoService) { }

  ngOnInit() {

    this.servicioTraerTodos.hacerAlgo().then(response=>{
      console.log("controlador ",response);
      this.todosHelados = this.transformarOBjetos(response);
    })
    .catch(err=>{
      console.log(err);
      return null;
    });
  }

  transformarOBjetos(resp:any):Helado[]{
    
    let todosH = new Array();

    resp.forEach(element => {


      let helado = new Helado();
      helado.id = element.id;
      helado.sabor = element.sabor;
      helado.tipo = element.tipo;
      helado.kilos = element.kilo;
      helado.foto = element.foto;

      console.log(element.sabor);
      todosH.push();
    });

    return todosH;
  }

  darDeAlta(){
    
    this.nuevoHelado=new Helado();
    this.nuevoHelado.sabor = "Apio";
    this.nuevoHelado.tipo = "Crema";
    this.nuevoHelado.kilos = 19250;
    this.nuevoHelado.foto = "14_apio.jpg";

    // llamar al post

    //console.info(this.deHeladoAObj());

    this.servCargarUno.hacerAlgo(this.deHeladoAObj());
  }

  deHeladoAObj():Object{

    return {"sabor":this.nuevoHelado.sabor,"tipo": this.nuevoHelado.tipo,"kilos":this.nuevoHelado.kilos,"foto": this.nuevoHelado.foto};
  }

}
