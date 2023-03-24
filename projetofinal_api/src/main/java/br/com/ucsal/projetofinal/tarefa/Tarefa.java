package br.com.ucsal.projetofinal.tarefa;

import br.com.ucsal.projetofinal.casoteste.CasoTeste;
import br.com.ucsal.projetofinal.itemProva.ItemProva;
import br.com.ucsal.projetofinal.prova.Prova;
import br.com.ucsal.projetofinal.usuario.Usuario;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
public class Tarefa implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    private String titulo;

    @NotBlank
    @Column(length = 5000)
    private String descricao;

    private Integer status;

    private Integer visibilidade;

    @Valid
    @NotNull
    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name = "tarefa_id")
    @JsonIgnore
    private List<CasoTeste> testes = new ArrayList<>();

    /*@OneToMany(mappedBy = "tarefa", cascade = CascadeType.ALL)
    @JsonBackReference
    private List<ItemProva> itens = new ArrayList<>();*/

   /* @ManyToMany(mappedBy = "tarefas", fetch = FetchType.LAZY)
    @JsonBackReference
    private List<Prova> prova;*/

    @Valid
    @ManyToOne
    @JoinColumn(name = "usuario_id")
    @NotNull
    private Usuario usuario;

    public Tarefa(String titulo, String descricao, Integer status,Integer visibilidade, List<CasoTeste> testes, Usuario usuario) {
        this.titulo = titulo;
        this.descricao = descricao;
        this.status = status;
        this.visibilidade = visibilidade;
        this.testes = testes;
        this.usuario = usuario;
    }
}
