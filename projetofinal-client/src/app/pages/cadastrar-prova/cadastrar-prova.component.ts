import { UsuarioDTO } from 'src/app/model/DTO/usuarioDTO';
import { Usuario } from './../../model/usuario';
import { UsuarioService } from 'src/app/service/usuario/usuario.service';
import { ProvaService } from './../../service/prova/prova.service';
import { ProvaDTO } from './../../model/DTO/provaDTO';
import { TarefaDTO } from 'src/app/model/DTO/tarefaDTO';
import { AfterViewInit, Component, OnInit, ViewChild } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';
import { Tarefa } from 'src/app/model/tarefa';
import { TarefaService } from 'src/app/service/tarefa/tarefa.service';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { CasoTeste } from 'src/app/model/casoTeste';
import { AccountService } from 'src/app/account/_service/account.service';
import { Router } from '@angular/router';
import { MatOption } from '@angular/material/core';
import { FormBuilder, Validators } from '@angular/forms';


class TarefaProva{
  id!: number;
  titulo!: string;
  descricao!: string;
  select: boolean = false;
}


@Component({
  selector: 'app-cadastrar-prova',
  templateUrl: './cadastrar-prova.component.html',
  styleUrls: ['./cadastrar-prova.component.css']
})

export class CadastrarProvaComponent implements OnInit {


  constructor(private tarefaService: TarefaService,
    private accountService: AccountService,
    private router: Router,
    private formBuilder: FormBuilder,
    private usuarioService: UsuarioService,
    private provaService: ProvaService) { }

  @ViewChild(MatPaginator)
  paginator!: MatPaginator;
  @ViewChild(MatSort)
  sort!: MatSort;

  @ViewChild('allSelected') allSelected!: MatOption;

  prova = new ProvaDTO();
  tarefas : Array <TarefaProva> = [];
  tarefasIds: Array<number> = [];
  usuario = new UsuarioDTO();
  public formProva: any;

  displayedColumns = [
    'select',
    'titulo',
  ];

  ngOnInit(): void {
    let id = this.accountService.getSubject();

    this.formProva =  this.formBuilder.group({
      nome:['',Validators.required],
      dataInicial: ['',  Validators.required],
      dataFinal:['', [Validators.required]],
      tarefasId:['', [Validators.required]]
    });

    this.tarefaService.listaPublicasProtegidasPrivadas(id).subscribe((data: any[]) => {
      this.tarefas = data;
      console.log(data)
    });

    this.usuarioService.findOne(id).subscribe((data) => {
      this.usuario = data;
      //console.log(this.usuario);
    });
  }

  // ngAfterViewInit() {
  //   this.tarefas.paginator = this.paginator;
  //   this.tarefas.sort = this.sort;
  // }

  adicionarTarefa(tarefa: TarefaDTO){
    //console.log(this.tarefasIds.indexOf(tarefa.id))
    const index =this.tarefasIds.indexOf(tarefa.id)
    if( index == -1){
      this.tarefasIds.push(tarefa.id);
    }else{

      this.tarefasIds.splice(index, 1);
    }
    console.log(this.tarefasIds)
  }

  preencherDados(){
    this.prova.usuarioId = this.usuario.id;
    this.prova.nome = this.formProva.get('nome').value;
    this.prova.dataInicial = this.formProva.get('dataInicial').value;
    this.prova.dataFinal = this.formProva.get('dataFinal').value;
    this.prova.tarefas = this.formProva.get('tarefasId').value
  }

  cadastrarProva(){
    //this.prova.tarefas = this.tarefasIds;

    //console.log(this.prova)
    this.preencherDados();
    console.log(this.prova);
    this.provaService.save(this.prova).subscribe(data=>{
      console.log("Cadastrado com sucesso", data)
    }, (error)=>{
      console.error("Erro ao fazer login", error);

    },()=>{
      this.router.navigate(['provas']);
    })

  }

  selecionarTodos(){

  }

  trocarPorUm(all: any){

  }
}
