import 'package:farmus/common/app_bar/primary_app_bar.dart';
import 'package:farmus/common/button/on_boarding_button.dart';
import 'package:farmus/view/main/main_screen.dart';
import 'package:farmus/view/on_boarding/component/on_boarding_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/theme/farmus_theme_color.dart';

class OnBoardingFinishScreen extends ConsumerWidget {
  const OnBoardingFinishScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const PrimaryAppBar(
        leading: null,
        title: null,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: OnBoardingTitle(
              mainText: " 님의 가입이 완료되었어요!",
              subText: "홈에서 추천 채소를 확인해보세요.",
            ),
          ),
          Expanded(
            child: Center(
              child: Image.asset(
                "assets/image/img_on_board_finish.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 64.0),
            child: OnBoardingButton(
              text: "시작하기",
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MainScreen()),
                );
              },
              enabled: true,
              textColor: FarmusThemeColor.white,
              backgroundColor: FarmusThemeColor.primary,
              borderColor: FarmusThemeColor.white,
            ),
          ),
        ],
      ),
    );
  }
}
