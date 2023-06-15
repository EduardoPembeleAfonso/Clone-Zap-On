part of 'navbar_bloc.dart';

abstract class NavbarEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GoHome extends NavbarEvent {
  final int showNextPage;

  GoHome(this.showNextPage);
}

class GoManagmentAccount extends NavbarEvent {
  final int showNextPage;
  GoManagmentAccount(this.showNextPage);
}

class GoGuideTv extends NavbarEvent {
  final int showNextPage;
  GoGuideTv(this.showNextPage);
}

class GoSettings extends NavbarEvent {
  final int showNextPage;
  GoSettings(this.showNextPage);
}
