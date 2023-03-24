package br.com.ucsal.projetofinal.testcode;

import lombok.extern.java.Log;
import org.springframework.stereotype.Service;

@Log
@Service
public class TestService {

    public TestResult executetest(String codigo, String userLogin, String filename, String folder, Object[] inputs, Object[] outputs, Object[] nomesTestes) {

        CodeExecutor codeExecutor = CodeExecutor.builder().codigo(codigo).
                compileCommand("javac").
                executeCommand("java").
                filename(filename).
                folder(userLogin)
                .inputs(inputs)
                .output(outputs)
                .nomesTestes(nomesTestes)
                .build();

        return codeExecutor.runTests();
    }
}
