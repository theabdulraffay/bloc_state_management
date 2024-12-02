import 'package:equatable/equatable.dart';

abstract class CounterEvents extends Equatable {
  @override
  List<Object> get props => [];

  const CounterEvents();
}

class IncrementCounter extends CounterEvents {}

class DecrementCounter extends CounterEvents {}

class ConvertZero extends CounterEvents {}
