import 'package:equatable/equatable.dart';
import 'package:field_training_app/student_features/search/data/repo/search_repo_implement.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepoImplement) : super(SearchInitial());
  final SearchRepoImplement searchRepoImplement;

  Future<void> getSearchByTeacherName(String? teacherName) async {
    emit(SearchLoading());
    final result =
        await searchRepoImplement.getSearchByTeacherName(teacherName);
    result.fold((failure) {
      emit(SearchFailure(failure.toString()));
    }, (searchedList) {
      emit(SearchSuccess(searchedList));
    });
  }

  Future<void> getSearchBySubjectName(String? subjectName) async {
    emit(SearchLoading());
    final result =
        await searchRepoImplement.getSearchBySubjectName(subjectName);
    result.fold((failure) {
      emit(SearchFailure(failure.toString()));
    }, (searchedList) {
      emit(SearchSuccess(searchedList));
    });
  }

  Future<void> getSearchByTeachersInGovernate(
      String teacherName, String subjectName) async {
    emit(SearchLoading());
    final result = await searchRepoImplement.getSearchByTeachersInGovernate(
        teacherName, subjectName);
    result.fold((failure) {
      emit(SearchFailure(failure.toString()));
    }, (searchedList) {
      emit(SearchSuccess(searchedList));
    });
  }
}
