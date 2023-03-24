import { Resposta2 } from './../../model/Resposta';
import { TarefaDTO } from 'src/app/model/DTO/tarefaDTO';
import { TarefaService } from 'src/app/service/tarefa/tarefa.service';

import { AccountService } from 'src/app/account/_service/account.service';
import { RespostaService } from './../../service/resposta/resposta.service';
import { RespostaDTO } from './../../model/DTO/RespostaDTO';
import { AfterViewInit, Component, Inject, OnInit, ViewChild } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';
import { SESSION_STORAGE, StorageService } from 'ngx-webstorage-service';
import { Router } from '@angular/router';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';


@Component({
  selector: 'app-listar-submissoes',
  templateUrl: './listar-submissoes.component.html',
  styleUrls: ['./listar-submissoes.component.css']
})
export class ListarSubmissoesComponent implements OnInit, AfterViewInit {
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

  respostas=  new MatTableDataSource<Resposta2>();
  teste: Array<Resposta2>  = []

  displayedColumns = [
    'atividade',
    'porcentagem',
    'data',
    'acoes'
  ];

  ngOnInit(): void {
    let user = this.accountService.getSubject()
    this.respostaService.listarPorUsuario(user).subscribe((data) => {
      this.respostas.data=data
      //console.log(this.respostas.data)
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
