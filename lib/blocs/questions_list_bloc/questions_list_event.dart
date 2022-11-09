part of 'questions_list_bloc.dart';

abstract class QuestionsListEvent extends Equatable {
  const QuestionsListEvent();

  @override
  List<Object> get props => [];
}

class GetQuestionsList extends QuestionsListEvent {
  const GetQuestionsList({required this.page});
  final int page;

  @override
  List<Object> get props => [page];
}