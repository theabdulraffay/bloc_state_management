import 'package:bloc_state_management/ImagePicker/bloc/image_picker_bloc.dart';
import 'package:bloc_state_management/Multi%20Bloc/bloc/switch_example_bloc.dart';
// import 'package:bloc_state_management/UI/counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Counter/Bloc/counter_bloc.dart';
import 'ImagePicker/Screens/image_picker_screen.dart';
import 'ImagePicker/utils/image_picker_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SwitchExampleBloc()),
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const MultiBlocScreen(),
        home: const ImagePickerScreen(),
      ),
    );
  }
}
