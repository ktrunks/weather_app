import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'application_event.dart';
import 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationBlocEvent, ApplicationBlocState> {
  SharedPreferences sharedPreference;

  ApplicationBloc(this.sharedPreference) : super(ApplicationInitialState());

  @override
  ApplicationBlocState get initialState => ApplicationInitialState();

  GlobalKey<NavigatorState> shopNavigatorKey = GlobalKey<NavigatorState>();


  /// scaffold which is used for toast or context
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Stream<ApplicationBlocState> mapEventToState(
      ApplicationBlocEvent event) async* {
    // TODO: implement mapEventToState
    if (event is ApplicationDataState) {
    } else if (event is ApplicationInitialEvent) {
      debugPrint('application initial state');
    } else if (event is ApplicationLoadSuccess) {
      // yield ApplicationDataState(loginResponse: event.loginResponse);
    } else if (event is ApplicationErrorEvent) {
      yield ApplicationDateErrorState(event.errorMessage);
    }
  }

  void getApplicationData(loginData) {

  }


}
