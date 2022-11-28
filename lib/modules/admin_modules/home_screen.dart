import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teledoctor/cubit/app_cubit.dart';
import 'package:teledoctor/cubit/app_state.dart';
import 'package:teledoctor/modules/admin_modules/add_new_account_screen.dart';
import 'package:teledoctor/modules/admin_modules/add_new_room_screen.dart';
import 'package:teledoctor/modules/admin_modules/empty_rooms_screen.dart';
import 'package:teledoctor/modules/admin_modules/full_rooms_screen.dart';
import 'package:teledoctor/shared/component/components.dart';
import 'package:teledoctor/shared/constants/constants.dart';

import 'edit_account_screen.dart';
import 'edit_acount_1_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
      listener:(context,state){} ,
      builder:(context,state)
      {
        var cubit=AppCubit.get(context);
        Size size=MediaQuery.of(context).size;
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding:  EdgeInsets.only(top:size.height*.065,left:size.width*.08,right:size.width*.08 ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children:
              [
                const Text('Manage User',style: TextStyle(fontSize: 18,
                fontWeight:FontWeight.w600
                ),
                ),
                const Text('Accounts',style: TextStyle(fontSize: 18,
                    fontWeight:FontWeight.w600
                ),),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:
                  [
                    HomeScreenItem(size,'add new account','Add New Account',context,AddNewAccountScreen()),
                    const SizedBox(width:15,),
                    HomeScreenItem(size,'edit account','Edit Account',context,EditScreen1()),



                  ],
                ),
                const SizedBox(height: 20,),
                const Text('Manage Hospital',style: TextStyle(fontSize: 18,
                    fontWeight:FontWeight.w600
                ),
                ),
                const Text('Rooms',style: TextStyle(fontSize: 18,
                    fontWeight:FontWeight.w600
                ),),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:
                  [
                    HomeScreenItem(size,'add new room','Add New Room',context,AddNewRoomsScreen()),
                    const SizedBox(width:15,),
                    HomeScreenItem(size,'full rooms','Full Rooms',context,FullRoomsScreen()),



                  ],
                ),
                const SizedBox(height: 10,),
                HomeScreenItem(size,'empty rooms','Empty Rooms',context,EmptyRoomsScreen()),





              ],
            ),
          ),
        );
      } ,

    );
  }
}

Widget HomeScreenItem(size,logoName,text,context,screen)=>InkWell(
  onTap: ()
  {
    navigateTo(context,screen);
  },
  child:   Container(
    width:size.width*.4 ,
    height:size.height*.2 ,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color:blue5,
        )
    ),
    child:Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
      [
        Image(image: AssetImage('images/${logoName}.png',),
          width:size.width*.27 ,
          height:size.height*.1 ,
        ),
        SizedBox(height: 10,),
        Text('${text}',style: TextStyle(fontSize: 15,
            fontWeight:FontWeight.w600
        ),
        ),

      ],
    ),
  ),
);
