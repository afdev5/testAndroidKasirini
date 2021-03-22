part of 'widgets.dart';

// ignore: must_be_immutable
class Category extends StatelessWidget {
  bool tap;
  String category;
  Category(this.tap, this.category);
  @override
  Widget build(BuildContext context) {
    return (tap)
        ? Center(
            child: Container(
              margin: EdgeInsets.only(right: 10),
              child: Text(
                category,
                style: TextStyle(color: Colors.white),
              ),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                color: (category == "Personal")
                    ? CustomColors.YellowIcon
                    : (category == "Work")
                        ? CustomColors.GreenIcon
                        : (category == "Meeting")
                            ? CustomColors.PurpleIcon
                            : (category == "Study")
                                ? CustomColors.BlueIcon
                                : CustomColors.OrangeIcon,
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
                  height: 10.0,
                  width: 10.0,
                  margin: EdgeInsets.only(right: 4),
                  decoration: BoxDecoration(
                    color: (category == "Personal")
                        ? CustomColors.YellowAccent
                        : (category == "Work")
                            ? CustomColors.GreenAccent
                            : (category == "Meeting")
                                ? CustomColors.PurpleIcon
                                : (category == "Study")
                                    ? CustomColors.BlueIcon
                                    : CustomColors.OrangeIcon,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Text(category),
                ),
              ],
            ),
          );
  }
}
