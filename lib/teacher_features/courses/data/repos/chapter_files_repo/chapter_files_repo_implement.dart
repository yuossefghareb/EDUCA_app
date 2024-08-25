// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:field_training_app/Core/api_services/api_service.dart';
import 'package:field_training_app/Core/api_services/end_points.dart';
import 'package:field_training_app/Core/api_services/failure.dart';
import 'package:field_training_app/teacher_features/courses/data/models/chapter_model.dart';
import 'package:field_training_app/teacher_features/courses/data/models/file_model.dart';
import 'package:field_training_app/teacher_features/courses/data/repos/chapter_files_repo/chaoter_files_repo.dart';

class ChapterFilesRepoImplement implements ChapterFilesRepo {
  final ApiServices apiServices;
  ChapterFilesRepoImplement({
    required this.apiServices,
  });
  @override
  Future<Either<Failure, ChapterModel>> addChapter({
    required String name,
    required int subjectId,
  }) async {
    try {
      var data = await apiServices.post(
        endPoint: EndPoint.chapters,
        data: {
          "name": name,
          ApiKey.subjectId: subjectId,
        },
      );

      ChapterModel chapterModel = ChapterModel.fromJson(data);

      return right(chapterModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure("حدث خطأ ما"));
    }
  }

  @override
  Future<Either<Failure, String>> uploadFile(
      {required int chapterId, required File file}) async {
    try {
      await apiServices.post(
        isFromData: true,
        endPoint: EndPoint.uploadFile(chapterId),
        data: {
          "file": await MultipartFile.fromFile(file.path),
        },
      );

      return right("sucess");
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure("حدث خطأ ما"));
    }
  }

  @override
  Future<Either<Failure, List<FileModel>>> getFiles(
      {required int chapterId}) async {
    try {
      var data =
          await apiServices.get(endPoint: EndPoint.getChapterFiles(chapterId));
      List<FileModel> filemodel = [];
      for (var item in data) {
        filemodel.add(FileModel.fromJson(item));
      }
      return right(filemodel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ChapterModel>>> getAllChapters(
      {required int subjectId}) async {
    try {
      var data = await apiServices.get(
          endPoint: EndPoint.getAllChaptersBySubjectId(subjectId));
      List<ChapterModel> chaptermodel = [];

      for (var item in data) {
        chaptermodel.add(ChapterModel.fromJson(item));
      }
      return right(chaptermodel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteChapter({
    required int chapterId,
  }) async {
    try {
      await apiServices.delete(EndPoint.deleteChapter(chapterId));
      return right("success deleted");
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    }
  }
}
