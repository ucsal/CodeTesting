package br.com.ucsal.projetofinal.itemProva;

import br.com.ucsal.projetofinal.tarefa.Tarefa;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ItemProvaRespository extends JpaRepository<ItemProva, Long> {
    List<ItemProva> findByProvaId(Long idProva);
}
