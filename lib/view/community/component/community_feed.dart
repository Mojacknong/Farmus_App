import 'package:flutter/material.dart';
import 'package:mojacknong_android/view/community/component/button_next_my_post.dart';
import 'package:mojacknong_android/view/community/component/community_category.dart';
import 'package:mojacknong_android/view/community/component/community_content.dart';
import 'package:mojacknong_android/view/community/component/community_picture.dart';
import 'package:mojacknong_android/view/community/component/community_profile.dart';
import 'package:mojacknong_android/view/community/component/post_category.dart';

class CommunityFeed extends StatelessWidget {
  List<String> category = <String>["도와주세요", "자랑할래요", "정보나눔"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              ...category.map(
                (item) {
                  return CommunityCategory(category: item);
                },
              ).toList(),
              const Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: ButtonNextMyPost(),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommunityProfile(),
              PostCategory(category: category[0]),
            ],
          ),
          CommunityContent(),
          CommunityPicture(),
        ],
      ),
    );
  }
}