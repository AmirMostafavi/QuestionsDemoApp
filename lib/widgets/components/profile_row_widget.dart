import '../../src.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileRowWidget extends StatelessWidget {
  const ProfileRowWidget(
      {Key? key,
      required this.profileImage,
      required this.displayName,
      required this.createdAt,
      required this.reputation})
      : super(key: key);

  final String profileImage;
  final String displayName;
  final int reputation;
  final String createdAt;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              /// --- Profile Avatar ---
              CircleAvatar(
                backgroundColor: Colors.transparent,
                child: SizedBox(
                    width: 35,
                    height: 35,
                    child: ClipOval(
                      child: Image.network(
                        profileImage,
                      ),
                    )),
              ),

              /// --- Spacer ---
              SizedBox(
                width: SizeUtils.safeBlockHorizontal * 2,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// --- Profile Name ---
                  Text(
                    displayName,
                    style: AppStyles.questionSubtitleTextStyle,
                  ),

                  /// --- Profile Reputation ---
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.star_fill,
                        color: CupertinoColors.systemYellow,
                        size: SizeUtils.safeBlockHorizontal * 3,
                      ),
                      SizedBox(
                        width: SizeUtils.safeBlockHorizontal * 1,
                      ),
                      Text(
                        reputation.toString(),
                        style: AppStyles.questionSubtitleTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),

        Expanded(
          child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  /// --- Spacer ---
                  Text(
                    "",
                    style: AppStyles.questionSubtitleTextStyle,
                  ),

                  /// --- Created At ---
                  Text(
                    createdAt,
                    style: AppStyles.questionSubtitleTextStyle,
                  ),
                ],
              ),
        ),
      ],
    );
  }
}
