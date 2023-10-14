import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytask/screens/editprofile/bloc/edit_profile_event.dart';
import 'package:mytask/screens/editprofile/bloc/edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc() : super(EditProfileInitial());

  
  Stream<EditProfileState> mapEventToState(EditProfileEvent event) async* {
    if (event is UpdateProfileInfo) {
      // Handle update profile logic (save changes to the backend, database, etc.)
      // For demonstration, let's assume the changes are successfully saved
      yield ProfileInfoUpdated();
    } else if (event is DiscardChanges) {
      // Handle discard changes logic (reset the form, etc.)
      yield DiscardChangesState();
    }
  }
}
