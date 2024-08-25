import 'package:equatable/equatable.dart';
import 'package:field_training_app/Core/models/subject_model.dart';
import 'package:field_training_app/student_features/home/data/repo/home_repo_implement.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepoImplement) : super(HomeInitial());
  final HomeRepoImplement homeRepoImplement;

  Future<void> getSubjects() async {
    emit(HomeGetSubjectsLoading());
    var result = await homeRepoImplement.getAllSubject();
    result.fold((failure) {
      emit(HomeGetSubjectsFailure(errMessage: failure.errMessage));
    }, (subjectList) {
      List<SubjectModel> newList = [];
      for (var element in subjectList) {
        if (element.isActive == true) {
          newList.add(element);
        }
      }
      emit(HomeGetSubjectsSuccess(subjectList: newList));
    });
  }
}
