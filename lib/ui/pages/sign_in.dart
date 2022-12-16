import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/ui/widgets/custom_button_navigation_item.dart';
import 'package:airplane/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/theme.dart';

// ignore_for_file: prefer_const_constructors
class SignIn extends StatelessWidget {
  SignIn({super.key});

  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 30, left: 22),
        child: Text('Sign In with\nYour\nExisting Account',
            style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semiBold)),
      );
    }

    Widget InputSection() {
      Widget emailname() {
        return CustomTextFormField(
          title: 'Email Address',
          hinText: 'Your Email Address',
          controller: emailController,
        );
      }

      Widget passwordInput() {
        return CustomTextFormField(
          title: 'Password',
          hinText: 'Your Password',
          obsecureText: true,
          controller: passwordController,
        );
      }

      Widget submitButton() {
        //paste blocconsumer sukes dan error
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSucces) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/main-page', (route) => false);
            } else if (state is AuthFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: kRedColor,
                  content: Text(state.error),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(child: CircularProgressIndicator());
            }

            return customButton(
                title: 'Sign In',
                onPressed: () {
                  print(passwordController.text);

                  context.read<AuthCubit>().signIn(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                });
          },
        );
      }

      return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(defaultRadius)),
        child: Column(
          children: [emailname(), passwordInput(), submitButton()],
        ),
      );
    }

    Widget tacButton() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(
              context, '/sign-up'); //agar kemabli ke page sebelumnya
        },
        child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 50, bottom: 73),
            child: Text(
              'Don\'t Have An Account? Sign Up',
              style: greyTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: light,
                  decoration: TextDecoration.underline),
            )),
      );
    }

//untuk list daftar nama

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: defaultMargin)),
            title(),
            InputSection(),
            tacButton(),
          ],
        ),
      ),
    );
  }
}
