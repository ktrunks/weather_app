import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/base/screen_data/screen_data_event.dart';
import 'package:weather/base/screen_data/screen_data_state.dart';

class ScreenDataBloc extends Bloc<ScreenDataBlocEvent, ScreenDataBlocState> {
  ScreenDataBloc() : super(ScreenDataDefault());

  @override
  ScreenDataBlocState get initialState => ScreenDataDefault();

  /// scaffold which is used for toast or context
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Stream<ScreenDataBlocState> mapEventToState(
      ScreenDataBlocEvent event) async* {
    if (event is ScreenDataInitialEvent) {}
  }

  void getEmailList() {}
}
