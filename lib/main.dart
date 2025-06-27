import 'package:flutter/material.dart';
import 'package:day1_coba_flutter/injection_container.dart';
import 'package:day1_coba_flutter/config/theme/app_themes.dart';
import 'package:day1_coba_flutter/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:day1_coba_flutter/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:day1_coba_flutter/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: const DailyNews(),
    ));
  }
}

 













// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text('You have pushed the button this many times:'),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
