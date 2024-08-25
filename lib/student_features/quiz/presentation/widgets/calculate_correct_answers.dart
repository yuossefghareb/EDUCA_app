int calculateCorrectAnswers(
    List<String> studentAnswers, List<String> correctAnswers, int length) {
  int correctAnswersCount = 0;
  for (int i = 0; i < length; i++) {
    if (studentAnswers[i] == correctAnswers[i]) {
      correctAnswersCount++;
    }
  }
  return correctAnswersCount;
}
