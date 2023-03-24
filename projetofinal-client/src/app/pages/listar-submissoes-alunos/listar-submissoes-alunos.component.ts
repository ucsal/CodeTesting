import { TarefaDTO } from './../../model/DTO/tarefaDTO';
import { Component, Inject, OnInit, ViewChild } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import { SESSION_STORAGE, StorageService } from 'ngx-webstorage-service';
import { AccountService } from 'src/app/account/_service/account.service';
import { RespostaDTO } from 'src/app/model/DTO/RespostaDTO';
import { RespostaService } from 'src/app/service/resposta/resposta.service';

@Component({
  selector: 'app-listar-submissoes-alunos',
  templateUrl: './listar-submissoes-alunos.component.html',
  styleUrls: ['./listar-submissoes-alunos.component.css']
})
export class ListarSubmissoesAlunosComponent implements OnInit {

  @ViewChild(MatPaginator)
  paginator!: MatPaginator;
  @ViewChild(MatSort)
  sort!: MatSort;

  constructor(
    private respostaService: RespostaService,
    private accountService: AccountService,
    private router: Router,
    @Inject(SESSION_STORAGE) private storage: StorageService,
  ) { }

  tarefa = new TarefaDTO();
  respostas=  new MatTableDataSource<RespostaDTO>();
  teste: Array<RespostaDTO>  = []

  displayedColumns = [
    'atividade',
    'aluno',
    'data',
    'porcentagem',
    'acoes'
  ];

  ngOnInit(): void {
    this.tarefa = this.storage.get("tarefaSubmissao")
    this.respostaService.listarPorTarefa(this.tarefa.id).subscribe((data) => {
      this.respostas.data=data
      //console.log(data)
  })
  }

  ngAfterViewInit() {
    this.respostas.paginator = this.paginator;
    this.respostas.sort = this.sort;
  }

  detalhar(resposta: RespostaDTO){
    this.storage.set("respostaEnviada", resposta);
    this.router.navigate(["resultado"]);
  }

}
