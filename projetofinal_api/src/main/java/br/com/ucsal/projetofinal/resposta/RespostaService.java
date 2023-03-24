package br.com.ucsal.projetofinal.resposta;

import br.com.ucsal.projetofinal.casoteste.CasoTeste;
import br.com.ucsal.projetofinal.itemProva.ItemProvaRespository;
import br.com.ucsal.projetofinal.prova.ProvaRepository;
import br.com.ucsal.projetofinal.resultado.Resultado;
import br.com.ucsal.projetofinal.resultado.ResultadoRepository;
import br.com.ucsal.projetofinal.tarefa.TarefaRepository;
import br.com.ucsal.projetofinal.testcode.TestResult;
import br.com.ucsal.projetofinal.testcode.TestService;
import br.com.ucsal.projetofinal.teste.Teste;
import br.com.ucsal.projetofinal.usuario.UsuarioRepository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class RespostaService {

    private final RespostaRepository respostaRepository;
    private final UsuarioRepository usuarioRepository;
    private final TarefaRepository tarefaRepository;
    private final ResultadoRepository resultadoRepository;
    private final ItemProvaRespository itemProvaRespository;
    private final ProvaRepository provaRepository;

    public RespostaService(RespostaRepository respostaRepository, UsuarioRepository usuarioRepository, TarefaRepository tarefaRepository, ResultadoRepository resultadoRepository, ItemProvaRespository itemProvaRespository, ProvaRepository provaRepository) {
        this.respostaRepository = respostaRepository;
        this.usuarioRepository = usuarioRepository;
        this.tarefaRepository = tarefaRepository;
        this.resultadoRepository = resultadoRepository;
        this.itemProvaRespository = itemProvaRespository;
        this.provaRepository = provaRepository;
    }

    public List<Resposta> listar() {
        return respostaRepository.findAll();
    }

    public Optional<Resposta> listarPorId(Long id) {
        Optional<Resposta> resposta = respostaRepository.findById(id);
        return resposta;
    }

    public List<RespostaPorcentagemResponseDTO> listarPorIdUsuario(Long id) {
        List<RespostaPorcentagemResponseDTO> respostas = respostaRepository.findByUsuarioId(id);
        /*for (RespostaPorcentagemResponseDTO r: respostas) {
            Optional<Tarefa> tarefa = tarefaRepository.findById(r.getTarefaId());
            r.setTarefa(tarefa.get());
            //respostas.add(r);
        }*/

        return respostas;
    }

    public List<RespostaPorcentagemResponseDTO> listarPorIdTarefa(Long id) {
        List<RespostaPorcentagemResponseDTO> listaRetornada = respostaRepository.findByTarefaId(id);
        /*for (Resposta resposta : respostaRepository.findByTarefaId(id)) {
            RespostaPorcentagemResponseDTO response = new RespostaPorcentagemResponseDTO(resposta);
            Resultado resultado = resultadoRepository.findByRespostaId(resposta.getId());
            response.setPorcentagemAcerto(resultado.getPorcentagem());
            listaRetornada.add(response);
        }*/
        return listaRetornada;
    }

    public List<RespostaPorcentagemResponseDTO> listarPorIdProva(long idProva){
        List<RespostaPorcentagemResponseDTO> listaRetornada = respostaRepository.findAllByIdProva(idProva);
        return listaRetornada;
    }

    public Resposta inserir(RespostaRequestDto respostaRequestDto) {
        Resposta resposta = respostaRequestDto.toModel(usuarioRepository, tarefaRepository, itemProvaRespository);
        return respostaRepository.save(resposta);
    }

    public Resposta atualizar(Long id, Resposta resposta) {
        return respostaRepository.findById(id).map(
                response -> {
                    response.setCodigo(resposta.getCodigo());
                    Resposta novaResposta = respostaRepository.save(response);
                    return novaResposta;
                }
        ).orElse(null);
    }

    public Resultado gerarResultado(Resposta resposta) {
        List<String> nomesTestes = new ArrayList<>();
        List<String> input = new ArrayList<>();
        List<String> output = new ArrayList<>();


        for (CasoTeste teste : resposta.getTarefa().getTestes()) {
            nomesTestes.add(teste.getNomeTeste());
            input.add(teste.getEntrada());
            output.add(teste.getSaida());
        }

        TestResult testResult = new TestService().executetest(resposta.getCodigo(), resposta.getUsuario().getLogin(), "Main.java", "", input.toArray(), output.toArray(), nomesTestes.toArray());

        List<Teste> testes = new ArrayList<>();
        Double percentagem = 0.0;

        if (testResult.getCompile()) {
            testes = new ArrayList<>(testResult.getTest());
            percentagem = obterPorcentagem(testes);
        }

        Resultado resultado = new Resultado(testResult.getOutput(), testResult.getCreate(), testResult.getCompile(), percentagem, resposta, testes);
        return resultadoRepository.save(resultado);
    }

    private double obterPorcentagem(List<Teste> testes) {
        int testesCorretos = 0;

        for (Teste teste : testes) {
            if (teste.getResultadoFinal() == true) {
                testesCorretos++;
            }
        }
        double percent = ((testesCorretos * 100) / testes.size());
        return percent;
    }
}
