import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tackon/data/model/question_model.dart';

part 'question_event.dart';
part 'question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  final List<QuestionData> questions = <QuestionData>[
    QuestionData(
      title: 'Apa itu',
      text: 'Lorem ipsum',
    ),
  ];

  QuestionBloc() : super(QuestionInitial()) {
    on<QuestionFetched>((
      QuestionFetched event,
      Emitter<QuestionState> emit,
    ) async {
      emit(QuestionFetch.loading(msg: 'Fetching Question'));
      await Future.delayed(const Duration(seconds: 1));
      emit(QuestionFetch.success(msg: 'Success', questions: questions));
    });

    on<QuestionCreated>((
      QuestionCreated event,
      Emitter<QuestionState> emit,
    ) async {
      emit(const QuestionCreate.loading(msg: 'Creating Question'));
      await Future.delayed(const Duration(seconds: 1));
      questions.add(
        QuestionData(
          title: event.title,
          text: event.text,
        ),
      );
      emit(const QuestionCreate.success(msg: 'Success'));
    });
  }
}
