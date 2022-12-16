import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/cubit/destination_cubit.dart';
import 'package:airplane/cubit/page_cubit.dart';
import 'package:airplane/cubit/seat_cubit_cubit.dart';
import 'package:airplane/cubit/transaction_cubit.dart';
import 'package:airplane/ui/pages/bonus_page.dart';
import 'package:airplane/ui/pages/get_started.dart';
import 'package:airplane/ui/pages/main_page.dart';
import 'package:airplane/ui/pages/sign_in.dart';
import 'package:airplane/ui/pages/sign_up.dart';
import 'package:airplane/ui/pages/succes_checkout_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore_for_file: prefer_const_constructors
import 'ui/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(create: ((context) => AuthCubit())),

        //menambahkan bloc provider
        BlocProvider(create: ((context) => DestinationCubit())),
        BlocProvider(
          create: (context) => SeatCubitCubit(),
        ),
        BlocProvider(create: ((context) => TransactionCubit())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        //home: BonusPage(),
        routes: {
          '/': (context) => SplashPage(),
          '/get_started': (context) => GetStartedPage(),
          '/sign-up': (context) => SignUp(),
          '/sign-in': (context) => SignIn(),
          '/bonus': (context) => BonusPage(),
          '/main-page': (context) => MainPage(),
          '/succes':(context)=>SuccesCheckoutPage(),
        },
      ),
    );
  }
}
