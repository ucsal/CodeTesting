import { Prova } from 'src/app/model/prova';
import { Tarefa } from './tarefa';

export interface ItemProva{
  id: number;
  ordem: number;
  prova: Prova;
  tarefa: Tarefa;
}
