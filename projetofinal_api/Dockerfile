FROM openjdk:17


ARG JAR_FILE=target/*.jar

COPY ${JAR_FILE} projetoFinal.jar

ENTRYPOINT ["java" ,"-jar","/projetoFinal.jar"]