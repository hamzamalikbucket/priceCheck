
import 'package:compareapp/modules/screens/dashboard/home/more_screen.dart';
import 'package:compareapp/modules/screens/dashboard/home/products_list_screen.dart';
import 'package:compareapp/modules/screens/dashboard/home/search_screen.dart';
import 'package:compareapp/modules/screens/dashboard/home/today_deal_screen.dart';
import 'package:compareapp/modules/screens/dashboard/home/grocery_list_screen.dart';
import 'package:compareapp/resources/utils/cart_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:compareapp/resources/utils/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../resources/utils/constants.dart';
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
    'assets/images/navBarIcons/search_blue.svg',
    'assets/images/navBarIcons/grocery_blue.png',
    'assets/images/navBarIcons/more_blue.png',

  ];

  final List<String> unselectedImagePaths = [
    'assets/images/unselectdNavBarIcons/home_grey.png',
    'assets/images/unselectdNavBarIcons/deal_grey.png',
    'assets/images/navBarIcons/search_blue.svg',
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
    return PopScope(
      canPop: false, // Initially set to false to prevent popping by default
      onPopInvoked: (bool didPop) {
        if (didPop) {
          return; // If the pop was allowed by other means (e.g., Navigator.pop()), do nothing.
        }
        // Custom logic to handle the back navigation attempt
        // For example, show a confirmation dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Confirm Exit'),
              content: const Text('Are you sure you want to exit?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false), // Don't allow pop
                  child: const Text('No'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true), // Allow pop
                  child: const Text('Yes'),
                ),
              ],
            );
          },
        ).then((value) {
          if (value == true) {
            setState(() {
              Constants.verifiedViaPhone=false;
            });
            clearLoginState();
            Navigator.of(context).pop(); // Actually pop the route if confirmed
          }
        });
      },
      child: Scaffold(

        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
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
                      color: _selectedIndex == index? AppColors.appGreenColor:AppColors.greyColor,
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
                selectedItemColor: AppColors.appGreenColor,
                unselectedItemColor: AppColors.greyColor,
                onTap: _onItemTapped,
              ),
              Positioned(
                top: -30.0, // Adjust to bring the icon above the bar
                child: GestureDetector(
                  onTap: () => _onItemTapped(2), // Handle tapping the search icon
                  child:
                  SvgPicture.asset(
                    _selectedIndex == 2
                        ? selectedImagePaths[2]
                        : unselectedImagePaths[2],
                    width: 100.0, // Larger size for the search icon
                    height: 100.0,
                  ),
               /*   Image.asset(

                    _selectedIndex == 2
                        ? selectedImagePaths[2]
                        : unselectedImagePaths[2],
                    width: 100.0, // Larger size for the search icon
                    height: 100.0,
                  ),*/
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
      ),
    );
  }
}
Future<void> clearLoginState() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('isLoggedIn');
  CartManager().cartList.clear();
}


