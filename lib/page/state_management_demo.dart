import 'package:flutter/material.dart';
import 'package:flutter_bqc/components/bottom_navigation.dart';
import 'package:flutter_bqc/config/api_base_url.dart';
import 'package:provider/provider.dart';

// class StateManagementDemo extends StatelessWidget {
//   int _count = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('StateManagementDemo'),
//         elevation: 0.0,
//       ),
//       body: Center(
//         child: Chip(
//           label: Text('$_count'),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () {
//           _count += 1;
//           print(_count);
//         },
//       ),
//     );
//   }
// }

class StateManagementDemo extends StatefulWidget {
  @override
  _StateManagementDemoState createState() => _StateManagementDemoState();
}

class _StateManagementDemoState extends State<StateManagementDemo> {
  int _count = 0;
  void _increaseCount() {
    setState(() {
      _count += 1;
      print(_count);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(URLConfig.apiHost['wingCodeDomain']);
    return CounterProvider(
        increaseCount: _increaseCount,
        child: Scaffold(
          appBar: AppBar(
            title: Text('StateManagementDemo'),
            elevation: 0.0,
          ),
          // body: Counter(_count, _increaseCount),
          body: Counter(),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: _increaseCount,
          ),
          bottomNavigationBar: BottomNavigator(),
        ));
  }
}

class Counter extends StatelessWidget {
  // final int count;
  // final VoidCallback increaseCount;
  // Counter(this.count, this.increaseCount);

  @override
  Widget build(BuildContext context) {
    final int count = CounterProvider.of(context).count;
    final VoidCallback increaseCount =
        CounterProvider.of(context).increaseCount;
    return Center(
      child: ActionChip(
        label: Text('$count'),
        onPressed: increaseCount,
      ),
    );
  }
}

class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increaseCount;
  final Widget child;

  CounterProvider({this.count, this.increaseCount, this.child})
      : super(child: child);
  static CounterProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(CounterProvider);

  @override
  // 决定是否通知继承了当前组件的其他组件
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }
}
