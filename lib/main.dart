import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytask/screens/homepage/bloc/home_bloc.dart';
import 'firebase_options.dart';
import 'package:mytask/auth/bloc/auth_bloc.dart';
import 'package:mytask/screens/homepage/home_screen.dart';
import 'package:mytask/screens/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of  application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => MultiBlocProvider(
              providers: [
                BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
                BlocProvider<HomeBloc>(
                    create: (context) =>
                        HomeBloc(authBloc: context.read<AuthBloc>())),
              ],
              child: LoginScreen(),
            ),
        '/home': (context) => MultiBlocProvider(
              providers: [
                BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
                BlocProvider<HomeBloc>(
                    create: (context) =>
                        HomeBloc(authBloc: context.read<AuthBloc>())),
              ],
              child: HomeScreen(),
            ),
        // Define other routes here
      },
    );
  }
}
