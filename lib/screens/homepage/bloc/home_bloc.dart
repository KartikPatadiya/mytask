import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytask/auth/bloc/auth_bloc.dart';
import 'package:mytask/auth/bloc/auth_state.dart';
import 'package:mytask/screens/homepage/bloc/home_event.dart';
import 'package:mytask/screens/homepage/bloc/home_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AuthBloc authBloc;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  HomeBloc({required this.authBloc}) : super(HomeInitial());

  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is LoadUserInfo) {
      if (authBloc.state is Authenticated) {
        try {
          // Get the user's UID from FirebaseAuth
          String uid = _firebaseAuth.currentUser!.uid;

          // Fetch user data from Firestore based on the UID
          DocumentSnapshot userDoc =
              await firestore.collection('users').doc(uid).get();

          // Extract user data from the document
          String name = userDoc['name'];
          String email = userDoc['email'];
          List<dynamic> skills = userDoc['skills'];
          String workExperience = userDoc['workExperience'];

          yield UserInfoLoaded(
            avatarUrl:
                'https://images.pexels.com/photos/2379005/pexels-photo-2379005.jpeg?cs=srgb&dl=pexels-italo-melo-2379005.jpg&fm=jpg',
            name: name,
            email: email,
            skills: skills.cast<String>(), // Cast skills to a List<String>
            workExperience: workExperience,
          );
        } catch (e) {
          // Handle error
          print('Error fetching user data: $e');
        }
      }
    } else if (event is LogoutButtonPressed) {
      await _firebaseAuth.signOut();

      // Yield the LogoutSuccess state to indicate successful logout
      yield LogoutSuccess();
    }
  }
}
