import 'package:airplane/cubit/page_cubit.dart';
import 'package:airplane/ui/pages/home_page.dart';
import 'package:airplane/ui/pages/setting_page.dart';
import 'package:airplane/ui/pages/transaction_page.dart';
import 'package:airplane/ui/pages/wallet_page.dart';
import 'package:airplane/ui/widgets/custom_bottom_navigation_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/theme.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();
          break;
        case 1:
          return TransactionPage();
          break;
        case 2:
          return WalletPage();
          break;
        case 3:
          return SettingPage();
        default:
          return HomePage();
      }
    }

    Widget customBottomNavigation() {
      return Align(
          alignment: Alignment.bottomCenter, //untuk membuat widget di bawah
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 30, left: 24, right: 24),
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: kWhiteColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomBottomNavigationItem(
                  imageurl: 'assets/icon_home.png',
                  index: 0,
                ),
                CustomBottomNavigationItem(
                  index: 1,
                  imageurl: 'assets/icon_booking.png',
                ),
                CustomBottomNavigationItem(
                  index: 2,
                  imageurl: 'assets/icon_card.png',
                ),
                CustomBottomNavigationItem(
                  index: 3,
                  imageurl: 'assets/icon_setting.png',
                ),
              ],
            ),
          ));
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
            backgroundColor: kBackgroundColor,
            body: Stack(
              children: [buildContent(currentIndex), customBottomNavigation()],
            ));
      },
    );
  }
}
