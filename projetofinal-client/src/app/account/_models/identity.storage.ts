import {Injectable} from '@angular/core';
import { Observable } from 'rxjs';

const USER_AUTH_LOGIN_KEY = 'SessionDataLogin';
const USER_AUTH_PERFIL_KEY = 'SessionDataPerfil';
const USER_AUTH_TOKEN_KEY = 'SessionDataToken';
const USER_AUTH_ID_USER = 'SessionDataIdUser';

@Injectable({
  providedIn: 'root'
})
export class IdentityStorage {



    constructor() {

    }

    public saveAuthData(userData: any) {

        window.sessionStorage.removeItem(USER_AUTH_LOGIN_KEY);
        window.sessionStorage.removeItem(USER_AUTH_PERFIL_KEY);
        window.sessionStorage.removeItem(USER_AUTH_TOKEN_KEY);
        window.sessionStorage.setItem(USER_AUTH_LOGIN_KEY, userData.login);
        window.sessionStorage.setItem(USER_AUTH_PERFIL_KEY, userData.perfil);
        window.sessionStorage.setItem(USER_AUTH_TOKEN_KEY, userData.token);
        window.sessionStorage.setItem(USER_AUTH_ID_USER, userData.id);
    }

    public clearAuthData() {

        window.sessionStorage.removeItem(USER_AUTH_LOGIN_KEY);
        window.sessionStorage.removeItem(USER_AUTH_PERFIL_KEY);
        window.sessionStorage.removeItem(USER_AUTH_TOKEN_KEY);
        window.sessionStorage.removeItem(USER_AUTH_ID_USER);
        window.sessionStorage.clear();


    }

    public authenticationPresent(): boolean {
        return window.sessionStorage.getItem(USER_AUTH_TOKEN_KEY) !== null;
    }

    public getIdentity(): any {
        const identity: any = {
            login: sessionStorage.getItem(USER_AUTH_LOGIN_KEY),
            perfil: sessionStorage.getItem(USER_AUTH_PERFIL_KEY),
            token: sessionStorage.getItem(USER_AUTH_TOKEN_KEY),
            id: sessionStorage.getItem(USER_AUTH_ID_USER),
        };
        return identity;
    }


    public getIdentityPromise(): Observable<any> {
        return this.getIdentity();
    }


}
