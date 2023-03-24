package br.com.ucsal.projetofinal.resultado;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/api/resultados")
public class ResultadoController {

   private final ResultadoService resultadoService;

    public ResultadoController(ResultadoService resultadoService) {
        this.resultadoService = resultadoService;
    }

    @GetMapping("/")
    public ResponseEntity<List<Resultado>> listar() {
        List<Resultado> resultados = resultadoService.listar();
        return ResponseEntity.ok().body(resultados);
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> listarPorId(@PathVariable Long id) {
        Optional<Resultado> resultado = resultadoService.listarPorId(id);
        if (resultado.isPresent()) {
            return ResponseEntity.ok().body(new ResultadoResponseDto(resultado.get()));
        }
        return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
    }

    @GetMapping("/resposta/{id}")
    public ResponseEntity<?> listarPorTarefa(@PathVariable Long id) {
        Resultado resultados = resultadoService.listarPorTarefa(id);
        return ResponseEntity.ok().body(resultados);
    }

    @PostMapping("/")
    public ResponseEntity<ResultadoResponseDto> inserir(@RequestBody @Valid ResultadoRequestDto resultadoRequestDto) {
        try {
            return ResponseEntity.ok().body(new ResultadoResponseDto(resultadoService.inserir(resultadoRequestDto)));
        }catch (Exception ex) {
            return ResponseEntity.badRequest().build();
        }

    }
}
