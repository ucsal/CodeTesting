package br.com.ucsal.projetofinal.casoteste;

import br.com.ucsal.projetofinal.casoteste.CasoTeste;

public class CasoTesteResponseDto {

    private Long id;
    private String nomeTeste;
    private String entrada;
    private String saida;
    private Integer comparacao;
    private Boolean flagExibir;
    private Long tarefaId;

    public CasoTesteResponseDto(CasoTeste casoTeste) {
        this.id = casoTeste.getId();
        this.nomeTeste = casoTeste.getNomeTeste();
        this.entrada = casoTeste.getEntrada();
        this.saida = casoTeste.getSaida();
        this.comparacao = casoTeste.getComparacao();
        this.flagExibir = casoTeste.getFlagExibir();
        this.tarefaId = casoTeste.getTarefa().getId();
    }

    public Long getId() {
        return id;
    }

    public String getNomeTeste() {
        return nomeTeste;
    }

    public String getEntrada() {
        return entrada;
    }

    public String getSaida() {
        return saida;
    }

    public Integer getComparacao() {
        return comparacao;
    }

    public Boolean getFlagExibir() {
        return flagExibir;
    }

    public Long getTarefaId() {
        return tarefaId;
    }
}
