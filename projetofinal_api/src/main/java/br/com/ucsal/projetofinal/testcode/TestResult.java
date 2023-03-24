package br.com.ucsal.projetofinal.testcode;

import br.com.ucsal.projetofinal.teste.Teste;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class TestResult {

    private String output;
    private Exception exception;
    private Boolean create;
    private Boolean compile;
    private List<Teste> test = new ArrayList<>();

}
