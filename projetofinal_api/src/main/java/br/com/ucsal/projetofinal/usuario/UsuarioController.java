package br.com.ucsal.projetofinal.usuario;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.time.Instant;
import java.util.List;
import java.util.Optional;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping(value = "/api/usuarios")
public class UsuarioController {
    private final Logger logger = LoggerFactory.getLogger(UsuarioController.class);

    private final UsuarioService usuarioService;

    public UsuarioController(UsuarioService usuarioService) {
        this.usuarioService = usuarioService;
    }

    @GetMapping
    public ResponseEntity<List<Usuario>> listar() {
        List<Usuario> usuarios = usuarioService.listar();
        return ResponseEntity.ok().body(usuarios);
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> listarPorId(@PathVariable Long id) {
        Optional<Usuario> usuario = usuarioService.listarPorId(id);
        if (usuario.isPresent()) {
            return ResponseEntity.ok(new UsuarioResponseDto(usuario.get()));
        }
        logger.error("Não existe usuario com esse id");
        return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
    }


    @CrossOrigin
    @PostMapping("/")
    public ResponseEntity<UsuarioResponseDto> inserir(@RequestBody @Valid UsuarioRequestDto usuarioRequestDto) {
        try {
            return ResponseEntity.ok().body(new UsuarioResponseDto(usuarioService.inserir(usuarioRequestDto)));
        } catch (Exception ex) {
            return ResponseEntity.badRequest().build();
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity atualizar(@PathVariable Long id, @RequestBody UsuarioRequestDto usuario) {
        try {
            return ResponseEntity.ok().body(new UsuarioResponseDto(usuarioService.atualizar(id, usuario)));
        } catch (Exception ex) {
            return ResponseEntity.badRequest().build();
        }
    }
}
