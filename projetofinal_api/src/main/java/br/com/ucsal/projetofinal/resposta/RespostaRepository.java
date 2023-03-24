package br.com.ucsal.projetofinal.resposta;

import br.com.ucsal.projetofinal.prova.Prova;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import br.com.ucsal.projetofinal.resposta.RespostaPorcentagemResponseDTO;
import java.util.List;

public interface RespostaRepository extends JpaRepository<Resposta, Long> {

//    @Query(value = "SELECT r.id, R.codigo, R.DATA_ENVIO , R.USUARIO_ID , R.TAREFA_ID , RESULTADO.PORCENTAGEM   FROM Resposta R INNER JOIN resultado ON r.ID  = RESULTADO.RESPOSTA_ID  WHERE USUARIO_ID = :id", nativeQuery = true)
//    List<RespostaPorcentagemResponseDTO> findByUsuarioId(Long id);

    @Query(value = "SELECT NEW br.com.ucsal.projetofinal.resposta.RespostaPorcentagemResponseDTO(r.id, r.codigo, r.dataEnvio , r.tarefa , re.porcentagem) FROM Resposta r INNER JOIN Resultado re ON r.id  = re.resposta.id  WHERE r.usuario.id = :id")
    List<RespostaPorcentagemResponseDTO> findByUsuarioId(Long id);

    @Query(value = "SELECT NEW br.com.ucsal.projetofinal.resposta.RespostaPorcentagemResponseDTO(r.id,  r.codigo, r.dataEnvio ,r.usuario, r.tarefa , re.porcentagem) FROM Resposta r INNER JOIN Resultado re ON r.id  = re.resposta.id  WHERE r.tarefa.id = :id")
    List<RespostaPorcentagemResponseDTO> findByTarefaId(Long id);

    @Query(value = "SELECT NEW br.com.ucsal.projetofinal.resposta.RespostaPorcentagemResponseDTO(r.id,  r.codigo, r.dataEnvio ,r.usuario, r.tarefa , re.porcentagem) FROM Resposta r " +
            "INNER JOIN Resultado re ON r.id  = re.resposta.id " +
            "inner join ItemProva ip on r.id = ip.id  WHERE ip.prova.id = :idProva")
    List<RespostaPorcentagemResponseDTO> findAllByIdProva(long idProva);

}
