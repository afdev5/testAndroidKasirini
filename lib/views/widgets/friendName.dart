part of 'widgets.dart';

// ignore: must_be_immutable
class FriendName extends StatelessWidget {
  bool tap;
  Friend friend;
  FriendName(this.tap, friend);
  @override
  Widget build(BuildContext context) {
    return (tap)
        ? Center(
            child: Container(
              margin: EdgeInsets.only(right: 10),
              child: Text(
                friend.name,
                style: TextStyle(color: Colors.white),
              ),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                color: CustomColors.GreenIcon,
                boxShadow: [
                  BoxShadow(
                    color: CustomColors.GreenShadow,
                    blurRadius: 5.0,
                    spreadRadius: 3.0,
                    offset: Offset(0.0, 0.0),
                  ),
                ],
              ),
            ),
          )
        : Center(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Text(friend.name),
                ),
              ],
            ),
          );
  }
}
