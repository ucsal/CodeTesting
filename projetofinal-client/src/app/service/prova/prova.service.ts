import { ProvaDTO } from './../../model/DTO/provaDTO';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { GenericService } from 'src/app/commons/generic.service';
import { Observable } from 'rxjs';
import { ItemProva } from 'src/app/model/itemProva';
import { Prova } from 'src/app/model/prova';

@Injectable({
  providedIn: 'root'
})
export class ProvaService extends GenericService {
  private relativePath = 'api/provas/';

  constructor(http: HttpClient) {
    super(http);
  }

  override save(prova: ProvaDTO): Observable<ProvaDTO> {
    return this.postMethod(prova, this.relativePath)
  }

  override findAll(): Observable<Array<ProvaDTO>>{
    return this.getMethod(this.relativePath);
  }

  listarPorIdProva(idProva: number):Observable<Array<ItemProva>>{
    return this.getMethod(this.relativePath + "itemprova/"+idProva);
  }

  listarPorData():Observable<Array<Prova>>{
    return this.getMethod(this.relativePath + "data/");
  }
}
