package br.com.ucsal.projetofinal.tarefa;

import br.com.ucsal.projetofinal.casoteste.CasoTeste;
import br.com.ucsal.projetofinal.tarefa.Tarefa;

import java.time.LocalDateTime;
import java.util.List;

public class TarefaResponseDto {

    private long id;
    private String titulo;
    private String descricao;
    private Integer status;
    private Integer visibilidade;
    private List<CasoTeste> testes;
    private Long usuarioId;

    public TarefaResponseDto(Tarefa tarefa) {
        this.id = tarefa.getId();
        this.titulo = tarefa.getTitulo();
        this.descricao = tarefa.getDescricao();
        this.status = tarefa.getStatus();
        this.visibilidade = tarefa.getVisibilidade();
        this.testes = tarefa.getTestes();
        this.usuarioId = tarefa.getUsuario().getId();
    }
    public long getId() {
        return id;
    }

    public String getTitulo() {
        return titulo;
    }

    public String getDescricao() {
        return descricao;
    }

    public Integer getStatus() {
        return status;
    }

    public Integer getVisibilidade() {
        return visibilidade;
    }

    public List<CasoTeste> getTestes() {
        return testes;
    }

    public Long getUsuarioId() {
        return usuarioId;
    }
}
