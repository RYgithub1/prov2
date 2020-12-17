import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prov2/counter.dart';
import 'package:prov2/flavor.dart';
import 'package:provider/provider.dart';



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      /// [ChangeNotifierProvider<TypeAnnotation>()]
      home: ChangeNotifierProvider<Counter>(
        create: (context) => Counter(),
        child: MyHomePage(title: 'Flavor v5'),
      ),

    );
  }
}



// class MyHomePage extends StatefulWidget {
// class MyHomePage extends StatelessWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//   final String title;
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }


// class _MyHomePageState extends State<MyHomePage> {
class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  // int _counter = 0;
  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final flavor = Provider.of<Flavor>(context, listen: false);
    final counter = Provider.of<Counter>(context, listen: false);  /// ["listen: false"必要だった]
    return Scaffold(
      appBar: AppBar(
        // title: Text(flavor.toString()),
        title: Text(title),

        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('push the btn'),
            // Text(
            //   '${counter.value}',
            //   style: Theme.of(context).textTheme.headline4,
            // ),
            Consumer<Counter>(   /// [Consumer<TA>()]により[受け]渡しが成立
              // builder: (context, counter, child) => Text(
              builder: (_, counter, __) => Text(
                '${counter.value}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counter.increment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
