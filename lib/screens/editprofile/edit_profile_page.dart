import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytask/screens/editprofile/bloc/edit_profile_bloc.dart';
import 'package:mytask/screens/editprofile/bloc/edit_profile_event.dart';
import 'package:mytask/screens/editprofile/bloc/edit_profile_state.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileBloc, EditProfileState>(
      builder: (context, state) {
        if (state is ProfileInfoUpdated) {
        } else if (state is DiscardChangesState) {}

        return Scaffold(
          appBar: AppBar(
            title: const Text('Edit Profile'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<EditProfileBloc>().add(UpdateProfileInfo(
                          newAvatarUrl: '',
                          newName: '',
                          newEmail: '',
                          newSkills: [''],
                          newWorkExperience: '',
                        ));
                  },
                  child: const Text('Save'),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<EditProfileBloc>().add(DiscardChanges());
                  },
                  child: const Text('Discard Changes'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
