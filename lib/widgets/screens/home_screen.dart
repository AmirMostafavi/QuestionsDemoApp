import 'package:flutter/cupertino.dart';
import '../../src.dart';

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Initialize SizeUtils
    SizeUtils().init(context);

    /// --- Main Scaffold ---
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backgroundWhite,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeUtils.safeBlockHorizontal * 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    /// --- Title ---
                    Text(
                      AppStrings.homeTitle,
                      style: AppStyles.boardingTitleStyle,
                    ),

                    /// --- Subtitle ---
                    Text(
                      AppStrings.homeSubtitle,
                      style: AppStyles.boardingSubtitleStyle,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    /// --- CTA - Discover an album ---
                    CtaFilledButtonWidget(
                      text: AppStrings.homeQuestionsCta,
                      onPressed: (){
                        /// Navigate to AlbumListScreen
                        Navigator.pushNamed(context, AppRoutes.questionsRoute);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
