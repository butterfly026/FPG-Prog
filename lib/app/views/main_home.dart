import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpg_flutter/app/controllers/auth_controller.dart';
import 'package:fpg_flutter/app/controllers/main_home_controller.dart';
import 'package:fpg_flutter/app/widgets/app_image.dart';
import 'package:fpg_flutter/data/models/bottom_nav_model.dart';
import 'package:fpg_flutter/utils/theme/app_colors.dart';
import 'package:get/get.dart';

class MainHome extends GetView<MainHomeController> {
  final AuthController authController = Get.find();

  List<BottomNavModel> bottomNavs = [
    BottomNavModel(name: "首页", icon: 'iconshouye1'),
    BottomNavModel(
      name: "寻宝",
      icon: 'iconshouye1',
    ), //'iconinformation'),
    BottomNavModel(name: "资讯", icon: 'iconcommunity'),
    BottomNavModel(name: "下载APP", icon: 'iconchess'),
    BottomNavModel(name: "棋牌", icon: 'iconchess'),
    BottomNavModel(name: "聊天室", icon: 'iconliaotianshi'),
    BottomNavModel(name: "我的", icon: 'iconwode'),
  ];

  @override
  Widget build(BuildContext context) {
    final appThemeColor = Theme.of(context).extension<AppColors>();
    return Scaffold(
        body: Obx(() => Center(
              child: controller.getCurrentPage(),
            )),
        bottomNavigationBar: Obx(
          () => BottomAppBar(
            padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 0.w),
            height: 90.w,
            color: Color(0xffC5CBC6),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(bottomNavs.length, (index) {
                      var nav = bottomNavs[index];
                      return GestureDetector(
                        onTap: () {
                          controller.activeIndex.value = index;
                        },
                        child: Expanded(
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Column(
                                children: [
                                  AppImage.svgByAsset('tabbar/${nav.icon}.svg',
                                      width: 30.w,
                                      height: 30.w,
                                      color:
                                          controller.activeIndex.value == index
                                              ? Color(0xff0277BD)
                                              : Color(0xffffffff)),
                                  Text(
                                    '${nav.name}',
                                    style: TextStyle(
                                        color: controller.activeIndex.value ==
                                                index
                                            ? Color(0xff0277BD)
                                            : Color(0xffffffff),
                                        fontSize: 22.sp),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                              if (index == 3 || index == 5)
                                AppImage.network(
                                  'https://wwwstatic01.fdgdggduydaa008aadsdf008.xyz/images/icon/mobile_bottom_hot_icon.gif',
                                  width: 30.w,
                                  height: 30.w,
                                )
                            ],
                          ),
                        ),
                      );
                    })
                  ]),
            ),
          ),
        )
        // Obx(
        //   () => BottomNavigationBar(
        //     // backgroundColor: const Color(0xFFB00020),
        //     items: const <BottomNavigationBarItem>[
        //       BottomNavigationBarItem(
        //         icon: Icon(Icons.home),
        //         label: '首页',
        //       ),
        //       BottomNavigationBarItem(
        //         icon: Icon(Icons.star),
        //         label: '专栏',
        //       ),
        //       BottomNavigationBarItem(
        //         icon: Icon(Icons.article),
        //         label: '资讯',
        //       ),
        //       BottomNavigationBarItem(
        //         icon: Icon(Icons.download),
        //         label: '下载APP',
        //       ),
        //       BottomNavigationBarItem(
        //         icon: Icon(Icons.support_agent),
        //         label: '联系客服',
        //       ),
        //       BottomNavigationBarItem(
        //         icon: Icon(Icons.person),
        //         label: '我的',
        //       ),
        //     ],
        //     // currentIndex: controller.currentIndex.value,
        //     selectedItemColor: Colors.yellow,
        //     unselectedItemColor: Colors.grey,
        //     showSelectedLabels: true, // Show labels for selected items
        //     showUnselectedLabels: true, // Show labels for unselected items
        //     currentIndex: controller.activeIndex.value,
        //     onTap: controller.activeIndex.call,
        //   ),
        // ),

        );
  }
}
