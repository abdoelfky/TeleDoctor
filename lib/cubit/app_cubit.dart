import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teledoctor/modules/doctor_nurse_modules/doctor_nurse_home_screen.dart';
import '../models/admin_model.dart';
import '../modules/admin_modules/add_patient_screen.dart';
import '../modules/admin_modules/home_screen.dart';
import '../modules/admin_modules/profile_screen.dart';
import '../modules/admin_modules/receipt_screen.dart';
import '../modules/doctor_nurse_modules/doctor_nurse_notification_screen.dart';
import '../modules/doctor_nurse_modules/doctor_nurse_profile_screen.dart';
import '../modules/doctor_nurse_modules/search_for_petient_screen.dart';
import '../modules/start_modules/login/login_screen.dart';
import '../shared/component/components.dart';
import '../shared/constants/constants.dart';
import '../shared/local/shared_preference.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);

//   //add new admin
//   void addNewAdmin({
//     required String email,
//     required String password,
//     required String name,
//     required String phone,
//     required String id,
//     required String hospitalLocation,
//     required String hospitalName,
//
//
//   }) {
//     emit(AddNewAdminRegisterLoadingState());
//
//     FirebaseAuth.instance
//         .createUserWithEmailAndPassword(email: email, password: password)
//         .then((value) {
//       print(value.user?.email);
//       print(value.user?.uid);
//       userCreate(email: email, name: name,password: password ,phone: phone, uId: value.user?.uid,
//           id:id, hospitalLocation: hospitalLocation, hospitalName:hospitalName);
//       emit(AddNewAdminRegisterSuccessState());
//
//     }).catchError((onError) {
//       emit(AddNewAdminErrorState(onError.toString()));
//     });
//   }
//
//   void userCreate({
//     required String email,
//     required String name,
//     required String phone,
//     required String? uId,
//     required String id,
//     required String hospitalLocation,
//     required String hospitalName,
//     required String password
//
//
//   }) {
//     AdminModel model=AdminModel(
//         name:name ,
//         email:email ,
//         phone:phone ,
//         uId: uId,
//       id:id,
//       hospitalLocation:hospitalLocation,
//       hospitalName:hospitalName,
//       password:password,
//       type: 'admin'
//     );
//     FirebaseFirestore.instance
//         .collection('admins')
//         .doc(uId)
//         .set(model.toMap()).then((value)
//     {
//       emit(AdminCreateUserSuccessState());
//     }).catchError((onError)
//     {
//       emit(AdminCreateUserErrorState(onError.toString()));
//
//     });
//   }
//
//get user data
  AdminModel? userData;

  void getUserData() {

    emit(GetAdminsLoadingState());
    FirebaseFirestore.instance.collection('admins').get()
        .then((value) async {
      value.docs.forEach((element)
      {


        if(element.data()['uId']==uId){
          userData=AdminModel.fromJson(element.data());
          CacheHelper.saveData(key: 'userType', value:userData!.type).then((value)
          {
            userType=value.toString().toUpperCase();
          });
        }
      });


        emit(GetAdminsSuccessState());


    })
        .catchError((onError) {
      emit(GetAdminsErrorState(onError.toString()));
    });
  }
//
// //update admin data
//   Future<void> updateAdminData({
//     required String email,
//     required String name,
//     required String phone,
//     required String uId,
//     required String id,
//     required String hospitalLocation,
//     required String hospitalName,
//     required String password
//
//   }) async {
//     emit(UpdateAdminDataLoadingState());
//     AdminModel model = AdminModel(
//       name: name,
//       phone: phone,
//       email: email,
//       id: id,
//       hospitalLocation:hospitalLocation ,
//       hospitalName:hospitalName ,
//       password: password,
//       uId: uId,
//       type: 'admin'
//
//
//     );
//
//
//
//     FirebaseFirestore.instance.collection('admins').doc(uId).update(model.toMap())
//      .then((value)async
//  {
//
//    getUsers();
//    emit(UpdateAdminDataSuccessState());
//  }).catchError((onError)
//  {
//    emit(UpdateAdminDataErrorState(onError.toString()));
//
//  });
//
//   }
//
//
// //delete admin data
//   Future<void> deleteAdminData({
//     required String uId,
//   }) async {
//     emit(DeleteAdminDataLoadingState());
//     FirebaseFirestore.instance.collection('admins').doc(uId).delete()
//         .then((value)async
//     {
//
//       getUsers();
//       emit(DeleteAdminDataSuccessState());
//     }).catchError((onError)
//     {
//       emit(DeleteAdminDataErrorState(onError.toString()));
//
//     });
//
//   }
//
//
// void logOut(context)
// {
//   CacheHelper.removeData(key: 'uId');
//   navigateAndEnd(context,LoginScreen());
//
// }




  List<Widget> adminLayOutScreens =
  [
    HomeScreen(),
    ReceiptScreen(),
    AddNewPatientScreen(),
    ProfileScreen(),

  ];

  List<Widget> doctorAndNurseLayOutScreens =
  [
    DoctorAndNurseHomeScreen(),
    SearchForPatientScreen(),
    DoctorAndNurseNotificationScreen(),
    DoctorAndNurseProfileScreen(),

  ];

  int currentIndex = 0;

  void changeBottomNav(int index) {

      currentIndex = index;
      emit(BottomNavigationBarChangedState());


  }





  bool isObsecured=true;

  void changeVisibility()
  {
    isObsecured=!isObsecured;
    emit(ChangeVisibilityState());
  }

  bool isLast =false;

  void changeOnBoarding(index,boardingLength)
  {
    if(index == boardingLength - 1)
    {
      isLast=true;
      emit(ChangeOnBoardingState());
    }else
    {

      isLast=false;
      emit(ChangeOnBoardingState());
    }
  }


  void submit(context) {
    CacheHelper.saveData(
      key: 'onBoarding',
      value: true,
    ).then((value)
    {
      if (value==true) {
        navigateAndEnd(
          context,
          LoginScreen(),
        );
      }
    });
  }


}
