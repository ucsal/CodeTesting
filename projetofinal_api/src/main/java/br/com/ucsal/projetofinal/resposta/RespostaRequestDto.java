package br.com.ucsal.projetofinal.resposta;

import br.com.ucsal.projetofinal.itemProva.ItemProva;
import br.com.ucsal.projetofinal.itemProva.ItemProvaRespository;
import br.com.ucsal.projetofinal.tarefa.Tarefa;
import br.com.ucsal.projetofinal.usuario.Usuario;
import br.com.ucsal.projetofinal.tarefa.TarefaRepository;
import br.com.ucsal.projetofinal.usuario.UsuarioRepository;

import java.time.LocalDateTime;

public class RespostaRequestDto {

    private String codigo;
    private LocalDateTime dataEnvio;
    private Long usuarioId;
    private Long tarefaId;
    private Long itemProvaId;

    public RespostaRequestDto() {
    }

    public RespostaRequestDto(String codigo, Long usuarioId, Long tarefaId, Long itemProvaId) {
        this.codigo = codigo;
        this.dataEnvio = LocalDateTime.now();
        this.usuarioId = usuarioId;
        this.tarefaId = tarefaId;
        this.itemProvaId = itemProvaId;
    }

    public Resposta toModel(UsuarioRepository usuarioRepository, TarefaRepository tarefaRepository, ItemProvaRespository itemProvaRespository) {
        Usuario usuario = usuarioRepository.findById(usuarioId).orElseThrow(() -> new RuntimeException("Id de usuario não encontrado"));
        Tarefa tarefa = tarefaRepository.buscarTarefa(tarefaId).orElseThrow(() -> new RuntimeException("Id de tarefa não encontrada"));
        ItemProva itemProva = null;
        if(itemProvaId != null)
            itemProva = itemProvaRespository.findById(itemProvaId).orElse(null);

        return new Resposta(codigo, dataEnvio, usuario, tarefa, itemProva);
    }

    public String getCodigo() {
        return codigo;
    }

    public LocalDateTime getDataEnvio() {
        return dataEnvio;
    }

    public Long getUsuarioId() {
        return usuarioId;
    }

    public Long getTarefaId() {
        return tarefaId;
    }

    public Long getItemProvaId() {
        return itemProvaId;
    }
}
