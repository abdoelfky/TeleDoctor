abstract class AppState {}

class AppInitial extends AppState {}

class ChangeVisibilityState extends AppState{}

class ChangeOnBoardingState extends AppState{}

class AddNewAdminRegisterLoadingState extends AppState{}

class AddNewAdminRegisterSuccessState extends AppState{}

class AddNewAdminErrorState extends AppState{
  final error;
  AddNewAdminErrorState(this.error);
}

class AdminCreateUserSuccessState extends AppState{}

class AdminCreateUserErrorState extends AppState{
  final error;

  AdminCreateUserErrorState(this.error);
}

class GetAdminsLoadingState extends AppState{}

class GetAdminsSuccessState extends AppState{}

class GetAdminsErrorState extends AppState{
  final error;
  GetAdminsErrorState(this.error);
}

class UpdateAdminDataLoadingState extends AppState{}

class UpdateAdminDataSuccessState extends AppState{}

class UpdateAdminDataErrorState extends AppState{
  final error;
  UpdateAdminDataErrorState(this.error);
}

class DeleteAdminDataLoadingState extends AppState{}

class DeleteAdminDataSuccessState extends AppState{}

class DeleteAdminDataErrorState extends AppState{
  final error;
  DeleteAdminDataErrorState(this.error);
}

class BottomNavigationBarChangedState extends AppState{}