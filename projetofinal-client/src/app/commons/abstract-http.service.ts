import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders,HttpErrorResponse } from '@angular/common/http';
import { throwError, retry, catchError} from 'rxjs';
import { environment } from 'src/environments/environment';
import { map } from 'rxjs/operators';

@Injectable()
export class AbstractHttpService {

    protected url: string = environment.url;

    private extractData: any;

    constructor(private http: HttpClient) { }

    protected getMethod<T>(relativePath: string = '', params: any = null) {
        if (params != null) {
          console.log('Get Method: ' + this.url + relativePath +" Params: ", params);
            return this.http.get<T>(this.url + relativePath, {
                params: params
            });
        } else {
            console.log('Get Method: ' + this.url + relativePath );
            return this.http.get<T>(this.url + relativePath);
        }
    }

    protected postMethod<T>(value: any, relativePath: string = '') {
        console.log('Post Method: ' + this.url + relativePath);
        return this.http.post<T>(this.url + relativePath, value, { headers: this.getHeaders() }).pipe(
          catchError(this.handleError)
        );
    }

    protected putMethod(value: any, relativePath: string = '') {
      console.log('Put Method: ' + this.url + relativePath);
      return this.http.put(this.url + relativePath, value, { headers: this.getHeaders() }).pipe(
        catchError(this.handleError)
      );
  }

    protected deleteMethod<T>(value: any, relativePath: string = '') {
      return this.http.delete<T>(this.url +  relativePath+"/", { headers: this.getHeaders() })
      .pipe(
        catchError(this.handleError)
      )
    }

    protected getHeaders() {
        const headers = new HttpHeaders();
        headers.set('Content-Type', 'application/json');
        return headers;
    }

    // Manipulação de erros
    handleError(error: HttpErrorResponse) {
      let errorMessage = '';
      if (error.error instanceof ErrorEvent) {
        // Erro ocorreu no lado do client
        errorMessage = `Erro ocorreu no lado do client: ${error.error.message}`;
      } else {
        // Erro ocorreu no lado do servidor
        errorMessage = `Código do erro: ${error.status}, ` + `menssagem: ${error.message}`;
      }
      console.error(errorMessage);
      return throwError(errorMessage);
    };

}
