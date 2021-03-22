part of 'services.dart';

class TaskService {
  static CollectionReference taskCollection =
      FirebaseFirestore.instance.collection('task');

  static Future<void> saveTask(Task task) async {
    print(task);
    if (task.friend != null) {
      await taskCollection.doc().set({
        'userID': task.userID,
        'nameUser': task.nameUser,
        'title': task.title,
        'category': task.category,
        'dateTime': task.dateTime,
        'friend': {
          'userID': task.friend.userID,
          'name': task.friend.name,
          'email': task.friend.email,
          'foto': task.friend.foto,
          'friendID': task.friend.friendID
        }
      });
    } else {
      await taskCollection.doc().set({
        'userID': task.userID,
        'nameUser': task.nameUser,
        'title': task.title,
        'category': task.category,
        'dateTime': task.dateTime,
        'friend': {}
      });
    }
  }

  static Future<void> updateTask(Task task, String uid) async {
    await taskCollection.doc(uid).update({
      'userID': task.userID,
      'title': task.title,
      'category': task.category,
      'dateTime': task.dateTime
    });
  }

  static Future<void> deleteTask(String uid) async {
    await taskCollection.doc(uid).delete();
  }

  static Future<List<Task>> getTask(String userID) async {
    QuerySnapshot snapshot =
        await taskCollection.orderBy('dateTime').get();

    var documents1 =
        snapshot.docs.where((document) => document.data()['userID'] == userID);

    var documents2 = snapshot.docs
        .where((document) => document.data()['friend']['friendID'] == userID);

    // var documents = documents1.contains(documents2);

    var documents = documents1
            .map((e) => Task(
                uid: e.id,
                userID: e.data()['userID'],
                nameUser: e.data()['nameUser'],
                title: e.data()['title'],
                category: e.data()['category'],
                dateTime: e.data()['dateTime'].toDate(),
                friend: Friend(
                    userID: e.data()['friend']['userID'],
                    name: e.data()['friend']['name'],
                    email: e.data()['friend']['email'],
                    foto: e.data()['friend']['foto'],
                    friendID: e.data()['friend']['friendID'])))
            .toList() +
        documents2
            .map((e) => Task(
                uid: e.id,
                userID: e.data()['userID'],
                nameUser: e.data()['nameUser'],
                title: e.data()['title'],
                category: e.data()['category'],
                dateTime: e.data()['dateTime'].toDate(),
                friend: Friend(
                    userID: e.data()['friend']['userID'],
                    name: e.data()['friend']['name'],
                    email: e.data()['friend']['email'],
                    foto: e.data()['friend']['foto'],
                    friendID: e.data()['friend']['friendID'])))
            .toList();

    return documents;
  }

  static Future getCount(String userID) async {
    QuerySnapshot snapshot =
        await taskCollection.orderBy('dateTime', descending: true).get();
    int personal = snapshot.docs
        .where((document) => document.data()['userID'] == userID)
        .where((document) => document.data()['category'] == 'Personal')
        .length;
    int work = snapshot.docs
        .where((document) => document.data()['userID'] == userID)
        .where((document) => document.data()['category'] == 'Work')
        .length;
    int meeting = snapshot.docs
        .where((document) => document.data()['userID'] == userID)
        .where((document) => document.data()['category'] == 'Meeting')
        .length;
    int study = snapshot.docs
        .where((document) => document.data()['userID'] == userID)
        .where((document) => document.data()['category'] == 'Study')
        .length;
    int shopping = snapshot.docs
        .where((document) => document.data()['userID'] == userID)
        .where((document) => document.data()['category'] == 'Shopping')
        .length;
    var count = [personal, work, meeting, study, shopping];
    print(count);
    return count;
  }

}
