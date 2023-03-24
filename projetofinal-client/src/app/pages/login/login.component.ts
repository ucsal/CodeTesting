import { LoginDTO } from './../../model/DTO/loginDTO';
import { Router } from '@angular/router';
import { Component, Inject, OnInit } from '@angular/core';
import { AccountService } from 'src/app/account/_service/account.service';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { SESSION_STORAGE, StorageService } from 'ngx-webstorage-service';
import { BlockUI, NgBlockUI } from 'ng-block-ui';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  @BlockUI()
  blockUI!: NgBlockUI;

  constructor(
    private router:Router,
    private accountService: AccountService,
    @Inject(SESSION_STORAGE) private storage: StorageService
  ) { }


  usuario = new  LoginDTO();


  mensagemErro: string= ""
  formLogin: any
  ngOnInit(): void {
    this.accountService.clearAuthentication();
    this.formLogin =  new FormGroup({
      login: new FormControl([Validators.required]),
      senha: new FormControl([Validators.required]),
    });

  }

  login(){

    let validado: boolean = false
    if(this.validarCampos()){
      this.accountService.login(this.usuario).subscribe(data =>{
        this.blockUI.start();
        if(data.ok){
          console.log('login efetuado: ', data)
          this.mensagemErro = "";
          validado = true
        }
      }, (error)=>{
        console.error("Erro ao fazer login", error);
        this.mensagemErro = "Login ou Senha Inválidos";
      }
      // ,()=>{
      //   this.blockUI.stop();
      //   this.router.navigate(['tarefas']);
      // }
      )
    }else{
      this.mensagemErro = "Preencha todos os campos";
    }

    setTimeout(() =>{
      this.blockUI.stop();
      this.router.navigate(['tarefas']);
    },1500);

  }

  validarCampos(): boolean{
    const formulario = this.formLogin.value;
    if(formulario.login == null || formulario.login === ''){
      return false;
    }

    if(formulario.senha == null || formulario.senha === ''){
      return false;
    }

    return true;

  }

  cadastrar(){
    this.router.navigate(['cadastrarAluno']);
  }
}
