import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:time_luxe/core/global/app_theme.dart';
import 'package:time_luxe/features/auth/sign_in/presentation/views/sign_in_view.dart';

import 'core/network/local/cache_helper.dart';
import 'core/utils/firebase_options.dart';
import 'core/utils/my_bloc_observer.dart';
import 'core/utils/service_locator.dart';

// TODO: Look at how to use sign in with google to look at how use SHA1

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  ServiceLocator().setupServiceLocators();

  Bloc.observer = MyBlocObserver();

  await CacheHelper.initSharedPref();

  setSystemUIOverlayStyle();

  runApp(const TimeLuxeApp());
}

class TimeLuxeApp extends StatelessWidget {
  const TimeLuxeApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme(),
      home: const SignInView(),
    );
  }
}

void setSystemUIOverlayStyle() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    CustomHelper.setTheSystemUIOverlayStyle(),
  );
}
