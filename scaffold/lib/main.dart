import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('App Bar'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple
              ),
              child: Text(
                'Menu',
                style: TextStyle
                (color: Colors.white,
                fontSize: 24,
                 ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('Pagamento')
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Menseges'),
            ),
            ListTile(
              leading: Icon(Icons.location_searching),
              title: Text('Localização'),
            ),
            ListTile(
              leading: Icon(Icons.mail),
              title: Text('e-mail')
            ),
            ListTile(
              leading: Icon(Icons.map),
              title: Text('Map')
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile')
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings')
            ),
          ],
        ),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
