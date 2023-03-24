import { Perfil } from './perfil';
export interface Usuario {
  id: number,
  nome: string,
  email: string,
  login: string,
  senha: string,
  perfil: Array<Perfil>,
  perfilId: number,
  flagAtivo: boolean,
  dataCriacao: Date,
  dataUltimoAcesso: Date
}
