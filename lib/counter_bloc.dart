import 'dart:async';

// Definindo eventos que são recebidos em sink e passados para stream
enum CounterAction { increment, decrement, reset }

class CounterBloc {
  late int counter;

  // Variavel Privada sendo assim tendo acesso apenas a entrada e saida de dados
  final _stateStreamController = StreamController<int>();

  // Entrada de Dados = Sink
  StreamSink<int> get counterSink => _stateStreamController.sink;
  // Saida de Dados = stream
  Stream<int> get counterStream => _stateStreamController.stream;

  // Variavel Privada sendo assim tendo acesso apenas a entrada e saida de dados
  final _eventStreamController = StreamController<CounterAction>();
  // Recebendo enum de possiveis eventos

  // Entrada do Evento = Sink
  StreamSink<CounterAction> get eventSink => _eventStreamController.sink;
  // Saida do Evento = stream
  Stream<CounterAction> get eventStream => _eventStreamController.stream;

  CounterBloc() {
    counter = 0;
    eventStream.listen((event) {
      if (event == CounterAction.increment) {
        counter++;
      } else if (event == CounterAction.decrement) {
        counter--;
      } else if (event == CounterAction.reset) {
        counter = 0;
      }

      counterSink.add(counter);
    });
  }
}
