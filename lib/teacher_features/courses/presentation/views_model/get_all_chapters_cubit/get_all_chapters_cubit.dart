import 'package:equatable/equatable.dart';
import 'package:field_training_app/teacher_features/courses/data/models/chapter_model.dart';
import 'package:field_training_app/teacher_features/courses/data/repos/chapter_files_repo/chapter_files_repo_implement.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_all_chapters_state.dart';

class GetAllChaptersCubit extends Cubit<GetAllChaptersState> {
  GetAllChaptersCubit(this.chapterFilesRepo) : super(GetAllChaptersInitial());

  ChapterFilesRepoImplement chapterFilesRepo;

  List<String> chapterNames = [];
  Map<String, int> chapterIndx = {};
  List<ChapterModel> chapterList = [];

  void getChapters({required int subjectId}) async {
    emit(GetAllChaptersLoading());
    final result = await chapterFilesRepo.getAllChapters(subjectId: subjectId);
    result.fold((failure) {
      emit(GetAllChaptersFailure(failure.toString()));
    }, (chaptersList) {
      for (var item in chaptersList) {
        chapterNames.add(item.name!);
        chapterIndx[item.name!] = item.id!;
      }
      chaptersList = chaptersList;
      emit(GetAllChaptersSuccess(chaptersList));
    });
  }

  deleteChapter({
    required int chapterId,
  }) async {
    emit(DeleteChapterLoading());
    var result = await chapterFilesRepo.deleteChapter(chapterId: chapterId);
    result.fold((failure) {
      emit(DeleteChapterFailure(message: failure.errMessage));
    }, (chapterModel) {
      emit(DeleteChapterSuccess());
    });
  }
}
