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

class AddNewPatientSuccessState extends AppState{}

class AddNewPatientErrorState extends AppState{
  final error;
  AddNewPatientErrorState(this.error);
}

class GetAllUsersLoadingState extends AppState{}

class GetAllUsersSuccessState extends AppState{}

class GetAllUsersErrorState extends AppState{
  final error;
  GetAllUsersErrorState(this.error);
}