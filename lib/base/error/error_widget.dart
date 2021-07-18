import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'error_bloc.dart';
import 'error_event.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errorMessage;

  CustomErrorWidget(this.errorMessage);

  @override
  Widget build(BuildContext context) {
    ErrorBloc errorBlockSink = BlocProvider.of<ErrorBloc>(context);
    return Container(
      color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                errorMessage,
                style: TextStyle(color: Colors.white),
                maxLines: 5,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: Icon(
                Icons.close, //CloseIcon
                color: Colors.white,
              ),
              onTap: () => errorBlockSink.add(ErrorDisplayEvent(false, '')),
            ),
          )
        ],
      ),
    );
  }
}
