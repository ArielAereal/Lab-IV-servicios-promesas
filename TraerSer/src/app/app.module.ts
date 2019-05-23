import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { PrincipalComponent } from './componentes/principal/principal.component';

import {HttpClientModule} from '@angular/common/http';
import {PrimerService} from './servicios/primer.service';
import {TraerTodosService} from './servicios/traer-todos.service';


@NgModule({
  declarations: [
    AppComponent,
    PrincipalComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule
  ],
  providers: [PrimerService,TraerTodosService],
  bootstrap: [AppComponent]
})
export class AppModule { }
