import 'dart:async';

class ControlContador {
//Creamos. <int>=> El tipo de vaor que pasara
final _streamControl = StreamController<int>();

int _contador = 0;

//Accedemos al tunel
Sink<int> get sink => _streamControl.sink;
//Accedemos a lo que sale del tunel
Stream<int> get stream => _streamControl.stream;

void increment() {
  //agregalos el valor al tunel
  sink.add(++_contador);
}
//cerramos
dispose() => _streamControl.close();
}