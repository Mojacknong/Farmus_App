import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/home/component/diary/diary_screen.dart';

class HomeGreenBoxUser extends StatelessWidget {
  final String? userNickName;
  final int? id;
  final String? nickname;
  final String? image;
  final int? age;
  const HomeGreenBoxUser({
    Key? key,
    this.userNickName,
    this.id,
    this.nickname,
    this.image,
    this.age
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DiaryScreen(
                  userNickName: '$userNickName',
                  id: id,
                  nickname: nickname,
                  image: image,
                  age: age,

                ),
              ),
            );
          },
          child: SizedBox(
            width: 470,
            height: 380,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  top: 0,
                  child: SvgPicture.asset(
                    'assets/image/bigbox.svg',
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 20,
                  right: 0,
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 36,
                        ),
                        Text(
                          '${nickname}' +"+" +"${age}",
                          style: FarmusThemeData.darkStyle13
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                           '${userNickName}' +'님의 사랑으로\n오늘도 쑥쑥 자라는 중',
                          style: TextStyle(
                            color: FarmusThemeData.dark,
                            fontFamily: "Pretendard-Semi-Bold",
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 200,
                  child: Center(
                    child: Image.network(
                      '${image}',
                      height: 100,
                    ),
                  ),
                ),
                Positioned(
                  top: 263,
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/image/greenwave.svg',
                      width: 369,
                    ),
                  ),
                ),
                Positioned(
                  top: 263,
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/image/darkwave.svg',
                      width: 369,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
