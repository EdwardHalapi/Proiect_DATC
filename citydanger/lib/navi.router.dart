// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'screens/home_screen.dart';
import 'screens/home_screen_admin.dart';
import 'screens/login_screen.dart';
import 'screens/login_screen_admin.dart';
import 'screens/signup_screen.dart';

class Routes {
  static const String loginScreen = '/';
  static const String signUpScreen = '/sign-up-screen';
  static const String loginAdmin = '/login-admin';
  static const String homePage = '/home-page';
  static const String homePageAdmin = '/home-page-admin';
  static const all = <String>{
    loginScreen,
    signUpScreen,
    loginAdmin,
    homePage,
    homePageAdmin,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.loginScreen, page: LoginScreen),
    RouteDef(Routes.signUpScreen, page: SignUpScreen),
    RouteDef(Routes.loginAdmin, page: LoginAdmin),
    RouteDef(Routes.homePage, page: HomePage),
    RouteDef(Routes.homePageAdmin, page: HomePageAdmin),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    LoginScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const LoginScreen(),
        settings: data,
      );
    },
    SignUpScreen: (data) {
      var args = data.getArgs<SignUpScreenArguments>(
        orElse: () => SignUpScreenArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignUpScreen(func: args.func),
        settings: data,
      );
    },
    LoginAdmin: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const LoginAdmin(),
        settings: data,
      );
    },
    HomePage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomePage(),
        settings: data,
      );
    },
    HomePageAdmin: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomePageAdmin(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// SignUpScreen arguments holder class
class SignUpScreenArguments {
  final Function? func;
  SignUpScreenArguments({this.func});
}
