import { Injectable } from '@angular/core';

import {HttpClient, HttpResponse} from '@angular/common/http';

import {PrimerService} from './primer.service';

@Injectable({
  providedIn: 'root'
})
export class CargarUnoService {

  constructor(protected servicioPrincipal: PrimerService) { }
  
    hacerAlgo(carga:object){
    return  this.servicioPrincipal.httpPostP("helados/agregaruno/",carga);    
   } 
    
}
