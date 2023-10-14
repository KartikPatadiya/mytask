abstract class EditProfileEvent {}

class UpdateProfileInfo extends EditProfileEvent {
  final String newAvatarUrl;
  final String newName;
  final String newEmail;
  final List<String> newSkills;
  final String newWorkExperience;

  UpdateProfileInfo({
    required this.newAvatarUrl,
    required this.newName,
    required this.newEmail,
    required this.newSkills,
    required this.newWorkExperience,
  });
}

class DiscardChanges extends EditProfileEvent {}
