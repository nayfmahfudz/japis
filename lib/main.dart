import 'package:flutter/material.dart';
import 'package:japis_new/navigasi/awal/Awal.dart';
import 'package:japis_new/navigasi/pesanan/Pesanan.dart';
import 'package:japis_new/navigasi/inbox/Inbox.dart';
import 'package:japis_new/navigasi/akun/Login.dart';

void main() => runApp(MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: _title,
      home: Akun(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HalamanAwal(),
    Pesanan(),
    Inbox(),
    Akun()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Color(0xFF44D8F3),
            ),
            label: 'Awal',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              color: Color(0xFF44D8F3),
            ),
            label: 'Pesanan',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.mail,
              color: Color(0xFF44D8F3),
            ),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Color(0xFF44D8F3),
            ),
            label: 'Akun',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
        backgroundColor: Colors.black,
      ),
    );
  }
}
