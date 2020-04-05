//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//import 'package:scoped/scoped.dart';
//
//class SignedIn {
//  final String id;
//
//  SignedIn(this.id);
//}
//
//class SignedOut {}
//
//class Firebase {
//  final FirebaseAuth _auth = FirebaseAuth.instance;
//  GoogleSignIn _googleSignIn = GoogleSignIn(
//    scopes: [
//      'email',
//      // 'https://www.googleapis.com/auth/contacts.readonly',
//    ],
//  );
//
//  Future<GoogleSignInAccount> _signInGoogle() async {
//    try {
//      return await _googleSignIn.signIn();
//    } catch (error) {
//      return null;
//    }
//  }
//
//  Future<FirebaseUser> _signIn() async {
//    final gAccount = await _signInGoogle();
//    final gAuth = await gAccount.authentication;
//    final cred = GoogleAuthProvider.getCredential(accessToken: gAuth.accessToken, idToken: gAuth.idToken);
//    final auth = await _auth.signInWithCredential(cred);
//    return auth.user;
//  }
//
//  Future<void> _signOut() async {
//    await _googleSignIn.signOut();
//    await _auth.signOut();
//  }
//
//  Future<void> signIn() async {
//    _setUser(await _signIn());
//  }
//
//  Future<void> signOut() async {
//    _setUser(null);
//    await _signOut();
//  }
//
////  Future<void> signInSilently() async {
////    _setUser(await _auth.currentUser());
////  }
//
//  final Ref<FirebaseUser> user = Ref();
//  _setUser(FirebaseUser firebaseUser) {
//    user.value = firebaseUser;
//    //var self =  firebaseUser?.uid;
//  }
//}
