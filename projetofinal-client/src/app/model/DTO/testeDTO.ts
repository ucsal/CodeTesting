export class TesteDTO{
  nome: String;
  execute: boolean;
  resultadoFinal: boolean;
  exception: String;
  entrada: String;
  saidaEsperada: string;
  saidaObtida: string;
  runtimeException: boolean;
  exceptionSimplificada: String;

  isMore: boolean;

  constructor(){
    this.nome = "";
    this.execute = false;
    this.resultadoFinal = false;
    this.exception = "";
    this.entrada = "";
    this.saidaEsperada = "";
    this.saidaObtida = "";
    this.runtimeException = false;
    this.exceptionSimplificada= "";

    this.isMore = false;
  }
}
