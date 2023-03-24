import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators, FormBuilder } from '@angular/forms';
import { Router } from '@angular/router';
import { UsuarioDTO } from 'src/app/model/DTO/usuarioDTO';
import { Usuario } from 'src/app/model/usuario';
import { UsuarioService } from 'src/app/service/usuario/usuario.service';

@Component({
  selector: 'app-cadastrar-aluno',
  templateUrl: './cadastrar-aluno.component.html',
  styleUrls: ['./cadastrar-aluno.component.css']
})
export class CadastrarAlunoComponent implements OnInit {

  constructor(private usuarioService: UsuarioService,
    private formBuilder: FormBuilder,
    private router: Router,) { }


  loginInvalido: boolean = false;
  hide: boolean = true;
  usuariosCadastrados: Usuario[] = [];
  usuario = new  UsuarioDTO();
  formCadastrarUsuario: any
  ngOnInit(): void {

    this.usuarioService.findAll().subscribe(data =>{
      this.usuariosCadastrados = data

    })

    this.formCadastrarUsuario =  this.formBuilder.group({
      nome:['',Validators.required],
      login: ['',  [Validators.required, Validators.minLength(4), Validators.pattern('[a-zA-Z]*')]],
      email:['', [Validators.required ,Validators.email]],
      senha:['', [Validators.required, Validators.minLength(6)]]
    });
  }

  cadastrarUsuario(){
    this.usuario.perfilId = 2;
    const form = this.formCadastrarUsuario.value;
    if(this.formCadastrarUsuario.valid && !this.verificarLoginInvalido2(form.login)){
      this.usuarioService.save(this.usuario).subscribe(data =>{
        console.log("cadastrado com sucesso", data);
      }, (error) =>{
        console.log(error.error);
      }
      )
      this.router.navigate(["login"])
    }else{
      console.log(this.loginInvalido)
    }
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

  exibirSenha(){
    this.hide = !this.hide;
  }

  voltar(){
    this.router.navigate(["login"])
  }

}
