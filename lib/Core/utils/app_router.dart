import 'package:field_training_app/Core/api_services/end_points.dart';
import 'package:field_training_app/Core/api_services/payment_api_services.dart';
import 'package:field_training_app/Core/models/subject_model.dart';
import 'package:field_training_app/Core/utils/app_services.dart';
import 'package:field_training_app/cache/cache_helper.dart';
import 'package:field_training_app/student_features/auth/data/repos/auth_repo_implement.dart';
import 'package:field_training_app/student_features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:field_training_app/student_features/auth/presentation/view_model/register_option_cubit.dart';
import 'package:field_training_app/student_features/courses/presentation/views/course_details_view.dart';
import 'package:field_training_app/student_features/enrollment/data/models/all_students_enrolled_in_spec_subject_model/st_dto.dart';
import 'package:field_training_app/student_features/enrollment/data/repo/enrollment_repo_implement.dart';
import 'package:field_training_app/student_features/enrollment/presentation/view_model/cubit/enrollment_cubit.dart';
import 'package:field_training_app/student_features/home/data/repo/home_repo_implement.dart';
import 'package:field_training_app/student_features/home/presentation/view_model/cubit/home_cubit.dart';
import 'package:field_training_app/student_features/lessons/data/repo/lessons_repo_implement.dart';
import 'package:field_training_app/student_features/lessons/presentation/view_model/cubit/lessons_cubit.dart';
import 'package:field_training_app/student_features/lessons/presentation/views/lesson_details_view.dart';
import 'package:field_training_app/student_features/lessons/presentation/views/lessons_list_view.dart';
import 'package:field_training_app/student_features/payment/presentation/view_model/payment_cubit/payment_cubit.dart';
import 'package:field_training_app/student_features/payment/presentation/views/payment_option_view.dart';
import 'package:field_training_app/student_features/payment/presentation/views/ref_code_view.dart';
import 'package:field_training_app/student_features/payment/presentation/views/visa_view.dart';
import 'package:field_training_app/student_features/profile/data/repos/student_repo/student_profile_repo_implement.dart';
import 'package:field_training_app/student_features/quiz/presentation/view_model/quiz_cubit/quiz_cubit.dart';
import 'package:field_training_app/student_features/quiz/presentation/views/quiz_view.dart';
import 'package:field_training_app/student_features/quiz/presentation/views/quizzes_list_view.dart';
import 'package:field_training_app/student_features/search/presentation/views/search_options_view.dart';
import 'package:field_training_app/student_features/splash/presentation/views/splash_view.dart';
import 'package:field_training_app/student_features/teacher_details_and_subjects/data/repo/teacher_details_repo_implement.dart';
import 'package:field_training_app/student_features/teacher_details_and_subjects/presentation/view_model/cubit/teacher_details_cubit.dart';
import 'package:field_training_app/student_features/teacher_details_and_subjects/presentation/views/teacher_details_view.dart';
import 'package:field_training_app/student_features/teacher_details_and_subjects/presentation/views/teacher_subjects_view.dart';
import 'package:field_training_app/teacher_features/courses/data/models/course_model.dart';
import 'package:field_training_app/teacher_features/courses/data/repos/add_course_repo/add_Course_repo_implement.dart';
import 'package:field_training_app/teacher_features/courses/data/repos/chapter_files_repo/chapter_files_repo_implement.dart';
import 'package:field_training_app/teacher_features/courses/data/repos/course_repo/course_repo_implement.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views/coures_edit_view.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views/course_details_teacher_view.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views/enrolled_student_details_view.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views/enrolled_students_view.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views_model/add_course_cubit/add_course_cubit.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views_model/get_all_chapters_cubit/get_all_chapters_cubit.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views_model/get_all_courses_cubit/get_all_courses_teacher_cubit.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views_model/get_enrolled_student_cubit/get_enrolled_student_cubit.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views_model/swith_select_cubit.dart';
import 'package:field_training_app/teacher_features/make_quiz/data/repos/add_quiz_repo/add_quzi_repo_impelement.dart';
import 'package:field_training_app/teacher_features/make_quiz/presentation/views/make_quiz_view.dart';
import 'package:field_training_app/teacher_features/make_quiz/presentation/views/show_all_quizzes_view.dart';
import 'package:field_training_app/teacher_features/make_quiz/presentation/views/show_quiz_view.dart';
import 'package:field_training_app/teacher_features/make_quiz/presentation/views_model/add_quiz_cubit/add_quiz_cubit.dart';
import 'package:field_training_app/teacher_features/make_quiz/presentation/views_model/add_question_cubit/add_question_cubit.dart';
import 'package:field_training_app/teacher_features/make_quiz/presentation/views_model/cubit/get_all_question_cubit.dart';
import 'package:field_training_app/teacher_features/profile_teacher/data/repos/teacher_repo/teacher_profile_repo_implement.dart';
import 'package:field_training_app/teacher_features/profile_teacher/presentation/view_model/cubit/teacher_profile_cubit.dart';
import 'package:field_training_app/teacher_features/teacher/presentation/views/create_class.dart';
import 'package:field_training_app/teacher_features/teacher/presentation/views/terms_view.dart';
import 'package:field_training_app/teacher_features/teacher/presentation/views_model/cubit/drop_down_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:field_training_app/Core/utils/routes.dart';
import 'package:field_training_app/student_features/auth/presentation/views/login_view.dart';
import 'package:field_training_app/student_features/auth/presentation/views/register_view.dart';
import 'package:field_training_app/student_features/bottom_bar/presentation/views/custom_bottom_bar.dart';
import 'package:field_training_app/student_features/introduction_screens/presentation/views/introduction_screens.dart';
import 'package:field_training_app/student_features/profile/presentation/views/profile_edit_view.dart';
import 'package:field_training_app/student_features/search/presentation/views/search_view.dart';

import '../../student_features/auth/presentation/view_model/change_profile_image.dart';
import '../../student_features/auth/presentation/view_model/governorate_cubit.dart';
import '../../student_features/bottom_bar/presentation/view_model/bottom_bar_cubit.dart';
import '../../student_features/chat_gpt/presentation/view_model/chat_cubit.dart';
import '../../student_features/profile/presentation/view_model/cubit/student_profile_cubit.dart';
import '../../student_features/profile/presentation/views/profile_select_class_edit_view.dart';
import '../../student_features/profile/presentation/views/profile_view.dart';
import '../../student_features/quiz/data/repo/quiz_repo_implement.dart';
import '../../student_features/quiz/presentation/view_model/counter_cubit.dart';
import '../../student_features/quiz/presentation/view_model/select_answer_cubit.dart';
import '../../student_features/quiz/presentation/views/quiz_result_view.dart';
import '../../student_features/search/data/repo/search_repo_implement.dart';
import '../../student_features/search/presentation/view_model/search_cubit/search_cubit.dart';

import '../../teacher_features/bottom_bar_teacher/presentation/views/custom_bottom_bar.dart';
import '../../teacher_features/profile_teacher/presentation/views/teacher_profile_edit_view.dart';
import '../../teacher_features/profile_teacher/presentation/views/teacher_profile_view.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashViewRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
      case Routes.createClassViewRoute:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => DropDownListCubit(),
              ),
              BlocProvider(
                create: (context) =>
                    AddCourseCubit(getIt.get<AddCourseRepoImplement>()),
              ),
            ],
            child: const CreateClassView(),
          ),
        );
      case Routes.introScreensViewRoute:
        return MaterialPageRoute(
          builder: (context) => const IntroScreens(),
        );
      case Routes.loginViewRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AuthCubit(getIt.get<AuthRepoImplement>()),
            child: const LoginView(),
          ),
        );
      case Routes.registerViewRoute:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => AuthCubit(getIt.get<AuthRepoImplement>()),
              ),
              BlocProvider(
                create: (context) => ChangeRegisterImageCubit(),
              ),
            ],
            child: const RegisterView(),
          ),
        );

      case Routes.customBottomBarViewRoute:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => BottomBarCubit(),
              ),
              BlocProvider(
                create: (context) => ChatCubit(),
              ),
              BlocProvider(
                create: (context) =>
                    EnrollmentCubit(getIt.get<EnrollmentRepoImplement>())
                      ..allStudentEnrolledSubjects(
                          CacheHelper.getData(key: ApiKey.id)),
              ),
              BlocProvider(
                create: (context) => ChangeRegisterImageCubit(),
              ),
              BlocProvider(
                create: (context) => StudentProfileCubit(
                    getIt.get<StudentProfileRepoImplement>())
                  ..getStudentData(),
              ),
              BlocProvider(
                create: (context) =>
                    HomeCubit(getIt.get<HomeRepoImplement>())..getSubjects(),
              ),
            ],
            child: const CustomBottomBarView(),
          ),
        );
      case Routes.customBottomBarForTeacherViewRoute:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => BottomBarCubit(),
              ),
              BlocProvider(
                create: (context) => ChangeRegisterImageCubit(),
              ),
              BlocProvider(
                create: (context) => GetAllCoursesTeacherCubit(
                    getIt.get<CourseRepoImplement>())
                  ..getCourses(teacherId: CacheHelper.getData(key: ApiKey.id)),
              ),
              BlocProvider(
                create: (context) => ChatCubit(),
              ),
              BlocProvider(
                create: (context) => AuthCubit(getIt.get<AuthRepoImplement>()),
              ),
              BlocProvider(
                create: (context) => TeacherProfileCubit(
                    getIt.get<TeacherProfileRepoImplement>())
                  ..getTeacherData(),
              ),
            ],
            child: const CustomBottomBarForTeacherView(),
          ),
        );
      case Routes.profileViewRoute:
        return MaterialPageRoute(
          builder: (context) => const ProfileView(),
        );
      case Routes.teacherProfileViewRoute:
        return MaterialPageRoute(
          builder: (context) => const TeacherProfileView(),
        );
      case Routes.profileEditViewRoute:
        var args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                StudentProfileCubit(getIt.get<StudentProfileRepoImplement>()),
            child: ProfileEditView(
              parameter: args["parameter"],
              value: args["value"],
            ),
          ),
        );
      case Routes.teacherProfileEditViewRoute:
        var args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                TeacherProfileCubit(getIt.get<TeacherProfileRepoImplement>()),
            child: TeacherProfileEditView(
              parameter: args["parameter"],
              value: args["value"],
            ),
          ),
        );
      case Routes.profileSelectClassEditViewRoute:
        var args = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                StudentProfileCubit(getIt.get<StudentProfileRepoImplement>()),
            child: ProfileSelectClassEditView(value: args),
          ),
        );

      case Routes.searchViewRoute:
        var args = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    SearchCubit(getIt.get<SearchRepoImplement>()),
              ),
              BlocProvider(
                create: (context) => OptionCubit(),
              ),
              BlocProvider(
                create: (context) => GovernorateSelectCubit(),
              ),
            ],
            child: SearchView(searchType: args),
          ),
        );
      case Routes.searchOptionViewRoute:
        return MaterialPageRoute(
          builder: (context) => const SearchOptionsView(),
        );
      case Routes.courseDetailsViewRoute:
        var args = settings.arguments as SubjectModel;
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    PaymentCubit(getIt.get<PaymentApiServices>())
                      ..getAuthToken(),
              ),
              BlocProvider(
                create: (context) =>
                    EnrollmentCubit(getIt.get<EnrollmentRepoImplement>())
                      ..allStudentsEnrolledInSpecSubject(args.id!),
              ),
            ],
            child: CourseDetailsView(subjectModel: args),
          ),
        );
      case Routes.termsViewRoute:
        return MaterialPageRoute(
          builder: (context) => TermsView(),
        );
      case Routes.courseDetailsTeacherViewRoute:
        var args = settings.arguments as CourseModel;
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    GetAllChaptersCubit(getIt.get<ChapterFilesRepoImplement>())
                      ..getChapters(subjectId: args.subjectId!),
              ),
              BlocProvider(
                create: (context) => SwithSelectCubit(),
              ),
            ],
            child: CourseDetailsTeacherView(
              courseModel: args,
            ),
          ),
        );
      case Routes.enrolledStudentsViewRoute:
        var args = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                GetEnrolledStudentCubit(getIt.get<EnrollmentRepoImplement>())
                  ..getEnrolledStudent(subjectID: args),
            child: const EnrolledStudentsView(),
          ),
        );
      case Routes.enrolledStudentDetailsRoute:
        var args = settings.arguments as StDto;
        return MaterialPageRoute(
            builder: (context) => EnrolledStudentDetailsView(
                  stDto: args,
                ));

      case Routes.quizViewRoute:
        var args = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => CounterCubit(),
              ),
              BlocProvider(
                create: (context) => QuizCubit(getIt.get<QuizRepoImplement>())
                  ..getAllQuestionsAssociatedWithQuiz(args),
              ),
              BlocProvider(
                create: (context) => SelectAnswerCubit(),
              ),
            ],
            child: QuizView(quizID: args),
          ),
        );
      case Routes.quizzesListViewRoute:
        var args = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => QuizCubit(getIt.get<QuizRepoImplement>())
              ..getAllQuizzesAssociatedWithSubjectID(args),
            child: const QuizzesListView(),
          ),
        );
      case Routes.quizResultViewRoute:
        var args = settings.arguments as List<int>;
        return MaterialPageRoute(
          builder: (context) => QuizResultView(
            numberOfQuestions: args[0],
            numberOfCorrectAnswers: args[1],
            quizID: args[2],
          ),
        );
      case Routes.createQuizViewRoute:
        var args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                AddQuestionCubit(getIt.get<AddQuizRepoImplement>()),
            child: MakeQuizView(
              titleQuiz: args["titleQuiz"],
              quizId: args["quizId"],
              subjectId: args["subjectId"],
            ),
          ),
        );
      case Routes.showQuizViewRoute:
        var args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                GetAllQuestionCubit(getIt.get<AddQuizRepoImplement>())
                  ..getAllQuestion(quizId: args["quizId"]),
            child: ShowQuizView(
              titleQuiz: args["titleQuiz"],
              quizId: args["quizId"],
              subjectId: args["subjectId"],
            ),
          ),
        );
      case Routes.showAllQuizzesViewRoute:
        var args = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AddQuizCubit(getIt.get<AddQuizRepoImplement>())
              ..getAllQuiz(subjectId: args),
            child: ShowAllQuizzesView(
              subjectId: args,
            ),
          ),
        );
      case Routes.paymentOptionViewRoute:
        var args = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => PaymentOptionView(subjectID: args),
        );
      case Routes.refCodeViewRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                PaymentCubit(getIt.get<PaymentApiServices>())..getRefCode(),
            child: const RefCodeView(),
          ),
        );
      case Routes.visaViewRoute:
        var args = settings.arguments as List;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                EnrollmentCubit(getIt.get<EnrollmentRepoImplement>()),
            child: VisaView(
              url: args[0],
              subjectID: args[1],
            ),
          ),
        );
      case Routes.teacherDetailsViewRoute:
        var args = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                TeacherDetailsCubit(getIt.get<TeacherDetailsRepoImplement>())
                  ..getTeacherData(teacherID: args),
            child: const TeacherDetailsView(),
          ),
        );
      case Routes.teacherSubjectsViewRoute:
        var args = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                TeacherDetailsCubit(getIt.get<TeacherDetailsRepoImplement>())
                  ..getTeacherSubjects(teacherID: args),
            child: const TeacherSubjectsView(),
          ),
        );
      case Routes.courseEditViewRoute:
        var args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => CourseEditView(
            namech: args["namech"],
            chapterId: args["chapterId"],
            chapterIndx: args["chapterIndx"],
            subjectId: args["subjectId"],
            chaptersN: args["chaptersN"],
          ),
        );
      case Routes.lessonsListViewRoute:
        var args = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LessonsCubit(getIt.get<LessonsRepoImplement>())
              ..getLessons(subjectID: args),
            child: const LessonsListView(),
          ),
        );
      case Routes.lessonDetailsViewRoute:
        var args = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LessonsCubit(getIt.get<LessonsRepoImplement>())
              ..getLessonItems(lessonID: args),
            child: const LessonDetailsView(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: Center(
                child: Text("No Route Found!!"),
              ),
            );
          },
        );
    }
  }
}
