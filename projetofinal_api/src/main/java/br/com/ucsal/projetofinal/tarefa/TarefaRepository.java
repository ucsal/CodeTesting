package br.com.ucsal.projetofinal.tarefa;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface TarefaRepository extends JpaRepository<Tarefa, Long> {
    @Query("SELECT t FROM Tarefa t WHERE t.id =:id")
    Optional<Tarefa> buscarTarefa(Long id);

    List<Tarefa> findAllByVisibilidadeEquals(Integer visibilidade);

    @Query("SELECT t FROM Tarefa t WHERE t.visibilidade = 2 AND t.usuario.id= :idUsuario")
    List<Tarefa> findPrivadas(Long idUsuario);

    @Query("SELECT t FROM Tarefa t WHERE t.visibilidade = 0 or t.visibilidade = 1 or t.visibilidade = 2 and t.usuario.id = :idUsuario")
    List<Tarefa> findPublicasProtegidasPrivadas(Long idUsuario);

    @Query("SELECT t FROM Tarefa t inner join ItemProva ip on ip.tarefa.id = t.id  where ip.prova.id = :idProva")
    List<Tarefa> findByProva(Long idProva);
}
