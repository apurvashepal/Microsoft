import { Component, OnInit } from "@angular/core";
import { FormGroup, FormControl, Validators } from "@angular/forms";
import Swal from 'sweetalert2'
@Component({
  selector: "app-home",
  templateUrl: "./home.component.html",
  styleUrls: ["./home.component.css"]
})
export class HomeComponent implements OnInit {
  myForm: FormGroup;
  secondFrom: FormGroup;

  constructor() { }

  ngOnInit() {
    this.myForm = new FormGroup({
      firstName: new FormControl(),
      lastName: new FormControl(),
      email: new FormControl(),
      mobile: new FormControl(),
    });

  }

  handleSubmit() {
    Swal.fire(
      'First Name : ' + this.myForm.value.firstName + '\n ' +
      'Last Name : ' + this.myForm.value.lastName + '\n ' +
      'Email Id : ' + this.myForm.value.email + '\n ' +
      'Mobile Number : ' + this.myForm.value.mobile
    )

  }




}
