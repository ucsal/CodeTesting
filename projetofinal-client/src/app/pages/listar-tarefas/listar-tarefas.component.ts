import { RespostaService } from './../../service/resposta/resposta.service';
import { TarefaService } from './../../service/tarefa/tarefa.service';
import { AfterViewInit, Component, Inject, OnInit, ViewChild } from '@angular/core';
import { Tarefa } from 'src/app/model/tarefa';
import { MatTableDataSource } from '@angular/material/table';
import { SESSION_STORAGE, StorageService } from 'ngx-webstorage-service';
import { Router } from '@angular/router';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { AccountService } from 'src/app/account/_service/account.service';

@Component({
  selector: 'app-listar-tarefas',
  templateUrl: './listar-tarefas.component.html',
  styleUrls: ['./listar-tarefas.component.css']
})
export class ListarTarefasComponent implements OnInit, AfterViewInit {

  @ViewChild(MatPaginator)
  paginator!: MatPaginator;
  @ViewChild(MatSort)
  sort!: MatSort;

  tarefas = new MatTableDataSource<Tarefa>();
  displayedColumns = [
    'titulo',
    'Acoes'
  ];
  constructor(private tarefaService: TarefaService,
    private router: Router,
    private accountService: AccountService,
    private respostaService: RespostaService,
    @Inject(SESSION_STORAGE) private storage: StorageService ) { }

  ngOnInit(): void {
    if(this.isAdmin() || this.isProfessor()){
      this.buscarTarefa();
    }else{
      this.buscarTarefaAluno();
    }

  }

  ngAfterViewInit() {
    this.tarefas.paginator = this.paginator;
    this.tarefas.sort = this.sort;
  }

  isAdmin(): boolean{
    return this.accountService.isAdmin();
  }

  isProfessor():boolean{
    return this.accountService.isProfessor();
  }

  buscarTarefaAluno(){
    this.tarefaService.listarPublicas().subscribe((data: any[]) => {
      this.tarefas.data = data;
    });
  }

  buscarTarefa(){
      this.tarefaService.findAll().subscribe((data: any[]) => {
      this.tarefas.data = data;
      //console.log(data);
    });
  }

  cadastrarTarefa(){
      this.router.navigate(["cadastrarTarefa"])
  }

  respoderTarefa(tarefa: Tarefa){
      this.storage.set("tarefa", tarefa)
      this.router.navigate(["cadastrarResposta"])
  }

  listarSubmissoesAlunos(tarefa: Tarefa){
    this.storage.set("tarefaSubmissao", tarefa)
    this.router.navigate(["submissoesAlunos"])
  }
}
