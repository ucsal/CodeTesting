import { GenericService } from './../../commons/generic.service';
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { CasoTesteDTO } from 'src/app/model/DTO/CasoTesteDTO';

@Injectable({
  providedIn: 'root'
})

export class CasoTesteService extends GenericService{
  private relativePath = 'api/casoteste/';

  constructor(http: HttpClient) {
    super(http);
  }

  override findAll(): Observable<Array<CasoTesteDTO>>{
    return this.getMethod(this.relativePath);
  }

  listarPorTarefa(id: number): Observable<Array<CasoTesteDTO>>{
    return this.getMethod(this.relativePath+'tarefa/'+id);
  }


}
