package br.com.ucsal.projetofinal.testcode;

import java.util.Arrays;
import java.util.Optional;

public enum ExceptionEnum {

    ARITHMETIC ("java.lang.ArithmeticException", "Você pode ter tentado realizar uma divisão por zero.\n\nTalvez o resultado de sua operação não possa ser representado como um número de ponto flutuante."),
    ARRAY_INDEX("java.lang.ArrayIndexOutOfBoundsException", "Você tentou acessar um índice menor que zero, ou maior que o tamanho total do seu vetor."),
    NULL_POINTER("java.lang.NullPointerException", "Talvez você esteja tentando acessar um índice com valor nulo na sua matriz.\n\nTentando passar parâmetros nulo para o seu método.\n\nTentou acessar um campo de uma instância cuja referência seja null.\n\nVocê pode ter tentando obter uma referência a um método de um objeto nulo."),
    STRING_INDEX_BOUND("java.lang.StringIndexOutOfBoundsException","Talvez o índice que você está tentando acessar não está no intervalo da string, ou seja, negativo ou maior que o último índice da string."),
    ILEGAL_ARGUMENT("java.lang.IllegalArgumentException", "Os argumentos passados para o seu método estão fora do intervalo.\n\nTalvez o formato do valor que está tentando passar seja inválido.\n\nVocê pode está tentando receber um objeto com valor nulo."),
    NUMBER_FORMAT("java.lang.NumberFormatException", "Uma variavel do tipo numérico está tentando receber um tipo de dado inválido.\n\nUma letra ou símbolo especial não pode ser convertido para um valor numérico\n\nValores "),
    INPUT_MISMATCH("java.util.InputMismatchException", "Talvez o tipo de dado esperado pelo Scanner seja diferente do tipo informado.\n\nTalvez você esteja digitando o separador decimal diferente do esperado pelo seu sistema. Normalmente o separador decimal é representado por uma vírgula e não um ponto."),
    NO_SUCH_ELEMENT("java.util.NoSuchElementException", "Algum método acessador(Iterator, Enumerator, Scanner ou StringTokenizer) do seu programa está esperando receber algum valor que não está sendo forcecido.\n\nSe estiver acessando um array com um Iterator, verifique se o array possui elementos para serem acessados pelo método next()\n\nSe estiver usando o Scanner para ler valores do console, verifique se o Scanner não está esperando receber valores que não são fornecidos");

    //    ILEGAL_STATE("java.lang.IllegalStateException", ""),
//    CLASS_CAST("java.lang.ClassCastException", ""),

    private final String saida;
    private final String saidaSimplificada;


    ExceptionEnum(String saida, String saidaSimplificada) {
        this.saida = saida;
        this.saidaSimplificada = saidaSimplificada;
    }

    public String getSaida() {
        return saida;
    }

    public String getSaidaSimplificada() {
        return saidaSimplificada;
    }

    public static Optional<ExceptionEnum> getSaidaSimplificadaBySaida(String value){
        final Optional<ExceptionEnum> first = Arrays.stream(ExceptionEnum.values()).filter(excep -> value.contains(excep.getSaida())).findFirst();
        return first;
    }
}
