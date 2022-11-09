import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import '../../src.dart';

class QuestionsListScreenWidget extends StatefulWidget {
  const QuestionsListScreenWidget({Key? key}) : super(key: key);

  @override
  State<QuestionsListScreenWidget> createState() =>
      _QuestionsListScreenWidgetState();
}

class _QuestionsListScreenWidgetState extends State<QuestionsListScreenWidget> {
  final QuestionsListBloc _questionsListBloc = QuestionsListBloc();
  List<Question> questionsList = [];
  int currentPage = 1;
  late Box<Question> dataBox;

  @override
  void initState() {
    super.initState();
    /// Make API Call
    _questionsListBloc.add(GetQuestionsList(page: currentPage));
    /// Open Hive Box
    dataBox = Hive.box<Question>("question");
  }

  @override
  Widget build(BuildContext context) {
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
              pageTitle: AppStrings.questions,
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
        create: (_) => _questionsListBloc,
        child: BlocConsumer<QuestionsListBloc, QuestionsListState>(
          listener: (context, state) async {
            if (state is QuestionsLoaded) {
              var result = await Connectivity().checkConnectivity();
              if (result != ConnectivityResult.none) {
                dataBox.clear().then((value) => dataBox.addAll(questionsList));
              }
            }
          },
          builder: (context, state) {
            if (state is QuestionsInitial) {
              return _buildLoadingWidget();
            } else if (state is QuestionsLoading) {
              if (currentPage == 1) {
                return _buildLoadingWidget();
              } else {
                return _buildQuestionsListWidget();
              }
            } else if (state is QuestionsLoaded) {
              questionsList.addAll(state.questions);
              return _buildQuestionsListWidget();
            } else if (state is QuestionsError) {
              return Container();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget _buildQuestionsListWidget() {
    return Scrollbar(
      thickness: 0,
      child: LazyLoadScrollView(
        onEndOfPage: () {
          currentPage = currentPage + 1;
          _questionsListBloc.add(GetQuestionsList(page: currentPage));
        },
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          primary: true,
          itemCount: questionsList.length,
          itemBuilder: (context, index) {
            /// Security Check
            if (index >= questionsList.length) {
              return Container();
            }

            /// Build Question item row
            return _buildQuestionItemRow(context, questionsList[index]);
          },
        ),
      ),
    );
  }

  Widget _buildQuestionItemRow(BuildContext context, Question question) {
    var questionLastActivityDate =
        DateTime.fromMillisecondsSinceEpoch(question.lastActivityDate! * 1000);
    var questionLastActivityFormatted =
        DateFormat('dd MMM yyyy, hh:mm a').format(questionLastActivityDate);

    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        AppRoutes.questionDetailsRoute,
        arguments: {'questionId': question.id},
      ),
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: SizeUtils.safeBlockVertical * 0.5,
          left: SizeUtils.safeBlockHorizontal * 2,
          right: SizeUtils.safeBlockHorizontal * 2,
        ),
        child: Card(
          /// --- Inner Padding ---
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeUtils.safeBlockHorizontal * 2.5,
              vertical: SizeUtils.safeBlockVertical * 2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// --- Title ---
                Padding(
                  padding: EdgeInsets.only(
                    bottom: SizeUtils.safeBlockVertical * 1,
                  ),
                  child: Text(
                    'Q: ' + (question.title ?? ''),
                    style: AppStyles.questionTitleTextStyle,
                  ),
                ),

                const Divider(),

                /// --- Views/Answers Count ---
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// --- Answers Count ---
                    Icon(
                      CupertinoIcons.captions_bubble,
                      color: CupertinoColors.quaternaryLabel,
                      size: SizeUtils.safeBlockHorizontal * 3,
                    ),
                    SizedBox(
                      width: SizeUtils.safeBlockHorizontal * 1.2,
                    ),
                    Text(
                      '${question.answerCount}',
                      style: AppStyles.questionSubtitleTextStyle,
                    ),

                    /// --- Spacer ---
                    SizedBox(
                      width: SizeUtils.safeBlockHorizontal * 1.5,
                    ),

                    /// --- Views Count ---
                    Icon(
                      CupertinoIcons.eye,
                      color: CupertinoColors.quaternaryLabel,
                      size: SizeUtils.safeBlockHorizontal * 3,
                    ),
                    SizedBox(
                      width: SizeUtils.safeBlockHorizontal * 1.2,
                    ),
                    Text(
                      '${question.viewCount}',
                      style: AppStyles.questionSubtitleTextStyle,
                    ),

                    const Spacer(),

                    /// --- Question Last Activity ---
                    Text(
                      questionLastActivityFormatted,
                      style: AppStyles.questionSubtitleTextStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
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
