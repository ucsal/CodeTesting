package br.com.ucsal.projetofinal.prova;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.time.Instant;
import java.time.LocalDateTime;
import java.util.List;

public interface ProvaRepository extends JpaRepository<Prova, Long> {

    @Query(value = "SELECT * FROM PROVA JOIN PROVA_TAREFAS WHERE PROVA_ID = :id", nativeQuery = true)
    List<Prova> listarPorIdProva(Long id);

    @Query(value = "SELECT p FROM Prova p WHERE :dataAtual BETWEEN p.dataInicial and p.dataFinal")
    List<Prova> findByData(LocalDateTime dataAtual);

}
