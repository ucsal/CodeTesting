import { BarraProgressoComponent } from './pages/barra-progresso/barra-progresso.component';
import { httpInterceptorProviders } from './account/';
import { DEFAULT_CURRENCY_CODE, LOCALE_ID, NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AceEditorModule } from 'ng2-ace-editor';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MaterialExampleModule } from 'src/material.module';
import { ListarUsuariosComponent } from './pages/listar-usuarios/listar-usuarios.component';
import { MenuComponent } from './pages/menu/menu.component';
import { HttpClientModule } from '@angular/common/http';
import { ListarTarefasComponent } from './pages/listar-tarefas/listar-tarefas.component';
import { CadastrarTarefaComponent } from './pages/cadastrar-tarefa/cadastrar-tarefa.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { CadastrarUsuarioComponent } from './pages/cadastrar-usuario/cadastrar-usuario.component';
import { registerLocaleData } from '@angular/common';
import {MatNativeDateModule} from '@angular/material/core';
import localePt from '@angular/common/locales/pt';
import { DialogCasoTesteComponent } from './pages/dialog-caso-teste/dialog-caso-teste.component';
import { CadastrarRespostaComponent } from './pages/cadastrar-resposta/cadastrar-resposta.component';
import { DialogRespostaComponent } from './pages/dialog-resposta/dialog-resposta.component';
import { CommonsModule } from './commons/commons.module';
import { ExibirResultadoComponent } from './pages/exibir-resultado/exibir-resultado.component';
import { ListarResultadosComponent } from './pages/listar-resultados/listar-resultados.component';
import { BlockUIModule } from 'ng-block-ui';
import { LoginComponent } from './pages/login/login.component';
import { HomeComponent } from './layout/home/home.component';
import { AuthenticationComponent } from './layout/authentication/authentication.component';
import { ListarSubmissoesComponent } from './pages/listar-submissoes/listar-submissoes.component';
import { CadastrarAlunoComponent } from './pages/cadastrar-aluno/cadastrar-aluno.component';
import { CadastrarProvaComponent } from './pages/cadastrar-prova/cadastrar-prova.component';
import { ListarSubmissoesAlunosComponent } from './pages/listar-submissoes-alunos/listar-submissoes-alunos.component';
import { DialogDetalharTesteComponent } from './pages/dialog-detalhar-teste/dialog-detalhar-teste.component';
import { ListarProvasComponent } from './pages/listar-provas/listar-provas.component';
import { DetalharProvaComponent } from './pages/detalhar-prova/detalhar-prova.component';
// import { ToasterModule } from 'angular2-toaster';


registerLocaleData(localePt, 'pt');
@NgModule({
  declarations: [
    AppComponent,
    ListarUsuariosComponent,
    MenuComponent,
    ListarTarefasComponent,
    CadastrarTarefaComponent,
    CadastrarUsuarioComponent,
    DialogCasoTesteComponent,
    CadastrarRespostaComponent,
    DialogRespostaComponent,
    ExibirResultadoComponent,
    ListarResultadosComponent,
    LoginComponent,
    HomeComponent,
    AuthenticationComponent,
    ListarSubmissoesComponent,
    CadastrarAlunoComponent,
    CadastrarProvaComponent,
    BarraProgressoComponent,
    ListarSubmissoesAlunosComponent,
    DialogDetalharTesteComponent,
    ListarProvasComponent,
    DetalharProvaComponent
  ],
  imports: [
    HttpClientModule,
    BrowserModule,
    BrowserAnimationsModule,
    FormsModule,
    AppRoutingModule,
    MaterialExampleModule,
    MatNativeDateModule,
    ReactiveFormsModule,
    AceEditorModule,
    BlockUIModule.forRoot(),
    CommonsModule
  ],
  providers: [
    httpInterceptorProviders,
    { provide: LOCALE_ID, useValue: 'pt' },
    {
      provide: DEFAULT_CURRENCY_CODE,
      useValue: 'BRL',
    },
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
