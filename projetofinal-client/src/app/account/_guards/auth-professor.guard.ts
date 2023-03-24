import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot, UrlTree } from '@angular/router';
import { Observable } from 'rxjs';
import { UsuarioDTO } from 'src/app/model/DTO/usuarioDTO';
import { AccountService } from '../_service/account.service';

@Injectable({
  providedIn: 'root'
})
export class AuthProfessorGuard implements CanActivate {
  constructor(
    private router: Router,
    private accountService: AccountService
  ) {}

  usuarioLogado = new UsuarioDTO()
  canActivate(next: ActivatedRouteSnapshot, state: RouterStateSnapshot): boolean {

    if (this.accountService.isUserLoggedIn() && this.accountService.isProfessor() ||  this.accountService.isAdmin() ) {
      return true;
    } else {
      this.router.navigate(['tarefas']);
      return false;
    }
  }

}
