import 'package:flutter/material.dart';
import 'package:mobil_store/pages/userFolder/account.dart';
import 'package:mobil_store/pages/cart.dart';
import 'package:mobil_store/pages/category.dart';
import 'package:mobil_store/pages/favorites.dart';
import 'package:mobil_store/pages/home.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';
import '../constants/const.dart';

Const constrant = Const();

// Const.motionTabBarController = MotionTabBarController(initialIndex: 0, length: 5, vsync: this);
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Const.motionTabBarController =
        MotionTabBarController(initialIndex: 0, length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: Const.motionTabBarController,
        children: <Widget>[
          HomeScreen(),
          CategoryScreen(),
          FavoriteScreen(),
          CartScreen(),
          AccountScreen(),
        ],
      ),
      bottomNavigationBar: MotionTabBar(
        controller: Const.motionTabBarController,
        initialSelectedTab: "Ana Sayfa",
        //useSafeArea: true,

        labels: const [
          "Ana Sayfa",
          "Kategoriler",
          "Favoriler",
          "Sepetim",
          "Hesabım"
        ],
        icons: const [
          Icons.home,
          Icons.border_all_outlined,
          Icons.favorite,
          Icons.shopping_cart_outlined,
          Icons.person,
        ],
        badges: [
          null,
          null,
          null,
          null,
          null,
        ],
        tabSize: 50,
        tabBarHeight: 55,
        textStyle: TextStyle(
          fontSize: 12,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        tabIconColor: Color(0xFFAFAFAF),
        tabIconSize: 28.0,
        tabIconSelectedSize: 26.0,
        tabSelectedColor: Color(0xff8b52fc),
        tabIconSelectedColor: Color(0xffab8af1),
        tabBarColor: Colors.white,

        onTabItemSelected: (int value) {
          setState(() {
            Const.motionTabBarController!.index = value;
          });
          print(Const.motionTabBarController!.index.toString() + "index");
        },
      ),
    );
  }
}

/*

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobil_store/pages/accountPage.dart';
import 'package:mobil_store/pages/cartPage.dart';
import 'package:mobil_store/pages/categoryPage.dart';
import 'package:mobil_store/pages/favoritesPage.dart';
import 'package:mobil_store/pages/homePage.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../constants/const.dart';

Const constrant = Const();

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      CategoryScreen(),
      FavoriteScreen(),
      CartScreen(),
      AccountScreen()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home), // Icon(CupertinoIcons.home),
        title: ("Ana Sayfa"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
            Icons.border_all_outlined), // Icon(CupertinoIcons.square_grid_2x2),
        title: ("Kategoriler"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.favorite), // Icon(CupertinoIcons.heart),
        title: ("Favoriler"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
            Icons.shopping_cart_outlined), //Icon(CupertinoIcons.shopping_cart),
        title: ("Sepetim"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person), // Icon(CupertinoIcons.person),
        title: ("Hesabım"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("controller: ${constrant.controller}");
    return PersistentTabView(context,
        controller: constrant.controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true, //! klavye ekranı kaldırsın mı ?
        stateManagement: false, //! state yönetimi True idi
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style3);
  }
}
*/
