abstract class AppState {}

class AppInitial extends AppState {}

class ChangeVisibilityState extends AppState{}

class ChangeOnBoardingState extends AppState{}

class AddUserRegisterLoadingState extends AppState{}

class AddUserRegisterSuccessState extends AppState{}

class AddUserErrorState extends AppState{
  final error;
  AddUserErrorState(this.error);
}

class CreateUserSuccessState extends AppState{}

class CreateUserErrorState extends AppState{
  final error;

  CreateUserErrorState(this.error);
}

class GetAdminsLoadingState extends AppState{}

class GetAdminsSuccessState extends AppState{}

class GetAdminsErrorState extends AppState{
  final error;
  GetAdminsErrorState(this.error);
}

class UpdateUserDataLoadingState extends AppState{}

class UpdateUserDataSuccessState extends AppState{}

class UpdateUserDataErrorState extends AppState{
  final error;
  UpdateUserDataErrorState(this.error);
}

class DeleteUserDataLoadingState extends AppState{}

class DeleteUserDataSuccessState extends AppState{}

class DeleteUserDataErrorState extends AppState{
  final error;
  DeleteUserDataErrorState(this.error);
}

class BottomNavigationBarChangedState extends AppState{}

class AddNewRoomLoadingState extends AppState{}

class AddNewRoomSuccessState extends AppState{}

class AddNewRoomErrorState extends AppState{
  final error;
  AddNewRoomErrorState(this.error);
}

class GetAllRoomsLoadingState extends AppState{}

class GetAllRoomsSuccessState extends AppState{}

class GetAllRoomsErrorState extends AppState{
  final error;
  GetAllRoomsErrorState(this.error);
}

class ChangeSelectedRoomState extends AppState{}

class AddNewPatientLoadingState extends AppState{}


class AddNewPatientSuccessState extends AppState{}

class AddNewPatientErrorState extends AppState{
  final error;
  AddNewPatientErrorState(this.error);
}

class UpdatePatientRecordSuccessState extends AppState{}

class UpdatePatientRecordErrorState extends AppState{
  final error;
  UpdatePatientRecordErrorState(this.error);
}

class GetAllUsersLoadingState extends AppState{}

class GetAllUsersSuccessState extends AppState{}

class GetAllUsersErrorState extends AppState{
  final error;
  GetAllUsersErrorState(this.error);
}

class GetAllPatientsLoadingState extends AppState{}

class GetAllPatientsSuccessState extends AppState{}

class GetAllPatientsErrorState extends AppState{
  final error;
  GetAllPatientsErrorState(this.error);


}class GetRecordLoadingState extends AppState{}

class GetRecordSuccessState extends AppState{}

class GetRecordErrorState extends AppState{
  final error;
  GetRecordErrorState(this.error);
}

class AddNewRecordSuccessState extends AppState{}

class AddNewRecordErrorState extends AppState{
  final error;
  AddNewRecordErrorState(this.error);
}

class SendNotificationSuccessState extends AppState{}

class SendNotificationErrorState extends AppState{
  final error;
  SendNotificationErrorState(this.error);
}

class GetAllNotificationsSuccessState extends AppState{}

class GetAllNotificationsErrorState extends AppState{
  final error;
  GetAllNotificationsErrorState(this.error);
}

class ChangeNotificationIsOpenedState extends AppState{}


class SendMessageSuccessState extends AppState {}

class SendMessageErrorState extends AppState {
  final error;
  SendMessageErrorState(this.error);
}

class GetMessagesSuccessState extends AppState {}

class CheckOutLoadingState extends AppState {}

class CheckOutSuccessState extends AppState {}

class CheckOutErrorState extends AppState
{
  final error;
  CheckOutErrorState(this.error);
}



class UploadImgLoadingState extends AppState {}

class UploadImgSuccessState extends AppState {}

class UploadImgErrorState extends AppState
{
  final error;
  UploadImgErrorState(this.error);
}

class ImagePickedSuccessState extends AppState {}

class ImagePickedErrorState extends AppState
{
  final error;
  ImagePickedErrorState(this.error);
}


