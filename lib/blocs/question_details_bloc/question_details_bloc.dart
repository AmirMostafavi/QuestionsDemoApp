import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../src.dart';

part 'question_details_event.dart';

part 'question_details_state.dart';

class QuestionDetailsBloc
    extends Bloc<QuestionDetailsEvent, QuestionDetailsState> {
  QuestionDetailsBloc() : super(QuestionDetailsInitial()) {
    final RetrofitRestClient _retrofitClient = RestClientManager.getClient();
    final dataBox = Hive.box<QuestionDetails>("question_details");

    on<GetQuestionDetails>((event, emit) async {
      var result = await Connectivity().checkConnectivity();
      if (result == ConnectivityResult.none) {
        /// No Network Connection - Use cached data
        final cachedData = dataBox.get(event.id);
        if (cachedData != null) {
          emit(QuestionDetailsLoaded(cachedData));
        }
      } else {
        /// We have network connection - Fetch new data
        try {
          emit(QuestionDetailsLoading());
          final questionDetailsResponse =
              await _retrofitClient.getQuestionDetails(event.id);
          final questionAnswersResponse =
              await _retrofitClient.getQuestionAnswers(event.id);
          if (questionDetailsResponse != null &&
              questionAnswersResponse != null) {
            emit(
              QuestionDetailsLoaded(QuestionDetails(
                questionDetailsResponse.items.first,
                questionAnswersResponse.items,
              )),
            );
          }
        } catch (exception) {
          emit(const QuestionDetailsError(
              "Failed to fetch data. is your device online?"));
        }
      }
    });
  }
}
