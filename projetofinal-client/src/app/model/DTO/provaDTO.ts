import { UsuarioDTO } from 'src/app/model/DTO/usuarioDTO';
import { Usuario } from './../usuario';
import { Tarefa } from 'src/app/model/tarefa';

export class ProvaDTO{
  id: number;
  nome: string;
  tarefas: Array<number>;
  dataInicial: Date;
  dataFinal: Date;

  usuarioId: number;
  usuario: Usuario;

  constructor(){
    this.id = 0,
    this.nome ="",
    this.tarefas = new Array<number>(),
    this.dataInicial = new Date(),
    this.dataFinal = new Date(),
    this.usuario = new UsuarioDTO(),
    this.usuarioId = 0
  }
}
