import { MatDialogRef } from '@angular/material/dialog';
import * as ace from "ace-builds";
import { UsuarioService } from 'src/app/service/usuario/usuario.service';
import { TarefaService } from 'src/app/service/tarefa/tarefa.service';
import { UsuarioDTO } from 'src/app/model/DTO/usuarioDTO';
import { RespostaService } from './../../service/resposta/resposta.service';
import { RespostaDTO } from './../../model/DTO/RespostaDTO';
import { AfterViewInit, Component, ElementRef, Inject, OnDestroy, OnInit, ViewChild, ViewEncapsulation } from '@angular/core';
import { Router } from '@angular/router';
import { SESSION_STORAGE, StorageService } from 'ngx-webstorage-service';
import { TarefaDTO } from 'src/app/model/DTO/tarefaDTO';
import { ResultadoDTO } from 'src/app/model/DTO/resultadoDTO';
import { ResultadoService } from 'src/app/service/resultado/resultado.service';
import { AccountService } from 'src/app/account/_service/account.service';
import { ResultadoRequestDTO } from 'src/app/model/DTO/resultadoRequestDTO';
import { BlockUI, NgBlockUI } from 'ng-block-ui';
import { ItemProvaDTO } from 'src/app/model/DTO/ItemProvaDTO';

@Component({
  selector: 'app-dialog-resposta',
  templateUrl: './dialog-resposta.component.html',
  styleUrls: ['./dialog-resposta.component.css']
})
export class DialogRespostaComponent implements OnInit, AfterViewInit, OnDestroy {
  @BlockUI()
  blockUI!: NgBlockUI;

  @ViewChild("editor") private editor!: ElementRef<HTMLElement>;
  valorInicial: string =
  `public class Main {

    public static void main(String[] args) {


    }

  }`;

  options: any = {
    enableBasicAutocompletion: true,
    enableSnippets: true,
    enableLiveAutocompletion: true,
  };

  codigo: string = "";
  idResposta: number = 0;
  constructor(private respostaService: RespostaService,
    private usuarioService: UsuarioService,
    private tarefaService: TarefaService,
    private router: Router,
    private accountService: AccountService,
    public dialogRef: MatDialogRef<DialogRespostaComponent>,
    @Inject(SESSION_STORAGE) private storage: StorageService,
    private resultadoService: ResultadoService,
    elementRef: ElementRef) { }


   /* formCadastrarResposta = new FormGroup({
      codigo: new FormControl(''),
    });*/

  usuario = new UsuarioDTO();
  resposta = new RespostaDTO();
  tarefa = new TarefaDTO();
  resultado = new ResultadoDTO();
  resultadoRequestDTO= new ResultadoRequestDTO()
  item = new ItemProvaDTO();

  ngOnInit(): void {
    this.item = this.storage.get("itemProva");
    this.tarefa = this.storage.get("tarefa");
    if(this.item!= null){
      this.tarefa = this.item.tarefa;
    }

    this.tarefaService.findOne(this.tarefa.id).subscribe((data) => {
      this.tarefa = data;
      //console.log(this.tarefa, " ", this.item);
    });

    let id  = this.accountService.getSubject()
    this.usuarioService.findOne(id).subscribe((data) => {
      this.usuario = data;
      //console.log(this.usuario);
    });
  }

  ngOnDestroy(): void {
    //this.storage.remove("itemProva");
  }

  ngAfterViewInit(): void {
    //ace.config.set("fontSize", "14px");
    ace.config.set('basePath', "https://ace.c9.io/build/src-noconflict/");
    const aceEditor = ace.edit(this.editor.nativeElement);


    aceEditor.setFontSize(14);
    aceEditor.session.setValue(this.valorInicial);
    aceEditor.setTheme("ace/theme/one_dark");
    aceEditor.session.setMode("ace/mode/java");

    aceEditor.on("change", () => {
      //console.log(aceEditor.getValue());
      this.codigo = aceEditor.getValue();
    });
    aceEditor.setShowPrintMargin(false);
    //aceEditor.renderer.attachToShadowRoot()
  }

  aumentarFonte(){
    const aceEditor = ace.edit(this.editor.nativeElement);
    console.log(aceEditor.getFontSize());
  }

  EnviarResposta(){
    this.blockUI.start();
    this.storage.set('tarefaVoltar', this.tarefa);

    if(this.item != null)
      this.storage.set('provaVoltar', this.item.prova)
    this.resposta.codigo = this.codigo;
    this.resposta.usuarioId = this.usuario.id;
    this.resposta.tarefa = this.tarefa;
    this.resposta.tarefaId = this.tarefa.id;
    if(this.item!= null)
      this.resposta.itemProvaId = this.item.id;
    //this.resposta.dataEnvio = new Date();
    this.storage.set("respostaEnviada", this.resposta);
    this.respostaService.save(this.resposta).subscribe( data =>{
      this.storage.set("respostaEnviada", data);
      console.log("cadastrado com sucesso", data);
    }, (error) =>{
      console.log(error.error);
    },
    () => {
      this.blockUI.stop();
      this.dialogRef.close();
      this.router.navigate(["resultado"])
    }
    )


  }

  fechar(){
    this.dialogRef.close();
  }

  executarCodigo(id: number){
    let r = new RespostaDTO()
    r = this.storage.get("respostaEnviada")
    //this.storage.get("respostaEnviada")
    this.resultadoRequestDTO.casoTesteId = id;
    this.resultadoRequestDTO.respostaId = r.id;

    console.log(this.resultadoRequestDTO);
    this.resultadoService.save(this.resultadoRequestDTO).subscribe(data =>{
      console.log("resultado cadastrado com sucesso", data);
    }, (error) =>{
      console.log("erro ao cadastrar resultado ",error);
    },()=>
    this.router.navigate(["resultado"])
    )
  }
}

