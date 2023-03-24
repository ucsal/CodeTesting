package br.com.ucsal.projetofinal.resultado;

import br.com.ucsal.projetofinal.teste.Teste;

import java.util.List;

public class ResultadoResponseDto {

    private String saidaObtida;
    private Boolean create;
    private Boolean compile;
    private Double porcentagem;
    private Long respostaId;
    private List<Teste> testes;


    public ResultadoResponseDto(Resultado resultado) {
        this.saidaObtida = resultado.getSaidaObtida();
        this.create = resultado.getCreate();
        this.compile = resultado.getCompile();
        this.porcentagem = resultado.getPorcentagem();
        this.respostaId = resultado.getResposta().getId();
        this.testes = resultado.getTestes();
    }

    public String getSaidaObtida() {
        return saidaObtida;
    }

    public Boolean getCreate() {
        return create;
    }

    public Boolean getCompile() {
        return compile;
    }

    public Double getPorcentagem() {
        return porcentagem;
    }

    public Long getRespostaId() {
        return respostaId;
    }

    public List<Teste> getTestes() {
        return testes;
    }
}
