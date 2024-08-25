class EndPoint {
  static String baseUrl = "http://edu1.runasp.net/api/";
  static String login = "account/login";
  static String studentRegister = "studentaccount/register";
  static String teacherRegister = "teacheraccount/register";
  static String subject = "subject";
  static String chapters = "chapters";
  static String quiz = "quiz";
  static String questions = "questions";
  static String getStudentById(int id) {
    return "student/$id";
  }

  static String getTeacherById(int id) {
    return "teacher/$id";
  }

  static String searchByTeacherOrSubject(String? searchName) {
    return "student/search?searchQuery=$searchName";
  }

  static String searchByTeachersInGovernate(
      String? teacherName, String? governorate) {
    return "student/search?searchQuery=$teacherName&Governorate=$governorate";
  }

  static String allCoursesWithTeacherId(int id) {
    return "subject/$id/subjects";
  }

  static String deleteSubjectWithTeacherId(int id) {
    return "subject/$id";
  }

  static String getAllQuizzesAssociatedWithSubjectID(int subjectID) {
    return "subject/$subjectID/quizzes";
  }

  static String getAllQuestionsAssociatedWithQuizID(int quizID) {
    return "questions/byquiz/$quizID";
  }

  static String studentEnrollment(int studentID, int subjectID) {
    return 'enrollment?StudentId=$studentID&SubjectId=$subjectID';
  }

  static String allstudentEnrolledSubjects(int studentID) {
    return 'enrollment/student/$studentID';
  }

  static String getSubjectByID(int subjectID) {
    return 'subject/$subjectID';
  }

  static String allStudentEnrolledInSpecificSubject(int subjectID) {
    return 'enrollment/subject/$subjectID';
  }

  static String getAllGuizsBySubjectId(int id) {
    return "subject/$id/quizzes";
  }

  static String getAllQuestionsByQuizId(int id) {
    return "questions/byquiz/$id";
  }

  static String uploadFile(int chapterId) {
    return "chapters/$chapterId/upload";
  }

  static String getChapterFiles(int chapterId) {
    return "chapters/$chapterId/files";
  }

  static String getAllChaptersBySubjectId(int subjectId) {
    return "chapters/bysubject/$subjectId";
  }

  static String updateCourseWithTeacherId(int id) {
    return "subject/$id";
  }

  static String deleteChapter(int chapterId) {
    return "chapters/$chapterId";
  }

  static String deleteQuiz(int quizId) {
    return "quiz/$quizId";
    
  }

  static String deleteQuestion(int questionId) {
    return "questions/$questionId";
  }
}

class ApiKey {
  static String code = "code";
  static String description = "description";
  static String token = "token";
  static String id = "id";
  static String role = "role";
  //? for login and register
  static String firstName = "firstName";
  static String lastName = "lastName";
  static String userName = "userName";
  static String email = "email";
  static String password = "password";
  static String phone = "phone";
  static String studentLevel = "level";
  static String address = "address";
  static String governorate = "Governorate";
  static String image = "profileImage";
  static String imageUrl = "profileImageUrl";

  static String teacherId = "teacherId";
  static String subjectName = "subjName";
  static String pricePerHour = "pricePerHour";
  static String level = "level";
  static String describtion = "describtion";
  static String addingTime = "addingTime";
  static String subjectId = "subjectId";

  static String isActive = "isActive";
  static String isOnline = "isOnline";

  static String tolalPrice = "totalPrice";

  static String term = "term";

  static String content = "content";
  static String correctAnswer = "correctAnswer";
  static String quizId = "quizId";
  static String option1 = "option1";
  static String option2 = "option2";
  static String option3 = "option3";
  static String option4 = "option4";
  static String createdDate = "createdDate";
  static String chapterId = "chapterId";

  static String fileName = "fileName";
  static String contentType = "contentType";
  static String fileContent = "fileContent";
}
