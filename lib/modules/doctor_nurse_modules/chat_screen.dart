import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:teledoctor/cubit/app_cubit.dart';
import 'package:teledoctor/cubit/app_state.dart';
import 'package:teledoctor/models/patient_model.dart';
import 'package:teledoctor/shared/constants/constants.dart';
import '../../models/user_model.dart';
import '../../models/chat_model.dart';

class ChatScreen extends StatelessWidget {
  final PatientModel patientModel;
  final UserModel? doctor;
  final UserModel? nurse;
  var messageController = TextEditingController();

  ChatScreen({super.key, required this.patientModel,
    required this.doctor,
    required this.nurse});


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Builder(
      builder: (BuildContext context) {
        AppCubit.get(context).getMessages(
          senderId: patientModel.selectedDoctorUID.toString(),
          receiverId: patientModel.selectedNurseUID.toString(),
        );

        return BlocConsumer<AppCubit, AppState>(
          listener: (context, state) {},
          builder: (context, state) {
            String receiverUID='';
            if(userModel!.type=='DOCTOR')
            {
              receiverUID=nurse!.uId!;
            }
            if(userModel!.type=='NURSE')
            {
              receiverUID=doctor!.uId!;
            }
            return Scaffold(

              body: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * .1,
                        vertical: size.height * .06),
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
                          EdgeInsets.only(top: 7.0, left: size.width * .1,right:20),
                          child: Text(
                            'Chatting Room',
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
                                child: userModel!.type=='Doctor'? Center(
                                  child: Image(
                                    image: AssetImage(
                                      'images/nurse.jpg',
                                    ),
                                    fit: BoxFit.fill,
                                    width: 100,
                                    height: 100,
                                  ),
                                ):Center(
                                  child: Image(
                                    image: AssetImage(
                                      'images/doctor.jpg',
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
                                    userModel!.type == "NURSE"
                                        ? Text(
                                      'Dr. ${doctor!.name}',
                                      style: TextStyle(
                                        color:primaryColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                        : Text(
                                      'Mrs. ${nurse?.name}',
                                      style: TextStyle(
                                        fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color:primaryColor),
                                    ),
                                    Text(
                                      'Patient: ${patientModel.name}',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
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
                  Expanded(
                    child: ConditionalBuilder(
                      condition: AppCubit.get(context).messages.length >= 0,
                      builder: (context) => Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  var message = AppCubit.get(context).messages[index];

                                  if (userModel!.uId.toString() == message.receiverId)
                                  {
                                    return buildMessage(message,context, size);
                                  }
                                  else if (userModel!.uId.toString() == message.senderId)
                                  {
                                    return buildMyMessage(message,context,size);
                                  }
                                  return Container();
                                },
                                separatorBuilder: (context, index) => SizedBox(
                                  height: 15.0,
                                ),
                                itemCount: AppCubit.get(context).messages.length,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(
                                  15.0,
                                ),
                              ),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0,
                                      ),
                                      child: TextFormField(
                                        controller: messageController,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'type your message here ...',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 50.0,
                                    color: primaryColor,
                                    child: MaterialButton(
                                      onPressed: () {
                                        AppCubit.get(context).sendMessage(
                                          senderId: userModel!.uId!
                                              .toString(),
                                          receiverId:receiverUID
                                              .toString(),
                                          dateTime: DateTime.now().toString(),
                                          text: messageController.text,
                                        );
                                      },
                                      minWidth: 1.0,
                                      child: Icon(
                                        Icons.send,
                                        size: 16.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      fallback: (context) => Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

Widget buildMessage(MessageModel model,context,Size size) => Align(
  alignment: AlignmentDirectional.centerStart,
  child: Padding(
    padding: const EdgeInsets.only(right: 80.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 2,
          color: blue5,
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 10.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            child: Container(
              width: size.width*3,
              child: Padding(
                padding:  EdgeInsets.all(8.0),
                child: Text(
                  '${model.text}',
                  style: Theme.of(context).textTheme.bodyText1,
                  //overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),


          Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(Icons.watch_later,size: 11,color: Colors.grey,),
                  ),
                  Text(
                    '${DateFormat("MM-dd hh:mm").format(DateTime.parse(model.dateTime.toString()))}',
                    style: TextStyle(
                        fontSize: 10
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  ),
);

Widget buildMyMessage(MessageModel model,context,Size size) => Align(
  alignment: AlignmentDirectional.centerEnd,
  child: Padding(
    padding: const EdgeInsets.only(left: 80.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 2,
          color: blue5,
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 10.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            child: Container(
              width: size.width*3,
              child: Padding(
                padding:  EdgeInsets.all(8.0),
                child: Text(
                  '${model.text}',
                  style: Theme.of(context).textTheme.bodyText1,
                  //overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),


          Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(Icons.watch_later,size: 11,color: Colors.grey,),
                  ),
                  Text(
                    '${DateFormat("MM-dd hh:mm").format(DateTime.parse(model.dateTime.toString()))}',
                    style: TextStyle(
                        fontSize: 10
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  ),
);