package br.com.ucsal.projetofinal.casoteste;

import br.com.ucsal.projetofinal.tarefa.Tarefa;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Entity
@Getter
@Setter
@ToString
@NoArgsConstructor
public class CasoTeste {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    private String nomeTeste;

    @Column(length = 110000)
    private String entrada;

    @Column(length = 110000)
    private String saida;

    @NotNull
    private Integer comparacao;

    private Boolean flagExibir;

    @Valid
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "tarefa_id")
    @JsonIgnore
    private Tarefa tarefa;


    public CasoTeste(String nomeTeste, String entrada, String saida, Integer comparacao, Boolean flagExibir, Tarefa tarefa) {
        this.nomeTeste = nomeTeste;
        this.entrada = entrada;
        this.saida = saida;
        this.comparacao = comparacao;
        this.flagExibir = flagExibir;
        this.tarefa = tarefa;
    }

}
