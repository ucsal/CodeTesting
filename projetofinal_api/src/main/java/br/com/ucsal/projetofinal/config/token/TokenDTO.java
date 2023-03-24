package br.com.ucsal.projetofinal.config.token;

public class TokenDTO {

    private Long id;
    private String token;
    private String tipo;

    public TokenDTO(Long id, String token, String tipo) {
        super();
        this.id = id;
        this.token = token;
        this.tipo = tipo;
    }

    public Long getId() {
        return id;
    }

    public String getToken() {
        return token;
    }

    public String getTipo() {
        return tipo;
    }


}
