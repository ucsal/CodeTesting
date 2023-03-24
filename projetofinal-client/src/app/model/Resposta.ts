
import { ItemProva } from './itemProva';
import { Tarefa } from './tarefa';
import { Usuario } from './usuario';

export interface Resposta2{
  id: number,
  codigo: string,
  dataEnvio: Date,
  usuario: Usuario,
  tarefa: Tarefa,
  itemProva: ItemProva;
  itemProvaId : number;
  usuarioId: number,
  tarefaId: number,


  porcentagemAcerto: number,
}
