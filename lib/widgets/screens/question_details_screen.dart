import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import '../../src.dart';

class QuestionDetailsScreenWidget extends StatefulWidget {
  const QuestionDetailsScreenWidget({Key? key}) : super(key: key);

  @override
  State<QuestionDetailsScreenWidget> createState() =>
      _QuestionDetailsScreenWidgetState();
}

class _QuestionDetailsScreenWidgetState
    extends State<QuestionDetailsScreenWidget> {
  _QuestionDetailsScreenWidgetState();

  final QuestionDetailsBloc _questionDetailsBloc = QuestionDetailsBloc();
  late Box<QuestionDetails> dataBox;

  @override
  void initState() {
    super.initState();

    /// Open Hive Box
    dataBox = Hive.box<QuestionDetails>("question_details");
  }

  @override
  Widget build(BuildContext context) {
    /// --- Get Question Id from Arguments ---
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    /// Make API Call
    _questionDetailsBloc.add(GetQuestionDetails(id: arguments['questionId']));

    /// --- Main Scaffold ---
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backgroundWhite,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            /// --- App Bar ---
            const AppBarWidget(
              pageTitle: AppStrings.questionDetails,
            ),

            /// --- Spacer ---
            SizedBox(
              height: SizeUtils.safeBlockVertical * 2,
            ),

            /// --- Content ---
            _buildContentWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildContentWidget() {
    return Expanded(
      child: BlocProvider(
        create: (_) => _questionDetailsBloc,
        child: BlocConsumer<QuestionDetailsBloc, QuestionDetailsState>(
          listener: (context, state) {
            if (state is QuestionDetailsLoaded) {
              dataBox.put(
                state.questionDetails.question.id,
                state.questionDetails,
              );
            }
          },
          builder: (context, state) {
            if (state is QuestionDetailsInitial) {
              return _buildLoadingWidget();
            } else if (state is QuestionDetailsLoading) {
              return _buildLoadingWidget();
            } else if (state is QuestionDetailsLoaded) {
              return _buildDetailsWidget(state.questionDetails);
            } else if (state is QuestionDetailsError) {
              return Container();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget _buildDetailsWidget(QuestionDetails questionDetails) {
    var questionCreationTimestamp = DateTime.fromMillisecondsSinceEpoch(
        questionDetails.question.creationDate! * 1000);
    var questionCreationDate =
        DateFormat('dd MMM yyyy, hh:mm a').format(questionCreationTimestamp);

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: SizeUtils.safeBlockHorizontal * 4,
          vertical: SizeUtils.safeBlockVertical * 2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// --- Label : Question Title ---
            Text(
              AppStrings.question,
              style: AppStyles.labelTextStyle,
            ),
            SizedBox(
              height: SizeUtils.safeBlockVertical * 1,
            ),

            /// --- Question Title ---
            Text(
              questionDetails.question.title!,
              style: AppStyles.questionTitleTextStyle,
            ),

            /// --- Spacer ---
            SizedBox(
              height: SizeUtils.safeBlockVertical * 2,
            ),

            /// --- Divider ---
            // Divider(),

            /// --- Spacer ---
            SizedBox(
              height: SizeUtils.safeBlockVertical * 1,
            ),

            /// --- Owner Profile ---
            ProfileRowWidget(
              profileImage: questionDetails.question.owner!.profileImage!,
              displayName: questionDetails.question.owner!.displayName!,
              reputation: questionDetails.question.owner!.reputation,
              createdAt: questionCreationDate,
            ),

            /// --- Spacer ---
            SizedBox(
              height: SizeUtils.safeBlockVertical * 1,
            ),

            /// --- Divider ---
            const Divider(),

            /// --- Spacer ---
            SizedBox(
              height: SizeUtils.safeBlockVertical * 1,
            ),

            /// --- Answers List ---
            questionDetails.answers.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// --- Label : Answers Title ---
                      Text(
                        AppStrings.answers,
                        style: AppStyles.labelTextStyle,
                      ),

                      /// --- Spacer ---
                      SizedBox(
                        height: SizeUtils.safeBlockVertical * 3,
                      ),

                      /// --- ListView ---
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: questionDetails.answers.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          /// Security Check
                          if (index >= questionDetails.answers.length) {
                            return Container();
                          }

                          /// Build Answer item row
                          return _buildAnswerRow(
                              index, questionDetails.answers[index]);
                        },
                        shrinkWrap: true,
                      ),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget _buildAnswerRow(int index, Answer answer) {
    var answerCreationTimestamp =
        DateTime.fromMillisecondsSinceEpoch(answer.creationDate! * 1000);
    var answerCreationDate =
        DateFormat('dd MMM yyyy, hh:mm a').format(answerCreationTimestamp);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// --- Answer Title ---
        Text(
          "Answer " + (index + 1).toString(),
          style: AppStyles.questionTitleTextStyle,
        ),

        /// --- Spacer ---
        SizedBox(
          height: SizeUtils.safeBlockVertical * 2,
        ),

        /// --- Spacer ---
        SizedBox(
          height: SizeUtils.safeBlockVertical * 1,
        ),

        /// --- Owner Profile ---
        ProfileRowWidget(
          profileImage: answer.owner!.profileImage!,
          displayName: answer.owner!.displayName!,
          reputation: answer.owner!.reputation,
          createdAt: answerCreationDate,
        ),

        /// --- Spacer ---
        SizedBox(
          height: SizeUtils.safeBlockVertical * 1,
        ),

        /// --- Divider ---
        const Divider(),

        /// --- Spacer ---
        SizedBox(
          height: SizeUtils.safeBlockVertical * 1,
        ),
      ],
    );
  }

  Widget _buildLoadingWidget() {
    return Container(
      alignment: Alignment.center,
      child: SizedBox(
        width: SizeUtils.safeBlockHorizontal * 7,
        height: SizeUtils.safeBlockHorizontal * 7,
        child: CircularProgressIndicator(
          strokeWidth: SizeUtils.safeBlockHorizontal * 0.6,
          valueColor:
              const AlwaysStoppedAnimation<Color>(AppColors.accentColor),
        ),
      ),
    );
  }
}
