part of 'questions_list_bloc.dart';

abstract class QuestionsListState extends Equatable {
  const QuestionsListState();

  @override
  List<Object?> get props => [];
}

class QuestionsInitial extends QuestionsListState {}

class QuestionsLoading extends QuestionsListState {}

class QuestionsLoaded extends QuestionsListState {
  final List<Question> questions;
  const QuestionsLoaded(this.questions);
}

class QuestionsError extends QuestionsListState {
  final String? message;
  const QuestionsError(this.message);
}