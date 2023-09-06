import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthState extends Equatable {
  /// notify change state without deep clone state
  final int version;

  final List? propss;

  const AuthState(this.version, [this.propss]);

  /// Copy object for use in action
  /// if need use deep clone
  AuthState getStateCopy();

  AuthState getNewVersion();

  @override
  List<Object> get props => ([version, propss ?? []]);
}

/// UnInitialized
class UnAuthenticatedState extends AuthState {
  const UnAuthenticatedState(int version) : super(version);

  @override
  String toString() => 'UnAuthenticatedState';

  @override
  UnAuthenticatedState getStateCopy() => UnAuthenticatedState(0);

  @override
  UnAuthenticatedState getNewVersion() => UnAuthenticatedState(version + 1);
}

class ReAuthenticateState extends AuthState {
  const ReAuthenticateState(int version) : super(version);

  @override
  String toString() => 'ReAuthenticateState';

  @override
  ReAuthenticateState getStateCopy() => ReAuthenticateState(0);

  @override
  ReAuthenticateState getNewVersion() => ReAuthenticateState(version + 1);
}

// class NewUserState extends AuthState {
//   NewUserState(int version) : super(version);

//   @override
//   String toString() => 'ReAuthenticateState';

//   @override
//   NewUserState getStateCopy() => NewUserState(0);

//   @override
//   NewUserState getNewVersion() => NewUserState(version + 1);
// }

/// UnInitialized
class AuthLoadingState extends AuthState {
  const AuthLoadingState(int version) : super(version);

  @override
  String toString() => 'AuthLoadingState';

  @override
  AuthLoadingState getStateCopy() => AuthLoadingState(0);

  @override
  AuthLoadingState getNewVersion() => AuthLoadingState(version + 1);
}

/// Initialized
class AuthenticatedState extends AuthState {
  const AuthenticatedState(int version) : super(version);

  @override
  AuthState getNewVersion() {
    throw UnimplementedError();
  }

  @override
  AuthState getStateCopy() {
    throw UnimplementedError();
  }
  // final Auth auth;

  //AuthenticatedState(int version, this.auth) : super(version, [auth]);

  //@override
  // String toString() => 'AuthenticatedState ${auth?.firstName} ${auth?.phone}';

  // @override
  // AuthenticatedState getStateCopy() =>
  //     AuthenticatedState(this.version, this.auth);

  // @override
  // AuthenticatedState getNewVersion() =>
  //     AuthenticatedState(version + 1, this.auth);
}

class ErrorAuthState extends AuthState {
  final String errorMessage;

  ErrorAuthState(int version, this.errorMessage)
      : super(version, [errorMessage]);

  @override
  String toString() => 'ErrorAuthState $errorMessage';

  @override
  ErrorAuthState getStateCopy() =>
      ErrorAuthState(version, errorMessage);

  @override
  ErrorAuthState getNewVersion() =>
      ErrorAuthState(version + 1, errorMessage);
}
