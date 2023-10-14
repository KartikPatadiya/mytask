import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytask/auth/bloc/auth_bloc.dart';
import 'package:mytask/auth/bloc/auth_state.dart';
import 'package:mytask/screens/homepage/bloc/home_event.dart';
import 'package:mytask/screens/homepage/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AuthBloc authBloc;

  HomeBloc({required this.authBloc}) : super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is LoadUserInfo) {
      if (authBloc.state is Authenticated) {
        Authenticated authState = authBloc.state as Authenticated;
        yield UserInfoLoaded(
          avatarUrl: 'URL_TO_USER_AVATAR',
          name: 'User Name',
          email: authState.email,
          skills: ['Skill 1', 'Skill 2'],
          workExperience: 'Work Experience Details',
        );
      }
    } else if (event is LogoutButtonPressed) {
      // Dispatch the LogoutButtonPressed event to the AuthBloc
      // authBloc.add(LogoutButtonPressed());
      // Yield the HomeInitial state or any other state based on your requirements
      yield HomeInitial();
    }
  }
}
