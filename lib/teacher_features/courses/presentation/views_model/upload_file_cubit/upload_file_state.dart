part of 'upload_file_cubit.dart';

sealed class UploadFileState extends Equatable {
  const UploadFileState();

  @override
  List<Object> get props => [];
}

final class UploadFileInitial extends UploadFileState {}

final class UploadFileLoading extends UploadFileState {}

final class UploadFileSuccess extends UploadFileState {}

final class UploadFileFailure extends UploadFileState {
  final String message;
  const UploadFileFailure({required this.message});
}
