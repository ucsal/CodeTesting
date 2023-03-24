package br.com.ucsal.projetofinal.config.token;

import br.com.ucsal.projetofinal.usuario.Usuario;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class TokenService {

    @Value("${spring.security.jwt.token.expire-length}")
    private String expiration;

    @Value("${spring.security.jwt.token.secret-key}")
    private String secret;

    public String gerarToken(Authentication authentication) {
        Usuario logado = (Usuario) authentication.getPrincipal();
        Date hoje = new Date();
        Date dataToken = new Date(hoje.getTime() + Long.parseLong(expiration));

        return Jwts.builder().setIssuer("Api projeto final").setSubject(logado.getId().toString())
                .setIssuedAt(hoje).setExpiration(dataToken).signWith(SignatureAlgorithm.HS256, secret).compact();
    }

    public boolean isValid(String token) {
        try {
            Jwts.parser().setSigningKey(this.secret).parseClaimsJws(token);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public Long getIdUsuario(String token) {
        Claims claims = Jwts.parser().setSigningKey(this.secret).parseClaimsJws(token).getBody();
        return Long.parseLong(claims.getSubject());
    }

}

