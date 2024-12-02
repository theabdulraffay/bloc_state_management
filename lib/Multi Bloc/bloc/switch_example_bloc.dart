import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'switch_example_event.dart';
part 'switch_example_state.dart';

class SwitchExampleBloc extends Bloc<SwitchExampleEvent, SwitchExampleState> {
  SwitchExampleBloc()
      : super(
          const SwitchExampleState(),
        ) {
    on<EnableNotification>(_changenotification);
    on<SliderEvent>(_changeSlider);
  }

  void _changenotification(
      EnableNotification event, Emitter<SwitchExampleState> emit) {
    emit(
      state.copyWith(
        isSwitch: event.val,
      ),
    );
  }

  void _changeSlider(SliderEvent event, Emitter<SwitchExampleState> emit) {
    emit(
      state.copyWith(
        sl: event.sliderVal,
      ),
    );
  }
}
