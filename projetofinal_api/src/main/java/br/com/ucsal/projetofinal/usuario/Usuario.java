package br.com.ucsal.projetofinal.usuario;

import br.com.ucsal.projetofinal.perfil.Perfil;
import br.com.ucsal.projetofinal.resposta.Resposta;
import br.com.ucsal.projetofinal.tarefa.Tarefa;
import com.fasterxml.jackson.annotation.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import javax.persistence.*;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Entity
@Setter
@Getter
@NoArgsConstructor
public class Usuario implements UserDetails, Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    private String nome;

    @NotBlank
    @Column(unique = true)
    private String login;

    @NotBlank
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    private String senha;

    @NotNull
    private Boolean flagAtivo;

    @NotBlank
    private String email;

    @NotNull
    private Instant dataCriacao;

    @NotNull
    private Instant dataUltimoAcesso;

    @Valid
    @NotNull
    @OneToMany(cascade = CascadeType.ALL)
    @JsonIgnore
    private List<Resposta> respostas = new ArrayList<>();

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(joinColumns = @JoinColumn(name = "usuario_id"),
            inverseJoinColumns = @JoinColumn(name = "perfil_id")
    )
    private List<Perfil> perfil = new ArrayList<>();

    public Usuario(String nome, String login, String senha, Boolean flagAtivo, String email, Perfil perfil) {
        this.nome = nome;
        this.login = login;
        this.senha = new BCryptPasswordEncoder().encode(senha);
        this.flagAtivo = flagAtivo;
        this.email = email;
        ZoneId brazilZone = ZoneId.of("America/Sao_Paulo");
        this.dataCriacao = Instant.now();
        this.dataUltimoAcesso = Instant.now();
        this.perfil.add(perfil);
    }

    @Override
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return this.perfil;
    }

    @Override
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    public String getPassword() {
        return this.senha;
    }

    @Override
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    public String getUsername() {
        return this.login;
    }

    @Override
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    public boolean isEnabled() {
        return true;
    }
}
