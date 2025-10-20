import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/data/models/user_google_model.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/data/repository/user_google_repository.dart';

class AuthGoogleService {
  GoogleSignIn? _googleSignIn;
  final UserGoogleRepository _userRepository = UserGoogleRepository();

  AuthGoogleService();

  Future<UserGoogleModel?> signInGoogle() async {
    try {
      UserCredential userCredential;

      if (kIsWeb) {
        final provider = GoogleAuthProvider();
        provider.setCustomParameters({'prompt': 'select_account'});
        userCredential = await FirebaseAuth.instance.signInWithPopup(provider);
      } else {
        final gs = _googleSignIn ??= GoogleSignIn(scopes: ['email']);
        final account = await gs.signIn();
        if (account == null) return null;
        final tokens = await account.authentication;
        final authCredential = GoogleAuthProvider.credential(
          accessToken: tokens.accessToken,
          idToken: tokens.idToken,
        );
        userCredential = await FirebaseAuth.instance.signInWithCredential(
          authCredential,
        );
      }

      final user = userCredential.user;
      if (user == null || user.email == null) return null;

      return await _userRepository.createUserDoc(
        user.email!,
        user.displayName ?? '-',
        user.uid,
        user.photoURL ?? '',
      );
    } catch (err) {
      debugPrint(err.toString());
      return null;
    }
  }

  Future<UserGoogleModel?> trySignInGoogle() async {
    try {
      if (kIsWeb) {
        final user = FirebaseAuth.instance.currentUser;
        if (user == null || user.email == null) return null;
        return await _userRepository.createUserDoc(
          user.email!,
          user.displayName ?? '-',
          user.uid,
          user.photoURL ?? '',
        );
      } else {
        final gs = _googleSignIn ??= GoogleSignIn(scopes: ['email']);
        final account = await gs.signInSilently();
        if (account == null) return null;
        final tokens = await account.authentication;
        final authCredential = GoogleAuthProvider.credential(
          accessToken: tokens.accessToken,
          idToken: tokens.idToken,
        );
        final userCredential = await FirebaseAuth.instance.signInWithCredential(
          authCredential,
        );
        final user = userCredential.user;
        if (user == null || user.email == null) return null;
        return await _userRepository.createUserDoc(
          user.email!,
          user.displayName ?? '-',
          user.uid,
          user.photoURL ?? '',
        );
      }
    } catch (err) {
      debugPrint(err.toString());
      return null;
    }
  }

  logoutGoogle() async {
    if (!kIsWeb) {
      final gs = _googleSignIn ??= GoogleSignIn(scopes: ['email']);
      await gs.signOut();
    }
    await FirebaseAuth.instance.signOut();
  }
}
