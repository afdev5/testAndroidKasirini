part of 'views.dart';

class Profile extends StatelessWidget {
  final String nama, email, foto, id;

  Profile({Key key, this.nama, this.email, this.foto, this.id});
  @override
  Widget build(BuildContext context) {
    print(id);
    return WillPopScope(
      onWillPop: () async {
        context.bloc<FriendBloc>().close();
        context.bloc<PageBloc>().add(GoToMainPage(nama, email, foto, id));
        return;
      },
      child: Scaffold(
        body: Stack(
          children: [
            ClipPath(
              clipper: OvalBottomBorderClipper(),
              child: Container(
                margin: const EdgeInsets.only(top: 30),
                height: 380,
                decoration: BoxDecoration(
                  color: Colors.pink,
                ),
              ),
            ),
            ClipPath(
              clipper: OvalBottomBorderClipper(),
              child: Container(
                height: 380,
                foregroundDecoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  CustomColors.HeaderBlueDark,
                  CustomColors.HeaderBlueLight
                ])),
              ),
            ),
            ListView(
              padding: const EdgeInsets.all(8.0),
              children: [
                const SizedBox(height: 90),
                _buildAvatar(foto),
                const SizedBox(height: 10.0),
                Text(
                  nama,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5.0),
                Text(
                  email,
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20.0),
                Card(
                  color: Colors.white,
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 32.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TypeAheadField(
                    textFieldConfiguration: TextFieldConfiguration(
                        autofocus: false,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: "add friend with email",
                            hintStyle:
                                TextStyle(color: Colors.black, fontSize: 16),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)))),
                    suggestionsCallback: (pattern) async {
                      return await FriendService.searchUser(pattern);
                    },
                    itemBuilder: (context, suggestion) {
                      Friend friend = suggestion;
                      return ListTile(
                        leading: Icon(Icons.person),
                        title: Text(friend.name),
                      );
                    },
                    onSuggestionSelected: (suggestion) {
                      Friend data = suggestion;
                      Friend friend = Friend(
                          userID: id,
                          name: data.name,
                          email: data.email,
                          foto: data.foto,
                          friendID: data.userID);
                      context.bloc<FriendBloc>()..add(AddFriend(friend));
                    },
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  "Friends",
                  style: Theme.of(context).textTheme.headline5,
                ),
                BlocBuilder<FriendBloc, FriendState>(
                  cubit: context.bloc<FriendBloc>()..add(FetchFriend(id)),
                  builder: (_, friendState) {
                  if (friendState is FriendLoaded) {
                    List<Friend> friend = friendState.friend;
                    if (friend.length > 0) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: friend.length,
                        itemBuilder: (BuildContext context, index) {
                          return FriendItem(friend[index], null);
                        },
                      );
                    } else {
                      return Center(child: Text("No Friends"));
                    }
                  } else if (friendState is FriendInitial) {
                    context.bloc<FriendBloc>()..add(FetchFriend(id));
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                })
              ],
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.exit_to_app),
          backgroundColor: Colors.red,
          onPressed: () async {
            // ignore: await_only_futures
            await AuthService().signOut();
            context.bloc<PageBloc>().add(GoToStartedPage());
          },
        ),
      ),
    );
  }

  CircleAvatar _buildAvatar(String image, {double radius = 80}) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: radius,
      child: CircleAvatar(
        radius: radius - 2,
        backgroundImage: NetworkImage(image),
      ),
    );
  }
}
