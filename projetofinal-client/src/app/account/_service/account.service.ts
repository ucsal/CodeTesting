import { IdentityStorage } from './../_models/identity.storage';
import { UsuarioDTO } from './../../model/DTO/usuarioDTO';
import { LoginDTO } from '../../model/DTO/loginDTO';
import { HttpClient } from '@angular/common/http';
import { Inject, Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { SESSION_STORAGE, StorageService } from 'ngx-webstorage-service';
import { BehaviorSubject, Observable } from 'rxjs';
import { UsuarioService } from 'src/app/service/usuario/usuario.service';
import { environment } from 'src/environments/environment';
import { map } from 'rxjs/operators';
import jwt_decode from 'jwt-decode';
import { Identity } from '../_models/identity';


class AuthorityResponse {
  public authority!: string;
}

class UserPerfilResponse {
  public nome!: string;
}

class UserDataResponse {
  public id!: string;
  public nome!: string;
  public cpf!: string;
  public perfis!: UserPerfilResponse[];
}

class AuthenticationResponse {
  public login!: string;
  public token!: string;
  public user!: UserDataResponse;
  public authorities!: AuthorityResponse[];
}
class AuthenticationResult {
  ok: boolean;
  message: string;

  constructor(ok: boolean, message: string) {
      this.ok = ok;
      this.message = message;
  }
}

const USER_AUTH_TOKEN_KEY = 'SessionDataToken';
@Injectable({
  providedIn: 'root'
})

export class AccountService  {
  usuarioLogado = new UsuarioDTO()
  baseUrl = environment.url;
  urlLogin = 'api/login/';
  private messageSource = new BehaviorSubject(false);

  constructor(
    private http: HttpClient,
    private identityStorage: IdentityStorage,
    private usuarioService: UsuarioService) {

  }

  login(user: LoginDTO): Observable<AuthenticationResult> {

        return this.http.post<AuthenticationResponse>(this.baseUrl + this.urlLogin, user).pipe(
          map(resp=>{
            if(resp.token){
              const token = resp.token;
              if(token){
                console.log(`Usuário autenticou`);
                window.sessionStorage.setItem(USER_AUTH_TOKEN_KEY, token);
                this.authenticate(token);

                this.messageSource.next(true);
              }
              return new AuthenticationResult(false, 'Token vazio');
            } else {
              this.messageSource.next(false);
              return new AuthenticationResult(false, 'Login ou Senha Inválidos');
            }
          })

      )

    }

  authenticate(token: string) {
    const decoded: any = jwt_decode(token);

    const user : number = decoded.sub;

    let userAuthenticate = new UsuarioDTO();
    this.usuarioService.findOne(user).subscribe((data) => {
      userAuthenticate = data;
      const userAuthData = {
        id: userAuthenticate.id,
        login: userAuthenticate.login,
        perfil: userAuthenticate.perfil[0].id,
        token:token
      };
      this.identityStorage.saveAuthData(userAuthData)
      //console.log(`autenticado no storage ${userAuthData}`);
    });
  }

  clearAuthentication(): void {
    this.identityStorage.clearAuthData();
  }

  getIdentity(): Identity{
    return this.identityStorage.getIdentity();
  }

  getToken(): string{
    return this.identityStorage.getIdentity().token;
  }

  getAuthorizationToken(){
    const token = this.identityStorage.getIdentity().token;
    return token;
  }

  getTokenExpirationDate(token: string): Date {
    const decoded: any = jwt_decode(token);

    if (decoded.exp === undefined) {
      console.error("decoded.exp undefined")
    }

    const date = new Date(0);
    date.setUTCSeconds(decoded.exp);
    return date;
  }

  getSubject(){
    const decoded: any = jwt_decode(this.getAuthorizationToken());
    if (decoded.sub === undefined) {
      console.error("decoded.exp undefined");
    }
    const user : number = decoded.sub;
    return user;
  }

  isAdmin(): boolean{
    const perfil = this.identityStorage.getIdentity().perfil;
    if(perfil == 1)
      return true
    else
      return false

  }

  isProfessor(): boolean{
    const perfil = this.identityStorage.getIdentity().perfil;
    if(perfil == 3)
      return true
    else
      return false
  }

  isAluno(): boolean{
    const perfil = this.identityStorage.getIdentity().perfil;
    if(perfil == 2)
      return true
    else
      return false
  }

  isTokenExpired(token?: string): boolean {
    if (!token) {
      return true;
    }

    const date = this.getTokenExpirationDate(token);
    if (date === undefined) {
      return false;
    }

    return !(date.valueOf() > new Date().valueOf());
  }

  isUserLoggedIn() {

    const token = this.getAuthorizationToken();
    //console.log("isUserLoggedIn", token)
    if (!token) {
      return false;
    } else if (this.isTokenExpired(token)) {
      return false;
    }

    return true;
  }
}
