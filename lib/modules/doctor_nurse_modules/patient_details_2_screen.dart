import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/app_cubit.dart';
import '../../cubit/app_state.dart';
import '../../models/patient_model.dart';
import '../../models/user_model.dart';
import '../../shared/component/components.dart';
import '../../shared/constants/constants.dart';
import '../../shared/local/shared_preference.dart';



class PatientDetailsScreen2 extends StatelessWidget {
  const PatientDetailsScreen2({required this.patientModel,});
  final PatientModel patientModel;





  @override
  Widget build(BuildContext context) {
    var recordController =TextEditingController();
    return BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          if (state is AddNewRecordSuccessState)
          {
            showToast(text:'Record Added Successfully'
                , state: ToastStates.SUCCESS
            );
            Navigator.pop(context);
            AppCubit.get(context).getAllRecords();
          }
          else if (state is AddNewRecordErrorState)
          {
            showToast(text:'${state.error.toString()}'
                , state: ToastStates.ERROR
            );
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          Size size = MediaQuery.of(context).size;
          String uId=CacheHelper.getData(key: 'uId');
          UserModel? doctor ;
          UserModel? nurse ;
          cubit.users.forEach((element) {
            if(element.uId.toString()==patientModel.selectedDoctorUID)
            {
              doctor=element;
            }
            else if(element.uId.toString()==patientModel.selectedNurseUID)
            {
              nurse=element;
            }
          });

          return Scaffold(
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  //AppBar
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
                  //Patient Card
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
                                        userModel!.type=="DOCTOR"?
                                        Text(
                                          'Dr. ${userModel!.name}',
                                          style: TextStyle(color: Colors.grey,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ):Text(
                                          'Mrs. ${userModel!.name}',
                                          style: TextStyle(color: Colors.grey),
                                        ),

                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '#${patientModel.id}',
                                            style: TextStyle(color: Colors.blue),
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
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 25,
                        left: 20, right: 20),
                    child: defaultFormFeild0(
                      maxLines: 4,
                      inputType: TextInputType.text,
                      validatorText: 'Type the record',
                      controller: recordController,
                      labelText: 'Type The record...',

                    ),
                  ),

                  Padding(
                      padding:
                      const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child:defaultButton2(
                          height: 60,
                          string: 'ADD Record',
                          function: ()
                          {

                            cubit.addNewRecord(


                                registeredDate:DateTime.now().toString(),
                                selectedDoctorUID: patientModel.selectedDoctorUID,
                                selectedNurseUID: patientModel.selectedNurseUID,
                                patientId: patientModel.id,
                                data: recordController.text.trim(),
                                nurseName: userModel!.name,
                                patientName: patientModel.name, sendBy: userModel!.name

                            );
                            cubit.getAllRecords();

                          }
                      )

                  ),






                ],
              ),
            ),
          );
        });
  }
}


