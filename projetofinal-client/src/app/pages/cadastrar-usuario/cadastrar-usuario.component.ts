import { Usuario } from './../../model/usuario';
import { UsuarioDTO } from './../../model/DTO/usuarioDTO';
import { Router } from '@angular/router';
import { Component, Inject, OnDestroy, OnInit, AfterViewInit } from '@angular/core';
import { UsuarioService } from 'src/app/service/usuario/usuario.service';
import {FormBuilder, FormControl, FormGroup, FormGroupDirective, NgForm, Validators} from '@angular/forms';
import { SESSION_STORAGE, StorageService } from 'ngx-webstorage-service';
import { ErrorStateMatcher } from '@angular/material/core';


export class MyErrorStateMatcher implements ErrorStateMatcher {
  isErrorState(control: FormControl | null, form: FormGroupDirective | NgForm | null): boolean {
    const isSubmitted = form && form.submitted;
    return !!(control && control.invalid && (control.dirty || control.touched || isSubmitted));
  }
}

@Component({
  selector: 'app-cadastrar-usuario',
  templateUrl: './cadastrar-usuario.component.html',
  styleUrls: ['./cadastrar-usuario.component.css']
})
export class CadastrarUsuarioComponent implements OnInit, AfterViewInit {


  matcher = new MyErrorStateMatcher();

  public formCadastrarUsuario: any;

  constructor(private usuarioService: UsuarioService,
    private router: Router,
    private formBuilder: FormBuilder,
    @Inject(SESSION_STORAGE) private storage: StorageService ) {
      // this.toasterService = toasterService;
    }
  ngAfterViewInit(): void {
    this.storage.remove("usuario");
  }




  usuario = new  UsuarioDTO();
  submitted: boolean = false;
  msgErro: string = ""
  usuariosCadastrados: Usuario[] = [];
  nomeTela : string = 'Novo';
  loginInvalido: boolean = false;
  hide: boolean = true;


  perfis = [
    {value: 1, viewValue: "Administrador"},
    {value: 2, viewValue: "Aluno"},
    {value: 3, viewValue: "Professor"},
  ]

  ngOnInit( ): void {
      this.usuario = this.storage.get("usuario")
      this.usuarioService.findAll().subscribe(data =>{
        this.usuariosCadastrados = data
      })
      this.formCadastrarUsuario =  this.formBuilder.group({
        nome:['',Validators.required],
        login: ['',  [Validators.required, Validators.minLength(4), Validators.pattern('[a-zA-Z]*')]],
        email:['', [Validators.required ,Validators.email]],
        senha:['', [Validators.required, Validators.minLength(6)]],
        perfil:['',Validators.required],
      });

      if(this.usuario != null){
        this.usuarioService.findOne(this.usuario.id).subscribe(data=>{
          this.usuario = data
        })
        this.nomeTela = 'Alterar';
      }else{
        this.usuario = new UsuarioDTO();
        this.nomeTela = 'Novo';
      }
  }



  enviarForm(){
    this.submitted = true;
    const form = this.formCadastrarUsuario.value;
    if(this.formCadastrarUsuario.valid
      && !this.verificarLoginInvalido2(form.login)
      ){
      if(this.nomeTela === 'Novo'){
        this.cadastrarUsuario();
      }else if(this.nomeTela === 'Alterar'){
        this.salvarAlteracao();
      }
    }else{
      console.log(this.loginInvalido)
    }
  }


  cadastrarUsuario(){

      console.log( JSON.stringify(this.usuario));
      this.usuarioService.save(this.usuario).subscribe(data =>{
        console.log("cadastrado com sucesso", data);
      }, (error) =>{
        console.log(error.error);
      },()=>{
        this.router.navigate(["usuarios"])
      }
      )


  }

   verificarLoginInvalido2(login: string): boolean{
    this.loginInvalido = false;
    this.usuariosCadastrados.forEach(u =>{
      if(u.login == login){
        this.loginInvalido = true;
      }
    })

    return this.loginInvalido;
  }

  verificarLoginInvalido(login: FormControl){
    const loginValue = login.value
    // let retorno = null;
    // this.usuariosCadastrados.forEach(u =>{
    //   if(u.login == loginValue){
    //     retorno =  {lInvalido: {qualquer: true}};
    //   }
    // })

    return (this.verificarLoginInvalido2(loginValue) ? null : {lInvalido:{qualquer: true}})
    //return retorno;
  }

  salvarAlteracao(){


      //this.usuario.perfilId = this.formCadastrarUsuario.value.perfilId
      this.usuario.dataCriacao = new Date(this.usuario.dataCriacao)
      this.usuario.dataUltimoAcesso = new Date(this.usuario.dataUltimoAcesso)
      console.log( JSON.stringify(this.usuario));
      this.usuarioService.update(this.usuario).subscribe(data =>{
        console.log("Atualizado com sucesso", data);
      }, (error) =>{
        console.log(error.error);
      }
      )
      this.router.navigate(["usuarios"])

  }

  exibirSenha(){
    this.hide = !this.hide;
  }


}
