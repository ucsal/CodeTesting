import { ItemProva } from './../../model/itemProva';
import { TarefaDTO } from './../../model/DTO/tarefaDTO';
import { Tarefa } from './../../model/tarefa';
import { TarefaService } from 'src/app/service/tarefa/tarefa.service';
import { ProvaDTO } from './../../model/DTO/provaDTO';
import { Prova } from './../../model/prova';
import { Component, Inject, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { SESSION_STORAGE, StorageService } from 'ngx-webstorage-service';
import { ProvaService } from 'src/app/service/prova/prova.service';

@Component({
  selector: 'app-detalhar-prova',
  templateUrl: './detalhar-prova.component.html',
  styleUrls: ['./detalhar-prova.component.css']
})
export class DetalharProvaComponent implements OnInit {
  prova = new ProvaDTO()
  itens: ItemProva[] = [];
  constructor(private provaService: ProvaService,
    private tarefaService: TarefaService,
    private router: Router,
    @Inject(SESSION_STORAGE) private storage: StorageService) { }

  dt= new Date()

  ngOnInit(): void {


    this.prova = this.storage.get('prova')
    this.provaService.listarPorIdProva(this.prova.id).subscribe(data =>{
      this.itens = data;
    });
  }

  responder(item: ItemProva){
    this.storage.set("itemProva", item)
    this.router.navigate(["cadastrarResposta"])
  }

}
