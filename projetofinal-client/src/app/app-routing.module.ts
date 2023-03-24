import { DetalharProvaComponent } from './pages/detalhar-prova/detalhar-prova.component';
import { ListarProvasComponent } from './pages/listar-provas/listar-provas.component';
import { ListarSubmissoesAlunosComponent } from './pages/listar-submissoes-alunos/listar-submissoes-alunos.component';
import { CadastrarProvaComponent } from './pages/cadastrar-prova/cadastrar-prova.component';
import { CadastrarAlunoComponent } from './pages/cadastrar-aluno/cadastrar-aluno.component';
import { ListarSubmissoesComponent } from './pages/listar-submissoes/listar-submissoes.component';
import { AuthProfessorGuard } from './account/_guards/auth-professor.guard';
import { AuthAdminGuard } from './account/_guards/auth-admin.guard';
import { AuthenticationComponent } from './layout/authentication/authentication.component';
import { HomeComponent } from './layout/home/home.component';
import { LoginComponent } from './pages/login/login.component';
import { ExibirResultadoComponent } from './pages/exibir-resultado/exibir-resultado.component';
import { ListarResultadosComponent } from './pages/listar-resultados/listar-resultados.component';
import { CadastrarUsuarioComponent } from './pages/cadastrar-usuario/cadastrar-usuario.component';
import { CadastrarTarefaComponent } from './pages/cadastrar-tarefa/cadastrar-tarefa.component';
import { ListarTarefasComponent } from './pages/listar-tarefas/listar-tarefas.component';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ListarUsuariosComponent } from './pages/listar-usuarios/listar-usuarios.component';
import { CadastrarRespostaComponent } from './pages/cadastrar-resposta/cadastrar-resposta.component';
import { AuthGuard } from './account/_guards/auth.guard';

const routes: Routes = [
  {
    path: '', component:AuthenticationComponent,
    children:[
      { path: '', redirectTo:'login', pathMatch:'full' },
      { path: 'login', component: LoginComponent },
      { path: 'cadastrarAluno', component: CadastrarAlunoComponent }
    ]
  },
  {
    path: '', component: HomeComponent,
    children:[
      { path: 'usuarios', component: ListarUsuariosComponent, canActivate: [AuthAdminGuard] },
      { path: 'tarefas', component: ListarTarefasComponent, canActivate: [AuthGuard] },
      { path: 'provas', component: ListarProvasComponent, canActivate: [AuthGuard] },
      { path: 'prova', component: DetalharProvaComponent, canActivate: [AuthGuard] },
      { path: 'resultado', component: ExibirResultadoComponent, canActivate: [AuthGuard] },
      { path: 'submissoes', component: ListarSubmissoesComponent, canActivate: [AuthGuard] },
      { path: 'submissoesAlunos', component: ListarSubmissoesAlunosComponent, canActivate: [AuthProfessorGuard] },
      { path: 'cadastrarProva', component: CadastrarProvaComponent, canActivate: [AuthProfessorGuard] },
      { path: 'cadastrarTarefa', component: CadastrarTarefaComponent, canActivate: [AuthProfessorGuard] },
      { path: 'cadastrarUsuario', component: CadastrarUsuarioComponent, canActivate: [AuthAdminGuard] },
      { path: 'cadastrarResposta', component: CadastrarRespostaComponent, canActivate: [AuthGuard] },
      { path: 'resultados', component: ListarResultadosComponent, canActivate: [AuthGuard]}
    ]
  },



];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
