import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_zap_on/data/repositories/auth_repository.dart';
import 'package:meta/meta.dart';

part 'navbar_event.dart';
part 'navbar_state.dart';

class NavbarBloc extends Bloc<NavbarEvent, NavbarState> {
  final AuthRepository authRepository;
  NavbarBloc({required this.authRepository}) : super(Initial()) {
    on<GoHome>((event, emit) async {
      emit(Home());
    });
    on<GoManagmentAccount>((event, emit) async {
      emit(ManagmentAccount());
    });
    on<GoGuideTv>((event, emit) async {
      emit(GuideTv());
    });
    on<GoSettings>((event, emit) async {
      emit(Settings());
    });
  }
}
