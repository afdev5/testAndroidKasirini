part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  const PageState();
}
class StateInitial extends PageState {
  @override
  List<Object> get props => [];
}

class OnStartedPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnMainPage extends PageState {
  final String nama, email, foto, id;
  OnMainPage(this.nama, this.email, this.foto, this.id);
  @override 
  List<Object> get props => [nama, email, foto, id];
}

class OnProfilePage extends PageState {
  final String nama, email, foto, id;
  OnProfilePage(this.nama, this.email, this.foto, this.id);
  @override 
  List<Object> get props => [nama, email, foto, id];
}