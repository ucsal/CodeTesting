package br.com.ucsal.projetofinal.resposta;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/api/respostas")
public class RespostaController {

    private final RespostaService respostaService;

    public RespostaController(RespostaService respostaService) {
        this.respostaService = respostaService;
    }

    @GetMapping("/")
    public ResponseEntity<List<Resposta>> listar() {
        List<Resposta> respostas = respostaService.listar();
        return ResponseEntity.ok().body(respostas);
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> listarPorId(@PathVariable Long id) {
        Optional<Resposta> resposta = respostaService.listarPorId(id);
        if (resposta.isPresent()) {
            return ResponseEntity.ok().body(new RespostaResponseDto(resposta.get()));
        }
        return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
    }

    @GetMapping("/usuario/{id}")
    public ResponseEntity<List<RespostaPorcentagemResponseDTO>> listarPorIdUsuario(@PathVariable Long id) {
        List<RespostaPorcentagemResponseDTO> respostas = respostaService.listarPorIdUsuario(id);
        if (respostas.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
        return ResponseEntity.ok().body(respostas);
    }

    @GetMapping("/tarefa/{id}")
    public ResponseEntity<List<RespostaPorcentagemResponseDTO>> listarPorIdTarefa(@PathVariable Long id) {
        List<RespostaPorcentagemResponseDTO> respostas = respostaService.listarPorIdTarefa(id);
        if (respostas.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
        return ResponseEntity.ok().body(respostas);
    }

    @GetMapping("/prova/{idProva}")
    public ResponseEntity<List<RespostaPorcentagemResponseDTO>> listarPorIdProva(@PathVariable Long idProva) {
        List<RespostaPorcentagemResponseDTO> respostas = respostaService.listarPorIdProva(idProva);
        if (respostas.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
        return ResponseEntity.ok().body(respostas);
    }

    @PostMapping("/")
    public ResponseEntity<RespostaResponseDto> inserir(@RequestBody @Valid RespostaRequestDto respostaRequestDto) {
        Resposta resposta = respostaService.inserir(respostaRequestDto);
        respostaService.gerarResultado(resposta);
        return ResponseEntity.ok().body(new RespostaResponseDto(resposta));
    }

    @PutMapping("/{id}")
    public ResponseEntity atualizar(@PathVariable Long id, @RequestBody Resposta resposta) {
        try {
            return ResponseEntity.ok().body(new RespostaResponseDto(respostaService.atualizar(id, resposta)));
        } catch (Exception ex) {
            return ResponseEntity.badRequest().build();
        }
    }


}
