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
          // Handle UI after successful profile update if needed
        } else if (state is DiscardChangesState) {
          // Handle UI when changes are discarded if needed
        }

        return Scaffold(
          appBar: AppBar(
            title: Text('Edit Profile'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Widgets for editing profile info (avatar, name, email, skills, work experience)
                // Save and Discard buttons
                ElevatedButton(
                  onPressed: () {
                    // Trigger update profile logic
                    context.read<EditProfileBloc>().add(UpdateProfileInfo(
                          newAvatarUrl: 'NEW_AVATAR_URL',
                          newName: 'NEW_NAME',
                          newEmail: 'NEW_EMAIL',
                          newSkills: ['Skill 1', 'Skill 2'],
                          newWorkExperience: 'NEW_WORK_EXPERIENCE',
                        ));
                  },
                  child: Text('Save'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Trigger discard changes logic
                    context.read<EditProfileBloc>().add(DiscardChanges());
                  },
                  child: Text('Discard Changes'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
