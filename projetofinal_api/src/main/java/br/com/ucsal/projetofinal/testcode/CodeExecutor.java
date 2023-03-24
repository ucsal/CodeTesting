package br.com.ucsal.projetofinal.testcode;

import br.com.ucsal.projetofinal.teste.Teste;
import lombok.Builder;
import lombok.Getter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.io.*;
import java.util.*;

@Getter
@Builder
public class CodeExecutor {

    private String codigo;

    private String folder;

    private String filename;

    private String compileCommand;

    private String executeCommand;

    private Object[] inputs;

    private Object[] output;

    private Object[] nomesTestes;

    private String saidaCodigoExecutado;

    @Builder.Default
    private List<String> details = new ArrayList<>();

    public TestResult runTests() {
        TestResult result = new TestResult();
        File file;
        try {
            file = create();
            result.setCreate(true);
        } catch (IOException e) {
            e.printStackTrace();
            result.setException(e);
            result.setCreate(false);

            return result;
        }

        String exit;
        try {
            exit = compile(file);
            if (exit.length() != 0) {
                result.setOutput(exit);
                result.setCompile(false);
                return result;
            } else {
                result.setCompile(true);
            }
        } catch (IOException e) {
            result.setException(e);
            result.setCompile(false);
            return result;
        }

        if (inputs == null || inputs.length == 0) {
            inputs = new String[]{""};
        }

        if (output == null || output.length == 0) {
            output = new String[]{""};
        }

        for (int i = 0; i < output.length; i++) {
            Teste test = runTest(inputs[i].toString(), output[i].toString(), nomesTestes[i].toString(),file);

            result.getTest().add(test);
        }
        result.setOutput("Compilou!");

        return result;

    }

    public Teste runTest(String input, String output, String nomeTeste, File file) {
        Teste test = new Teste();

        try {
            boolean isOK = execute(file, input, output);
            test.setExecute(true);
            test.setResultadoFinal(isOK);
            test.setNome(nomeTeste);
            test.setEntrada(input);
            test.setSaidaEsperada(output);
            test.setSaidaObtida(saidaCodigoExecutado);
        } catch (IOException e) {
            test.setException(e.toString());
            test.setExecute(false);
            return test;
        }
        if(!test.getResultadoFinal()){
            test.setExceptionSimplificada(gerarMensagem(test));
        }
        return test;
    }

    private String gerarMensagem(Teste test){
        //    \(Main\.java:([^(\)]*?)\)
        String msg = "";
        String saidaObtida = test.getSaidaObtida();
        boolean isExcept = isException(saidaObtida);
        test.setRuntimeException(isExcept);
        if(isExcept){
            Optional<ExceptionEnum> exceptionEnum = ExceptionEnum.getSaidaSimplificadaBySaida(saidaObtida);

            if(exceptionEnum.isPresent())
                msg += exceptionEnum.get().getSaidaSimplificada();
            else
                msg += "Esta exception ainda não foi mapeada pelo sistema.";

            String rgx = "\\(Main\\.java:([^()]*?)\\)";
            Pattern p = Pattern.compile(rgx);
            Matcher m = p.matcher(saidaObtida);
            List<String> allMatches = new ArrayList<>();

            while (m.find()) {
                allMatches.add(m.group(1));
            }
            msg += "\n\nTente verificar a(s) linha(s): "+ allMatches.toString().replaceAll("[\\[\\]]", "");
        }
        return msg;
    }

    private File create() throws IOException {
        //Cria arquivo
        if (filename == null || filename.isBlank()) {
            filename = "Main.java";
        }
        File directory = new File("usuarios/"+folder);
        if (!directory.exists()) {
            directory.mkdirs();
        }
        File file = new File(directory.getAbsolutePath() + "/" + filename);
        //Adiciona o codigo ao arquivo
        FileWriter fileWritter = new FileWriter(file.getAbsolutePath(), false);
        BufferedWriter bufferWritter = new BufferedWriter(fileWritter);
        bufferWritter.write(codigo);
        bufferWritter.flush();

        return file;
    }

    private String compile(File file) throws IOException {
        var sb = new StringBuilder();
        var builder = new ProcessBuilder(compileCommand, file.getName());
        builder.directory(file.getParentFile());
        Process process;
        process = builder.start();
        var reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
        var error = new BufferedReader(new InputStreamReader(process.getErrorStream()));
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line).append("\n");
        }
        while ((line = error.readLine()) != null) {
            sb.append(line + "\n");
        }
        return sb.toString();
    }

    private boolean execute(File file, String input, String output) throws IOException {
        if (input == null || input.isBlank()) {
            input = "";
        }
        if (output == null || output.isBlank()) {
            output = "";
        }
        String classfile = file.getName().substring(0, file.getName().lastIndexOf("."));
        var builder = new ProcessBuilder(executeCommand, classfile);
        builder.directory(file.getParentFile());
        builder.redirectErrorStream(true);
        Process process;
        process = builder.start();
        var stdin = process.getOutputStream();
        var stdout = process.getInputStream();
        var writer = new BufferedWriter(new OutputStreamWriter(stdin));
        var isFirstLine = true;
        var st = new StringTokenizer(input, "\n");

        while (st.hasMoreTokens()) {
            String line = st.nextToken();
            if (isFirstLine) {
                writer.write(line);
                isFirstLine = false;
            } else {
                writer.write("\n" + line);
            }
        }

        writer.flush();
        writer.close();

        var scanner = new Scanner(stdout);
        var respostaDOCODIGO = new StringBuilder();
        isFirstLine = true;
        while (scanner.hasNextLine()) {
            if (isFirstLine) {
                respostaDOCODIGO.append(scanner.nextLine());
                isFirstLine = false;
            } else {
                respostaDOCODIGO.append("\n").append(scanner.nextLine());
            }
        }

        scanner.close();
        saidaCodigoExecutado = respostaDOCODIGO.toString();
        details.add(output);

        if (output == null || output.isEmpty()) {
            return true;
        }

        return respostaDOCODIGO.toString().equals(output);
    }

    public static boolean isException(String value){
        return value.contains("Exception in thread \"main\"");
    }
}
