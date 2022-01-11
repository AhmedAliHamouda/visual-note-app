/*
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class CustomBottomNavBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final provider=ref.watch(appNavigationProvider);
    void _navigateToPage(int pageIndex) {
      if (Navigator.canPop(context)) {
        Navigator.of(context).pop();
      }
      final appNavProvider = ref.read(appNavigationProvider);
      appNavProvider.pageController.animateToPage(pageIndex,
          duration: const Duration(milliseconds: 10), curve: Curves.easeInOut);

      appNavProvider.navigatorIndex = pageIndex;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),

     */
/* child: FloatingNavbar(
        currentIndex: provider.navigatorIndex,
        onTap: (int val) {
          _navigateToPage(val);
        },
        borderRadius: 19.0,
        selectedBackgroundColor: Colors.black12.withOpacity(0.001),
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black87,
        iconSize: 25.0,
        items: [
          FloatingNavbarItem(customWidget: _customNavBarItem(image: 'assets/images/home.png',index: 0,provider: provider)),
          FloatingNavbarItem(customWidget: _customNavBarItem(image: 'assets/images/timetable.png',index: 1,provider: provider)),
          FloatingNavbarItem(customWidget: _customNavBarItem(image: 'assets/images/user.png',index: 2,provider: provider)),
          FloatingNavbarItem(customWidget: _customNavBarItem(image: 'assets/images/setting-lines.png',index: 3,provider: provider)),
        ],
      ),*//*


    );
  }

  // _customNavBarItem({String image,int index,var provider}){
  //   return Column(
  //     children: [
  //       Image.asset(
  //         image,
  //         width: 25.0,
  //         height: 25.0,
  //         color: provider.navigatorIndex==index ?ColorsUtils.primaryYellow:ColorsUtils.whiteColor,
  //       ),
  //       SizedBox(
  //         height: 5.0,
  //       ),
  //       provider.navigatorIndex==index? Icon(
  //         Icons.circle,
  //         size: 7,
  //         color: ColorsUtils.primaryYellow,
  //       ):Container(
  //         height: 7,
  //       ),
  //     ],
  //   );
  //
  // }
}


*/
