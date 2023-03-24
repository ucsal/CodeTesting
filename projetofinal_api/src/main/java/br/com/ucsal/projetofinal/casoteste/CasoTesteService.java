package br.com.ucsal.projetofinal.casoteste;

import br.com.ucsal.projetofinal.tarefa.TarefaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class CasoTesteService {

    private final CasoTesteRepository casoTesteRepository;

    private final TarefaRepository tarefaRepository;

    public CasoTesteService(CasoTesteRepository casoTesteRepository, TarefaRepository tarefaRepository) {
        this.casoTesteRepository = casoTesteRepository;
        this.tarefaRepository = tarefaRepository;
    }

    public List<CasoTeste> listar() {
        return casoTesteRepository.findAll();
    }

    public Optional<CasoTeste> listarPorId(Long id) {
        return casoTesteRepository.findById(id);
    }

    public List<CasoTeste> listarPorTarefa(Long id) {
        return casoTesteRepository.findByTarefaId(id);
    }

    public CasoTeste inserir(CasoTesteRequestDto casoTesteRequestDto) {
        CasoTeste casoTeste = casoTesteRequestDto.toModel(tarefaRepository);
        return casoTesteRepository.save(casoTeste);
    }

    public CasoTeste atualizar(Long id, CasoTeste casoTeste){
        return casoTesteRepository.findById(id).map(
                caso -> {
                    caso.setNomeTeste(casoTeste.getNomeTeste());
                    caso.setEntrada(casoTeste.getEntrada());
                    caso.setSaida(casoTeste.getSaida());
                    caso.setComparacao(casoTeste.getComparacao());
                    CasoTeste casoTesteAtualizado = casoTesteRepository.save(caso);
                    return casoTesteAtualizado;
                }).orElse(null);
    }
}
