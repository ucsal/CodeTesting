// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Projeto Final`
  String get textProjectName {
    return Intl.message(
      'Projeto Final',
      name: 'textProjectName',
      desc: '',
      args: [],
    );
  }

  /// `Algo deu errado!`
  String get errorSomethingWentWrong {
    return Intl.message(
      'Algo deu errado!',
      name: 'errorSomethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Tente novamente em alguns instantes.`
  String get errorTryAgain {
    return Intl.message(
      'Tente novamente em alguns instantes.',
      name: 'errorTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get textOk {
    return Intl.message(
      'Ok',
      name: 'textOk',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get textLogin {
    return Intl.message(
      'Login',
      name: 'textLogin',
      desc: '',
      args: [],
    );
  }

  /// `Usuário`
  String get textUser {
    return Intl.message(
      'Usuário',
      name: 'textUser',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get textPassword {
    return Intl.message(
      'Password',
      name: 'textPassword',
      desc: '',
      args: [],
    );
  }

  /// `Registrar`
  String get textRegister {
    return Intl.message(
      'Registrar',
      name: 'textRegister',
      desc: '',
      args: [],
    );
  }

  /// `Não tem uma conta?`
  String get textDoYouHaveAccount {
    return Intl.message(
      'Não tem uma conta?',
      name: 'textDoYouHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get textHome {
    return Intl.message(
      'Home',
      name: 'textHome',
      desc: '',
      args: [],
    );
  }

  /// `Perfil`
  String get textProfile {
    return Intl.message(
      'Perfil',
      name: 'textProfile',
      desc: '',
      args: [],
    );
  }

  /// `Ranking`
  String get textRanking {
    return Intl.message(
      'Ranking',
      name: 'textRanking',
      desc: '',
      args: [],
    );
  }

  /// `Tarefas`
  String get textTasks {
    return Intl.message(
      'Tarefas',
      name: 'textTasks',
      desc: '',
      args: [],
    );
  }

  /// `Provas`
  String get textTests {
    return Intl.message(
      'Provas',
      name: 'textTests',
      desc: '',
      args: [],
    );
  }

  /// `Submissões`
  String get textSubimission {
    return Intl.message(
      'Submissões',
      name: 'textSubimission',
      desc: '',
      args: [],
    );
  }

  /// `Sair`
  String get textLogout {
    return Intl.message(
      'Sair',
      name: 'textLogout',
      desc: '',
      args: [],
    );
  }

  /// `Nome`
  String get textName {
    return Intl.message(
      'Nome',
      name: 'textName',
      desc: '',
      args: [],
    );
  }

  /// `Usuário registrado com sucesso!`
  String get textUserRegiteredSuccess {
    return Intl.message(
      'Usuário registrado com sucesso!',
      name: 'textUserRegiteredSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Ir para o login`
  String get textGoToLogin {
    return Intl.message(
      'Ir para o login',
      name: 'textGoToLogin',
      desc: '',
      args: [],
    );
  }

  /// `Título`
  String get textTitle {
    return Intl.message(
      'Título',
      name: 'textTitle',
      desc: '',
      args: [],
    );
  }

  /// `Descrição`
  String get textDescription {
    return Intl.message(
      'Descrição',
      name: 'textDescription',
      desc: '',
      args: [],
    );
  }

  /// `Respostas`
  String get textAnswers {
    return Intl.message(
      'Respostas',
      name: 'textAnswers',
      desc: '',
      args: [],
    );
  }

  /// `Resposta`
  String get textAnswer {
    return Intl.message(
      'Resposta',
      name: 'textAnswer',
      desc: '',
      args: [],
    );
  }

  /// `Minhas Respostas`
  String get textMyAnswers {
    return Intl.message(
      'Minhas Respostas',
      name: 'textMyAnswers',
      desc: '',
      args: [],
    );
  }

  /// `Nenhuma resposta encontrada`
  String get textNoAnswersFound {
    return Intl.message(
      'Nenhuma resposta encontrada',
      name: 'textNoAnswersFound',
      desc: '',
      args: [],
    );
  }

  /// `Resultado`
  String get textResult {
    return Intl.message(
      'Resultado',
      name: 'textResult',
      desc: '',
      args: [],
    );
  }

  /// `Teste`
  String get textTest {
    return Intl.message(
      'Teste',
      name: 'textTest',
      desc: '',
      args: [],
    );
  }

  /// `Casos de Teste`
  String get textPossibleTests {
    return Intl.message(
      'Casos de Teste',
      name: 'textPossibleTests',
      desc: '',
      args: [],
    );
  }

  /// `Entrada`
  String get textInput {
    return Intl.message(
      'Entrada',
      name: 'textInput',
      desc: '',
      args: [],
    );
  }

  /// `Saída`
  String get textOutput {
    return Intl.message(
      'Saída',
      name: 'textOutput',
      desc: '',
      args: [],
    );
  }

  /// `Saída Obtida`
  String get textOutputObtained {
    return Intl.message(
      'Saída Obtida',
      name: 'textOutputObtained',
      desc: '',
      args: [],
    );
  }

  /// `Saída Esperada`
  String get textOutputExpected {
    return Intl.message(
      'Saída Esperada',
      name: 'textOutputExpected',
      desc: '',
      args: [],
    );
  }

  /// `Mostrar mais`
  String get textShowMore {
    return Intl.message(
      'Mostrar mais',
      name: 'textShowMore',
      desc: '',
      args: [],
    );
  }

  /// `Mostrar menos`
  String get textShowLess {
    return Intl.message(
      'Mostrar menos',
      name: 'textShowLess',
      desc: '',
      args: [],
    );
  }

  /// `Data de Inicio`
  String get textStartDate {
    return Intl.message(
      'Data de Inicio',
      name: 'textStartDate',
      desc: '',
      args: [],
    );
  }

  /// `Data de Entrega`
  String get textFinalDate {
    return Intl.message(
      'Data de Entrega',
      name: 'textFinalDate',
      desc: '',
      args: [],
    );
  }

  /// `Prazo`
  String get textDeadline {
    return Intl.message(
      'Prazo',
      name: 'textDeadline',
      desc: '',
      args: [],
    );
  }

  /// `às`
  String get textAt {
    return Intl.message(
      'às',
      name: 'textAt',
      desc: '',
      args: [],
    );
  }

  /// `Enviar`
  String get textSubmit {
    return Intl.message(
      'Enviar',
      name: 'textSubmit',
      desc: '',
      args: [],
    );
  }

  /// `Resposta Enviada`
  String get textSubmited {
    return Intl.message(
      'Resposta Enviada',
      name: 'textSubmited',
      desc: '',
      args: [],
    );
  }

  /// `Resposta enviada com sucesso!`
  String get textSubmitedWithSuccess {
    return Intl.message(
      'Resposta enviada com sucesso!',
      name: 'textSubmitedWithSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get textEmail {
    return Intl.message(
      'Email',
      name: 'textEmail',
      desc: '',
      args: [],
    );
  }

  /// `Sucesso`
  String get textSuccess {
    return Intl.message(
      'Sucesso',
      name: 'textSuccess',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'pt'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
