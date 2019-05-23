import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { PrincipalComponent } from './componentes/principal/principal.component';



const routes: Routes = [
  {path: '',component: PrincipalComponent},
  {path: 'principal',component: PrincipalComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
