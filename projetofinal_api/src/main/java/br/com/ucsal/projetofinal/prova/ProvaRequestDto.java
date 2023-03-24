package br.com.ucsal.projetofinal.prova;

import br.com.ucsal.projetofinal.itemProva.ItemProva;
import br.com.ucsal.projetofinal.tarefa.Tarefa;
import br.com.ucsal.projetofinal.tarefa.TarefaRepository;
import br.com.ucsal.projetofinal.usuario.Usuario;
import br.com.ucsal.projetofinal.usuario.UsuarioRepository;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class ProvaRequestDto {
    private String nome;
    private List<Long> tarefas;
    private LocalDateTime dataInicial;
    private LocalDateTime dataFinal;
    private Long usuarioId;

    public ProvaRequestDto() {
    }

    public ProvaRequestDto(String nome, List<Long> tarefas, LocalDateTime dataInicial, LocalDateTime dataFinal, Long usuarioId) {
        this.nome = nome;
        this.tarefas = tarefas;
        this.dataInicial = dataInicial;
        this.dataFinal = dataFinal;
        this.usuarioId = usuarioId;
    }

    public Prova toModel(TarefaRepository tarefaRepository, UsuarioRepository usuarioRepository) {
        Usuario usuario = usuarioRepository.findById(usuarioId).orElseThrow(() -> new RuntimeException("Id de usuario não encontrado"));
        Prova prova = new Prova();
        prova.setNome(nome);
        prova.setDataFinal(dataFinal);
        prova.setDataInicial(dataInicial);
        prova.setUsuario(usuario);

        int count = 1;
        for (Long idTarefa : tarefas) {
            Tarefa tarefa = tarefaRepository.buscarTarefa(idTarefa).orElseThrow(() -> new RuntimeException("Id de tarefa não encontrado"));
            //tarefasEncontradas.add(tarefa);
            prova.adicionarItem(new ItemProva(count++, prova, tarefa));
        }
        return prova;
    }

    public String getNome() {
        return nome;
    }

    public List<Long> getTarefas() {
        return tarefas;
    }

    public LocalDateTime getDataInicial() {
        return dataInicial;
    }

    public LocalDateTime getDataFinal() {
        return dataFinal;
    }

    public Long getUsuarioId() {
        return usuarioId;
    }
}
