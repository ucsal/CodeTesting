package br.com.ucsal.projetofinal.resultado;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ResultadoRepository extends JpaRepository<Resultado, Long> {

    @Query(value = "SELECT * FROM RESULTADO WHERE RESPOSTA_ID = :id", nativeQuery = true)
    Resultado findByRespostaId(Long id);
}
