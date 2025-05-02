class Question {
  final String questionText;
  final String answerText;

  Question({required this.questionText, required this.answerText});
  
  // Factory method to create Persian demo questions
  static Question createPersianDemo(int number) {
    return Question(
      questionText: 'این متن سوال شماره $number است',
      answerText: 'این پاسخ سوال شماره $number است'
    );
  }
}