part of 'question_bloc.dart';

abstract class QuestionEvent extends Equatable {
  const QuestionEvent();

  @override
  List<Object> get props => [];
}

class QuestionFetched extends QuestionEvent {
  const QuestionFetched(
    // required this.questions,
  );

  // final List<QuestionData> questions;

  @override
  List<Object> get props => [];
}

class QuestionCreated extends QuestionEvent {
  const QuestionCreated({
    required this.title,
    required this.text,
  });

  final String title;
  final String text;

  @override
  List<Object> get props => [title, text];
}
