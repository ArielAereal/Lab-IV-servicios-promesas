import { Injectable } from '@angular/core';

import {HttpClient, HttpResponse} from '@angular/common/http';

import {PrimerService} from './primer.service';


@Injectable({
  providedIn: 'root'
})

export class TraerTodosService {

  constructor( protected servicioPrincipal: PrimerService) { }  

  hacerAlgo():Promise<Array<any>>{
   return  this.servicioPrincipal.httpGetP("helados/traertodos/")
   .then(response=>{
     console.log("servicio ", response );   
    return this.extractData(response);
   })
   .catch(err => {
    console.log(err);
    return null;
  });   
  } 

  private extractData ( res: HttpResponse<any> )
  {    
     return res || {};
  }

}
