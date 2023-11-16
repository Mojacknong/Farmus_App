import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/view/farmclub/component/new_vegetable_item.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub_make_controller.dart';

class NewVegetableSelect extends StatelessWidget {
  final FarmclubMakeController farmclubMakeController =
      Get.put(FarmclubMakeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 8),
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          final veggieKey =
              farmclubMakeController.veggieData.keys.elementAt(index);
          final veggieName = farmclubMakeController.veggieData[veggieKey];
          final veggieLevel = farmclubMakeController.veggieLevel[veggieKey];

          return GetBuilder<FarmclubMakeController>(
            builder: (controller) {
              return SizedBox(
                height: 180, // 아이템의 높이를 조절
                child: NewVegetableItem(
                  blackPath: 'assets/image/${veggieKey}_black.svg',
                  colPath: 'assets/image/${veggieKey}_col.svg',
                  isSelected: controller.isSelectedList[index],
                  onTap: () => controller.toggleImageSelection(index),
                  veggieName: veggieName!,
                  difficulty: veggieLevel!,
                ),
              );
            },
          );
        },
      ),
    );
  }
}