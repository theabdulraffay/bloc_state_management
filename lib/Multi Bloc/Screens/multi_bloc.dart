import 'package:bloc_state_management/Multi%20Bloc/bloc/switch_example_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultiBlocScreen extends StatefulWidget {
  const MultiBlocScreen({super.key});

  @override
  State<MultiBlocScreen> createState() => _MultiBlocScreenState();
}

class _MultiBlocScreenState extends State<MultiBlocScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Multi Bloc Example',
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<SwitchExampleBloc, SwitchExampleState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Notification',
                    ),
                    Switch(
                      value: state.value,
                      onChanged: (val) {
                        context.read<SwitchExampleBloc>().add(
                              EnableNotification(val: val),
                            );
                      },
                    ),
                  ],
                ),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(state.slider),
                  ),
                ),
                Slider(
                  value: state.slider,
                  onChanged: (val) {
                    context.read<SwitchExampleBloc>().add(
                          SliderEvent(
                            sliderVal: val,
                          ),
                        );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
