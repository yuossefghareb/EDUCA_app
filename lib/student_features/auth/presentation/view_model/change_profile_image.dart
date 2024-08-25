import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ChangeRegisterImageCubit extends Cubit<XFile?> {
  ChangeRegisterImageCubit() : super(null);

  void changeImage(XFile? image) {
    emit(image!);
  }
}
