import 'package:flutter/material.dart';
import 'package:movieapp_api/screens/fav_screen.dart';
import 'package:movieapp_api/screens/forgetpassword_screen.dart';

// Imports

import 'package:movieapp_api/screens/home_screen.dart';
import 'package:movieapp_api/screens/details_screen.dart';
import 'package:movieapp_api/screens/onboard.dart';
import 'package:movieapp_api/screens/profile_screen.dart';
import 'package:movieapp_api/screens/splash_screen.dart';

// Exports

export 'package:movieapp_api/screens/home_screen.dart';
export 'package:movieapp_api/screens/details_screen.dart';

// Routes

Map<String, WidgetBuilder> getAplicationRoutes() => <String, WidgetBuilder>{
      HomeScreen.routeName: (BuildContext context) => const HomeScreen(),
      DetailsScreen.routeName: (BuildContext context) => const DetailsScreen(),
      OnboardingScreen.routeName: (BuildContext context) => OnboardingScreen(),
      WelcomePage.routeName: (BuildContext context) => WelcomePage(),
      ProfileScreen.routeName: (BuildContext context) => ProfileScreen(),
      FavScreen.routeName: (BuildContext context) => const FavScreen(),
      ForgotPasswordScreen.routeName: (BuildContext context) => ForgotPasswordScreen(),
    };
