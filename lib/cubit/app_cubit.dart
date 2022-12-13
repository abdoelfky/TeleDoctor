import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:intl/intl.dart';
import 'package:teledoctor/models/notification_model.dart';
import 'package:teledoctor/models/patient_model.dart';
import 'package:teledoctor/models/room_model.dart';
import 'package:teledoctor/modules/doctor_nurse_modules/doctor_nurse_home_screen.dart';
import '../models/admin_model.dart';
import '../models/record_model.dart';
import '../models/user_model.dart';
import '../modules/admin_modules/add_patient_screen.dart';
import '../modules/admin_modules/home_screen.dart';
import '../modules/admin_modules/profile_screen.dart';
import '../modules/admin_modules/receipt_screen.dart';
import '../models/chat_model.dart';
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

  //add new user
  void addNewUser({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String id,
    required String type,
    required String jop,
  }) {
    emit(AddUserRegisterLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user?.email);
      print(value.user?.uid);
      userCreate(
          email: email,
          name: name,
          phone: phone,
          uId: value.user?.uid,
          id: id,
          jop: jop,
          type: type,
          password: password);
      emit(AddUserRegisterSuccessState());
    }).catchError((onError) {
      emit(AddUserErrorState(onError.toString()));
    });
  }

  void userCreate(
      {required String email,
      required String name,
      required String phone,
      required String? uId,
      required String id,
      required String jop,
      required String type,
      required String password}) {
    UserModel model = UserModel(
        uId: uId,
        id: id,
        email: email,
        phone: phone,
        name: name,
        jop: jop,
        password: password,
        type: type);
    FirebaseFirestore.instance
        .collection('admins')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      getAllUsers();
      emit(CreateUserSuccessState());
    }).catchError((onError) {
      emit(CreateUserErrorState(onError.toString()));
    });
  }

//get user data

  Future<void> getUserData() async {
    emit(GetAdminsLoadingState());

    await FirebaseFirestore.instance
        .collection('admins')
        .doc(uId)
        .get()
        .then((value) async {
      isSuper = CacheHelper.getData(key: 'isSuper');
      isDoctor = CacheHelper.getData(key: 'isDoctor');
      isAdmin = CacheHelper.getData(key: 'isAdmin');
      isNurse = CacheHelper.getData(key: 'isNurse');
      //if user is Admin
      print(isAdmin);
      print(isDoctor);
      print(isNurse);
      if (isAdmin!) {
        adminModel = AdminModel.fromJson(value.data()!);
        CacheHelper.saveData(key: 'userType', value: adminModel!.type)
            .then((value) {
          userType = value.toString().toUpperCase();
          print(userType);
        });
      }
      //if user is Doctor or Nurse
      if (isDoctor! || isNurse!) {
        userModel = UserModel.fromJson(value.data()!);
        print(value.data());
        CacheHelper.saveData(key: 'userType', value: userModel!.type)
            .then((value) {
          userType = value.toString().toUpperCase();
          print(userType);
        });
      }

      emit(GetAdminsSuccessState());
    }).catchError((onError) {
      emit(GetAdminsErrorState(onError.toString()));
    });
  }

//
//update admin data
  Future<void> updateUserData({
    required String email,
    required String name,
    required String phone,
    required String uId,
    required String id,
    required String password,
    required String jop,
    required String type,
  }) async {
    emit(UpdateUserDataLoadingState());
    UserModel model = UserModel(
        uId: uId,
        id: id,
        email: email,
        phone: phone,
        name: name,
        jop: jop,
        password: password,
        type: type);

    FirebaseFirestore.instance
        .collection('admins')
        .doc(uId)
        .update(model.toMap())
        .then((value) async {
      getAllUsers();
      emit(UpdateUserDataSuccessState());
    }).catchError((onError) {
      emit(UpdateUserDataErrorState(onError.toString()));
    });
  }

//delete admin data
  Future<void> deleteUserData(
      {required String uId,
      required String email,
      required String password}) async {
    emit(DeleteUserDataLoadingState());
    FirebaseFirestore.instance
        .collection('admins')
        .doc(uId)
        .delete()
        .then((value) async {
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);
      await FirebaseAuth.instance.currentUser!
          .reauthenticateWithCredential(credential);
      await FirebaseAuth.instance.currentUser!.delete();

      getAllUsers();
      emit(DeleteUserDataSuccessState());
    }).catchError((onError) {
      emit(DeleteUserDataErrorState(onError.toString()));
    });
  }

  void logOut(context) {
    CacheHelper.removeData(key: 'uId');
    navigateAndEnd(context, LoginScreen());
  }

//get doctors and nurses
  List<UserModel> users = [];
  List<UserModel> doctors = [];
  List<UserModel> nurses = [];

  Future<void> getAllUsers() async {
    users = [];
    doctors = [];
    nurses = [];
    emit(GetAllUsersLoadingState());
    await FirebaseFirestore.instance
        .collection('admins')
        .get()
        .then((value) async {
      value.docs.forEach((element) {
        users.add(UserModel.fromJson(element.data()));
      });
      users.forEach((element) {
        if (element.type.toString().toUpperCase() == 'DOCTOR') {
          doctors.add(element);
        } else if (element.type.toString().toUpperCase() == 'NURSE') {
          nurses.add(element);
        }
      });

      emit(GetAllUsersSuccessState());
    }).catchError((onError) {
      emit(GetAllUsersErrorState(onError.toString()));
    });
  }

  bool? isExist = false;
  bool addRoomIsLoading=false;

  Future<void> addNewRoom({
    required roomNo,
    required floorNumber,
    required bedsNo,
    required pricePerNight,
  }) async {
    emit(AddNewRoomLoadingState());
    addRoomIsLoading=true;
    RoomModel model = RoomModel(
        roomNo: roomNo,
        floorNumber: floorNumber,
        bedsNo: bedsNo,
        pricePerNight: pricePerNight,
        roomType: 'EMPTY',
        patientList: []);

    try {
      final snapShot = await FirebaseFirestore.instance
          .collection('rooms')
          .doc(roomNo)
          .get();

      if (snapShot.exists) {
        addRoomIsLoading=false;
        emit(AddNewRoomErrorState('This room is already exist'));

        isExist = false;
      } else {
        await FirebaseFirestore.instance
            .collection('rooms')
            .doc(roomNo)
            .set(model.toMap())
            .then((value) {

          emit(AddNewRoomSuccessState());
          addRoomIsLoading=false;

        }).catchError((onError) {
          emit(AddNewRoomErrorState(onError.toString()));
          addRoomIsLoading=false;

        });
        isExist = true;
      }
    } catch (e) {}
  }

  List<RoomModel> rooms = [];

  Future<void> getAllRooms() async {
    rooms = [];

    emit(GetAllRoomsLoadingState());
    FirebaseFirestore.instance.collection('rooms').get().then((value) async {
      value.docs.forEach((element) {
        rooms.add(RoomModel.fromJson(element.data()));
      });

      emit(GetAllRoomsSuccessState());
    }).catchError((onError) {
      emit(GetAllRoomsErrorState(onError.toString()));
    });
  }

  List patientList = [];
  bool addPatientIsLoading=false;

  Future<void> addNewPatient({
    required name,
    required age,
    required roomNo,
    required selectedDoctorUID,
    required selectedNurseUID,
    required gender,
    required id,
    required registeredDate,
    required newPatient,
    required patientEmail
  }) async {
    emit(AddNewPatientLoadingState());

    addPatientIsLoading=true;
    patientList = [];
    rooms.forEach((element) {
      if (element.roomType.toString().toUpperCase() == 'EMPTY' &&
          element.roomNo.toString() == roomNo) {
        patientList = element.patientList!;
      }
    });
    if (patientList.isNotEmpty) {
      patientList.insert(patientList.length, newPatient);
    } else {
      patientList.insert(0, newPatient);
    }

    rooms.forEach((element) async {
      if (element.roomType.toString().toUpperCase() == 'EMPTY' &&
          element.roomNo.toString() == roomNo &&
          element.bedsNo.toString() == (patientList.length).toString()) {
        await FirebaseFirestore.instance
            .collection('rooms')
            .doc(roomNo)
            .update({'roomType': 'FULL'});

        print('${element.bedsNo},,,,:${patientList.length}');
      }
    });
    print('patientList: ${patientList}');

    await FirebaseFirestore.instance
        .collection('rooms')
        .doc(roomNo)
        .update({'patientList': patientList});
    PatientModel model = PatientModel(

        name: name,
        age: age,
        roomNo: roomNo,
        selectedDoctorUID: selectedDoctorUID,
        selectedNurseUID: selectedNurseUID,
        gender: gender,
        id: id,
        registeredDate: registeredDate,
        temp: '-',
        suger: '-',
        pressure: '-',
        patientEmail: patientEmail);

    try {
      final snapShot =
          await FirebaseFirestore.instance.collection('patients').doc(id).get();

      if (snapShot.exists) {
        addPatientIsLoading=false;
        emit(AddNewPatientErrorState('This patient is already exist'));

        isExist = false;
      } else {
        await FirebaseFirestore.instance
            .collection('patients')
            .doc(id)
            .set(model.toMap())
            .then((value) async {
          await FirebaseFirestore.instance
              .collection('rooms')
              .doc(roomNo)
              .update({'patientList': patientList}).then((value) {
            print(patientList);

            getAllRooms();

            sendNotification(
                text: 'Admin Has Added New Patient For You',
                doctorUID: selectedDoctorUID,
                nurseUID: selectedNurseUID,
                patientId: id,
                sendDate: DateTime.now().toString());
            addPatientIsLoading=false;

            emit(AddNewPatientSuccessState());
          }).catchError((onError) {
            addPatientIsLoading=false;
            emit(AddNewPatientErrorState(onError.toString()));
          });
        }).catchError((onError) {
          addPatientIsLoading=false;
          emit(AddNewPatientErrorState(onError.toString()));
        });

        isExist = true;
      }
    } catch (e) {}
  }

  Future<void> updatePatientData(
      {required id,
      required temp,
      required suger,
      required pressure,
      selectedDoctorUID,
      selectedNurseUID,
      patientName}) async {
    await FirebaseFirestore.instance.collection('patients').doc(id).update({
      'suger': suger.toString(),
      'temp': temp.toString(),
      'pressure': pressure.toString()
    }).then((value) async {
      sendNotification(
          text: 'Has updated ${patientName} Rates',
          doctorUID: selectedDoctorUID,
          nurseUID: selectedNurseUID,
          patientId: id,
          sendDate: DateTime.now().toString());
      getAllPatients();
      emit(UpdatePatientRecordSuccessState());
    }).catchError((onError) {
      emit(UpdatePatientRecordErrorState(onError.toString()));
    });
  }

  List<PatientModel> patients = [];

  Future<void> getAllPatients() async {
    patients = [];

    emit(GetAllPatientsLoadingState());
    await FirebaseFirestore.instance
        .collection('patients')
        .get()
        .then((value) async {
      value.docs.forEach((element) {
        patients.add(PatientModel.fromJson(element.data()));
      });

      print('patients length${patients.length}');
      getAllRecords();
      emit(GetAllPatientsSuccessState());
    }).catchError((onError) {
      emit(GetAllPatientsErrorState(onError.toString()));
    });
  }

  String? emptyFloorSelectedValue;
  List<RoomModel> emptyRoomsInFloor = [];

  Future<void> changeEmptySelectedRoom({required floorSelectedVal}) async {
    emptyRoomsInFloor = [];
    emptyFloorSelectedValue = floorSelectedVal;
    rooms.forEach((element) {
      if (element.floorNumber == floorSelectedVal &&
          element.roomType.toString().toUpperCase() == 'EMPTY') {
        emptyRoomsInFloor.add(element);
      }
    });
    print(emptyFloorSelectedValue);
    emit(ChangeSelectedRoomState());
  }

  String? fullFloorSelectedValue;
  List<RoomModel> fullRoomsInFloor = [];

  Future<void> changeFullSelectedRoom({required floorSelectedVal}) async {
    fullRoomsInFloor = [];
    fullFloorSelectedValue = floorSelectedVal;
    rooms.forEach((element) {
      if (element.floorNumber == floorSelectedVal &&
          element.roomType.toString().toUpperCase() == 'FULL') {
        fullRoomsInFloor.add(element);
      }
    });
    print(fullFloorSelectedValue);
    emit(ChangeSelectedRoomState());
  }

  List<Widget> adminLayOutScreens = [
    HomeScreen(),
    ReceiptScreen(),
    AddNewPatientScreen(),
    ProfileScreen(),
  ];

  List<Widget> doctorAndNurseLayOutScreens = [
    DoctorAndNurseHomeScreen(),
    SearchForPatientScreen(),
    DoctorAndNurseNotificationScreen(),
    DoctorAndNurseProfileScreen(),
  ];

  int currentIndex = 0;

  void changeBottomNav(int index) {
    currentIndex = index;
    getAllPatients();
    getAllRooms();

    emit(BottomNavigationBarChangedState());
  }

  bool isObsecured = true;

  void changeVisibility() {
    isObsecured = !isObsecured;
    emit(ChangeVisibilityState());
  }

  bool isLast = false;

  void changeOnBoarding(index, boardingLength) {
    if (index == boardingLength - 1) {
      isLast = true;
      emit(ChangeOnBoardingState());
    } else {
      isLast = false;
      emit(ChangeOnBoardingState());
    }
  }

  void submit(context) {
    CacheHelper.saveData(
      key: 'onBoarding',
      value: true,
    ).then((value) {
      if (value == true) {
        navigateAndEnd(
          context,
          LoginScreen(),
        );
      }
    });
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  Future<void> addNewRecord(
      {required data,
      required patientId,
      required selectedDoctorUID,
      required selectedNurseUID,
      required registeredDate,
      required nurseName,
      required patientName}) async {
    RecoredModel model = RecoredModel(
      data: data,
      patientId: patientId,
      registeredDate: registeredDate,
      selectedDoctorUID: selectedDoctorUID,
      selectedNurseUID: selectedNurseUID,
    );

    try {
      final snapShot = await FirebaseFirestore.instance
          .collection('records')
          .doc(data)
          .get();

      await FirebaseFirestore.instance
          .collection('records')
          .doc(data)
          .set(model.toMap())
          .then((value) {
        sendNotification(
            text: 'Has updated ${patientName} record',
            doctorUID: selectedDoctorUID,
            nurseUID: selectedNurseUID,
            patientId: patientId,
            sendDate: DateTime.now().toString());
        emit(AddNewRecordSuccessState());
      }).catchError((onError) {
        emit(AddNewRecordErrorState(onError.toString()));
      });
    } catch (e) {}
  }

  List<RecoredModel> records = [];

  Future<void> getAllRecords() async {
    records = [];

    emit(GetRecordLoadingState());
    FirebaseFirestore.instance.collection('records').get().then((value) async {
      value.docs.forEach((element) {
        records.add(RecoredModel.fromJson(element.data()));
      });
      print(records);
      emit(GetRecordSuccessState());
    }).catchError((onError) {
      emit(GetRecordErrorState(onError.toString()));
    });
  }

  Future<void> sendNotification({
    required String text,
    required String doctorUID,
    required String nurseUID,
    required String patientId,
    required String sendDate,
  }) async {
    NotificationModel model = NotificationModel(
        text: text,
        doctorUID: doctorUID,
        nurseUID: nurseUID,
        patientId: patientId,
        sendDate: sendDate);

    FirebaseFirestore.instance
        .collection('notifications')
        .doc()
        .set(model.toMap())
        .then((value) {
      emit(SendNotificationSuccessState());
    }).catchError((onError) {
      emit(SendNotificationErrorState(onError.toString()));
    });
  }

  List<NotificationModel> notifications = [];

  Future<void> getAllNotifications() async {
    notifications = [];
    FirebaseFirestore.instance
        .collection('notifications')
        .orderBy('sendDate', descending: true)
        .snapshots()
        .listen((value) {
      value.docs.forEach((element) {
        notifications.add(NotificationModel.fromJson(element.data()));
      });
      emit(GetAllNotificationsSuccessState());
    });
  }

  void sendMessage({
    required String receiverId,
    required String dateTime,
    required String text,
    required String senderId,
  }) {
    MessageModel model = MessageModel(
      text: text,
      senderId: senderId,
      receiverId: receiverId,
      dateTime: dateTime,
    );

    // set my chats
    FirebaseFirestore.instance
        .collection('admins')
        .doc(senderId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .add(model.toMap())
        .then((value) {
      emit(SendMessageSuccessState());
    }).catchError((error) {
      emit(SendMessageErrorState(error));
    });

    // set receiver chats
    FirebaseFirestore.instance
        .collection('admins')
        .doc(receiverId)
        .collection('chats')
        .doc(senderId)
        .collection('messages')
        .add(model.toMap())
        .then((value) {
      emit(SendMessageSuccessState());
    }).catchError((error) {
      emit(SendMessageErrorState(error));
    });
  }

  List<MessageModel> messages = [];

  void getMessages({
    required String receiverId,
    required String senderId,
  }) {
    FirebaseFirestore.instance
        .collection('admins')
        .doc(senderId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      messages = [];

      event.docs.forEach((element) {
        messages.add(MessageModel.fromJson(element.data()));
      });

      emit(GetMessagesSuccessState());
    });
  }

  List checkOutPatientList = [];
  bool checkOutIsLoading=false;

  Future<void> checkOut(
      {required patientName,
      required id,
      required selectedDoctorUID,
      required selectedNurseUID,
      required roomNo,
        required registeredDate,
        required exitDate,
        required nightsNo,
        required totalCash,
        required patientEmail
      }) async {

    emit(CheckOutLoadingState());
    checkOutIsLoading=true;

    checkOutPatientList = [];
    rooms.forEach((element) {
      if (element.roomNo.toString() == roomNo) {
        element.patientList!.forEach((element2) {
          if (element2 != id) {
            checkOutPatientList.insert(checkOutPatientList.length, element2);
          }
        });
      }
    });

    await FirebaseFirestore.instance
        .collection('patients')
        .doc(id)
        .delete()
        .then((value) async {
      await FirebaseFirestore.instance.collection('rooms').doc(roomNo).update({
        'patientList': checkOutPatientList,
        'roomType': 'EMPTY'
      }).then((value) async {
        print(patientList);


        sendNotification(
            text: 'Patient ${patientName} Checked Out',
            doctorUID: selectedDoctorUID,
            nurseUID: selectedNurseUID,
            patientId: id,
            sendDate: DateTime.now().toString());

        final Email email = Email(
          body: 'Welcome ${patientName} \n'
              'Room Number: #${roomNo}\n'
              'Registered Date: ${registeredDate}\n'
              'Exit Date: ${exitDate}\n'
              'Nights Number: ${nightsNo}\n'
              'Total Cash: ${totalCash}\n'

          ,
          subject: 'TeleDoctor',
          recipients: ['${patientEmail}'],
          isHTML: false,

        );

        await FlutterEmailSender.send(email);

        checkOutIsLoading=false;
        getAllRooms();

        emit(CheckOutSuccessState());
      }).catchError((onError) {
        checkOutIsLoading=false;

        emit(CheckOutErrorState(onError.toString()));
      });
    }).catchError((onError) {
      emit(CheckOutErrorState(onError.toString()));
    });
  }
}
