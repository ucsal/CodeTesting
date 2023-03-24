package br.com.ucsal.projetofinal.resultado;

import br.com.ucsal.projetofinal.resposta.Resposta;
import br.com.ucsal.projetofinal.resposta.RespostaRepository;
import br.com.ucsal.projetofinal.teste.Teste;

import java.util.List;

public class ResultadoRequestDto {

    private String saidaObtida;
    private Boolean create;
    private Boolean compile;
    private Double porcentagem;
    private Long respostaId;
    private List<Teste> testes;

    public ResultadoRequestDto() {
    }

    public ResultadoRequestDto(String saidaObtida, Boolean create, Boolean compile, Double porcentagem, Long respostaId, List<Teste> testeId) {
        this.saidaObtida = saidaObtida;
        this.create = create;
        this.compile = compile;
        this.porcentagem = porcentagem;
        this.respostaId = respostaId;
        this.testes = testeId;
    }

    public Resultado toModel(RespostaRepository respostaRepository) {
        Resposta resposta = respostaRepository.findById(respostaId).orElseThrow(() -> new RuntimeException("Id de resposta não encontrado"));
        return new Resultado(saidaObtida, create, compile, porcentagem, resposta, testes);
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
