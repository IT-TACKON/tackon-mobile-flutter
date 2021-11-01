part of 'answer_bloc.dart';

abstract class AnswerState extends Equatable {
  const AnswerState();
  
  @override
  List<Object> get props => [];
}

class AnswerInitial extends AnswerState {}
