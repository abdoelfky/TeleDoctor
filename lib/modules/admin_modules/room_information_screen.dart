import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:teledoctor/models/room_model.dart';
import 'package:teledoctor/modules/admin_modules/add_patient_screen.dart';
import '../../cubit/app_cubit.dart';
import '../../cubit/app_state.dart';
import '../../models/patient_model.dart';
import '../../shared/component/components.dart';
import '../../shared/constants/constants.dart';
import 'checkout_screen.dart';

class RoomInformation extends StatelessWidget {
  final RoomModel roomModel;

  const RoomInformation({super.key, required this.roomModel});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
        listener: (context, state)
        {

        },
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          Size size = MediaQuery.of(context).size;
          List<PatientModel> patientList=[];
          AppCubit.get(context).patients.forEach((element)
          {
            if(element.roomNo.toString()==roomModel.roomNo)
            {
              patientList.add(element);
            }

          });
          return Scaffold(
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * .1,
                        vertical: size.height * .07),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: blue5,
                              borderRadius: BorderRadius.circular(25)),
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 25,
                              )),
                        ),
                        Padding(
                          padding:
                          EdgeInsets.only(top: 7.0, left: size.width * .12),
                          child: Text(
                            'Room  #${roomModel.roomNo}',
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 22),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 10),
                        child: Image.asset(
                          'images/info.png',
                          width: size.width * .05,
                          height: size.height * .08,
                        ),
                      ),
                      Text(
                        'Room Information',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: blue3),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: size.width * .08),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey.shade300,
                              ),
                              width: size.width * .2,
                              height: size.height * .1,
                              child: Column(
                                children: [
                                  Image.asset(
                                    'images/bed.png',
                                    width: size.width * .09,
                                    height: size.height * .06,
                                  ),
                                  Text(
                                    '${roomModel.patientList!.length}/${roomModel.bedsNo} beds',
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: size.width * .02),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey.shade300),
                              width: size.width * .2,
                              height: size.height * .1,
                              child: Column(
                                children: [
                                  Image.asset(
                                    'images/dolar.png',
                                    width: size.width * .09,
                                    height: size.height * .06,
                                  ),
                                  Text(
                                    '${roomModel.pricePerNight}\$',
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: size.width * .09),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey.shade300),
                              width: size.width * .2,
                              height: size.height * .1,
                              child: Column(
                                children: [
                                  Image.asset(
                                    'images/roomno.png',
                                    width: size.width * .09,
                                    height: size.height * .06,
                                  ),
                                  Text(
                                    '#${roomModel.roomNo}',
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 10),
                        child: Image.asset(
                          'images/infooo.png',
                          width: size.width * .05,
                          height: size.height * .08,
                        ),
                      ),
                      Text(
                        'Patient Information',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: blue3),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: patientList.length,
                      itemBuilder: (context, index) => buildItem(context,patientList[index],),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 8,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      navigateTo(context, AddNewPatientScreen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              width: 2,
                              color:blue5,
                            )
                        ),
                        child:Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image.asset(
                                'images/add.png',
                                width: size.width * .19,
                                height: size.height * .08,
                              ),
                            ),
                            SizedBox(height:2,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(' Add New Patient',style: TextStyle(fontSize: 15,
                                    fontWeight:FontWeight.bold,
                                    color: blue3
                                )),
                                Text(' Click to add patient in this room',style: TextStyle(fontSize: 15,
                                    fontWeight:FontWeight.w500,
                                    color: Colors.grey
                                )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

Widget buildItem(context,PatientModel patientModel) => InkWell(
  onTap: () {
    navigateTo(context, CheckOutScreen(model: patientModel,));
  },
  child: Card(
    color: Colors.grey[100],

    elevation: 5,

    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15))),

    //  color: Colors.blue,

    child: Padding(
      padding: const EdgeInsets.only(
        right: 12,
        left: 12,
      ),
      child: Container(
        child: Row(
          children: [
            //image
            Container(
              width: 80,
              height: 85,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    width: 6,
                    color: Colors.white,
                  )),
              child: Center(
                child: Image(
                  image: AssetImage(
                    'images/profile.jpeg',
                  ),
                  fit: BoxFit.fill,
                  width: 100,
                  height: 100,
                ),
              ),
            ),

            SizedBox(
              width: 10.0,
            ),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${patientModel.name}',
                    style: TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(

                    'Enter Date :${DateFormat("yyyy-MM-dd").format(DateTime.parse(patientModel.registeredDate.toString()))}',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13.0,
                      fontWeight: FontWeight.w200,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Text(
                        'Room No: ${patientModel.roomNo}',
                        style: TextStyle(color: primaryColor),
                      ),
                      Spacer(),
                      TextButton(
                        child: Text('Check Out'),
                        onPressed: () {
                          navigateTo(context, CheckOutScreen(model: patientModel,));
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
