package br.com.ucsal.projetofinal.config.autenticacao;

import br.com.ucsal.projetofinal.perfil.Perfil;
import br.com.ucsal.projetofinal.usuario.Usuario;
import br.com.ucsal.projetofinal.usuario.UsuarioService;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.HashSet;
import java.util.Optional;
import java.util.Set;

@Transactional
@Service
public class AutenticacaoService implements UserDetailsService {

    private final UsuarioService usuarioService;

    public AutenticacaoService(UsuarioService usuarioService) {
        this.usuarioService = usuarioService;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Usuario usuario = usuarioService.listarPorLogin(username);
        if (usuario != null) {

            return usuario;
        }
        throw new UsernameNotFoundException("Usuario não encontrado");
    }

    private Set<GrantedAuthority> getAuthories(Usuario usuario) {
        Set<GrantedAuthority> authories = new HashSet<>();
        for (Perfil perfil : usuario.getPerfil()) {
            GrantedAuthority grantedAuthority = new SimpleGrantedAuthority(perfil.getNome());
            authories.add(grantedAuthority);
        }
        return authories;
    }
}
