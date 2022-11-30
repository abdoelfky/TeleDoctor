import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teledoctor/cubit/app_cubit.dart';
import 'package:teledoctor/cubit/app_state.dart';
import 'package:teledoctor/modules/doctor_nurse_modules/patient_details_1_screen.dart';
import 'package:teledoctor/modules/doctor_nurse_modules/patient_details_2_screen.dart';
import 'package:teledoctor/shared/constants/constants.dart';

import '../../shared/component/components.dart';

class DoctorAndNurseHomeScreen extends StatelessWidget {
  const DoctorAndNurseHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
        listener:(context,state){},
         builder:(context,state)
         {
           var cubit=AppCubit.get(context);
           Size size=MediaQuery.of(context).size;
           return SingleChildScrollView(
             physics: BouncingScrollPhysics(),
             child: Padding(
               padding:  EdgeInsets.only(top:size.height*.07,left:size.width*.08,right:size.width*.08 ),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children:
                 [
                   const Text('Good evening,',style: TextStyle(fontSize:22,
                       fontWeight:FontWeight.w600
                   ),),
                   Row(
                     children: [
                       const Text('Mrs. Rania',style: TextStyle(fontSize: 22,
                           fontWeight:FontWeight.w600
                       ),),
                       SizedBox(width: 8,),
                       Icon(Icons.front_hand_rounded,color: Colors.yellow[700],)
                     ],
                   ),
                   SizedBox(height: 22  ,),
                   Row(
                     children: [
                       Text('Patient\'s List',style: TextStyle(fontSize:18,
                           fontWeight:FontWeight.w600
                       ),),
                       Spacer(),
                       Container(
                         width:87 ,
                         height:30,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(5),
                           border: Border.all(color: Colors.grey.shade400,width: 2),

                         ),
                         child: Row(
                           children:
                           [
                             Icon((Icons.sort),color: Colors.grey.shade500),
                             Spacer(),
                             Text('A-Z',style: TextStyle(color: Colors.grey.shade500),),
                             Spacer(),
                             Icon(Icons.keyboard_arrow_up_outlined,color: Colors.grey.shade500)
                           ],
                         ),
                       )
                     ],
                   ),
                   SizedBox(height: 10,),
                   ListView.separated(
                     physics: const NeverScrollableScrollPhysics(),
                     shrinkWrap: true,
                     itemCount: 9,
                     itemBuilder:(context,index)=>buildItem(context),
                     separatorBuilder:(context,index)=>SizedBox(height:12,) ,
                   )

                 ],
               ),
             ),
           );
         }

    );
  }
}
Widget buildItem(context)=>InkWell(
  onTap: (){
    navigateTo(context,PatientDetailsScreen1());

  },
  child:   Card(
    color: Colors.grey[100],

    elevation: 5,

    shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.all(

            Radius.circular(15))),

    //  color: Colors.blue,

    child: Padding(

      padding: const EdgeInsets.only(

        right: 12, left:12,top:12,bottom:12),

      child: Container(

        child: Row(

          children: [
            //image
            Container(

              width:80 ,

              height:85 ,

              decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(6),

                  border: Border.all(

                    width: 6,

                    color:Colors.white,

                  )

              ),

              child:Center(

                child: Image(image: AssetImage('images/profile.jpeg',),
                  fit: BoxFit.fill,

                  width:100 ,

                  height:100 ,

                ),

              ),

            ),

            SizedBox(

              width: 10.0,

            ),

            Expanded(

              child: Column(

                crossAxisAlignment:

                CrossAxisAlignment.start,

                children: [

                  SizedBox(

                    height: 5,

                  ),

                  Text(

                    'Islam Magdi Abdelsattar',

                    style: TextStyle(

                        fontSize: 16.0,

                        fontWeight:

                        FontWeight

                            .bold),

                    maxLines: 1,

                    overflow: TextOverflow

                        .ellipsis,

                  ),

                  Text(

                    'Enter Data : 25,Nov 2022',

                    style: TextStyle(

                      color: Colors.grey,

                      fontSize: 13.0,

                      fontWeight:

                      FontWeight.w200,

                    ),

                    maxLines: 1,

                    overflow: TextOverflow

                        .ellipsis,

                  ),

                  Row(

                    children: [

                      Text(

                        'Room No: 3',

                        style: TextStyle(color:primaryColor),

                      ),

                      Spacer(),

                      Text('Active',style:TextStyle(color: Colors.red[800]),),

                    ],

                  ),

                ],

              ),

            ),

          ],

        ),

      ),

    ),

  ),
);