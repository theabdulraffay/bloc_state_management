part of 'switch_example_bloc.dart';

abstract class SwitchExampleEvent extends Equatable {
  const SwitchExampleEvent();

  @override
  List<Object> get props => [];
}

class EnableNotification extends SwitchExampleEvent {
  final bool val;
  const EnableNotification({required this.val});
}

class SliderEvent extends SwitchExampleEvent {
  final double sliderVal;
  const SliderEvent({required this.sliderVal});
}
