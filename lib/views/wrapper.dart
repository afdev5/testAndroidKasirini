part of 'views.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageBloc, PageState>(
        builder: (_, pageState) => (pageState is OnStartedPage)
            ? Onboarding()
            : (pageState is OnMainPage)
                ? MainPage(nama: pageState.nama, email: pageState.email, foto: pageState.foto, id: pageState.id)
                : (pageState is OnProfilePage)
                ? Profile(nama: pageState.nama, email: pageState.email, foto: pageState.foto, id: pageState.id)
                : Container());
  }
}
