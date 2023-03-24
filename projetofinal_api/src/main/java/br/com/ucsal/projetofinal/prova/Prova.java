package br.com.ucsal.projetofinal.prova;

import br.com.ucsal.projetofinal.itemProva.ItemProva;
import br.com.ucsal.projetofinal.tarefa.Tarefa;
import br.com.ucsal.projetofinal.usuario.Usuario;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
public class Prova {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    private String nome;

    @OneToMany(fetch = FetchType.EAGER,mappedBy = "prova", cascade = CascadeType.ALL)
    @JsonBackReference
    private List<ItemProva> itens = new ArrayList<>();

    private LocalDateTime dataInicial;

    private LocalDateTime dataFinal;

    @Valid
    @ManyToOne
    @JoinColumn(name = "usuario_id")
    @NotNull
    private Usuario usuario;

    public Prova(String nome, List<ItemProva> itens, LocalDateTime dataInicial, LocalDateTime dataFinal, Usuario usuario) {
        this.nome = nome;
        this.itens = itens;
        this.dataInicial = dataInicial;
        this.dataFinal = dataFinal;
        this.usuario = usuario;
    }

    public void adicionarItem(ItemProva item){
        item.setProva(this);
        this.itens.add(item);
    }
}
