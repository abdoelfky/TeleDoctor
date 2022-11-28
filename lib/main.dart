import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teledoctor/cubit/app_cubit.dart';
import 'package:teledoctor/modules/start_modules/onBoarding_screen.dart';
import 'package:teledoctor/shared/constants/constants.dart';
import 'package:teledoctor/shared/local/shared_preference.dart';
import 'modules/start_modules/login/login_cubit/login_cubit.dart';
import 'modules/start_modules/login/login_screen.dart';
import 'modules/start_modules/splash_screen.dart';

Future<void> main() async {
  // بيتأكد ان كل حاجه هنا في الميثود خلصت و بعدين يتفح الابلكيشن
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await CacheHelper.init();
  Widget widget;
  bool onBoarding =false;
  if (await CacheHelper.getData(key: 'onBoarding')!=
      null&&await CacheHelper.getData(key: 'onBoarding')==true) {
    if (CacheHelper.getData(key: 'uId')!=null) {
      print(uId);
      uId = CacheHelper.getData(key: 'uId');
      widget = SplashScreen();
    } else {
      widget = LoginScreen();
    }    }
   else {
    CacheHelper.saveData(key: 'onBoarding',value: false);
    onBoarding = await CacheHelper.getData(key: 'onBoarding');
    widget = OnBoardingScreen();
  }


  runApp(MyApp(onBoarding: onBoarding, startWidget: widget,));}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  final bool onBoarding;
  const MyApp({required this.onBoarding, required this.startWidget});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider(create: (BuildContext context) =>AppCubit() ,
        ),
        BlocProvider(create: (BuildContext context) =>LoginCubit(),
        )

      ],
      child:MaterialApp(
            theme: ThemeData(
            textTheme: GoogleFonts.lailaTextTheme(
              Theme.of(context).textTheme,
        ),),
          debugShowCheckedModeBanner: false,
          home:startWidget,


    )
    );
  }
}


