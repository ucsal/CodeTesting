package br.com.ucsal.projetofinal.casoteste;

import br.com.ucsal.projetofinal.casoteste.CasoTeste;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CasoTesteRepository extends JpaRepository<CasoTeste, Long> {

    @Query(value = "SELECT * FROM CASO_TESTE WHERE TAREFA_ID = :id AND FLAG_EXIBIR = TRUE ", nativeQuery = true)
    List<CasoTeste> findByTarefaId(Long id);

}
