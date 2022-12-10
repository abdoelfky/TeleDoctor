import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:teledoctor/models/user_model.dart';
import 'package:teledoctor/models/user_model.dart';
import 'package:teledoctor/modules/doctor_nurse_modules/chat_screen.dart';
import 'package:teledoctor/modules/doctor_nurse_modules/edit_normal_rates_screen.dart';
import 'package:teledoctor/modules/doctor_nurse_modules/patient_details_2_screen.dart';
import '../../cubit/app_cubit.dart';
import '../../cubit/app_state.dart';
import '../../models/patient_model.dart';
import '../../models/record_model.dart';
import '../../models/user_model.dart';
import '../../models/user_model.dart';
import '../../models/user_model.dart';
import '../../shared/component/components.dart';
import '../../shared/constants/constants.dart';
import '../../shared/local/shared_preference.dart';

class PatientDetailsScreen1 extends StatelessWidget {
  final PatientModel patientModel;

  const PatientDetailsScreen1({
    super.key,
    required this.patientModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          Size size = MediaQuery.of(context).size;
          String uId = CacheHelper.getData(key: 'uId');

          UserModel? doctor;
          UserModel? nurse;
          cubit.users.forEach((element) {
            if (element.uId.toString() == patientModel.selectedDoctorUID) {
              doctor = element;
            } else if (element.uId.toString() ==
                patientModel.selectedNurseUID) {
              nurse = element;
            }
          });

          List<RecoredModel> records = cubit.records;
          List<RecoredModel> patientRecords = [];

          records.forEach((recordElement) {
            if (patientModel.id == recordElement.patientId.toString()) {
              patientRecords.insert(patientRecords.length, recordElement);
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
                          padding: EdgeInsets.only(
                              top: 7.0, left: size.width * .12, right: 20),
                          child: Text(
                            'Patient Details',
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 22),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
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
                                          color: primaryColor,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        userModel!.type == "DOCTOR"
                                            ? Text(
                                                'Dr. ${userModel!.name}',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              )
                                            : Text(
                                                'Mrs. ${userModel!.name}',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '#${patientModel.id}',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
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
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 20, left: 20, right: 10),
                        child: Image.asset(
                          'images/personal.png',
                          width: size.width * .05,
                          height: size.height * .08,
                        ),
                      ),
                      Text(
                        'Personal Info.',
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
                        padding: EdgeInsets.only(
                          left: size.width * .03,
                          right: size.width * .02,
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  width: 2,
                                  color: blue5,
                                ),
                              ),
                              width: size.width * .2,
                              height: size.height * .1,
                              child: Column(
                                children: [
                                  Image.asset(
                                    'images/age.png',
                                    width: size.width * .09,
                                    height: size.height * .06,
                                  ),
                                  Text(
                                    '${patientModel.age} Years',
                                    style:
                                        TextStyle(
                                            fontSize:(size.height*size.width)*.00004 ,
                                            fontWeight: FontWeight.bold),
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
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  width: 2,
                                  color: blue5,
                                ),
                              ),
                              width: size.width * .2,
                              height: size.height * .1,
                              child: Column(
                                children: [
                                  Image.asset(
                                    'images/gender.png',
                                    width: size.width * .09,
                                    height: size.height * .06,
                                  ),
                                  Text(
                                    '${patientModel.gender}',
                                    style:
                                    TextStyle(
                                        fontSize:(size.height*size.width)*.00004 ,
                                        fontWeight: FontWeight.bold),
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
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  width: 2,
                                  color: blue5,
                                ),
                              ),
                              width: size.width * .2,
                              height: size.height * .1,
                              child: Column(
                                children: [
                                  Image.asset(
                                    'images/date.png',
                                    width: size.width * .09,
                                    height: size.height * .06,
                                  ),
                                  Text(
                                    '${DateFormat("yy-MM-dd")
                                        .format(DateTime
                                        .parse(patientModel.registeredDate.toString()))}',
                                    style:TextStyle(
                                        fontSize:(size.height*size.width)*.00004 ,
                                        fontWeight: FontWeight.bold),
                                  ),
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
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  width: 2,
                                  color: blue5,
                                ),
                              ),
                              width: size.width * .2,
                              height: size.height * .1,
                              child: Column(
                                children: [
                                  Image.asset(
                                    'images/status.png',
                                    width: size.width * .09,
                                    height: size.height * .06,
                                  ),
                                  Text(
                                    'Registered',
                                    style:
                                    TextStyle(
                                        fontSize:(size.height*size.width)*.0000345 ,
                                        fontWeight: FontWeight.bold),                                  )
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
                          'images/hospital.png',
                          width: size.width * .05,
                          height: size.height * .08,
                        ),
                      ),
                      Text(
                        'Hospital Info.',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: blue3),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * .03),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade300,
                      ),
                      width: size.width * .93,
                      height: size.height * .2,
                      child: Padding(
                        padding:EdgeInsets.symmetric(horizontal:(size.height*size.width)*.00004 ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 8, left: 8),
                                  child: Image.asset(
                                    'images/doctor.png',
                                    width: size.width * .09,
                                    height: size.height * .06,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Container(
                                    width:80,

                                    child: Text(
                                      'Dr ${doctor!.name}',
                                      overflow: TextOverflow.fade,
                                      style:TextStyle(
                                          fontSize:(size.height*size.width)*.00004 ,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 15),
                                  child: Image.asset(
                                    'images/bed.png',
                                    width: size.width * .09,
                                    height: size.height * .06,
                                  ),
                                ),
                                Padding(
                                  padding:EdgeInsets.only(right:(size.height*size.width)*.00004 ),
                                  child: Text(

                                    'Room No. ${patientModel.roomNo}',

                                    style:TextStyle(
                                        fontSize:(size.height*size.width)*.00004 ,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 8, left: 8),
                                  child: Image.asset(
                                    'images/nurse.png',
                                    width: size.width * .09,
                                    height: size.height * .06,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Container(
                                    width: 80,
                                    child: Text(
                                      'Mrs ${nurse!.name}',
                                      overflow: TextOverflow.fade,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                TextButton(
                                  child: doctor!.uId == uId
                                      ? Text(
                                          'Chat with Nurse.',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15),
                                        )
                                      : Text(
                                          'Chat with Doctor.',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15),
                                        ),
                                  onPressed: () {
                                    navigateTo(
                                        context,
                                        ChatScreen(
                                            patientModel: patientModel,
                                            doctor: doctor,
                                            nurse: nurse));
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, bottom: 20, left: 20, right: 10),
                          child: Image.asset(
                            'images/normal rates.png',
                            width: size.width * .05,
                            height: size.height * .08,
                          ),
                        ),
                        Text(
                          'Normal Rates',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: blue3),
                        ),
                        Spacer(),
                        uId == patientModel.selectedNurseUID
                            ? TextButton(
                                onPressed: () {
                                  navigateTo(
                                      context,
                                      EditNormalRatesScreen(
                                          patient: patientModel));
                                },
                                child: Text(
                                  'Edit',
                                  style: TextStyle(
                                      color: primaryColor, fontSize: 16),
                                ))
                            : SizedBox()
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * .07),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  width: 2,
                                  color: blue5,
                                ),
                              ),
                              width: size.width * .2,
                              height: size.height * .1,
                              child: Column(
                                children: [
                                  Image.asset(
                                    'images/diabetes.png',
                                    width: size.width * .09,
                                    height: size.height * .06,
                                  ),
                                  Text(
                                    '${patientModel.suger}',
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
                            EdgeInsets.symmetric(horizontal: size.width * .06),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  width: 2,
                                  color: blue5,
                                ),
                              ),
                              width: size.width * .2,
                              height: size.height * .1,
                              child: Column(
                                children: [
                                  Image.asset(
                                    'images/bloood.png',
                                    width: size.width * .09,
                                    height: size.height * .06,
                                  ),
                                  Text(
                                    '${patientModel.pressure}',
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
                            EdgeInsets.symmetric(horizontal: size.width * .06),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  width: 2,
                                  color: blue5,
                                ),
                              ),
                              width: size.width * .2,
                              height: size.height * .1,
                              child: Column(
                                children: [
                                  Image.asset(
                                    'images/temp.png',
                                    width: size.width * .09,
                                    height: size.height * .06,
                                  ),
                                  Text(
                                    '${patientModel.temp}',
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
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 20, left: 20, right: 10),
                        child: Image.asset(
                          'images/medrec.png',
                          width: size.width * .05,
                          height: size.height * .08,
                        ),
                      ),
                      Text(
                        'Medical Record',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: blue3),
                      )
                    ],
                  ),
                  uId == patientModel.selectedNurseUID
                      ? Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20),
                          child: defaultButton2(
                              width: size.width * .7,
                              height: 60,
                              string: 'ADD New Recored',
                              function: () {
                                navigateTo(
                                    context,
                                    PatientDetailsScreen2(
                                      patientModel: patientModel,
                                    ));
                              }))
                      : SizedBox(),

                  //recored
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: patientRecords.length,
                      itemBuilder: (context, index) => buildItem(
                          context, size, patientRecords[index], nurse!),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 8,
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

Widget buildItem(context, size, RecoredModel recordModel, UserModel nurse) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: size.width * .03),
    child: Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.shade300,
          ),
          width: size.width * .93,
          height: size.height * .2,
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Mrs. ${nurse.name}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.watch_later,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${DateFormat("MM-dd hh:mm").format(DateTime.parse(recordModel.registeredDate.toString()))}',
                          style: TextStyle(color: Colors.blue),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${recordModel.data}',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
