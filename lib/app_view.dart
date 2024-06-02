import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_app_bloc/blocs/authentication/authentication_bloc.dart';
import 'package:pizza_app_bloc/screens/auth/bloc/sign_in/sign_in_bloc.dart';
import 'package:pizza_app_bloc/screens/auth/view/sign_up_screen.dart';
import 'screens/auth/bloc/sign_up/sign_up_bloc.dart';
import 'screens/auth/view/sign_in_screen.dart';
import 'screens/home/view/home_screen.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pizza Delivery',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.light(
          surface: Colors.grey.shade100,
          onSurface: Colors.black,
          primary: Colors.blue,
          onPrimary: Colors.white,
        ),
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          log("MAMA SUKA : $state, status state : ${state.status}");
          if (state.status == AuthenticationStatus.authenticated) {
            return BlocProvider(
              create: (context) => SignInBloc(
                context.read<AuthenticationBloc>().userRepository,
              ),
              child: const HomeScreen(),
            );
          } else {
            return WelcomScreenDisini();
            // return const WelcomeScreen(); // ini ngebug
          }
        },
      ),
    );
  }
}

class WelcomScreenDisini extends StatefulWidget {
  const WelcomScreenDisini({super.key});

  @override
  State<WelcomScreenDisini> createState() => _WelcomScreenDisiniState();
}

class _WelcomScreenDisiniState extends State<WelcomScreenDisini>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(20, -1.2),
                child: Container(
                  height: MediaQuery.of(context).size.width,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(2.7, -1.2),
                child: Container(
                  height: MediaQuery.of(context).size.width / 1.3,
                  width: MediaQuery.of(context).size.width / 1.3,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(),
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 1.8,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: TabBar(
                          controller: _tabController,
                          unselectedLabelColor: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.5),
                          labelColor: Theme.of(context).colorScheme.onSurface,
                          tabs: const [
                            Padding(
                              padding: EdgeInsets.all(12),
                              child: Text(
                                "Sign In",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(12),
                              child: Text(
                                "Sign Up",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child: TabBarView(
                        controller: _tabController,
                        children: [
                          BlocProvider<SignInBloc>(
                            create: (context) => SignInBloc(context
                                .read<AuthenticationBloc>()
                                .userRepository),
                            child: const SignInScreen(),
                          ),
                          BlocProvider<SignUpBloc>(
                            create: (context) => SignUpBloc(context
                                .read<AuthenticationBloc>()
                                .userRepository),
                            child: const SignUpScreen(),
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
