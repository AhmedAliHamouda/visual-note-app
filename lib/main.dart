import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'UI/splash.dart';
import 'Utils/colors_utils.dart';
import 'ViewModel/localization_provider.dart';
import 'generated/l10n.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: MyMaterial()));
}

class MyMaterial extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    var localeProv = watch(localeProvider);
    return MaterialApp(
      title: 'Visual Notes',
      debugShowCheckedModeBanner: false,
      locale: localeProv.appLocal,
      theme: ThemeData(
        primaryColor: ColorsUtils.kPrimaryColor,
        scaffoldBackgroundColor: ColorsUtils.whiteColor,
      ),
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: Splash(),
    );
  }
}

