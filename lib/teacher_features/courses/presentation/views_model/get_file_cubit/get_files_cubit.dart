import 'package:equatable/equatable.dart';
import 'package:field_training_app/teacher_features/courses/data/models/file_model.dart';
import 'package:field_training_app/teacher_features/courses/data/repos/chapter_files_repo/chaoter_files_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_files_state.dart';

class GetFilesCubit extends Cubit<GetFilesState> {
  GetFilesCubit(this.chapterFilesRepo) : super(GetFilesInitial());
  final ChapterFilesRepo chapterFilesRepo;
  void getFiles({required int chapterId}) async {
    emit(GetFileLoading());
    final result = await chapterFilesRepo.getFiles(chapterId: chapterId);
    result.fold((failure) {
      emit(GetFilesFailure(failure.toString()));
    }, (filelist) {
      emit(GetFilesSuccess(filelist));
    });
  }
}
