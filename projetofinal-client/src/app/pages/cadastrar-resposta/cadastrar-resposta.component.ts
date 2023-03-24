import { Prova } from 'src/app/model/prova';
import { ItemProvaDTO } from './../../model/DTO/ItemProvaDTO';
import { UsuarioDTO } from './../../model/DTO/usuarioDTO';
import { UsuarioService } from './../../service/usuario/usuario.service';
import { CasoTesteService } from './../../service/caso-teste/caso-teste.service';
import { CasoTeste } from 'src/app/model/casoTeste';
import { DialogRespostaComponent } from './../dialog-resposta/dialog-resposta.component';
import { TarefaDTO } from 'src/app/model/DTO/tarefaDTO';
import { Component, Inject, OnInit, OnDestroy } from '@angular/core';
import { Router } from '@angular/router';
import { SESSION_STORAGE, StorageService } from 'ngx-webstorage-service';
import { TarefaService } from 'src/app/service/tarefa/tarefa.service';
import { MatDialog } from '@angular/material/dialog';
import { MatTableDataSource } from '@angular/material/table';


@Component({
  selector: 'app-cadastrar-resposta',
  templateUrl: './cadastrar-resposta.component.html',
  styleUrls: ['./cadastrar-resposta.component.css']
})
export class CadastrarRespostaComponent implements OnInit, OnDestroy {



  displayedColumns = [
    'entrada',
    'saida'
  ];

  tarefa = new TarefaDTO();
  tarefaStorage = new TarefaDTO();
  item = new ItemProvaDTO();
  user = new UsuarioDTO();
  casosTeste = new MatTableDataSource<CasoTeste>();

  constructor(private tarefaService: TarefaService,
    public dialog: MatDialog,
    private usuarioService: UsuarioService,
    private router: Router,
    private casoTesteService: CasoTesteService,
    @Inject(SESSION_STORAGE) private storage: StorageService,
  ) { }


  ngOnInit(): void {
    this.tarefaStorage = this.storage.get("tarefa");
    this.item = this.storage.get("itemProva");

    if(this.item != null){
      this.tarefaStorage = this.item.tarefa
    }
    this.buscarTarefa();
  }

  ngOnDestroy(): void {
    //this.storage.remove("itemProva");
  }

  buscarCasosTeste(){
    this.casoTesteService.listarPorTarefa(this.tarefaStorage.id).subscribe((data) => {
      this.casosTeste.data = data;
      //console.log(this.casosTeste.data);
    });
  }

  buscarTarefa(){
    this.tarefaService.findOne(this.tarefaStorage.id).subscribe((data) => {
      this.tarefa = data;
      //console.log(data);
    },(error) =>{
      console.log(error.error);
    },
    ()=>{
      this.buscarCasosTeste();
    });
  }

  openDialogResposta(){
    const dialogRef = this.dialog.open(DialogRespostaComponent, {
      disableClose: true,
      width: '1200px',
      height: "70%"
    });
  }

  voltar(){
    this.router.navigate(['tarefas'])
  }

  voltarProva(prova: Prova){
    this.storage.set('prova', prova);
    this.router.navigate(['prova'])
  }

}
