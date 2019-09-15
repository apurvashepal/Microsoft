import { NgModule } from "@angular/core";
import { Routes, RouterModule } from "@angular/router";
import { AboutusComponent } from "./aboutus/aboutus.component";
import { ContactusComponent } from "./contactus/contactus.component";
import { HomeComponent } from "./home/home.component";

const routes: Routes = [
  { path: "contact", component: ContactusComponent },
  { path: "about", component: AboutusComponent },
  { path: "home", component: HomeComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule {}
