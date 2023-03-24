package br.com.ucsal.projetofinal.resultado;

import br.com.ucsal.projetofinal.feedback.Feedback;
import br.com.ucsal.projetofinal.teste.Teste;
import br.com.ucsal.projetofinal.resposta.Resposta;
import com.fasterxml.jackson.annotation.JsonBackReference;
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
public class Resultado implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    @Column(length = 110000)
    private String saidaObtida;

    @Column(name = "criado")
    private Boolean create;

    @Column(name = "compilado")
    private Boolean compile;

    private Double porcentagem;

    @NotNull
    @Valid
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "resposta_id")
    @JsonBackReference
    private Resposta resposta;

    @ManyToOne
    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name = "feedback_id")
    @JsonBackReference
    private Feedback feedback;

    @Valid
    @NotNull
    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name = "resultado_id")
    private List<Teste> testes = new ArrayList<>();

    public Resultado(String saidaObtida, Boolean create, Boolean compile, Double porcentagem, Resposta resposta, List<Teste> testes) {
        this.saidaObtida = saidaObtida;
        this.create = create;
        this.compile = compile;
        this.porcentagem = porcentagem;
        this.resposta = resposta;
        this.testes = testes;
    }
}
