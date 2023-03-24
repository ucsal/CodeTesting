import { ItemProva } from './../../model/itemProva';

import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { GenericService } from 'src/app/commons/generic.service';
import { Tarefa } from 'src/app/model/tarefa';

@Injectable({
  providedIn: 'root'
})
export class TarefaService extends GenericService {
  private relativePath = 'api/tarefa/';

  constructor(http: HttpClient) {
    super(http);
  }

  override findAll(): Observable<Array<Tarefa>>{
    return this.getMethod(this.relativePath);
  }

  override save(tarefa: Tarefa): Observable<Tarefa> {
    return this.postMethod(tarefa, this.relativePath);
  }

  override findOne(value: number): Observable<Tarefa> {
    return this.getMethod(this.relativePath + value);
  }

  buscarCasosTestes(id: number): Observable<Tarefa>{
    return this.getMethod(this.relativePath + id);
  }

  listarPublicas():Observable<Array<Tarefa>>{
    return this.getMethod(this.relativePath + "publicas/");
  }

  listarPrivadas(idUsuario: number):Observable<Array<Tarefa>>{
    return this.getMethod(this.relativePath + "privadas/"+idUsuario);
  }

  listarProtegidas():Observable<Array<Tarefa>>{
    return this.getMethod(this.relativePath + "protegidas/");
  }

  listaPublicasProtegidasPrivadas(idUsuario: number):Observable<Array<Tarefa>>{
    return this.getMethod(this.relativePath + "professor/"+idUsuario);
  }


}
