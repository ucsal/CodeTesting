package br.com.ucsal.projetofinal.resposta;

import br.com.ucsal.projetofinal.resultado.Resultado;
import br.com.ucsal.projetofinal.tarefa.Tarefa;
import br.com.ucsal.projetofinal.usuario.Usuario;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
public class RespostaPorcentagemResponseDTO {

    private Long id;
    private String codigo;
    private LocalDateTime dataEnvio;
    private Long usuarioId;
    private Usuario usuario;
    private Long tarefaId;
    private Tarefa tarefa;
    private Double porcentagemAcerto;

    public RespostaPorcentagemResponseDTO(Long id, String codigo, LocalDateTime dataEnvio,Tarefa tarefa, Double porcentagemAcerto) {
        this.id = id;
        this.codigo = codigo;
        this.dataEnvio = dataEnvio;
        this.tarefa = tarefa;
        this.porcentagemAcerto = porcentagemAcerto;
    }

    public RespostaPorcentagemResponseDTO(Long id,String codigo, LocalDateTime dataEnvio,Usuario usuario,Tarefa tarefa, Double porcentagemAcerto) {
        this.id = id;
        this.codigo = codigo;
        this.dataEnvio = dataEnvio;
        this.tarefa = tarefa;
        this.usuario = usuario;
        this.porcentagemAcerto = porcentagemAcerto;
    }

    public RespostaPorcentagemResponseDTO(Resposta resposta) {
        this.id = resposta.getId();
        this.codigo = resposta.getCodigo();
        this.dataEnvio = resposta.getDataEnvio();
        this.usuarioId = resposta.getUsuario().getId();
        this.tarefaId = resposta.getTarefa().getId();
    }

}
