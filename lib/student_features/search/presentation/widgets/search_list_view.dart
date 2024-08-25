import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/custom_failure_widget.dart';
import 'package:field_training_app/Core/widgets/custom_search_loading_widget.dart';
import 'package:field_training_app/Core/models/teacher_model.dart';
import 'package:field_training_app/student_features/search/presentation/view_model/search_cubit/search_cubit.dart';
import 'package:field_training_app/student_features/search/presentation/widgets/subject_search_item.dart';
import 'package:field_training_app/student_features/search/presentation/widgets/teacher_search_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({super.key, this.searchType});
  final String? searchType;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return state.searchedList.isNotEmpty
              ? ListView.builder(
                  itemCount: state.searchedList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return state.searchedList is List<TeacherModel>
                        ? Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: TeacherSearchItem(
                              teacherSearchedModel: state.searchedList[index],
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: SubjectSearchItem(
                              subjectSearchedModel: state.searchedList[index],
                            ),
                          );
                  },
                )
              : Center(
                  child: Text("لا توجد نتائج", style: Styles.textStyle16));
        } else if (state is SearchFailure) {
          return const CustomFailureWidget(errMessage: "لا توجد نتائج");
        } else if (state is SearchLoading) {
          return const CustomSearchLoadingWidget();
        }
        return const SizedBox();
      },
    );
  }
}
