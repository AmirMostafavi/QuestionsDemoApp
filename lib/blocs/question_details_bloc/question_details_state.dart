part of 'question_details_bloc.dart';

abstract class QuestionDetailsState extends Equatable {
  const QuestionDetailsState();

  @override
  List<Object?> get props => [];
}

class QuestionDetailsInitial extends QuestionDetailsState {}

class QuestionDetailsLoading extends QuestionDetailsState {}

class QuestionDetailsLoaded extends QuestionDetailsState {
  final QuestionDetails questionDetails;
  const QuestionDetailsLoaded(this.questionDetails);
}

class QuestionDetailsError extends QuestionDetailsState {
  final String? message;
  const QuestionDetailsError(this.message);
}