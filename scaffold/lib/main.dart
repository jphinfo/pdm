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
        child: Container(
          child: Text('Hellow World')),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          title: Text('Business'),
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          title: Text('School'), 
        ),
        ],
      ),
    );    
  }
}
