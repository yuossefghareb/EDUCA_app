import 'package:equatable/equatable.dart';
import 'package:field_training_app/teacher_features/courses/data/models/chapter_model.dart';

import 'package:field_training_app/teacher_features/courses/data/repos/chapter_files_repo/chapter_files_repo_implement.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_chapter_state.dart';

class AddChapterCubit extends Cubit<AddChapterState> {
  AddChapterCubit(this.chapterFilesRepo) : super(AddChapterInitial());
  final ChapterFilesRepoImplement chapterFilesRepo;
  addChapter({
    required String name,
    required int subjectId,
  }) async {
    emit(AddChapterLoading());
    var result =
        await chapterFilesRepo.addChapter(name: name, subjectId: subjectId);
    result.fold((failure) {
      emit(AddChapterFailure(message: failure.errMessage));
    }, (chapterModel) {
      emit(AddChapterSuccess(chapterModel: chapterModel));
    });
  }
}
