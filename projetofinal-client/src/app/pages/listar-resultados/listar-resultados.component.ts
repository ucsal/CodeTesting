import { ResultadoService } from './../../service/resultado/resultado.service';
import { Resultado } from './../../model/resultado';
import { Component, Inject, OnInit } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import { SESSION_STORAGE, StorageService } from 'ngx-webstorage-service';

@Component({
  selector: 'app-listar-resultados',
  templateUrl: './listar-resultados.component.html',
  styleUrls: ['./listar-resultados.component.css']
})
export class ListarResultadosComponent implements OnInit {
  resultados = new MatTableDataSource<Resultado>();
  displayedColumns = [
    'saidaObtida',
    'resultado',
    'resposta',
    'casoTesteEntrada',
    'casoTesteSaida'
  ];
  constructor(private resultadoService: ResultadoService,
    private router: Router,
    @Inject(SESSION_STORAGE) private storage: StorageService) { }

  ngOnInit(): void {
    this.buscarResultados();
  }

  buscarResultados(){
    this.resultadoService.findAll().subscribe((data: any[]) => {
      this.resultados.data = data;
      console.log(this.resultados);
    });
  }
}
