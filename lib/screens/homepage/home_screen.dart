import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytask/auth/bloc/auth_bloc.dart';
import 'package:mytask/auth/bloc/auth_event.dart';
import 'package:mytask/screens/homepage/bloc/home_bloc.dart';
import 'package:mytask/screens/homepage/bloc/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              context.read<AuthBloc>().add(LogoutButtonPressed());
            },
          ),
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is UserInfoLoaded) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(state.avatarUrl),
                    radius: 50,
                  ),
                  const SizedBox(height: 20),
                  Text('Name: ${state.name}'),
                  Text('Email: ${state.email}'),
                  Text('Skills: ${state.skills.join(', ')}'),
                  Text('Work Experience: ${state.workExperience}'),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
              // child: Text('NO DATA'),
            );
          }
        },
      ),
    );
  }
}
