part of 'widgets.dart';

// ignore: must_be_immutable
class ItemTask extends StatelessWidget {
  Task task;
  String id;
  Function onDelete;
  ItemTask(this.task,this.id, this.onDelete);
  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
        padding: EdgeInsets.fromLTRB(5, 13, 5, 13),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            (DateTime.now().isBefore(task.dateTime))
                ? Image.asset('assets/images/checked-empty.png')
                : Image.asset('assets/images/checked.png'),
            Text(
              task.dateTime.hour.toString() +
                  ':' +
                  task.dateTime.minute.toString(),
              style: TextStyle(color: CustomColors.TextGrey),
            ),
            Container(
                width: 180,
                child: (task.friend.name == null)
                    ? Text(
                        task.title,
                        style: TextStyle(
                            color: CustomColors.TextHeader,
                            fontWeight: FontWeight.w600),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Text(
                              task.title,
                              style: TextStyle(
                                  color: CustomColors.TextHeader,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 3),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: (task.userID == id)
                                  ? Row(
                                      children: [
                                        Text(
                                          "Share With :",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: CustomColors.TextBody,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Text(
                                          task.friend.name,
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        Text(
                                          "Share By :",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: CustomColors.TextBody,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Text(
                                          task.nameUser,
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    )
                            )
                          ])),
            Image.asset('assets/images/bell-small.png'),
          ],
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            stops: [0.015, 0.015],
            colors: [
              (task.dateTime.difference(DateTime.now()).inHours == 0 &&
                      DateTime.now().isBefore(task.dateTime))
                  ? CustomColors.YellowIcon
                  : CustomColors.GreenIcon,
              Colors.white
            ],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
          boxShadow: [
            BoxShadow(
              color: CustomColors.GreyBorder,
              blurRadius: 10.0,
              spreadRadius: 5.0,
              offset: Offset(0.0, 0.0),
            ),
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
