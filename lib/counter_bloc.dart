import 'dart:async';

class CounterBloc {
  // Variavel Privada sendo assim tendo acesso apenas a entrada e saida de dados
  final _stateStreamController = StreamController<int>();

  // Entrada de Dados = Sink
  StreamSink<int> get counterSink => _stateStreamController.sink;
  // Saida de Dados = stream
  Stream<int> get counterStream => _stateStreamController.stream;
}
