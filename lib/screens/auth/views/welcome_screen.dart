import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_app/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:pizza_app/screens/auth/views/sign_in_screen.dart';
import 'package:pizza_app/screens/auth/views/sign_up_screen.dart';

import '../blocs/sign_in_bloc/sign_in_bloc.dart';
import '../blocs/sign_up_bloc/sign_up_bloc.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(initialIndex: 0, length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        children: [
          // Background Circles
          Align(
            alignment: const Alignment(0, -1.2),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
          ),

          Align(
            alignment: const Alignment(2.7, -1.2),
            child: Container(
              height: MediaQuery.of(context).size.height / 1.3,
              width: MediaQuery.of(context).size.width / 1.3,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
          ),

          // Blur Effect
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
            child: Container(),
          ),

          // Main UI
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // TabBar
                  TabBar(
                    controller: tabController,
                    unselectedLabelColor: Theme.of(context).colorScheme.tertiary,
                    labelColor: Theme.of(context).colorScheme.onBackground,
                    tabs: const [
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text('Sign In', style: TextStyle(fontSize: 18)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text('Sign Up', style: TextStyle(fontSize: 18)),
                      ),
                    ],
                  ),

                  // TabBarView (placed OUTSIDE the tabs)
                  SizedBox(
                    height: 300,
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        BlocProvider(
                          create: (context) => SignInBloc(
                            context.read<AuthenticationBloc>().userRepository,
                          ),
                          child: const SignInScreen(),
                        ),
                        BlocProvider(
                          create: (context) => SignUpBloc(
                            context.read<AuthenticationBloc>().userRepository,
                          ),
                          child: const SignUpScreen(),
                        ),
                      ],
                    ),
                  ),


                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
