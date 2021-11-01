part of 'question_bloc.dart';

abstract class QuestionState extends Equatable {
  const QuestionState();

  @override
  List<Object> get props => [];
}

class QuestionInitial extends QuestionState {
  @override
  List<Object> get props => [];
}

class QuestionFetch extends QuestionState {
  const QuestionFetch({
    required this.isLoading,
    required this.message,
    this.questions,
  });

  final bool isLoading;
  final String message;
  final List<QuestionData>? questions;

  QuestionFetch.loading({required String msg})
      : this(
          isLoading: true,
          message: msg,
          // questions: [],
        );

  const QuestionFetch.success({
    required String msg,
    required List<QuestionData> questions,
  }) : this(
          isLoading: false,
          message: msg,
          questions: questions,
        );

  QuestionFetch.error({required String msg})
      : this(
          isLoading: false,
          message: msg,
        );

  @override
  List<Object> get props => [isLoading, questions ?? []];
}

class QuestionCreate extends QuestionState {
  const QuestionCreate({
    required this.isLoading,
    required this.message,
  });

  final bool isLoading;
  final String message;

  const QuestionCreate.loading({required String msg})
      : this(
          isLoading: true,
          message: msg,
        );

  const QuestionCreate.success({required String msg})
      : this(
          isLoading: false,
          message: msg,
        );

  const QuestionCreate.error({required String msg})
      : this(
          isLoading: false,
          message: msg,
        );

  @override
  List<Object> get props => [isLoading];
}
