
import 'package:compareapp/modules/screens/dashboard/home/more_screen.dart';
import 'package:compareapp/modules/screens/dashboard/home/products_list_screen.dart';
import 'package:compareapp/modules/screens/dashboard/home/search_screen.dart';
import 'package:compareapp/modules/screens/dashboard/home/today_deal_screen.dart';
import 'package:compareapp/modules/screens/dashboard/home/grocery_list_screen.dart';
import 'package:compareapp/resources/utils/cart_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:compareapp/resources/utils/app_colors.dart';

import 'home/home_screen.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BottomNavigationBarScreenState();
  }
}

class BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int _selectedIndex = 0;
  final GlobalKey<SliderDrawerState> sliderDrawerKey =
      GlobalKey<SliderDrawerState>();
  bool afterJoining = true;
  String? home = 'Home';

  final List<String> selectedImagePaths = [
    'assets/images/navBarIcons/home_blue.png',
    'assets/images/navBarIcons/deal_blue.png',
    'assets/images/navBarIcons/search_blue.png',
    'assets/images/navBarIcons/grocery_blue.png',
    'assets/images/navBarIcons/more_blue.png',

  ];

  final List<String> unselectedImagePaths = [
    'assets/images/unselectdNavBarIcons/home_grey.png',
    'assets/images/unselectdNavBarIcons/deal_grey.png',
    'assets/images/navBarIcons/search_blue.png',
    'assets/images/unselectdNavBarIcons/grocery_list_grey.png',
    'assets/images/unselectdNavBarIcons/more_grey.png',

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 3) {
        /* setState(() {
          home = 'Home';
        });*/
      } else if (_selectedIndex == 1) {
        /* setState(() {
          home = 'My Event';
        });*/
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.8),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            BottomNavigationBar(
            // Make transparent for Stack effect
              type: BottomNavigationBarType.fixed,
              items: List.generate(
                selectedImagePaths.length,
                    (index) => BottomNavigationBarItem(
                  icon: index == 2
                      ? const SizedBox() // Placeholder, handled by the Stack
                      : Image.asset(
                    _selectedIndex == index
                        ? selectedImagePaths[index]
                        : unselectedImagePaths[index],
                    width: 55.0,
                    height: 55.0,
                  ),
                  label: '',
                ),
              ),
              currentIndex: _selectedIndex,
              selectedItemColor: AppColors.bluecolor,
              unselectedItemColor: AppColors.greyColor,
              onTap: _onItemTapped,
            ),
            Positioned(
              top: -30.0, // Adjust to bring the icon above the bar
              child: GestureDetector(
                onTap: () => _onItemTapped(2), // Handle tapping the search icon
                child: Image.asset(
                  _selectedIndex == 2
                      ? selectedImagePaths[2]
                      : unselectedImagePaths[2],
                  width: 100.0, // Larger size for the search icon
                  height: 100.0,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children:  [
            // Replace these with your content screens
            const HomeScreen(),
            const TodayDealScreen(),
            SearchScreen(),
            //FriendsScreen(),

            //ProductsListScreen(),
             GroceryListScreen(),
            const MoreScreen(),


          ],
        ),
      ),
    );
  }
}


