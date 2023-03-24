package br.com.ucsal.projetofinal.prova;

import br.com.ucsal.projetofinal.itemProva.ItemProva;
import br.com.ucsal.projetofinal.itemProva.ItemProvaRespository;
import br.com.ucsal.projetofinal.tarefa.TarefaRepository;
import br.com.ucsal.projetofinal.usuario.UsuarioRepository;
import org.springframework.stereotype.Service;

import java.time.Instant;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
public class ProvaService {

    private final ProvaRepository provaRepository;

    private final TarefaRepository tarefaRepository;

    private final UsuarioRepository usuarioRepository;

    private final ItemProvaRespository itemProvaRespository;

    public ProvaService(ProvaRepository provaRepository, TarefaRepository tarefaRepository, UsuarioRepository usuarioRepository, ItemProvaRespository itemProvaRespository) {
        this.provaRepository = provaRepository;
        this.tarefaRepository = tarefaRepository;
        this.usuarioRepository = usuarioRepository;
        this.itemProvaRespository = itemProvaRespository;
    }

    public List<Prova> listar() {
        return provaRepository.findAll();
    }

    public Optional<Prova> listarPorId(Long id) {
        return provaRepository.findById(id);
    }

    public List<Prova> listarPorIdProva(Long id) {
        return provaRepository.listarPorIdProva(id);
    }

    public List<Prova> listarPorData() {
        LocalDateTime dataAtual = LocalDateTime.now();
        return provaRepository.findByData(dataAtual);
    }

    public List<ItemProva> listaPorIdProva(Long idProva) {
        return itemProvaRespository.findByProvaId(idProva);
    }

    public Prova inserir(ProvaRequestDto provaRequestDto) {
        Prova prova = provaRequestDto.toModel(tarefaRepository, usuarioRepository);
        return provaRepository.save(prova);
    }


}
