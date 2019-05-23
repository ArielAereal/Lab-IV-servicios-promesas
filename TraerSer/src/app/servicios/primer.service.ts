import { Injectable } from '@angular/core';

import {HttpClient, HttpResponse,HttpHeaders} from '@angular/common/http';


@Injectable({
  providedIn: 'root'
})
export class PrimerService {

  url:string="http://localhost/apibase/";

  constructor(public http:HttpClient) { }

  public httpGetP ( metodo: string)
  {
    return this.http
    .get( this.url+metodo)
    .toPromise()
    .then( this.extractData )
    .catch( this.handleError );
  }

  public httpPostP( metodo: string, objeto: any )
  {
    return this.http
    .post( this.url+ metodo,objeto,{headers: new HttpHeaders(
      {'Content-Type':  'application/json'})})  
    .subscribe( data => {
      console.info( data );
      return data;
    });
  }

  private extractData ( res: HttpResponse<any> )
  {    
     return res || {};
  }

  private handleError ( error: HttpResponse<any> | any )
  {
    return error;
  }
}
