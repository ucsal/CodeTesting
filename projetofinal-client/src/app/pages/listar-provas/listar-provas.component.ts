import { ProvaDTO } from './../../model/DTO/provaDTO';
import { ProvaService } from './../../service/prova/prova.service';
import { Component, Inject, OnInit } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';
import { Prova } from 'src/app/model/prova';
import { Router } from '@angular/router';
import { SESSION_STORAGE, StorageService } from 'ngx-webstorage-service';

@Component({
  selector: 'app-listar-provas',
  templateUrl: './listar-provas.component.html',
  styleUrls: ['./listar-provas.component.css']
})
export class ListarProvasComponent implements OnInit {

  constructor(private provaService: ProvaService,
    private router: Router,
    @Inject(SESSION_STORAGE) private storage: StorageService ) { }

  provas = new MatTableDataSource<Prova>();
  displayedColumns = ['nome','data', 'acoes'];

  ngOnInit(): void {
    var timeDiff;
    this.provaService.listarPorData().subscribe((data: any[]) => {
      this.provas.data = data;
      console.log(this.provas.data);
    },(error)=>{
      console.log(error);
    },
    ()=>{
      // this.provas.data.forEach(p =>{
      //   var timeDiff = p.dataFinal.getDate - p.dataInicial.getDate;
      //   console.log("dif ", timeDiff)
      // })
    });


  }

  respoderProva(prova: Prova){
    this.storage.set('prova', prova);
    this.router.navigate(['prova'])
  }
}
