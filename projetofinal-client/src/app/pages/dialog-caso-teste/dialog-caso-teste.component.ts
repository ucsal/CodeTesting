import { CasoTesteDTO } from '../../model/DTO/CasoTesteDTO';
import { Component, Inject, OnInit } from '@angular/core';
import { CasoTeste } from 'src/app/model/casoTeste';
import { SESSION_STORAGE, StorageService } from 'ngx-webstorage-service';
import { MatDialogRef, MAT_DIALOG_DATA} from '@angular/material/dialog';
import { FormBuilder, Validators } from '@angular/forms';
@Component({
  selector: 'app-dialgog',
  templateUrl: './dialog-caso-teste.component.html',
  styleUrls: ['./dialog-caso-teste.component.css']
})
export class DialogCasoTesteComponent implements OnInit{
  [x: string]: any;
  teste = new CasoTesteDTO();
  formularioCasoTeste: any;
  status: String;
  comparacoes = [
    {value: 0, viewValue: "Igual"},
    {value: 1, viewValue: "Igual ignorando case sensitive"},
    {value: 2, viewValue: "Contém"},
  ]

  constructor(
    private formBuilder: FormBuilder,
    public dialogRef: MatDialogRef<DialogCasoTesteComponent>,
    @Inject(MAT_DIALOG_DATA) public data: CasoTeste,
    @Inject(SESSION_STORAGE) private storage: StorageService
  ) {
    this.status = "cancelar"
  }

  ngOnInit(): void {
    this.formularioCasoTeste= this.formBuilder.group({
      nomeTeste: ['',Validators.required],
      descricao: [''],
      entrada: [''],
      saida: [''],
      comparacao: [Validators.required],
      flagExibir:[false]
    })

    this.teste = this.storage.get("testeEditar");

    if(this.teste != null){

      this.status = "editar"
    }else{
      this.teste = new CasoTesteDTO();
      this.status = "cadastrar"
    }
  }

  cancelar() {
    this.status = "cancelar"
    this.storage.set("status", this.status);
    this.storage.remove("teste");
    this.dialogRef.close();
  }

  cadastrarCasoTeste(){
    if(this.formularioCasoTeste.valid){
      this.storage.set("status", this.status);
      this.storage.set("teste", this.teste);
      this.dialogRef.close();
    }
  }

}
