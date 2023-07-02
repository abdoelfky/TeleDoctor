import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teledoctor/cubit/app_cubit.dart';
import 'package:teledoctor/cubit/app_state.dart';

class MyDialog extends StatelessWidget {
  final String receiverId;
   final String patientID;
  MyDialog(
      {super.key,
        required this.receiverId,
        required this.patientID,
       });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
        builder:(context,state)
        {
          return
          AlertDialog(
            title: Text('Choose an option'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text('Camera'),
                    onTap: () {
                      AppCubit.get(context).getImage(
                          camera: true,
                          receiverId: receiverId,
                          patientID: patientID);
                      Navigator.pop(context, 'attach');
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  GestureDetector(
                    child: Text('Attach Image'),
                    onTap: () {
                      AppCubit.get(context).getImage(
                          camera: false,
                          receiverId: receiverId,
                          patientID: patientID);
                      Navigator.pop(context, 'attach');
                    },
                  ),
                ],
              ),
            ),
          );
        },
        listener:(context,state){});
  }
}
