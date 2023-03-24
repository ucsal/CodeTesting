import { TarefaDTO } from 'src/app/model/DTO/tarefaDTO';
import { ProvaDTO } from './provaDTO';
import { Prova } from "../prova";
import { Tarefa } from "../tarefa";

export class ItemProvaDTO{
  id: number;
  ordem: number;
  prova: Prova;
  tarefa: Tarefa;

  constructor(){
    this.id = 0;
    this.ordem = 0;
    this.prova = new ProvaDTO();
    this.tarefa = new TarefaDTO();
  }
}
