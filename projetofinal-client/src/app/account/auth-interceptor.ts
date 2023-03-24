import { Inject, Injectable } from '@angular/core';
import {
  HttpEvent, HttpInterceptor, HttpHandler, HttpRequest, HttpErrorResponse
} from '@angular/common/http';

import { Observable, catchError,retry, throwError } from 'rxjs';
import { SESSION_STORAGE, StorageService } from 'ngx-webstorage-service';
import { AccountService } from './_service/account.service';

const USER_AUTH_TOKEN_KEY = 'SessionDataToken';
@Injectable()
export class AuthInterceptor implements HttpInterceptor {

  constructor(
    private accountService: AccountService,
    @Inject(SESSION_STORAGE) private storage: StorageService,

  ){}

  intercept(req: HttpRequest<any>, next: HttpHandler):Observable<HttpEvent<any>> {
    let token = this.accountService.getToken();
    let request: HttpRequest<any> = req;

    if(token){
      // o request é imutavel, ou seja, não é possível mudar nada
      // Faço o clone para conseguir mudar as propriedades
      // Passo o token de autenticação no header
      token = `Bearer ${token}`;
      request = req.clone({
        setHeaders:{
          Authorization: token
        }
      })
    }

    return next.handle(request)
    // .pipe(
    //   retry(2),
    //   catchError(this.handleError)
    // )

  }

  handleError(error: HttpErrorResponse) {
    let errorMessage = '';
    if (error.error instanceof ErrorEvent) {
      // Erro ocorreu no lado do client
      errorMessage = `Ocorreu um erro: ${error.error.message}`;
    } else {
      // Erro ocorreu no lado do servidor
      errorMessage = `Código do erro: ${error.status}, ` + `menssagem: ${error.message}`;
    }
    console.error(errorMessage);
    return throwError(errorMessage);
  };
}
