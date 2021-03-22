import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/bloc/friend_bloc.dart';
import 'package:todolist/utils/util.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todolist/views/views.dart';
import 'bloc/page_bloc.dart';
import 'bloc/task_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, //top bar color
      ),
    );
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => PageBloc(StateInitial())..add(PageUnInitial())),
        BlocProvider(create: (_) => TaskBloc()),
        BlocProvider(create: (_) => FriendBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          canvasColor: CustomColors.GreyBackground,
          fontFamily: 'rubik',
        ),
        home: Wrapper(),
      ),
    );
  }
}
