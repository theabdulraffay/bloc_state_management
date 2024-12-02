import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_events.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvents, CounterState> {
  CounterBloc()
      : super(
          const CounterState(),
        ) {
    on<IncrementCounter>(_increment);
    on<DecrementCounter>(_decrement);
    on<ConvertZero>(_convertZero);
  }

  void _increment(IncrementCounter event, Emitter<CounterState> emit) {
    emit(
      state.copyWith(
        counter: state.counter + 1,
      ),
    );
  }

  void _decrement(DecrementCounter event, Emitter<CounterState> emit) {
    emit(
      state.copyWith(
        counter: state.counter - 1,
      ),
    );
  }

  void _convertZero(ConvertZero event, Emitter<CounterState> emit) {
    emit(
      state.copyWith(
        counter: 0,
      ),
    );
  }
}
