part of 'question_details_bloc.dart';

abstract class QuestionDetailsEvent extends Equatable {
  const QuestionDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetQuestionDetails extends QuestionDetailsEvent {
  const GetQuestionDetails({required this.id});
  final int id;

  @override
  List<Object> get props => [id];
}