part of 'services.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User> signIn() async {
    final GoogleSignInAccount googleSignInAccount =
        await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final user = (await _auth.signInWithCredential(credential)).user;
    setUser(user.uid, user.displayName, user.email, user.photoURL);
    saveUser(user.uid, user.displayName, user.email, user.photoURL);
    return user;
  }

  static Future<void> saveUser(String id, name, email, foto) async {
    CollectionReference taskCollection =
        FirebaseFirestore.instance.collection('users');
    QuerySnapshot snapshot = await taskCollection.get();

    var documents =
        snapshot.docs.where((document) => document.data()['userID'] == id);

    if (documents.length == 0) {
      await taskCollection
          .doc()
          .set({'userID': id, 'name': name, 'email': email, 'foto': foto});
    }
  }

  void signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

  Future<bool> isSignedIn() async {
    final currentUser = _auth.currentUser;
    return currentUser != null;
  }

  Future<String> getUser() async {
    return _auth.currentUser.email;
  }

  static void setUser(
      String uid, String name, String email, String foto) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("id", uid);
    pref.setString("nama", name);
    pref.setString("email", email);
    pref.setString("foto", foto);
    pref.setBool("isLogin", true);

    print(pref.getString("nama"));
  }
}
