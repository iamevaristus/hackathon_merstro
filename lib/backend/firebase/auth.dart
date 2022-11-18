import 'package:firebase_auth/firebase_auth.dart';
import 'package:merstro/lib.dart';
import 'package:get/get.dart';

class MAuth{
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? get getCurrentUser => auth.currentUser;
  Stream<User?> authChanges() => auth.authStateChanges();

  Future<User> signup({
    required String email, required String password, required String firstName, required String lastName,
    required String phoneNumber,String? refCode
    }) async {
    try {
      final UserCredential user = await auth.createUserWithEmailAndPassword(email: email, password: password);
      await MDB().createUserData(firstName, lastName, email, phoneNumber, refCode);
      if (user.user != null) return user.user!;
      throw CustomException("User was null");
    } on FirebaseException catch (e) {
      throw CustomException (e.message!);
    }
  }

  Future<User> signIn({required String email, required String password,}) async {
    try {
      final UserCredential user = await auth.signInWithEmailAndPassword(email: email, password: password,);
      if (user.user != null) return user.user!;
      throw CustomException("User was null");
    } on FirebaseAuthException catch (e) {
      throw CustomException(e.toString());
    }
  }

  Future<void> sendPassword({required String email}) async {
    await auth.sendPasswordResetEmail(email: email);
    showGetSnackbar(title: "Sweet", message: "Check your email, check spam too...lol, for an email.", type: Popup.success);
    try {
      await auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw CustomException(e.toString());
    }
  }

  //sigining out
  signOut() async {
    try{
      await auth.signOut();
      // Get.offAll(() => const AdminLoginPage());
    } on FirebaseAuthException catch (e) {
      throw CustomException("Error logging out : ${e.message!}");
    }
  }
}

class MAuthentication extends AuthProvider {
  final user = MAuth().getCurrentUser;

  signUp({
    required String firstName, required String lastName, required String password, required String email,
    required String phoneNumber, String? refCode
  }) async {
    try {
      setLoading();
      final User user = await authenticate.signup(
        firstName: firstName,
        lastName: lastName,
        password: password,
        email: email,
        phoneNumber: phoneNumber,
        refCode: refCode
      );
      user.sendEmailVerification();
      debugShow("Signed up user's uid : ${user.uid}");
      // Get.offAll(() => MKYC(email: email, firstName: firstName, lastName: lastName, userRef: email));
      setNotLoading();
    } on CustomException catch (e) {
      if(e.message.contains("email address is already in use")){
        showGetSnackbar(title: "Error signing up", message: "User already exist. Try log in instead.", type: Popup.error,
          duration: const Duration(seconds: 3)
        );
        setNotLoading();
      } else if(e.message.contains("email address is badly formatted")){
        showGetSnackbar(title: "Error signing up", message: "Email is badly formatted", type: Popup.error, duration: const Duration(seconds: 3));
        setNotLoading();
      }
    }
  }

  signIn({required String email, required String password,}) async {
    try {
      setLoading();
      await authenticate.signIn(email: email, password: password);
      Get.offAll(() => const MHome());
      setNotLoading();
    } on CustomException catch (e) {
      setNotLoading();
      if (e.message.contains("no user record")) {
        showGetSnackbar(title: "Error signing in", message: "User does not exist. Try sign up instead.", type: Popup.error,
          duration: const Duration(seconds: 3)
        );
        return;
      } else if(e.message.contains("password is invalid")){
        showGetSnackbar(title: "Error signing in", message: "Password is incorrect. Try resetting password.", type: Popup.error,
          duration: const Duration(seconds: 3)
        );
      } else if (e.message.contains("null")) {
        showGetSnackbar(title: "Error signing in", message: "You have missing fields in your detail.", type: Popup.error,
          duration: const Duration(seconds: 3)
        );
      } else if (e.message.contains("blocked all requests")) {
        showGetSnackbar(title: "Warning", message: "There is too much login attempts. Try again later.", type: Popup.warning,
          duration: const Duration(seconds: 3)
        );
      }
    }
  }

  // sendPassword({required String email}) async {
  //   try {
  //     setLoading();
  //     await authenticate.sendPassword(email: email);
  //     setNotLoading();
  //     showGetSnackbar(title: "Sweet", message: "Check your email, check spam too...lol, for an email.", type: Popup.success);
  //     setNotLoading();
  //   } on CustomException catch (e) {
  //     setNotLoading();
  //     if (e.code == "unknown") {
  //       showGetSnackbar(title: "Oops", message: "The email field is empty. Enter email.", type: Popup.error);
  //     } else {
  //       showGetSnackbar(title: "Oops", message: "Email is not signed up. Consider signing up instead.", type: Popup.error);
  //     }
  //   }
  // }
}