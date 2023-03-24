package br.com.ucsal.projetofinal.config.autenticacao;

import br.com.ucsal.projetofinal.config.token.LoginForm;
import br.com.ucsal.projetofinal.config.token.TokenDTO;
import br.com.ucsal.projetofinal.config.token.TokenService;
import br.com.ucsal.projetofinal.usuario.Usuario;
import br.com.ucsal.projetofinal.usuario.UsuarioService;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Optional;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/api/login")
public class AutenticacaoController {

    private final AuthenticationManager authenticationManager;

    private final TokenService tokenService;

    private final UsuarioService usuarioService;

    public AutenticacaoController(AuthenticationManager authenticationManager, TokenService tokenService, UsuarioService usuarioService) {
        this.authenticationManager = authenticationManager;
        this.tokenService = tokenService;
        this.usuarioService = usuarioService;
    }

    @PostMapping("/")
    public ResponseEntity<TokenDTO> autenticarLogin(@RequestBody @Valid LoginForm login){
        UsernamePasswordAuthenticationToken dados = login.converter();
        Usuario usuario = usuarioService.listarPorLogin(dados.getPrincipal().toString());
        try {
            Authentication authentication = authenticationManager.authenticate(dados);
            String token = tokenService.gerarToken(authentication);
            return ResponseEntity.ok(new TokenDTO(usuario.getId(), token, "Bearer"));

        } catch (AuthenticationException e) {
            return ResponseEntity.badRequest().build();
        }
    }
}
