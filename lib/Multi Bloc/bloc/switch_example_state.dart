part of 'switch_example_bloc.dart';

class SwitchExampleState extends Equatable {
  final bool value;
  final double slider;

  const SwitchExampleState({
    this.value = false,
    this.slider = 0,
  });

  @override
  List<Object> get props => [value, slider];

  SwitchExampleState copyWith({bool? isSwitch, double? sl}) {
    return SwitchExampleState(
      value: isSwitch ?? value,
      slider: sl ?? slider,
    );
  }
}
