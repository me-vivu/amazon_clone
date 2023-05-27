import 'package:amazon_clone/constants/global_variable.dart';
import 'package:amazon_clone/features/account/screens/account_screen.dart';
import 'package:amazon_clone/features/admin/screens/post_screen.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class AdminBottomBar extends StatefulWidget {
  static const String routeName = 'home-screen';
  const AdminBottomBar({Key? key}) : super(key: key);

  @override
  State<AdminBottomBar> createState() => _AdminBottomBarState();
}

class _AdminBottomBarState extends State<AdminBottomBar> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [

    const PostsScreen(),
    const Center(
      child: Text('Analytics Page'),
    ),
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
              child: const Icon(Icons.analytics_outlined),
            ),
            label: '',
          ),

          //ORDERS
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
              child: const Icon(Icons.all_inbox_outlined),
            ),
            label: '',
          ),


        ],
      ),
    );
  }
}
