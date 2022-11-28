import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teledoctor/shared/constants/constants.dart';
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

  bool? isSuper=false;
  void userLogin({
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
      CacheHelper.saveData(key: 'uId', value:value.user!.uid);

//check if user is super admin
      await FirebaseFirestore.instance.collection('admins').doc(value.user!.uid)
          .get().then((value){
        isSuper=value.data()!.containsValue('super admin');
      })       ;
      print(isSuper);
      if(isSuper!) {
        emit(LoginSuccessState(uId));

      }
        else
        {
          emit(LoginErrorState('this user can\' access these data'));

        }

      })
        .catchError((error)
    {
      emit(LoginErrorState(error.toString()));
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