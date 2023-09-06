// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'index.dart';
//
// class AuthGuard extends StatefulWidget {
//   @override
//   _AuthGuardState createState() => _AuthGuardState();
// }
//
// class _AuthGuardState extends State<AuthGuard> {
//   // ignore: close_sinks
//   AuthBloc? _authBloc;
//
//   @override
//   void initState() {
//     _authBloc = BlocProvider.of<AuthBloc>(context)..add(LaunchAuthEvent());
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<AuthBloc, AuthState>(
//       bloc: _authBloc,
//       builder: (BuildContext ctx, AuthState state) {
//         if (state is AuthLoadingState) {
//           return Center(
//               //   child: HIActivityIndicator(),
//               );
//         }
//
//         if (state is ReAuthenticateState) {
//           //  return LoginPage();
//         }
//
//         if (state is UnAuthenticatedState) {
//           // return OnboardingPage();
//         }
//
//         return Center(
//           //   child: HIActivityIndicator(),
//         );
//
//         // if (state is NewUserState) {
//         //   return CreateAccountPage();
//         // }
//
//         // return DashboardPage();
//       },
//     );
//   }
// }
