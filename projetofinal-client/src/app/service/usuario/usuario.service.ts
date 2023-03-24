import { UsuarioDTO } from './../../model/DTO/usuarioDTO';
import { Usuario } from './../../model/usuario';
import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse, HttpHeaders } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { retry, catchError } from 'rxjs/operators';
import { GenericService } from 'src/app/commons/generic.service';




@Injectable({
  providedIn: 'root'
})
export class UsuarioService extends GenericService {
  private relativePath = 'api/usuarios/';

  constructor(http: HttpClient) {
    super(http);
  }


  sessao(): Observable<any> {
      return this.getMethod(this.relativePath + 'sessao');
  }

  override update(usuario: UsuarioDTO){
    return this.putMethod(usuario, this.relativePath + usuario.id);
  }

  override findOne(value: number): Observable<any> {
    return this.getMethod(this.relativePath + value);
  }

  override findAll(): Observable<Array<UsuarioDTO>>{
      return this.getMethod(this.relativePath);
  }

  override save(usuario: UsuarioDTO): Observable<UsuarioDTO> {
      return this.postMethod(usuario, this.relativePath)
  }
}
