import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytask/screens/editprofile/bloc/edit_profile_event.dart';
import 'package:mytask/screens/editprofile/bloc/edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc() : super(EditProfileInitial());

  Stream<EditProfileState> mapEventToState(EditProfileEvent event) async* {
    if (event is UpdateProfileInfo) {
      yield ProfileInfoUpdated();
    } else if (event is DiscardChanges) {
      yield DiscardChangesState();
    }
  }
}
