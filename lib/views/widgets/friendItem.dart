part of 'widgets.dart';

// ignore: must_be_immutable
class FriendItem extends StatelessWidget {
  final Friend friend;
  Function onDelete;
  FriendItem(this.friend, this.onDelete);
  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        margin: EdgeInsets.only(top: 12, left: 12, right: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[400],
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Container(
                width: 70,
                height: 90,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8)),
                child: Image(image: NetworkImage(friend.foto))),
            SizedBox(
              width: 16,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width -
                    2 * 12 -
                    70 -
                    48 -
                    30 -
                    16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      friend.name,
                      style: TextStyle(fontSize: 16),
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      friend.email,
                      style: TextStyle(fontSize: 14),
                    )
                  ],
                )),
          ],
        ),
      ),
      secondaryActions: <Widget>[
        SlideAction(
          child: Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: CustomColors.TrashRedBackground),
              child: Image.asset('assets/images/trash.png'),
            ),
          ),
          onTap: () {
            if (onDelete != null) {
              onDelete();
            }
          },
        ),
      ],
    );
  }
}
