package br.com.ucsal.projetofinal.casoteste;

import br.com.ucsal.projetofinal.tarefa.Tarefa;
import br.com.ucsal.projetofinal.tarefa.TarefaRepository;

public class CasoTesteRequestDto {

    private String nomeTeste;
    private String entrada;
    private String saida;
    private Integer comparacao;
    private Boolean flagExibir;
    private Long tarefaId;

    public CasoTesteRequestDto() {
    }

    public CasoTesteRequestDto(String nomeTeste, String entrada, String saida, Integer comparacao, Boolean flagExibir, Long tarefaId) {
        this.nomeTeste = nomeTeste;
        this.entrada = entrada;
        this.saida = saida;
        this.comparacao = comparacao;
        this.flagExibir = flagExibir;
        this.tarefaId = tarefaId;
    }

    public CasoTeste toModel(TarefaRepository tarefaRepository) {
        Tarefa tarefa = tarefaRepository.buscarTarefa(tarefaId).orElseThrow();

        return new CasoTeste(nomeTeste, entrada, saida, comparacao, flagExibir, tarefa);
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
