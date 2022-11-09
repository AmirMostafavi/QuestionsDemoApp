import 'package:flutter/cupertino.dart';
import '../../src.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key, required this.pageTitle}) : super(key: key);

  final String pageTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeUtils.safeBlockVertical * 8,
      child: Padding(
        padding:
            EdgeInsets.symmetric(vertical: SizeUtils.safeBlockVertical * 1),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            /// --- Button : Back ---
            Positioned(
              left: 5,
              child: GestureDetector(
                onTap: () {
                  /// Navigate back
                  Navigator.pop(context);
                },
                behavior: HitTestBehavior.opaque,
                child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Icon(
                      CupertinoIcons.back,
                      size: 30,
                      color: CupertinoColors.darkBackgroundGray,
                    )),
              ),
            ),

            /// --- Page Title ---
            Text(
              pageTitle,
              style: AppStyles.appBarPageTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
