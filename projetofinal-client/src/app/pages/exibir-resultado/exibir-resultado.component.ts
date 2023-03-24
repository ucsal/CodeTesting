import { ItemProvaDTO } from 'src/app/model/DTO/ItemProvaDTO';
import { ItemProva } from 'src/app/model/itemProva';
import { TarefaService } from './../../service/tarefa/tarefa.service';
import { TarefaDTO } from './../../model/DTO/tarefaDTO';
import { ProvaDTO } from './../../model/DTO/provaDTO';
import { DialogDetalharTesteComponent } from './../dialog-detalhar-teste/dialog-detalhar-teste.component';
import { Teste } from './../../model/teste';
import * as ace from "ace-builds";
import { CasoTesteDTO } from './../../model/DTO/CasoTesteDTO';
import { CasoTeste } from './../../model/casoTeste';
import { RespostaService } from './../../service/resposta/resposta.service';
import { CasoTesteService } from './../../service/caso-teste/caso-teste.service';
import { ResultadoDTO } from './../../model/DTO/resultadoDTO';
import { RespostaDTO } from 'src/app/model/DTO/RespostaDTO';
import { Resultado } from './../../model/resultado';
import { ResultadoService } from './../../service/resultado/resultado.service';
import { AfterViewInit, Component, ElementRef, Inject, OnDestroy, OnInit, ViewChild } from '@angular/core';
import { BlockUI, NgBlockUI } from 'ng-block-ui';
import { SESSION_STORAGE, StorageService } from 'ngx-webstorage-service';
import { ActivatedRoute, Router } from '@angular/router';
import { MatDialog } from '@angular/material/dialog';


@Component({
  selector: 'app-exibir-resultado',
  templateUrl: './exibir-resultado.component.html',
  styleUrls: ['./exibir-resultado.component.css']
})
export class ExibirResultadoComponent implements OnInit, AfterViewInit, OnDestroy {

  codigo: String = "";
  casoTeste: CasoTeste;

  resposta = new RespostaDTO();
  resultado = new ResultadoDTO();
  item= new ItemProvaDTO();
  tarefaStorage = new TarefaDTO();
  provaVoltar = null;
  tarefaVoltar = null;
  idResposta = 0

  @BlockUI() blockUI: NgBlockUI | undefined;
  @ViewChild("editor") private editor!: ElementRef<HTMLElement>;

  porcentagem: number = 0;

  constructor(
    @Inject(SESSION_STORAGE) private storage: StorageService,
    private resultadoService: ResultadoService,
    private router: Router,
    private tarefaService: TarefaService,
    private casoTesteService: CasoTesteService,
    private respostaService: RespostaService,
    public dialog: MatDialog,
    private activatedRoute: ActivatedRoute
  ) {
    this.casoTeste = new CasoTesteDTO();
  }

  ngOnDestroy(): void {
    this.storage.remove('provaVoltar')
  }

  ngOnInit(): void {
    this.resposta = this.storage.get("respostaEnviada");
    this.tarefaStorage = this.storage.get("tarefa");
    this.item = this.storage.get("itemProva");
    //console.log(this.storage.get('tarefaVoltar'));
    //const par = this.activatedRoute.snapshot.paramMap.get('parametro');
    this.idResposta = this.resposta.id;
    //console.log("id:"+ this.idResposta);

    this.resultadoService.listarPorResposta(this.idResposta).subscribe((busca: Resultado) => {
      this.resultado = busca;
      this.porcentagem = busca.porcentagem

    });

  }

  ngAfterViewInit(): void {
    //ace.config.set("fontSize", "14px");
    ace.config.set('basePath', "https://ace.c9.io/build/src-noconflict/");
    const aceEditor = ace.edit(this.editor.nativeElement);

    aceEditor.setFontSize(14);
    aceEditor.session.setValue(this.resposta.codigo);
    aceEditor.setTheme("ace/theme/one_dark");
    aceEditor.session.setMode("ace/mode/java");
    aceEditor.setShowPrintMargin(false);
    aceEditor.setReadOnly(true);
  }

  detalhar(teste: Teste){
    this.storage.set("resultado-detalhar", teste)
    const dialogRef = this.dialog.open(DialogDetalharTesteComponent, {
      width: '600px',
      data: {teste2: teste}
    });
  }

  tarefaId: number =0;

  voltarTarefa(){
    //this.tarefaService.findOne(tarefaId).subscribe()
    this.storage.set('tarefa', this.tarefaStorage)
    this.router.navigate(['cadastrarResposta'])
  }

  voltarProva(){
    this.storage.set('itemProva', this.item)
    this.router.navigate(['prova'])
  }
}
