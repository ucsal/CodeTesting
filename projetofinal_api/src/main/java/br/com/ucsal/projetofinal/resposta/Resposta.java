package br.com.ucsal.projetofinal.resposta;

import br.com.ucsal.projetofinal.itemProva.ItemProva;
import br.com.ucsal.projetofinal.resultado.Resultado;
import br.com.ucsal.projetofinal.tarefa.Tarefa;
import br.com.ucsal.projetofinal.usuario.Usuario;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.time.LocalDateTime;

@Entity
@Setter
@Getter
@NoArgsConstructor
public class Resposta implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    @Column(length = 5000)
    private String codigo;

    @NotNull
    @JsonFormat(pattern = "dd-MM-yyyy@HH:mm:ss", shape = JsonFormat.Shape.STRING)
    private LocalDateTime dataEnvio;

    @Valid
    @NotNull
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "usuario_id")
    private Usuario usuario;

    @Valid
    @NotNull
    @OneToOne
    private Tarefa tarefa;

    @OneToOne(mappedBy = "resposta")
    @Valid
    @JsonBackReference
    private Resultado resultado;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "item_prova_id")
    private ItemProva itemProva;

    public Resposta(String codigo, LocalDateTime dataEnvio, Usuario usuario, Tarefa tarefa) {
        this.codigo = codigo;
        this.dataEnvio = dataEnvio;
        this.dataEnvio = LocalDateTime.now();
        this.usuario = usuario;
        this.tarefa = tarefa;
    }

    public Resposta(String codigo, LocalDateTime dataEnvio, Usuario usuario, Tarefa tarefa, ItemProva itemProva) {
        this.codigo = codigo;
        this.dataEnvio = dataEnvio;
        this.dataEnvio = LocalDateTime.now();
        this.usuario = usuario;
        this.tarefa = tarefa;
        this.itemProva = itemProva;
    }
}
