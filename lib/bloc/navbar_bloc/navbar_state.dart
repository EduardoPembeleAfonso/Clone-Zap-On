part of 'navbar_bloc.dart';

@immutable
abstract class NavbarState extends Equatable {}

class NotInitial extends NavbarState {
  @override
  List<Object?> get props => [];
}

class Initial extends NavbarState {
  @override
  List<Object?> get props => [];
}

class Home extends NavbarState {
  @override
  List<Object?> get props => [];
}

class ManagmentAccount extends NavbarState {
  @override
  List<Object?> get props => [];
}

class GuideTv extends NavbarState {
  @override
  List<Object?> get props => [];
}

class Settings extends NavbarState {
  @override
  List<Object?> get props => [];
}
