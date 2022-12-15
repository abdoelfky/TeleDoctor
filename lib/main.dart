import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teledoctor/cubit/app_cubit.dart';
import 'package:teledoctor/modules/admin_modules/home_layout_screen.dart';
import 'package:teledoctor/modules/start_modules/onBoarding_screen.dart';
import 'package:teledoctor/shared/constants/constants.dart';
import 'package:teledoctor/shared/local/shared_preference.dart';
import 'modules/start_modules/login/login_cubit/login_cubit.dart';
import 'modules/start_modules/login/login_screen.dart';
import 'modules/start_modules/splash_screen.dart';

Future<void> main() async {
  // بيتأكد ان كل حاجه هنا في الميثود خلصت و بعدين يتفح الابلكيشن
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      // options: const FirebaseOptions(
      //     apiKey: "AIzaSyAIDHvKqrJ4g4kz49y00xmMPaTE8mi1Y7Q",
      //     authDomain: "teledoctor-94083.firebaseapp.com",
      //     projectId: "teledoctor-94083",
      //     storageBucket: "teledoctor-94083.appspot.com",
      //     messagingSenderId: "134827706672",
      //     appId: "1:134827706672:web:62160ff2c031c3cd0920f5",
      //     measurementId: "G-HBETJMWD9F")
  );

  await CacheHelper.init();
  Widget widget;
  bool onBoarding = false;
  if (await CacheHelper.getData(key: 'onBoarding') != null &&
      await CacheHelper.getData(key: 'onBoarding') == true) {
    if (CacheHelper.getData(key: 'uId') != null) {
      userType = CacheHelper.getData(key: 'userType');
      print(uId);
      uId = CacheHelper.getData(key: 'uId');
      widget = HomeLayoutScreen();
    } else {
      widget = LoginScreen();
    }
  } else {
    CacheHelper.saveData(key: 'onBoarding', value: false);
    onBoarding = await CacheHelper.getData(key: 'onBoarding');
    widget = OnBoardingScreen();
  }

  runApp(MyApp(
    onBoarding: onBoarding,
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  final bool onBoarding;

  const MyApp({required this.onBoarding, required this.startWidget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => AppCubit()
              ..getAllNotifications()
              ..getAllRecords()
              ..getAllPatients()
              ..getAllRooms()
              ..getUserData()
              ..getAllUsers(),
          ),
          BlocProvider(
            create: (BuildContext context) => LoginCubit(),
          )
        ],
        child: MaterialApp(
          theme: ThemeData(
            textTheme: GoogleFonts.amikoTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: startWidget,
        ));
  }
}
