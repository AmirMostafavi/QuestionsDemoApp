import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../src.dart';

part 'questions_list_event.dart';

part 'questions_list_state.dart';

class QuestionsListBloc extends Bloc<QuestionsListEvent, QuestionsListState> {
  QuestionsListBloc() : super(QuestionsInitial()) {
    final RetrofitRestClient _retrofitClient = RestClientManager.getClient();
    final dataBox = Hive.box<Question>("question");

    on<GetQuestionsList>((event, emit) async {
      var result = await Connectivity().checkConnectivity();
      if (result == ConnectivityResult.none) {
        /// No Network Connection - Use cached data
        if (event.page == 1) {
          final cachedData = dataBox.values.toList();
          emit(QuestionsLoaded(cachedData));
        }
      } else {
        /// We have network connection - Fetch new data
        try {
          emit(QuestionsLoading());
          final response = await _retrofitClient.getQuestionsList(event.page);
          if (response?.items != null){
            emit(QuestionsLoaded(response!.items));
          }
        } catch (exception) {
          emit(const QuestionsError(
              "Failed to fetch data. is your device online?"));
        }
      }
    });
  }
}
