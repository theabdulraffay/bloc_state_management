part of 'image_picker_bloc.dart';

class ImagePickerState extends Equatable {
  final XFile? file;
  const ImagePickerState({this.file});

  ImagePickerState copyWith({XFile? file}) {
    return ImagePickerState(
      file: file ?? file,
    );
  }

  @override
  List<Object> get props => [];
}
