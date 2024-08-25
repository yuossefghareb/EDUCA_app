import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:field_training_app/teacher_features/courses/data/repos/chapter_files_repo/chaoter_files_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'upload_file_state.dart';

class UploadFileCubit extends Cubit<UploadFileState> {
  UploadFileCubit(this.chapterFilesRepo) : super(UploadFileInitial());
  final ChapterFilesRepo chapterFilesRepo;

  uploadFile({required int chapterId, required File file}) async {
    emit(UploadFileLoading());
    var result =
        await chapterFilesRepo.uploadFile(chapterId: chapterId, file: file);
    result.fold((failure) {
      emit(UploadFileFailure(message: failure.errMessage));
    }, (s) {
      emit(UploadFileSuccess());
    });
  }
}
