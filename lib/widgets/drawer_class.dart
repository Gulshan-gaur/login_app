import 'package:flutter/material.dart';
import 'package:chestX/screens/chestX_test_screen.dart';
import 'package:chestX/screens/records_screen.dart';
import 'package:chestX/screens/subscription_details.dart';
import 'package:chestX/widgets/hexColor.dart';


class DrawerScreen extends StatefulWidget {
  final String title;
  DrawerScreen({Key key, this.title}) : super(key: key);
  
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  int _selectedDestination = 0;
  Color drawerColor = HexColor("#012606");

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontSize: 14.0, color: Colors.red.shade800);

    return //Row(
      //children: [
        Drawer(
         child: Container(
          width: 100,
          color:drawerColor,
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'ChestX',
                  style: style.copyWith(
                    color: Colors.black12,
                    fontWeight: FontWeight.bold)
                ),
              ),
              Divider(
                height: 1,
                thickness: 1,
              ),
              ListTile(
                leading: Icon(Icons.plus_one),
                title: Text('Test'),
                selected: _selectedDestination == 0,
                onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => ChestX())),
              ),
              ListTile(
                leading: Icon(Icons.wallet_giftcard_outlined),
                title: Text('Item 2'),
                selected: _selectedDestination == 1,
                onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => RecordsScreen())),
              ),
              ListTile(
                leading: Icon(Icons.account_circle_rounded),
                title: Text('Item 3'),
                selected: _selectedDestination == 2,
                onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => SubscriptionScreen())),
              ),
              Divider(
                height: 1,
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Label',
                ),
              ),
              ListTile(
                leading: Icon(Icons.bookmark),
                title: Text('Item A'),
                selected: _selectedDestination == 3,
                onTap: () => selectDestination(3),
              ),
            ],
          ),
        ));
        //VerticalDivider(
        //  width: 1,
        //  thickness: 1,
        //);
        /*Expanded(
          child: Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              padding: EdgeInsets.all(20),
              childAspectRatio: 3 / 2,
              children: [
                Container(height:200,width:200,color:Colors.blue)
                /*Image.asset('assets/nav-drawer-1.jpg'),
                Image.asset('assets/nav-drawer-2.jpg'),
                Image.asset('assets/nav-drawer-3.jpg'),
                Image.asset('assets/nav-drawer-4.jpg'),*/
              ],
            ),
          ),
        ),*/
      //],
    //);
  }

  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });
  }
}
/*
class MyApp extends StatelessWidget {
  final appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
      theme: ThemeData(
        primaryColor: Color(0xFF6200EE),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedDestination = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Header',
                style: textTheme.headline6,
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Item 1'),
              selected: _selectedDestination == 0,
              onTap: () => selectDestination(0),
            ),
            ListTile(
              leading: Icon(Icons.delete),
              title: Text('Item 2'),
              selected: _selectedDestination == 1,
              onTap: () => selectDestination(1),
            ),
            ListTile(
              leading: Icon(Icons.label),
              title: Text('Item 3'),
              selected: _selectedDestination == 2,
              onTap: () => selectDestination(2),
            ),
            Divider(
              height: 1,
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Label',
              ),
            ),
            ListTile(
              leading: Icon(Icons.bookmark),
              title: Text('Item A'),
              selected: _selectedDestination == 3,
              onTap: () => selectDestination(3),
            ),
          ],
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        padding: EdgeInsets.all(20),
        childAspectRatio: 3 / 2,
        children: [
          Image.asset('assets/nav-drawer-1.jpg'),
          Image.asset('assets/nav-drawer-2.jpg'),
          Image.asset('assets/nav-drawer-3.jpg'),
          Image.asset('assets/nav-drawer-4.jpg'),
        ],
      ),
    );
  }

  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });
  }
}
*/
/*
/// Flutter code sample for NavigationRail

// This example shows a [NavigationRail] used within a Scaffold with 3
// [NavigationRailDestination]s. The main content is separated by a divider
// (although elevation on the navigation rail can be used instead). The
// `_selectedIndex` is updated by the `onDestinationSelected` callback.

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.selected,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.favorite_border),
                selectedIcon: Icon(Icons.favorite),
                label: Text('First'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bookmark_border),
                selectedIcon: Icon(Icons.book),
                label: Text('Second'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.star_border),
                selectedIcon: Icon(Icons.star),
                label: Text('Third'),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          // This is the main content.
          Expanded(
            child: Center(
              child: Text('selectedIndex: $_selectedIndex'),
            ),
          )
        ],
      ),
    );
  }
}
*/

