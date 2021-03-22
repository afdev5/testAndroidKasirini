part of 'widgets.dart';

Widget fullAppbar(
    BuildContext context, String nama, String foto, String id, Function tap) {
  int count = 0;
  Task reminder;
  return PreferredSize(
    preferredSize: Size.fromHeight(210.0),
    child: BlocBuilder<TaskBloc, TaskState>(
      builder: (_, taskState) {
        if (taskState is TaskLoaded) {
          List<Task> todayTask = taskState.task
              .where((element) => element.dateTime.year == DateTime.now().year)
              .where(
                  (element) => element.dateTime.month == DateTime.now().month)
              .where((element) => element.dateTime.day == DateTime.now().day)
              .toList();
          if (todayTask.isNotEmpty) {
            count = todayTask.length;
            reminder = todayTask.first;
          }
          print(count);
          print(reminder);
          return GradientAppBar(
            flexibleSpace: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CustomPaint(
                  painter: CircleOne(),
                ),
                CustomPaint(
                  painter: CircleTwo(),
                ),
              ],
            ),
            title: Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Hello ' + nama + ' !',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Today you have ' + count.toString() + ' tasks',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              GestureDetector(
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 20, 0),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(foto), fit: BoxFit.cover)),
                ),
                onTap: () {
                  if (tap != null) {
                    tap();
                  }
                },
              ),
            ],
            elevation: 0,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                CustomColors.HeaderBlueDark,
                CustomColors.HeaderBlueLight
              ],
            ),
            bottom: (reminder != null)
                ? PreferredSize(
                    preferredSize: Size.fromHeight(10),
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      padding: EdgeInsets.fromLTRB(15, 5, 15, 0),
                      decoration: BoxDecoration(
                        color: CustomColors.HeaderGreyLight,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Today Reminder',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  reminder.title,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w300),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  reminder.dateTime.hour.toString() +
                                      ':' +
                                      reminder.dateTime.minute.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2.9,
                            ),
                            Image.asset(
                              'assets/images/bell-left.png',
                              scale: 1.3,
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 80),
                              child: Icon(
                                Icons.clear,
                                color: Colors.white,
                                size: 18.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : PreferredSize(
                    preferredSize: Size.fromHeight(10),
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      padding: EdgeInsets.fromLTRB(15, 5, 15, 0),
                      decoration: BoxDecoration(
                        color: CustomColors.HeaderGreyLight,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'No Reminder Today',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2.9,
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 80),
                              child: Icon(
                                Icons.clear,
                                color: Colors.white,
                                size: 18.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          );
        } else if (taskState is TaskCount) {
          List<Task> todayTask = taskState.task
              .where((element) => element.dateTime.year == DateTime.now().year)
              .where(
                  (element) => element.dateTime.month == DateTime.now().month)
              .where((element) => element.dateTime.day == DateTime.now().day)
              .toList();
          if (todayTask.isNotEmpty) {
            count = todayTask.length;
            reminder = todayTask.first;
          }
          print(count);
          print(reminder);
          return GradientAppBar(
            flexibleSpace: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CustomPaint(
                  painter: CircleOne(),
                ),
                CustomPaint(
                  painter: CircleTwo(),
                ),
              ],
            ),
            title: Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Hello ' + nama + ' !',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Today you have ' + count.toString() + ' tasks',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              GestureDetector(
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 20, 0),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(foto), fit: BoxFit.cover)),
                ),
                onTap: () {
                  if (tap != null) {
                    tap();
                  }
                },
              ),
            ],
            elevation: 0,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                CustomColors.HeaderBlueDark,
                CustomColors.HeaderBlueLight
              ],
            ),
            bottom: (reminder != null)
                ? PreferredSize(
                    preferredSize: Size.fromHeight(10),
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      padding: EdgeInsets.fromLTRB(15, 5, 15, 0),
                      decoration: BoxDecoration(
                        color: CustomColors.HeaderGreyLight,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Today Reminder',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  reminder.title,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w300),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  reminder.dateTime.hour.toString() +
                                      ':' +
                                      reminder.dateTime.minute.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2.9,
                            ),
                            Image.asset(
                              'assets/images/bell-left.png',
                              scale: 1.3,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : PreferredSize(
                    preferredSize: Size.fromHeight(10),
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      padding: EdgeInsets.fromLTRB(15, 5, 15, 0),
                      decoration: BoxDecoration(
                        color: CustomColors.HeaderGreyLight,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'No Reminder Today',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2.9,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          );
        } else {
          context.bloc<TaskBloc>()..add(FetchTask(id));
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    ),
  );
}

class CircleOne extends CustomPainter {
  Paint _paint;

  CircleOne() {
    _paint = Paint()
      ..color = CustomColors.HeaderCircle
      ..strokeWidth = 10.0
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(28.0, 0.0), 99.0, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class CircleTwo extends CustomPainter {
  Paint _paint;

  CircleTwo() {
    _paint = Paint()
      ..color = CustomColors.HeaderCircle
      ..strokeWidth = 10.0
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(-30, 20), 50.0, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
