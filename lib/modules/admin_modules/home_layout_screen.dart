import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:teledoctor/cubit/app_cubit.dart';
import 'package:teledoctor/cubit/app_state.dart';
import 'package:teledoctor/modules/start_modules/splash_screen.dart';
import 'package:teledoctor/shared/constants/constants.dart';


class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;

    return BlocConsumer<AppCubit,AppState>(
      listener:(context,state)
      {

      }
      ,
        builder:(context,state)
        {

          var cubit=AppCubit.get(context);

          return isDoctor!&&userModel!=null||
              isNurse!&&userModel!=null||isAdmin!&&adminModel!=null?
          Scaffold(
            body:isDoctor!||isNurse!?
            cubit.doctorAndNurseLayOutScreens[cubit.currentIndex]:
            cubit.adminLayOutScreens[cubit.currentIndex],
            bottomNavigationBar: SalomonBottomBar(
              currentIndex: cubit.currentIndex,
              onTap:(index)=>cubit.changeBottomNav(index),
              selectedItemColor: primaryColor,
              unselectedItemColor: Colors.grey[600],
              margin: const EdgeInsets.all(15),
              items:
              [
                SalomonBottomBarItem(
                    icon: Icon(Iconsax.home_25,size: size.width*.09,),
                  title: Text("Home")),

                isDoctor!||isNurse!?
                SalomonBottomBarItem(
                    icon: Icon(Iconsax.receipt_search,size: size.width*.09,),
                    title: Text("Search")):
                SalomonBottomBarItem(
                    icon: Icon(Iconsax.receipt_2_15,size: size.width*.09,),
                    title: Text("Receipt"))

                ,
                isDoctor!||isNurse!?
                SalomonBottomBarItem(
                    icon: Icon(Icons.notifications_active,size: size.width*.09,),
                    title: Text("Notification")):
                SalomonBottomBarItem(
                    icon: Icon(Icons.person_add_alt_1_sharp,size: size.width*.09,),
                    title: Text("Add")),


                SalomonBottomBarItem(
                    icon: Icon(Icons.person,size: size.width*.09,),
                    title: Text("Profile")),


              ],

            )
          ):SplashScreen();
        }
    );
  }
}

