import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ssi_wallet/components/colors.dart';
import 'package:ssi_wallet/utils/config.dart';
import '../global_controller.dart';

const List<Map<String, dynamic>> pages = [
  {
    "image": "assets/icons/home.png",
    "title": "Home",
  },
  {
    "image": "assets/icons/credentials.png",
    "title": "Upload",
  },
  {
    "image": "assets/icons/home.png",
    "title": "Profile",
  },
];

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(80),
      color: AppColors.card,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
            pages.length,
                (index) => NavigationButton(
                asset: pages[index]["image"],
                index: index,
                title: pages[index]["title"])),
      ),
    );
  }
}

class NavigationButton extends StatelessWidget {
  NavigationButton(
      {Key? key, required this.asset, required this.index, required this.title})
      : super(key: key);

  GlobalController globalController = Get.put(GlobalController());

  final String asset;
  final int index;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: () {
          globalController.onChangeTab(index);
        },
        child: SizedBox(
          height: getHeight(50),
          width: getWidth(70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                asset,
                width: getWidth(24),
                height: getHeight(30),
                color: globalController.currentPage.value == index
                    ? AppColors.button
                    : AppColors.greyShade,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: getWidth(15),
                  fontWeight: FontWeight.w400,
                  color: globalController.currentPage.value == index
                      ? AppColors.button
                      : AppColors.greyShade,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}