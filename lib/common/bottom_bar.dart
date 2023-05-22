import 'package:amazon_clone/constants/global_variable.dart';
import 'package:amazon_clone/features/account/screens/account_screen.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class BottomBar extends StatefulWidget {
  static const String routeName = 'home-screen';
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const Center(
      child: Text('Cart Page'),
    ),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariable.selectedNavBarColor,
        unselectedItemColor: GlobalVariable.unselectedNavBarColor,
        backgroundColor: GlobalVariable.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          //HomePage
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                  color: _page == 0
                      ? GlobalVariable.selectedNavBarColor
                      : GlobalVariable.backgroundColor,
                  width: bottomBarBorderWidth,
                )),
              ),
              child: const Icon(Icons.home_outlined),
            ),
            label: '',
          ),

          //Account/profile
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                  color: _page == 1
                      ? GlobalVariable.selectedNavBarColor
                      : GlobalVariable.backgroundColor,
                  width: bottomBarBorderWidth,
                )),
              ),
              child: const Icon(Icons.person_outlined),
            ),
            label: '',
          ),

          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                  color: _page == 2
                      ? GlobalVariable.selectedNavBarColor
                      : GlobalVariable.backgroundColor,
                  width: bottomBarBorderWidth,
                )),
              ),
              child: const badges.Badge(
                badgeContent: Text('2'),
                child: Icon(Icons.shopping_cart_outlined),
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
