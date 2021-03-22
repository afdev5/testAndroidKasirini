part of 'services.dart';

class FriendService {
  static CollectionReference friendCollection =
      FirebaseFirestore.instance.collection('friends');

  static Future<void> addFriend(Friend friend) async {
    QuerySnapshot snapshot = await friendCollection.get();
    var data = snapshot.docs
        .where((document) => document.data()['userID'] == friend.userID);
    var documents = data
        .where((document) => document.data()['friendID'] == friend.friendID);
    if (documents.length == 0) {
      await friendCollection.doc().set({
        'userID': friend.userID,
        'name': friend.name,
        'email': friend.email,
        'foto': friend.foto,
        'friendID': friend.friendID
      });
    }
  }

  static Future<List<Friend>> getFriend(String userID) async {
    QuerySnapshot snapshot = await friendCollection.get();

    var documents =
        snapshot.docs.where((document) => document.data()['userID'] == userID);

    return documents
        .map((e) => Friend(
            uid: e.id,
            userID: e.data()['userID'],
            name: e.data()['name'],
            email: e.data()['email'],
            foto: e.data()['foto'],
            friendID: e.data()['friendID']))
        .toList();
  }

  static Future<List<Friend>> searchUser(String email) async {
    CollectionReference userCollection =
        FirebaseFirestore.instance.collection('users');

    print(email);
    QuerySnapshot snapshot = await userCollection.get();

    var documents =
        snapshot.docs.where((document) => document.data()['email'] == email);
    print(documents);
    return documents
        .map((e) => Friend(
            uid: e.id,
            userID: e.data()['userID'],
            name: e.data()['name'],
            email: e.data()['email'],
            foto: e.data()['foto'],
            friendID: e.data()['friendID']))
        .toList();
  }

  static Future<List<Friend>> searchFriend(String email, userID) async {
    print(email);
    QuerySnapshot snapshot = await friendCollection.get();
    var data =
        snapshot.docs.where((document) => document.data()['userID'] == userID);
    var documents = data.where((document) => document.data()['email'] == email);
    print(documents);
    return documents
        .map((e) => Friend(
            uid: e.id,
            userID: e.data()['userID'],
            name: e.data()['name'],
            email: e.data()['email'],
            foto: e.data()['foto'],
            friendID: e.data()['friendID']))
        .toList();
  }
}
