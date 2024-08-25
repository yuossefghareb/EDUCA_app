String subjectImage(String subject) {
  if (subject == 'اللغة الإنجليزية') {
    return 'assets/images/english.png';
  } else if (subject == 'الرياضيات' ||
      subject == 'أستاتيكا' ||
      subject == 'ديناميكا' ||
      subject == 'أحصاء' ||
      subject == 'جبر و هندسة') {
    return 'assets/images/math.png';
  } else if (subject == 'الكيمياء' || subject == 'العلوم') {
    return 'assets/images/chemestry.png';
  } else if (subject == 'اللغة الفرنسية') {
    return 'assets/images/francais.png';
  } else if (subject == 'اللغة الإيطالية' ||
      subject == 'اللغة الألمانية' ||
      subject == 'اللغة الإسبانية' ||
      subject == 'اللغة الروسية') {
    return 'assets/images/italy.png';
  } else if (subject == 'الفيزياء') {
    return 'assets/images/physics.png';
  } else if (subject == 'جغرافيا' || subject == 'الدراسات الاجتماعية') {
    return 'assets/images/geography.png';
  } else if (subject == 'الأحياء') {
    return 'assets/images/biologyy.png';
  } else if (subject == 'التفكير العملي' ||
      subject == 'التفكير النقدي' ||
      subject == 'الفلسفة') {
    return 'assets/images/thinking.png';
  }
  return 'assets/images/subject2.png';
}
