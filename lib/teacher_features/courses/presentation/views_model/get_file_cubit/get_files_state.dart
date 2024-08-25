part of 'get_files_cubit.dart';

sealed class GetFilesState extends Equatable {
  const GetFilesState();

  @override
  List<Object> get props => [];
}

final class GetFilesInitial extends GetFilesState {}

final class GetFileLoading extends GetFilesState {}

final class GetFilesSuccess extends GetFilesState {
  final List<FileModel> files;
  const GetFilesSuccess(this.files);
}

final class GetFilesFailure extends GetFilesState {
  final String message;
  const GetFilesFailure(this.message);
}
