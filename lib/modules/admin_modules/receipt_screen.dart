import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/app_cubit.dart';
import '../../cubit/app_state.dart';
import '../../shared/component/components.dart';
import '../../shared/constants/constants.dart';
import 'checkout_screen.dart';

class ReceiptScreen extends StatelessWidget {
  const ReceiptScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var roomNo = TextEditingController();
    return BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          Size size = MediaQuery.of(context).size;
          return Scaffold(
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:15,vertical: 10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                            EdgeInsets.only(top: 7.0, left: size.width * .24),
                            child: Text(
                              'Check Out',
                              style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22),
                            ),
                          ),

                          //patient name
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: defaultFormFeild3(
                          controller: roomNo, labelText: 'Enter Room No'),
                    ),
                    Padding(
                        padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child:defaultButton2(
                            string: 'Search',
                            function: ()
                            {

                            }
                        )

                    ),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder:(context,index)=>buildItem(context),
                      separatorBuilder:(context,index)=>SizedBox(height:8,) ,
                    )

                  ],
                ),
              ),
            ),
          );
        });
  }
}

Widget buildItem(context)=>InkWell(
  onTap: (){
    navigateTo(context,

        CheckOutScreen());
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

          right: 12, left:12,),

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

                    'Shefo',

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

                      TextButton(

                        child:

                        Text('Check Out'),

                        onPressed: () {

                          navigateTo(context,

                              CheckOutScreen());

                        },

                      ),

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