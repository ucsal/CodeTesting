package br.com.ucsal.projetofinal.prova;

import br.com.ucsal.projetofinal.itemProva.ItemProva;
import br.com.ucsal.projetofinal.tarefa.Tarefa;

import java.time.LocalDateTime;
import java.util.List;

public class ProvaResponseDto {

    private String nome;
    private List<ItemProva> tarefas;
    private LocalDateTime dataInicial;
    private LocalDateTime dataFinal;

    public ProvaResponseDto(Prova prova) {
        this.nome = prova.getNome();
        this.tarefas = prova.getItens();
        this.dataInicial = prova.getDataInicial();
        this.dataFinal = prova.getDataFinal();
    }

    public String getNome() {
        return nome;
    }

    public List<ItemProva> getItens() {
        return tarefas;
    }

    public List<ItemProva> getTarefas() {
        return tarefas;
    }

    public LocalDateTime getDataInicial() {
        return dataInicial;
    }

    public LocalDateTime getDataFinal() {
        return dataFinal;
    }
}
