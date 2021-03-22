part of 'widgets.dart';

// ignore: must_be_immutable
class CardCategory extends StatelessWidget {
  String category;
  int count;
  CardCategory(this.category, this.count);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 65,
                height: 65,
                child: Image.asset((category == 'Personal')
                    ? 'assets/images/icon-user.png'
                    : (category == 'Work')
                        ? 'assets/images/icon-briefcase.png'
                        : (category == 'Meeting')
                            ? 'assets/images/icon-presentation.png'
                            : (category == 'Shopping')
                                ? 'assets/images/icon-shopping-basket.png'
                                : (category == 'Study')
                                    ? 'assets/images/icon-molecule.png'
                                    : 'assets/images/icon-confetti.png'),
                decoration: BoxDecoration(
                  color: (category == 'Personal')
                      ? CustomColors.YellowBackground
                      : (category == 'Work')
                          ? CustomColors.GreenBackground
                          : (category == 'Meeting')
                              ? CustomColors.PurpleBackground
                              : (category == 'Shopping')
                                  ? CustomColors.OrangeBackground
                                  : (category == 'Study')
                                      ? CustomColors.PurpleBackground
                                      : CustomColors.BlueBackground,
                  borderRadius: BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                category,
                style: TextStyle(
                    fontSize: 17,
                    color: CustomColors.TextHeaderGrey,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              Text(
                count.toString() + ' Tasks',
                style: TextStyle(
                    fontSize: 9, color: CustomColors.TextSubHeaderGrey),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
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
          color: Colors.white,
        ),
        margin: EdgeInsets.all(10),
        height: 150.0);
  }
}
