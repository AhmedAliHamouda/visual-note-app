import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visual_notes/Helpers/routes.dart';
import 'package:visual_notes/Utils/colors_utils.dart';
import 'package:visual_notes/ViewModel/localization_provider.dart';

import 'Screens/home/home_screen.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 4),
      () async {
        await context.read(localeProvider).fetchLocale();
        CustomNavigator.pushScreenReplacement(widget: HomeScreen(), context: context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorsUtils.kPrimaryColor,
      body: Center(
        child: Text(
          'WELCOME',
          maxLines: 3,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30.0),
        ),
      ),
    );
  }
}
