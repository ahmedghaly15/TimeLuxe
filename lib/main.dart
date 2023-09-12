import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reusable_components/reusable_components.dart';

import '/TimeLuxe/presentation/view/manager/time_luxe_cubit.dart';
import '/core/global/app_theme.dart';
import '/features/splash/presnetation/view/splash_view.dart';
import 'core/utils/helper.dart';
import 'core/network/local/cache_helper.dart';
import 'core/utils/firebase_options.dart';
import 'core/utils/my_bloc_observer.dart';
import 'core/utils/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Bloc.observer = MyBlocObserver();

  ServiceLocator().setupServiceLocators();

  await CacheHelper.initSharedPref();

  setSystemUIOverlayStyle();

  runApp(const TimeLuxeApp());
}

class TimeLuxeApp extends StatelessWidget {
  const TimeLuxeApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (context) =>
          serviceLocator.get<TimeLuxeCubit>()..getUserData(Helper.uId),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.appTheme(),
          home: const SplashView(),
        ),
      ),
    );
  }
}

void setSystemUIOverlayStyle() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    CustomHelper.setTheSystemUIOverlayStyle(),
  );
}
