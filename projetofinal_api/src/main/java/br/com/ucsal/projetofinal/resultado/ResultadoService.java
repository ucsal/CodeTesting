package br.com.ucsal.projetofinal.resultado;

import br.com.ucsal.projetofinal.resposta.RespostaRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ResultadoService {

    private final RespostaRepository respostaRepository;
    private final ResultadoRepository resultadoRepository;

    public ResultadoService(RespostaRepository respostaRepository, ResultadoRepository resultadoRepository) {
        this.respostaRepository = respostaRepository;
        this.resultadoRepository = resultadoRepository;
    }

    public List<Resultado> listar() {
        return resultadoRepository.findAll();
    }

    public Optional<Resultado> listarPorId(Long id) {
        Optional<Resultado> resultado = resultadoRepository.findById(id);
        return resultado;
    }

    public Resultado listarPorTarefa(Long id) {
        Resultado resultados = resultadoRepository.findByRespostaId(id);
        return resultados;
    }

    public Resultado inserir(ResultadoRequestDto resultadoRequestDto){
        Resultado resultado = resultadoRequestDto.toModel(respostaRepository);
        return resultadoRepository.save(resultado);
    }
}
