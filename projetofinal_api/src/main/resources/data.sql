INSERT INTO usuario(data_criacao, data_ultimo_acesso, flag_ativo, login, email, nome, senha)
values ('2021-12-20 18:47:52', '2021-12-21 18:47:52', true, 'ester','ester@ucsal.edu.br', 'Ester', '$2a$10$Le.iEd4ISlBGn65MJuSeMuLfwlcES6zMfHKBnm07xWKfTAv1S/sw6'),
       ('2021-12-20 18:47:52', '2021-12-21 18:47:52', true, 'yla','yla@ucsal.edu.br', 'Yla Buri', '$2a$10$76rLhrHoVlJNxT9lvmV3LuqBwVYrAtJ3akT1ahV3viS7cSo42Tpq.'),
       ('2021-12-20 18:47:52', '2021-12-21 18:47:52', true, 'joaldo','joaldo@ucsal.edu.br', 'Joaldo Tavares', '$2a$10$76rLhrHoVlJNxT9lvmV3LuqBwVYrAtJ3akT1ahV3viS7cSo42Tpq.');

INSERT INTO perfil(nome)
values('Admin'),
('Aluno'),
('Professor');

INSERT INTO tarefa(descricao, status, visibilidade, titulo, usuario_id)
values
       ('Digite numeros separados por espaço que a soma seja 10', 0, 0, 'Até 10', 3),
       ('Mostre a divisão entre dois numeros', 0, 0, 'Divisão', 3),
       ('Mostre o inverso da palavra', 0, 0, 'Inverso', 3);

INSERT INTO caso_teste(comparacao, entrada, flag_exibir, nome_teste, saida, tarefa_id)
values
       (1, '1 2 3 4', true, 'Até 10', '10', 1),
       (2, '5 5', false, 'Até 10', '10', 1),
       (2, '7 1 1 1', true, 'Até 10', '10', 1),
       (1, '4 2', true, 'Teste 1', '2', 2),
       (1, '10 0', true, 'Divisão por 0', 'undefined', 2),
       (1, '8 2', true, 'Teste 2', '4', 2),
       (1, 'oi', true, 'Teste 1', 'io', 3),
       (1, 'casa', true, 'Teste 2', 'asac', 3),
       (1, 'papel', false, 'Teste 3', 'lepap', 3),
       (1, 'tomada', false, 'Teste 4', 'adamot', 3);

INSERT INTO USUARIO_PERFIL(USUARIO_ID, PERFIL_ID)
values (1, 1),(2, 2),(3, 3);

INSERT INTO PROVA(DATA_INICIAL, DATA_FINAL, NOME, USUARIO_ID)
values ('2022-11-14 07:00:00', '2022-11-29 23:59:59', 'Prova final', 3),
       ('2022-11-01 07:00:00', '2022-12-12 23:59:59', 'Prova final 2', 3);

INSERT INTO ITEM_PROVA(ORDEM, PROVA_ID, TAREFA_ID)
values (1, 1, 1),
        (2, 1, 2),
       (1, 2, 2),
       (2, 2, 3);


