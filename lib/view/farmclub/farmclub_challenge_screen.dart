import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';
import 'package:mojacknong_android/view/farmclub/component/button_brown.dart';
import 'package:mojacknong_android/view/farmclub/component/button_white.dart';
import 'package:mojacknong_android/view/farmclub/component/challenge/challenge_picture.dart';
import 'package:mojacknong_android/view/farmclub/component/challenge/challenge_help.dart';
import 'package:mojacknong_android/view/farmclub/component/challenge/challenge_step.dart';
import 'package:mojacknong_android/view/farmclub/component/farmclub_title_with_divider.dart';
import 'package:mojacknong_android/view/farmclub/farmclub_auth_screen.dart';
import 'package:mojacknong_android/view/farmclub/my_farmclub_mission_screen.dart';
import 'package:mojacknong_android/view_model/controllers/bottom_sheet_controller.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub/farmclub_etc_controller.dart';

class FarmclubChallengeScreen extends StatefulWidget {
  final String? detailId;

  const FarmclubChallengeScreen({Key? key, required this.detailId})
      : super(key: key);

  @override
  State<FarmclubChallengeScreen> createState() =>
      _FarmclubChallengeScreenState();
}

class _FarmclubChallengeScreenState extends State<FarmclubChallengeScreen> {
  final FarmclubEtcController farmclubController =
      Get.put(FarmclubEtcController());

  final BottomSheetController _bottomSheetController = BottomSheetController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(title: "함께 도전해요"),
      backgroundColor: FarmusThemeData.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FarmclubTitleWithDivider(title: "완료한 Step"),
            const Row(
              children: [
                SizedBox(
                  width: 16,
                ),
                Text(
                  "아직 완료한 Step이 없어요",
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const FarmclubTitleWithDivider(title: "현재 Step"),
            const ChallengeStep(
              step: 0,
              title: "준비물을 챙겨요",
            ),
            const SizedBox(
              height: 16,
            ),
            const ChallengeHelp(
              help: "상추 씨앗과 상토, 재배 용기를 준비해 주세요",
            ),
            const SizedBox(
              height: 16,
            ),
            const ChallengePicture(),
            const SizedBox(
              height: 16,
            ),
            const FarmclubTitleWithDivider(title: "다음 Step"),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ChallengeStep(
                      step: index,
                      title: index.toString(),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Divider(
                      endIndent: 16,
                      indent: 16,
                      color: FarmusThemeData.grey4,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                );
              },
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: const EdgeInsets.all(8),
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: ButtonWhite(
                  text: "내 미션",
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MyFarmclubMissionScreen(
                            detailId: widget.detailId,
                          );
                        },
                      ),
                    );
                  }),
            ),
            Expanded(
              flex: 2,
              child: ButtonBrown(
                text: "미션 인증하기",
                enabled: RxBool(true),
                onPress: () {
                  _bottomSheetController.showMissionFinishDialog(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
