import 'package:flutter/material.dart';
import 'package:myapp/models/item.dart';

class HomePage extends StatefulWidget {
  var items = new List<Item>();

  HomePage() {
    items = [];
    items.add(Item(title: "Arroz", done: true));
    items.add(Item(title: "Feijão", done: false));
    items.add(Item(title: "Farinha", done: true));
    items.add(Item(title: "Banana", done: true));
    items.add(Item(title: "Melancia", done: true));
    items.add(Item(title: "Laranja", done: false));
    items.add(Item(title: "Batata", done: true));
    items.add(Item(title: "Macarão", done: true));
    items.add(Item(title: "Trigo", done: false));
    items.add(Item(title: "Ovos", done: true));
    items.add(Item(title: "Laranja", done: true));
    items.add(Item(title: "Sadinha", done: true));
    items.add(Item(title: "Feijoada", done: false));
    items.add(Item(title: "Açucar", done: true));
    items.add(Item(title: "Sal", done: true));
    items.add(Item(title: "Manteiga", done: false));
    items.add(Item(title: "Catchup", done: true));
    items.add(Item(title: "Maionese", done: true));
    items.add(Item(title: "Tomate", done: true));
    items.add(Item(title: "Cebola", done: false));
    items.add(Item(title: "Biscoito", done: true));
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TodoList for balance"),
        actions: <Widget>[
          Icon(Icons.local_grocery_store),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.orange),
              child: const Text(
                'Setting',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('Pagamento'),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('email'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("Profile"),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (BuildContext contxt, int index) {
          final item = widget.items[index];
          return CheckboxListTile(
            title: Text(item.title),
            key: Key(item.title),
            value: item.done,
            onChanged: (value) {
              setState(() {
                item.done = value;
              });
            },
          );
        },
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
