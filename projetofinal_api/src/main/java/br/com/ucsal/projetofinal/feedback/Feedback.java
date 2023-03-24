package br.com.ucsal.projetofinal.feedback;

import br.com.ucsal.projetofinal.resultado.Resultado;
import br.com.ucsal.projetofinal.resposta.Resposta;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;

@Entity
@Getter
@Setter
@NoArgsConstructor
public class Feedback {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    private String complexidade;

    @Valid
    @OneToOne
    private Resposta resposta;

    @Valid
    @ManyToOne
    @JoinColumn(name = "resultado_id")
    @JsonIgnore
    private Resultado resultados;

    public Feedback(String complexidade, Resposta resposta, Resultado resultado) {
        this.complexidade = complexidade;
        this.resposta = resposta;
        this.resultados = resultado;
    }
}
