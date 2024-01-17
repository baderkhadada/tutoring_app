import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutoring_app/app/modules/auth/domain/provider/controler/authcontroler.dart';
import 'package:tutoring_app/app/modules/auth/domain/provider/controler/textform_prov.dart';
import 'package:tutoring_app/app/modules/auth/domain/provider/state/authstate.dart';
import 'package:tutoring_app/app/modules/auth/domain/repo/authrepo.dart';

final authFormController =
    ChangeNotifierProvider((ref) => MyAuthFormController());

final authRepositoryProvider = Provider<AuthRepo>((ref) {
  return AuthRepo(FirebaseAuth.instance);
});

final authControllerProvider =
    StateNotifierProvider<AuthController, AuthState>((ref) {
  return AuthController(AuthState(), AuthRepo(FirebaseAuth.instance));
});

final authStateProvider = StreamProvider<User?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  ref.read(authControllerProvider);
  return authRepository.authStateChanged;
});
