package br.com.ucsal.projetofinal.prova;

import br.com.ucsal.projetofinal.itemProva.ItemProva;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/api/provas")
public class ProvaController {

    private final ProvaService provaService;

    public ProvaController(ProvaService provaService) {
        this.provaService = provaService;
    }

    @GetMapping("/")
    public ResponseEntity<List<Prova>> lista() {
        List<Prova> provas = provaService.listar();
        return ResponseEntity.ok().body(provas);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Optional<Prova>> listarPorIdProva(@PathVariable Long id) {
        Optional<Prova> provas = provaService.listarPorId(id);
        if (provas.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
        return ResponseEntity.ok().body(provas);
    }

    @GetMapping("/data/")
    public ResponseEntity<List<Prova>> listarPorData() {
        List<Prova> provas = provaService.listarPorData();
        if (provas.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
        return ResponseEntity.ok().body(provas);
    }

    @GetMapping("/itemprova/{idProva}")
    public ResponseEntity<?> listaPorIdProva(@PathVariable Long idProva) {
        List<ItemProva> tarefas = provaService.listaPorIdProva(idProva);
        return ResponseEntity.ok().body(tarefas);
    }

    @PostMapping("/")
    public ResponseEntity<?> inserir(@RequestBody @Valid ProvaRequestDto provaRequestDto) {
        try {
            return ResponseEntity.ok().body(new ProvaResponseDto(provaService.inserir(provaRequestDto)));
        } catch (Exception ex) {
            return ResponseEntity.badRequest().build();
        }
    }
}
