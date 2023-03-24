export class CasoTesteDTO{
  id: number;
  nomeTeste: string;
  entrada: string;
  saida: string;
  comparacao: number;
  flagExibir: boolean;

  constructor() {
    this.id = 0;
    this.nomeTeste= '';
    this.entrada=  '';
    this.saida = '';
    this.comparacao = 0;
    this.flagExibir = false;
  }
}
