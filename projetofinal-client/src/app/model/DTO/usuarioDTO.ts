
import { Perfil } from "../perfil";
export class UsuarioDTO {
  id: number;
  nome: string;
  email: string;
  login: string;
  senha: string;
  perfil: Array<Perfil>;
  perfilId: number;
  flagAtivo: boolean;
  dataCriacao: Date;
  dataUltimoAcesso: Date

  constructor() {
    this.id = 0,
    this.nome = '',
    this.email = '',
    this.login = '',
    this.senha = '',
    this.perfil = new Array<Perfil>(),
    this.perfilId = 0,
    this.flagAtivo = true,
    this.dataCriacao =  new Date(),
    this.dataUltimoAcesso = new Date()
  }
}
