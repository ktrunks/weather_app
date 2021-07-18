import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/util/color.dart';

import 'error/error_bloc.dart';
import 'error/error_state.dart';
import 'error/error_widget.dart';
import 'progress/progress_bloc.dart';
import 'progress/progress_state.dart';
import 'progress/progress_widget.dart';

class BaseScreen extends StatefulWidget {
  final Widget screenWidget;
  final GlobalKey<ScaffoldState> scaffoldKey;

  BaseScreen({required this.screenWidget, required this.scaffoldKey});

  @override
  BaseScreenState createState() => BaseScreenState();
}

class BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: widget.scaffoldKey,
        backgroundColor: white,
        body: Stack(
          children: [
            Column(
              children: [
                BlocBuilder<ErrorBloc, ErrorBlocState>(
                  builder: (context, state) {
                    return (state as ErrorDisplayState).errorStatus
                        ? CustomErrorWidget(
                            (state as ErrorDisplayState).errorMessage)
                        : Container();
                  },
                ),
                Expanded(
                  child: Column(
                    children: [widget.screenWidget],
                  ),
                ),
              ],
            ),
            BlocBuilder<ProgressBloc, ProgressBlocState>(
              builder: (context, state) {
                return (state as ProgressState).progressStatus
                    ? ProgressWidget()
                    : Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
