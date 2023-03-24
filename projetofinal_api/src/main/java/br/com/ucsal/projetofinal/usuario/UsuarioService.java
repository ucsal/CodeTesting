package br.com.ucsal.projetofinal.usuario;

import br.com.ucsal.projetofinal.perfil.PerfilRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UsuarioService {

    private final UsuarioRepository usuarioRepository;

    private final PerfilRepository perfilRepository;

    public UsuarioService(UsuarioRepository usuarioRepository, PerfilRepository perfilRepository) {
        this.usuarioRepository = usuarioRepository;
        this.perfilRepository = perfilRepository;
    }

    public List<Usuario> listar() {
        return usuarioRepository.findAll();
    }

    public Optional<Usuario> listarPorId(Long id) {
        return usuarioRepository.findById(id);
    }

    public Usuario inserir(UsuarioRequestDto usuarioRequestDto) {
        Usuario usuario = usuarioRequestDto.toModel(perfilRepository);
        return usuarioRepository.save(usuario);
    }

    public Usuario atualizar(Long id, UsuarioRequestDto usuario) {
        return usuarioRepository.findById(id).map(
                user -> {
                    user.setNome(usuario.getNome());
                    user.setLogin(usuario.getLogin());
                    user.setSenha(usuario.getSenha());
                    user.setEmail(usuario.getEmail());
                    user.setFlagAtivo(usuario.getFlagAtivo());
                    return usuarioRepository.save(user);
                }).orElse(null);
    }

    public Usuario listarPorLogin(String login) {
        return usuarioRepository.findByLogin(login);
    }
}
