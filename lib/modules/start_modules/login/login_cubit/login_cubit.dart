import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teledoctor/shared/constants/constants.dart';
import '../../../../cubit/app_cubit.dart';
import '../../../../models/admin_model.dart';
import '../../../../models/user_model.dart';
import '../../../../shared/local/shared_preference.dart';
import 'login_state.dart';



class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);


  bool isObsecured=true;

  void changeVisibility()
  {
    isObsecured=!isObsecured;
    emit(ChangeVisibilityState());
  }



  Future<void> userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());

    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) async {
      print(value.user!.email);
      print(value.user!.uid);

      //check if user is not super admin
      await FirebaseFirestore.instance.collection('admins').doc(value.user!.uid)
          .get().then((value){

        CacheHelper.saveData(key: 'isSuper', value:value.data()!.containsValue('super admin'));
        CacheHelper.saveData(key: 'isAdmin', value:value.data()!.containsValue('ADMIN'));
        CacheHelper.saveData(key: 'isNurse', value:value.data()!.containsValue('NURSE'));
        CacheHelper.saveData(key: 'isDoctor', value:value.data()!.containsValue('DOCTOR'));
        isSuper= CacheHelper.getData(key: 'isSuper');
        isDoctor= CacheHelper.getData(key: 'isDoctor');
        isAdmin= CacheHelper.getData(key: 'isAdmin');
        isNurse= CacheHelper.getData(key: 'isNurse');

      })       ;
      // print(isSuper!);
      // print(isAdmin!);
      // print(isDoctor!);
      // print(isNurse!);
      if(!isSuper!) {
        CacheHelper.saveData(key: 'uId', value:value.user!.uid);
        await getUserData(value.user!.uid);

        emit(LoginSuccessState(uId));

      }
      else
      {
        emit(LoginErrorState('this user can\'t access these data'));

      }






      })
        .catchError((error)
    {
      emit(LoginErrorState(error.toString()));
    });
  }


  Future<void> getUserData(uId) async {

    emit(GetAdminsLoadingState());

    await FirebaseFirestore.instance.collection('admins').doc(uId).get()
        .then((value) async {
      isSuper= CacheHelper.getData(key: 'isSuper');
      isDoctor= CacheHelper.getData(key: 'isDoctor');
      isAdmin= CacheHelper.getData(key: 'isAdmin');
      isNurse= CacheHelper.getData(key: 'isNurse');
      //if user is Admin
      print(isAdmin);
      print(isDoctor);
      print(isNurse);
      if(isAdmin!){

        adminModel=AdminModel.fromJson(value.data()!);
        CacheHelper.saveData(key: 'userType', value:adminModel!.type).then((value)
        {
          userType=value.toString().toUpperCase();
          print(userType);
        });


      }
      //if user is Doctor or Nurse
      if(isDoctor!||isNurse!) {
        userModel = UserModel.fromJson(value.data()!);
        print(value.data());
        CacheHelper.saveData(key: 'userType', value: userModel!.type)
            .then((value) {
          userType = value.toString().toUpperCase();
          print(userType);

        });

      }


      emit(GetAdminsSuccessState());


    })
        .catchError((onError) {
      emit(GetAdminsErrorState(onError.toString()));
    });
  }



  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ChangePasswordVisibilityState());
  }
}