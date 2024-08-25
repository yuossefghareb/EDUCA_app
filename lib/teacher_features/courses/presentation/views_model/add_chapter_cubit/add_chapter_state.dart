part of 'add_chapter_cubit.dart';

sealed class AddChapterState extends Equatable {
  const AddChapterState();

  @override
  List<Object> get props => [];
}

final class AddChapterInitial extends AddChapterState {}

final class AddChapterLoading extends AddChapterState {}

final class AddChapterSuccess extends AddChapterState {
  final ChapterModel chapterModel;

  const AddChapterSuccess({required this.chapterModel});
}

final class AddChapterFailure extends AddChapterState {
  final String message;

  const AddChapterFailure({required this.message});
}


