part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();
}

class PageUnInitial extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToStartedPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToMainPage extends PageEvent {
  final String nama, email, foto, id;
  GoToMainPage(this.nama, this.email, this.foto, this.id);
  @override
  List<Object> get props => [nama, email, foto, id];
}

class GoToProfilePage extends PageEvent {
  final String nama, email, foto, id;
  GoToProfilePage(this.nama, this.email, this.foto, this.id);
  @override
  List<Object> get props => [nama, email, foto, id];
}
