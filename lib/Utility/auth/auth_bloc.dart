// import 'dart:async';
//
// import 'package:bloc/bloc.dart';
// // import '../../repository.dart';
//
// import 'index.dart';
//
// class AuthBloc extends Bloc<AuthEvent, AuthState> {
//   // final AuthRepository authRepository;
//   //
//   AuthBloc({required AuthRepository repository})
//       : authRepository = repository,
//   //       super(AuthLoadingState(0));
//
//   @override
//   Future<void> close() async {
//     // await authRepository.close();
//     await super.close();
//   }
//
//   // @override
//   // Stream<AuthState> mapEventToState(
//   //   AuthEvent event,
//   // ) async* {
//   //   try {
//   //     yield* event.applyAsync(currentState: state, bloc: this);
//   //   } catch (_, stackTrace) {
//   //     developer.log('$_', name: 'AuthBloc', error: _, stackTrace: stackTrace);
//   //     yield state;
//   //   }
//   // }
//
//   void reauthenticate() => add(LaunchAuthEvent());
//
//   //void logout() => add(LogoutEvent());
// }
