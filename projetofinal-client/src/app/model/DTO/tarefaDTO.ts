import { UsuarioDTO } from './usuarioDTO';
import { Usuario } from './../usuario';
import { CasoTeste } from './../casoTeste';
export class TarefaDTO{
  id: number
  titulo: string;
  descricao: string;
  status: number;
  visibilidade: number;
  select: boolean;

  usuario: Usuario;
  usuarioId: number;
  testes:  Array<CasoTeste>;

  constructor() {
    this.id = 0,
    this.titulo = '',
    this.descricao = '',
    this.status = 0,
    this.visibilidade = 0;
    this.select = false,

    this.usuario = new UsuarioDTO(),
    this.usuarioId = 0,
    this.testes = new Array<CasoTeste>()

  }
}
