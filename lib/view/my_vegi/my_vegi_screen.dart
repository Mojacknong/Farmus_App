import 'package:farmus/model/home/my_vegi_model.dart';
import 'package:farmus/view/my_vegi/component/my_vegi_list_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/app_bar/primary_app_bar.dart';
import '../../common/theme/farmus_theme_color.dart';

class MyVegiScreen extends ConsumerWidget {
  const MyVegiScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<MyVegiModel> myVegi = [
      MyVegiModel(
          vegiName: "상훈이", vegiType: "상추", nowDay: "8", startDay: "23.06.27"),
      MyVegiModel(
          vegiName: "방울이",
          vegiType: "방울토마토",
          nowDay: "8",
          startDay: "24.03.23"),
      MyVegiModel(
          vegiName: "깨르륵", vegiType: "깻잎", nowDay: "5", startDay: "24.03.25"),
    ];

    return Scaffold(
      appBar: PrimaryAppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset("assets/image/ic_left.svg"),
        ),
        title: "내 텃밭",
        centerTitle: false,
      ),
      body: ListView.builder(
        itemCount: myVegi.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              MyVegiListInfo(
                myVegi: myVegi[index],
              ),
              if (myVegi.length - 1 != index)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: const Divider(
                    height: 1,
                    color: FarmusThemeColor.gray5,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
