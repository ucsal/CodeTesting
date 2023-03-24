package br.com.ucsal.projetofinal.tarefa;

import br.com.ucsal.projetofinal.itemProva.ItemProva;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/api/tarefa")
public class TarefaController {

    private final TarefaService tarefaService;

    public TarefaController(TarefaService tarefaService) {
        this.tarefaService = tarefaService;
    }

    @GetMapping("/")
    public ResponseEntity<List<Tarefa>> listar() {
        List<Tarefa> tarefas = tarefaService.listar();
        return ResponseEntity.ok().body(tarefas);
    }

    @GetMapping("/publicas/")
    public ResponseEntity<List<Tarefa>> listarPublicas() {
        List<Tarefa> tarefas = tarefaService.listarPublicas();
        return ResponseEntity.ok().body(tarefas);
    }

    @GetMapping("/privadas/{idUsuario}")
    public ResponseEntity<List<Tarefa>> listarPrivadas(@PathVariable Long idUsuario) {
        List<Tarefa> tarefas = tarefaService.listarPrivadas(idUsuario);
        return ResponseEntity.ok().body(tarefas);
    }

    @GetMapping("/protegidas/")
    public ResponseEntity<List<Tarefa>> listarProtegidas() {
        List<Tarefa> tarefas = tarefaService.listarProtegidas();
        return ResponseEntity.ok().body(tarefas);
    }

    @GetMapping("/professor/{idUsuario}")
    public ResponseEntity<List<Tarefa>> listaPublicasProtegidasPrivadas(@PathVariable Long idUsuario) {
        List<Tarefa> tarefas = tarefaService.listaPublicasProtegidasPrivadas(idUsuario);
        return ResponseEntity.ok().body(tarefas);
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> listarPorId(@PathVariable Long id) {
        Optional<Tarefa> tarefa = tarefaService.listarPorId(id);
        if (tarefa.isPresent()) {
            return ResponseEntity.ok(new TarefaResponseDto(tarefa.get()));
        }
        return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
    }

    @PostMapping("/")
    public ResponseEntity<TarefaResponseDto> inserir(@RequestBody @Valid TarefaRequestDto tarefaRequestDto) {

        try {
            return ResponseEntity.ok().body(new TarefaResponseDto(tarefaService.inserir(tarefaRequestDto)));
        }catch (Exception ex) {
            System.out.println(ex.getMessage());
            return ResponseEntity.badRequest().build();
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity atualizar(@PathVariable Long id, @RequestBody Tarefa tarefa) {
        try {
            return ResponseEntity.ok().body(new TarefaResponseDto(tarefaService.atualizar(id, tarefa)));
        }catch (Exception ex) {
            return ResponseEntity.badRequest().build();
        }
    }
}
