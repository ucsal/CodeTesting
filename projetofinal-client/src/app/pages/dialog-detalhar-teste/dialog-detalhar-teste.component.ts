import { TesteDTO } from './../../model/DTO/testeDTO';
import { Component, Inject, OnInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { Teste } from 'src/app/model/teste';
import { SESSION_STORAGE, StorageService } from 'ngx-webstorage-service';

@Component({
  selector: 'app-dialog-detalhar-teste',
  templateUrl: './dialog-detalhar-teste.component.html',
  styleUrls: ['./dialog-detalhar-teste.component.css']
})
export class DialogDetalharTesteComponent implements OnInit {

  constructor( @Inject(SESSION_STORAGE) private storage: StorageService,
  public dialogRef: MatDialogRef<DialogDetalharTesteComponent>) {}

  entrada: String = ""

  result = new TesteDTO()
  divResult: String = "";
  h2Result: String = "";
  ngOnInit(): void {
    this.result = this.storage.get("resultado-detalhar");
    this.entrada = this.result.entrada;
    if(this.result.resultadoFinal){
      this.divResult = "div-titulo-certo";
      this.h2Result = "certo";
    }else if(!this.result.resultadoFinal && !this.result.runtimeException){
      this.divResult = "div-titulo-errado";
      this.h2Result = "errado";
    }else if(this.result.runtimeException){
      this.divResult = "div-titulo-exception";
      this.h2Result = "excecao";
    }
    console.log(this.result)
  }

  fechar() {
    this.dialogRef.close();
  }

}
