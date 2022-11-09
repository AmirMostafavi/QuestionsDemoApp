import 'package:questions_app/models/answer_list_response.dart';

import '../src.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'retrofit_client_manager.g.dart';

/// ----- Rest Client Manager -----

class RestClientManager {
  static RetrofitRestClient? _retrofitRestClient;

  static const apiEndpointUrl = "https://api.stackexchange.com/2.3";

  static void rebuildClient(
      {bool customizedTimeout = false,
      bool rebuildForMultipart = false,
      bool rebuildForJson = false}) async {
    /// Create Dio Instance
    final dio = Dio(BaseOptions(contentType: 'application/json'));

    /// Add Customized DioBaseOptions for timeout customization
    if (customizedTimeout) {
      BaseOptions customizedDioBaseOptions = BaseOptions(
          baseUrl: apiEndpointUrl,
          receiveDataWhenStatusError: true,
          connectTimeout: 10 * 1000,
          receiveTimeout: 10 * 1000);
      dio.options = customizedDioBaseOptions;
    }

    /// Create Retrofit Rest Client
    _retrofitRestClient = RetrofitRestClient(dio);
  }

  static RetrofitRestClient getClient() {
    if (_retrofitRestClient == null) {
      rebuildClient();
    }

    return _retrofitRestClient!;
  }
}

/// ----- Retrofit Rest Client -----

@RestApi(baseUrl: RestClientManager.apiEndpointUrl)
abstract class RetrofitRestClient {
  factory RetrofitRestClient(Dio dio, {String baseUrl}) = _RetrofitRestClient;

  /// --- Get Questions List  ---

  @GET("/questions?pagesize=20&order=desc&sort=activity&site=stackoverflow")
  Future<QuestionListResponse?> getQuestionsList(
    @Query('page') int page,
  );

  @GET("/questions/{id}?order=desc&sort=activity&site=stackoverflow")
  Future<QuestionListResponse?> getQuestionDetails(
    @Path('id') int id,
  );

  @GET("/questions/{id}/answers?order=desc&sort=activity&site=stackoverflow")
  Future<AnswerListResponse?> getQuestionAnswers(
    @Path('id') int questionId,
  );
}
