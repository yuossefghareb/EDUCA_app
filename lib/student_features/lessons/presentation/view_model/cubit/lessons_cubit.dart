import 'package:equatable/equatable.dart';
import 'package:field_training_app/student_features/lessons/data/models/lesson_item_model.dart';
import 'package:field_training_app/student_features/lessons/data/repo/lessons_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/lessons_model.dart';

part 'lessons_state.dart';

class LessonsCubit extends Cubit<LessonsState> {
  LessonsCubit(this.lessonsRepo) : super(LessonsInitial());
  final LessonsRepo lessonsRepo;

  Future<void> getLessons({required int subjectID}) async {
    emit(LessonsLoading());
    var result = await lessonsRepo.getLessons(subjectID: subjectID);
    result.fold((failure) {
      emit(LessonsFailure(errMessage: failure.errMessage));
    }, (lessons) {
      emit(LessonsSuccess(lessons: lessons));
    });
  }

  Future<void> getLessonItems({required int lessonID}) async {
    emit(LessonItemsLoading());
    var result = await lessonsRepo.getLessonsItems(lessonID: lessonID);
    result.fold((failure) {
      emit(LessonItemsFailure(errMessage: failure.errMessage));
    }, (lessonItems) {
      emit(LessonItemsSuccess(lessonItems: lessonItems));
    });
  }
}
