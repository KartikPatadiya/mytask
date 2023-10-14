abstract class HomeState {}

class HomeInitial extends HomeState {}

class UserInfoLoaded extends HomeState {
  final String avatarUrl;
  final String name;
  final String email;
  final List<String> skills;
  final String workExperience;

  UserInfoLoaded({
    required this.avatarUrl,
    required this.name,
    required this.email,
    required this.skills,
    required this.workExperience,
  });
}

class LogoutSuccess extends HomeState {}
