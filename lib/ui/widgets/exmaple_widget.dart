import 'package:flutter/material.dart';

class ExampleWidget extends StatefulWidget {
  const ExampleWidget({Key? key}) : super(key: key);

  @override
  _ExampleWidgetState createState() => _ExampleWidgetState();
}

/// application life cycle
class _ExampleWidgetState extends State<ExampleWidget>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // small data
    ListView(
      children: [
        // TextWidget(name: 'vinod',),


      ],
    );

    /// memory
    /// large data
    ListView.builder(
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          ///  Image(); 10MB
          return Container();
        });

    Column(
      children: [],
    );

    Row(
      children: [],
    );
    return Container();
  }

  /// limited items
  List<Widget> getListViewWidget() {
    List<Widget> widgets = [];

    /// 100 *10 mb
    for (int i = 0; i < 100; i++) {
      widgets.add(Container());
    }
    return widgets;
  }


  // listnes  for application change
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      /// video play
    } else if (state == AppLifecycleState.paused) {
      /// video pause
    } else if (state == AppLifecycleState.inactive) {
      /// video pause
    }
    if (state == AppLifecycleState.detached) {
      /// video pause
    }
    debugPrint('application life cycle  --- $state');
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }
}
