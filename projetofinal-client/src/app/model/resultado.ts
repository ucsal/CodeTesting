import { RespostaDTO } from 'src/app/model/DTO/RespostaDTO';
import { Teste } from './teste';


export interface Resultado{
  id: number;
  saidaObtida: string;
  // execption: string;
  create: boolean;
  compile: boolean;
  porcentagem: number;

  resposta: RespostaDTO;
  testes: Array<Teste>
}
