import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc(PageState initialState) : super(initialState);

  @override
  Stream<PageState> mapEventToState(
    PageEvent event,
  ) async* {
    if (event is PageUnInitial) {
      SharedPreferences pref = await SharedPreferences.getInstance();
      bool isLogin = pref.getBool("isLogin");
      print("status Login : " + isLogin.toString());
      if (isLogin != null) {
        yield OnMainPage(pref.getString("nama"), pref.getString("email"),
            pref.getString("foto"), pref.getString("id"));
      } else {
        yield OnStartedPage();
      }
    } else if (event is GoToStartedPage) {
      yield OnStartedPage();
    } else if (event is GoToMainPage) {
      yield OnMainPage(event.nama, event.email, event.foto, event.id);
    } else if (event is GoToProfilePage) {
      yield OnProfilePage(event.nama, event.email, event.foto, event.id);
    }
  }
}
