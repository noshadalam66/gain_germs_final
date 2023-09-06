// import 'dart:async';
// import 'dart:developer' as developer;
//
// import 'package:flutter/material.dart';
// import 'package:meta/meta.dart';
// import '../../Models/commonmodel.dart';
// import '../../mem_cache/mem_cache.dart';
//
// import 'index.dart';
//
// @immutable
// abstract class AuthEvent {
//   Stream<AuthState> applyAsync({AuthState? currentState, AuthBloc? bloc});
// }
//
// ///
// /// Triggered on loggout, access token expiry, etc. to force logout user.
// class LogoutEvent extends AuthEvent {
//   @override
//   String toString() => 'LogoutEvent';
//
//   @override
//   Stream<AuthState> applyAsync({AuthState? currentState, AuthBloc? bloc}) async* {
//     try {
//       DefaultMemCache.clearAllCache();
//       sessionTrace = null;
//       yield ReAuthenticateState(0);
//     } catch (_, stackTrace) {
//       developer.log('$_',
//           name: 'LaunchAuthEvent', error: _, stackTrace: stackTrace);
//       yield ReAuthenticateState(0);
//     }
//   }
// }
//
// ///
// /// Triggered at app start.
// class LaunchAuthEvent extends AuthEvent {
//   LaunchAuthEvent();
//
//   @override
//   String toString() => 'LaunchAuthEvent';
//
//   @override
//   Stream<AuthState> applyAsync({AuthState? currentState, AuthBloc? bloc}) async* {
//     /* try {
//       final auth = await bloc.authRepository.currentUser();
//       if (auth != null) {
//         // new user without create accounnt
//         if (auth.firstName == null) {
//           // await bloc.authRepository.logout(LogoutRequest());
//           yield UnAuthenticatedState(0);
//         } else {
//           yield AuthenticatedState(0, auth);
//         }
//       } else {
//         yield (currentState is ReAuthenticateState)
//             ? currentState.getNewVersion()
//             : UnAuthenticatedState(0);
//       }
//     } catch (_, stackTrace) {
//       developer.log('$_',
//           name: 'LaunchAuthEvent', error: _, stackTrace: stackTrace);
//       yield ErrorAuthState(0, _?.message);
//     }*/
//   }
// }
