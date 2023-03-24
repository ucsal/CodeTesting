package br.com.ucsal.projetofinal.casoteste;

import br.com.ucsal.projetofinal.tarefa.TarefaRepository;
import br.com.ucsal.projetofinal.usuario.UsuarioResponseDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/api/casoteste")
public class CasoTesteController {

    private final CasoTesteService casoTesteService;

    public CasoTesteController(CasoTesteService casoTesteService) {
        this.casoTesteService = casoTesteService;
    }

    @GetMapping("/")
    public ResponseEntity<List<CasoTeste>> listar() {
        List<CasoTeste> casoTestes = casoTesteService.listar();
        return ResponseEntity.ok().body(casoTestes);
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> listarPorId(@PathVariable Long id) {
        Optional<CasoTeste> casoTeste = casoTesteService.listarPorId(id);
        if (casoTeste.isPresent()) {
            return ResponseEntity.ok(casoTeste);
        }

        return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
    }

    @GetMapping("/tarefa/{id}")
    public ResponseEntity<?> listarPorTarefa(@PathVariable Long id) {
        List<CasoTeste> casoTestes = casoTesteService.listarPorTarefa(id);

        return ResponseEntity.ok().body(casoTestes);


    }

    @PostMapping("/")
    public ResponseEntity<CasoTesteResponseDto> inserir(@RequestBody @Valid CasoTesteRequestDto casoTesteRequestDto) {
        return ResponseEntity.ok().body(new CasoTesteResponseDto(casoTesteService.inserir(casoTesteRequestDto)));
    }

    @PutMapping("/{id}")
    public ResponseEntity atualizar(@PathVariable Long id, @RequestBody CasoTeste casoTeste) {
        try {
            return ResponseEntity.ok().body(new CasoTesteResponseDto((casoTesteService.atualizar(id, casoTeste))));
        } catch (Exception ex) {
            return ResponseEntity.badRequest().build();
        }
    }
}
