class Question{
  final String question;
  final List<String> options;
  final int correctAnswerIndex;

  const Question({
    required this.correctAnswerIndex,
    required this.options,
    required this.question
  });
}