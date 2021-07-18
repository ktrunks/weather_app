import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'progress_event.dart';
import 'progress_state.dart';

class ProgressBloc extends Bloc<ProgressBlocEvent, ProgressBlocState> {
  ProgressBloc() : super(ProgressState(progressStatus: false));

  @override
  Stream<ProgressBlocState> mapEventToState(ProgressBlocEvent event) async* {
    // TODO: implement mapEventToState
    debugPrint('error event --- ${event}');

    if (event is ProgressEvent) {
      debugPrint('error event');
      bool progress = !(state as ProgressState).progressStatus;
      yield ProgressState(progressStatus: progress);
    }
  }
}
