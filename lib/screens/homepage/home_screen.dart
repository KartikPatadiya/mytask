import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytask/auth/bloc/auth_bloc.dart';
import 'package:mytask/screens/homepage/bloc/home_bloc.dart';
import 'package:mytask/screens/homepage/bloc/home_event.dart';
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
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<HomeBloc>().add(LogoutButtonPressed());
            },
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => HomeBloc(authBloc: context.read<AuthBloc>()),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is UserInfoLoaded) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(state.avatarUrl),
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
              // Handle other states if needed
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
