import { ItemProva } from './itemProva';
import { CasoTeste } from './casoTeste';
import { Usuario } from './usuario';
export interface Tarefa{
  id: number
  titulo: string,
  descricao: string,
  status: number,
  visibilidade: number;
  select: boolean,
  usuario: Usuario,
  usuarioId: number,
  testes : Array<CasoTeste>
}
