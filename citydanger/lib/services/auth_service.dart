/*=============== Owned packages ===================*/
import 'package:citydanger/enums/snackbar_type.dart';
import 'package:citydanger/locator.dart';
import 'package:citydanger/services/database.dart';
import 'package:citydanger/models/user_data_model.dart';
/*=============== Extern packages ==================*/
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final SnackbarService snackBarService = locator<SnackbarService>();
  late UserData _currentUser;
  UserData get currentUser => _currentUser;
  final DatabaseService _databaseService = locator<DatabaseService>();

  Future<bool> isUserLoggedIn() async {
    final User? user = _auth.currentUser;

    if (user == null) {
      return false;
    } else {
      await _populateCurrentUser(user);
      return true;
    }
  }

  Future<bool> registerWithEmailAndPassword(String email, String password,
      String firstname, String lastname, int rewardPoints) async {
    User? user;
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);

      if (result.user != null) {
        user = result.user as User;
        _currentUser =
            UserData(user.uid, email, firstname, lastname, rewardPoints);

        await _databaseService.updateUserData(_currentUser.map);
      }
      return true;
    } catch (error) {
      String message = "Authentication failed!";

      if (error.toString().contains("weak-password")) {
        message = "Password is to weak! Please insert a stronger one!";
      } else if (error.toString().contains("invalid-email")) {
        message = "Email is invalid! Please insert a valid one!";
      } else if (error.toString().contains("email-already-in-use")) {
        message = "Email is already in use! Change email or sign in with it!";
      }
      await snackBarService.showCustomSnackBar(
          variant: SnackBarType.Error,
          duration: const Duration(seconds: 3),
          title: "Authentication Error",
          message: message);
      return false;
    }
  }

  Future<bool> signIn(String email, String password) async {
    late User? user;

    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (result.user != null) {
        user = result.user as User;
        await _populateCurrentUser(user);
        return true;
      }
    } catch (error) {
      String message = "Authentication failed!";
      if (error.toString().contains("invalid-email")) {
        message = "Email is not valid. Please insert a valid one!";
      } else if (error.toString().contains("wrong-password")) {
        message = "Password is not correct!";
      } else if (error.toString().contains("user-not-found")) {
        message =
            "There is no user with this email. Please register before sign in!";
      } else if (error.toString().contains("user-disabled")) {
        message = "This user was disabled!";
      } else if (error.toString().contains("too-many-requests")) {
        message = "Too many requests to sign in with this user";
      }
      await snackBarService.showCustomSnackBar(
          variant: SnackBarType.Error,
          duration: const Duration(seconds: 3),
          title: "Authentication Error",
          message: message);
    }
    return false;
  }

  Future<void> _populateCurrentUser(User user) async {
    _currentUser = await _databaseService.getUser(user.uid);
  }

  Future<dynamic> signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
    }
  }

  Future<String?> sendEmailToResetPassword(String email) async {
    String? message;

    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (error) {
      if (error.toString().contains("invalid-email")) {
        message = "This email is invalid please insert a vlaid one!";
      }
      if (error.toString().contains("missing-andorid-pkg-name")) {
        message = "An Android package name must be provided";
      }
      if (error.toString().contains("missing-continue-uri")) {
        message = "A continue URL must be provided in the request";
      }
      if (error.toString().contains("missing-ios-bundle-id")) {
        message = "An iOS Bundle ID must be provided";
      }
      if (error.toString().contains("invalid-continue-uri")) {
        message = "The continue URL provided in the request is invalid";
      }
      if (error.toString().contains("unauthorized-continue-uri")) {
        message = "The domain of the continue URL is not whitelisted";
      }
      if (error.toString().contains("user-not-found")) {
        message = "There is no user coresponding to this email address";
      }
    }
    return message;
  }

  Future<String> getCurrentUserUid() async {
    final User user = _auth.currentUser!;
    final String uid = user.uid.toString();
    return uid;
  }

  Future<String> errorHandlingValidatePassword(error, ctx) async {
    String message = "Reset Password Faild";
    if (error.toString().contains("wrong-password")) {
      message =
          "The original password is invalid or the user does not have a password.";
    } else if (error.toString().contains("too-many-requests")) {
      message =
          "We have blocked all requests from this device due to unusual activity. Try again later";
    }
    return message;
  }

  Future<String> errorHandlingUpdatePassword(error, ctx) async {
    String message;

    if (error.toString().contains("requiers-recent-login")) {
      message = "The users session has expired, please reauthenticate";
    } else if (error.toString().contains("wrong-password")) {
      message = "The password is not strong enough.";
    } else if (error.toString().contains("user-not-found")) {
      message = "The user has been deleted";
    } else {
      message = "Update Password failed";
    }
    return message;
  }

  bool returnFunction(value) {
    if (value != null)
      return true;
    else
      return false;
  }

  Future<UserCredential> validatePassword(String password) async {
    User firebaseUser = _auth.currentUser!;
    AuthCredential authCredentials = EmailAuthProvider.credential(
        email: firebaseUser.email!, password: password);
    return await firebaseUser.reauthenticateWithCredential(authCredentials);
  }

  Future<void> updatePassword(String password) async {
    User firebaseUser = _auth.currentUser!;
    return await firebaseUser.updatePassword(password);
  }

  Future<bool> signInAdmin(String code) async {
    bool flag = false;
    if (code == hashRole("admin")) {
      flag = true;
    }
    return flag;
  }

  String hashRole(String role) {
    List<int> passwordEncode = utf8.encode(role);
    Digest hash = sha256.convert(passwordEncode);
    return hash.toString();
  }
}
