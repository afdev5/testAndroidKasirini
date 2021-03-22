part of 'views.dart';

class MainPage extends StatefulWidget {
  final String nama, email, foto, id;

  MainPage({Key key, this.nama, this.email, this.foto, this.id});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int bottomNavBarIndex = 0;
  Task reminder;
  int count = 0;
  PageController pageController = PageController(
    initialPage: 0,
  );

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: fullAppbar(context, widget.nama, widget.foto, widget.id, () {
        context.bloc<PageBloc>()
          ..add(GoToProfilePage(
              widget.nama, widget.email, widget.foto, widget.id));
      }),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            bottomNavBarIndex = index;
          });
        },
        children: <Widget>[Home(widget.id, widget.nama), TaskPage(widget.id)],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: customFab(context, () {
        showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            useRootNavigator: true,
            builder: (context) {
              return Modal(widget.id, widget.nama);
            });
      }),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: bottomNavBarIndex,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 10,
          selectedLabelStyle: TextStyle(color: CustomColors.BlueDark),
          selectedItemColor: CustomColors.BlueDark,
          unselectedFontSize: 10,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(bottom: 5),
                child: Image.asset(
                  'assets/images/home.png',
                  color: (bottomNavBarIndex == 0)
                      ? CustomColors.BlueDark
                      : CustomColors.TextGrey,
                ),
              ),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(bottom: 5),
                child: Image.asset(
                  'assets/images/task.png',
                  color: (bottomNavBarIndex == 1)
                      ? CustomColors.BlueDark
                      : CustomColors.TextGrey,
                ),
              ),
              title: Text('Task'),
            ),
          ],
          onTap: (index) {
            setState(() {
              bottomNavBarIndex = index;
              print(index);
              pageController.jumpToPage(bottomNavBarIndex);
            });
          }),
    );
  }
}
