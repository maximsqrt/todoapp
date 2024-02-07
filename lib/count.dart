// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// void main() {
//   runApp(MyApp());
// }

// class Counter with ChangeNotifier {
//   int _count = 0;

//   int get count => _count;

//   void increment() {
//     _count++;
//     notifyListeners();
//   }
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => Counter(),
//       child: MaterialApp(
//         title: 'Counter App',
//         home: MyHomePage(),
//       ),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final counter = Provider.of<Counter>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Counter App'),
//       ),
//       body: Center(
//         child: Consumer<Counter>(
//           builder: (context, counter, child) {
//             return Text(
//               'Count: ${counter.count}',
//               style: TextStyle(fontSize: 24),
//             );
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           counter.increment();
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
