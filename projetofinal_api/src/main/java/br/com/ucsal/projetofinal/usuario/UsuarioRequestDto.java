package br.com.ucsal.projetofinal.usuario;

import br.com.ucsal.projetofinal.perfil.Perfil;
import br.com.ucsal.projetofinal.perfil.PerfilRepository;

import java.time.Instant;

public class UsuarioRequestDto {

    private String nome;
    private String login;
    private String senha;
    private String email;
    private Boolean flagAtivo;
    private Instant dataCriacao;
    private Instant dataUltimoAcesso;
    private Long perfilId;

    public UsuarioRequestDto() {
    }

    public UsuarioRequestDto(String nome, String login, String senha, Boolean flagAtivo, String email, Instant dataCriacao, Instant dataUltimoAcesso, Long perfilId) {
        this.nome = nome;
        this.login = login;
        this.senha = senha;
        this.flagAtivo = flagAtivo;
        this.email = email;
        this.dataCriacao = dataCriacao;
        this.dataUltimoAcesso = dataUltimoAcesso;
        this.perfilId = perfilId;
    }

    public Usuario toModel(PerfilRepository perfilRepository) {
        Perfil perfil = perfilRepository.findById(perfilId).orElseThrow(() -> new RuntimeException("Id de perfil não encontrado"));
        return new Usuario(nome, login, senha,  flagAtivo, email, perfil);
    }

    public String getNome() {
        return nome;
    }

    public String getLogin() {
        return login;
    }

    public String getSenha() {
        return senha;
    }

    public Boolean getFlagAtivo() {
        return flagAtivo;
    }

    public  String getEmail(){
        return  email;
    }

    public Instant getDataCriacao() {
        return dataCriacao;
    }

    public Instant getDataUltimoAcesso() {
        return dataUltimoAcesso;
    }

    public Long getPerfilId() {
        return perfilId;
    }
}
