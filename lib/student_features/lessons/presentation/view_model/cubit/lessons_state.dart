part of 'lessons_cubit.dart';

sealed class LessonsState extends Equatable {
  const LessonsState();

  @override
  List<Object> get props => [];
}

final class LessonsInitial extends LessonsState {}

final class LessonsLoading extends LessonsState {}

final class LessonsSuccess extends LessonsState {
  final List<LessonsModel> lessons;

  const LessonsSuccess({required this.lessons});
}

final class LessonsFailure extends LessonsState {
  final String errMessage;

  const LessonsFailure({required this.errMessage});
}

final class LessonItemsLoading extends LessonsState {}

final class LessonItemsSuccess extends LessonsState {
  final List<LessonItemModel> lessonItems;

  const LessonItemsSuccess({required this.lessonItems});
}

final class LessonItemsFailure extends LessonsState {
  final String errMessage;

  const LessonItemsFailure({required this.errMessage});
}
