package br.com.ucsal.projetofinal.perfil;

import br.com.ucsal.projetofinal.usuario.Usuario;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;

import javax.persistence.*;
import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
public class Perfil implements GrantedAuthority {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true)
    private String nome;

    @ManyToMany(mappedBy = "perfil", fetch = FetchType.LAZY)
    @JsonBackReference
    private List<Usuario> usuario;

    @Override
    public String getAuthority() {
        return this.nome;
    }
}