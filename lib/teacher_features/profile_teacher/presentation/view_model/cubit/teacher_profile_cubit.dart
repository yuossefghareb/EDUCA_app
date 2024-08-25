import 'package:equatable/equatable.dart';
import 'package:field_training_app/Core/api_services/end_points.dart';
import 'package:field_training_app/cache/cache_helper.dart';

import 'package:field_training_app/teacher_features/profile_teacher/data/models/teacher_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../data/repos/teacher_repo/teacher_profile_repo.dart';
part 'teacher_profile_state.dart';

class TeacherProfileCubit extends Cubit<TeacherProfileState> {
  TeacherProfileCubit(this.teacherProfileRepo) : super(TeacherProfileInitial());
  final TeacherProfileRepo teacherProfileRepo;

  Future<void> getTeacherData() async {
    emit(TeacherProfileLoading());
    var result = await teacherProfileRepo.getTeacherData(
      endPoint: EndPoint.getTeacherById(
        CacheHelper.getData(key: ApiKey.id),
      ),
    );
    result.fold((failure) {
      emit(TeacherProfileFailure(errMessage: failure.errMessage));
    }, (teacherModel) {
      emit(TeacherProfileSuccess(teacherModel: teacherModel));
    });
  }

  Future<void> updateTeacherData({
    String? firstName,
    String? lastName,
    String? password,
    String? phone,
    String? address,
    String? governorate,
    XFile? image,
  }) async {
    emit(TeacherProfileUpdateLoading());
    var result = await teacherProfileRepo.updateTeacherData(
      endPoint: EndPoint.getTeacherById(CacheHelper.getData(key: ApiKey.id)),
      firstName: firstName,
      lastName: lastName,
      password: password,
      phone: phone,
      address: address,
      governorate: governorate,
      image: image,
    );
    result.fold((failure) {
      emit(TeacherProfileUpdateFailure(errMessage: failure.errMessage));
    }, (success) {
      emit(TeacherProfileUpdateSuccess());
    });
  }
}
