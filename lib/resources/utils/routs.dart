
import 'package:compareapp/modules/screens/AdvertScreens/add_adverts_screen.dart';
import 'package:compareapp/modules/screens/EventsByLocationScreens/find_event_by_location_screen.dart';
import 'package:compareapp/modules/screens/HostDetails/details_tab_screen.dart';
import 'package:compareapp/modules/screens/ShoppingScreens/shop_detail_screen.dart';
import 'package:compareapp/modules/screens/app_setup/fill_data_active_screen.dart';
import 'package:compareapp/modules/screens/app_setup/fill_data_bio_screen.dart';
import 'package:compareapp/modules/screens/app_setup/interested_serving_screen.dart';
import 'package:compareapp/modules/screens/auth/activate_biometric_screen.dart';
import 'package:compareapp/modules/screens/auth/create_profile_screen.dart';
import 'package:compareapp/modules/screens/auth/forgot_password_screen.dart';
import 'package:compareapp/modules/screens/auth/login_screen.dart';
import 'package:compareapp/modules/screens/auth/login_via_phone_screen.dart';
import 'package:compareapp/modules/screens/auth/otp_screen.dart';
import 'package:compareapp/modules/screens/auth/register_screen.dart';
import 'package:compareapp/modules/screens/auth/set_new_password_screen.dart';
import 'package:compareapp/modules/screens/dashboard/bottom_nav_bar.dart';
import 'package:compareapp/modules/screens/dashboard/home/about_us_screen.dart';
import 'package:compareapp/modules/screens/dashboard/home/contact_us_screen.dart';
import 'package:compareapp/modules/screens/dashboard/home/futuregram_detail.dart';
import 'package:compareapp/modules/screens/dashboard/home/grocery_list_screen.dart';
import 'package:compareapp/modules/screens/dashboard/home/products_list_screen.dart';
import 'package:compareapp/modules/screens/dashboard/home/small_business_screen.dart';
import 'package:compareapp/modules/screens/live_user_tabs/tab_layout.dart';
import 'package:compareapp/modules/screens/menu_screens/contact_list_screen.dart';
import 'package:compareapp/modules/screens/menu_screens/deals_screen.dart';
import 'package:compareapp/modules/screens/menu_screens/edit_profile_screen.dart';
import 'package:compareapp/modules/screens/menu_screens/find_friends_screen.dart';
import 'package:compareapp/modules/screens/menu_screens/invite_list_screen.dart';
import 'package:compareapp/modules/screens/menu_screens/profile_screen.dart';
import 'package:compareapp/modules/screens/notification_screen.dart';
import 'package:compareapp/modules/screens/send%20_chat_screen.dart';
import 'package:flutter/material.dart';


class AppRoute {
  Route onGenerateRoute(RouteSettings routeArguments) {
    print('Navigating to: ${routeArguments.name}');
    print('Arguments received: ${routeArguments.arguments}');
    switch (routeArguments.name) {

      case '/LoginScreen':
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case '/activateBioScreen':
        return MaterialPageRoute(builder: (context) => const ActivateBiometricScreen());


      case '/ForgotPassword':
        return MaterialPageRoute(builder: (context) => const ForgotPassScreen());
      case '/SetNewPassword':
        return MaterialPageRoute(builder: (context) => const SetNewPasswordScreen());


      case '/RegisterScreen':
        return MaterialPageRoute(builder: (context) => const RegisterScreen(),
          settings: routeArguments,
        );
      case '/CreateProfileScreen':
        return MaterialPageRoute(builder: (context) => const CreateProfileScreen());
      case '/OtpScreen':
        return MaterialPageRoute(builder: (context) => const OtpScreen());
      case '/PhoneLoginScreen':
        return MaterialPageRoute(builder: (context) => const LoginViaPhone());
      case '/AllProductsScreen':
        return MaterialPageRoute(
          builder: (context) => const ProductsListScreen(),
          settings: routeArguments, // Forward the RouteSettings, including arguments
        );
      case '/GroceryList':
        return MaterialPageRoute(
          builder: (context) => const GroceryListScreen(),
          settings: routeArguments, // Forward the RouteSettings, including arguments
        );
      case '/productDetailsScreen':
        return MaterialPageRoute(builder: (context) => const ShopDetailScreen(),
            settings: routeArguments,
        );
      case '/InterestedServingScreen':
        return MaterialPageRoute(builder: (context) => const InterestedServingScreen());
      case '/FillData1':
        return MaterialPageRoute(builder: (context) => const FillDataScreen());
      case '/FillData2':
        return MaterialPageRoute(builder: (context) => const FillDataBioScreen());
      case '/BottomNavigationBarScreen':
        return MaterialPageRoute(
            builder: (context) => const BottomNavigationBarScreen());
      case '/AboutUsScreen':
        return MaterialPageRoute(builder: (context) => const AboutUsScreen());
      case '/ContactUsScreen':
        return MaterialPageRoute(builder: (context) => const ContactUsScreen());

      case '/HostDetailTabScreen':
        return MaterialPageRoute(
            builder: (context) => const DetailTab());
      case '/AddAdverts':
        return MaterialPageRoute(
            builder: (context) => const AddAdverts());


      case '/EventByLocationScreen':
        return MaterialPageRoute(
            builder: (context) => const EventByLocationScreen());

      case '/FuturegramDetails':
        return MaterialPageRoute(
            builder: (context) => const FutureGramDetail());



      case '/LiveUserTab':
        return MaterialPageRoute(
            builder: (context) =>  const LiveUserTab());
      case '/ProfileScreen':
        return MaterialPageRoute(
            builder: (context) =>   const ProfileScreen());
      case '/CommentScreen':
        return MaterialPageRoute(
            builder: (context) =>  const SendChatScreen());
      case '/NotificationScreen':
        return MaterialPageRoute(
            builder: (context) =>  const NotificationScreen());
      case '/EditProfile':
        return MaterialPageRoute(
            builder: (context) =>  const EditProfileScreen());
      case '/FindFriends':
        return MaterialPageRoute(
            builder: (context) =>  const FindFriendsScreen());
      case '/ContactList':
        return MaterialPageRoute(
            builder: (context) =>  const ContactListScreen());
      case '/InviteList':
        return MaterialPageRoute(
            builder: (context) =>  const InviteListScreen());
      case '/Deals':
        return MaterialPageRoute(
            builder: (context) =>  const DealsScreen());
      case '/SmallBusinessScree':
        return MaterialPageRoute(
            builder: (context) =>  const SmallBusinessScreen());
      // case '/Profile':
      //   return MaterialPageRoute(builder: (context) => const Profile());
      // case '/EditProfile':
      //   var data = routeArguments.arguments;
      //   if (data is ParentDataModel) {
      //     return MaterialPageRoute(
      //         builder: (context) => EditProfile(parentDataModel: data));
      //   }
      //   return MaterialPageRoute(builder: (context) => const Profile());
      default:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
    }
  }
}
