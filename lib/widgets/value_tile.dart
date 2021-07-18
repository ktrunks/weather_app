import 'package:flutter/material.dart';
import 'package:weather/util/color.dart';

import 'empty_widget.dart';

class ValueTile extends StatelessWidget {
  final String label;
  final String value;
  final IconData iconData;

  ValueTile(this.label, this.value, {required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          this.label,
          style: TextStyle(
              /*color: AppStateContainer.of(context)
                  .theme
                  .accentColor
                  .withAlpha(80)*/
              ),
        ),
        SizedBox(
          height: 5,
        ),
        this.iconData != null
            ? Icon(
                iconData,
                // color: AppStateContainer.of(context).theme.accentColor,
                color: backgroundColor,
                size: 20,
              )
            : EmptyWidget(),
        SizedBox(
          height: 10,
        ),
        Text(
          this.value,
          /*style:
              TextStyle(color: AppStateContainer.of(context).theme.accentColor),*/
        ),
      ],
    );
  }
}
