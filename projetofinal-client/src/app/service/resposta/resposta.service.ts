import { GenericService } from 'src/app/commons/generic.service';
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { RespostaDTO } from 'src/app/model/DTO/RespostaDTO';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class RespostaService extends GenericService {
  private relativePath = 'api/respostas/';
  constructor(http: HttpClient) {
    super(http);
  }

  override save(resposta: RespostaDTO): Observable<RespostaDTO> {

    return this.postMethod(resposta, this.relativePath);
  }

  listarPorUsuario(idUsuario: number): Observable<any>{
    return this.getMethod(this.relativePath+'usuario/'+idUsuario)
  }

  listarPorTarefa(id: number):Observable<any>{
    return this.getMethod(this.relativePath +'tarefa/'+ id);
  }
}
