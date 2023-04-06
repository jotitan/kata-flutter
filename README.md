# KATA FLUTTER

This kata has for purpose to get hands on Flutter framework.
You can implement the app you want, but here are some ideas: FlexOffice app, MemeGenerator app, Poll app, etc.

# GETTING STARTED

First you will have to install Flutter (and the IDE Android Studio). Please refer to this part of the Flutter documentation : https://docs.flutter.dev/get-started/install.

Link to full doc : https://api.flutter.dev/index.html

# StateLess/StateFull Widgets

## StateLess

Stateless widgets are describing an immutable part of the graphic interface, and depends on and only on the configuration passed from the parent and his build context :

```dart
class MySuperStatelessWidget extends StatelessWidget {
  const MySuperStatelessWidget({ super.key, this.title });
  
  final String title; 

  @override
  Widget build(BuildContext context) {
    return Text(data: title);
  }
}
```

## StateFull

A widget that describe the user interface but have a mutable state : https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html
To mutate state, you can use the setState method

```dart
class MySuperStateFullWidget extends StatefulWidget {
  const Bird({
    super.key,
    this.color = const Color(0xFFFFE306),
    this.child,
  });
  
  final Color color;
  final Widget? child;

  @override
  State<MySuperStateFullWidget> createState() => _MySuperStateFullWidgetState();
}

class _MySuperStateFullWidgetState extends State<MySuperStateFullWidget> {
  double _size = 1.0;

  void grow() {
    setState(() { _size += 0.1; });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color,
      transform: Matrix4.diagonal3Values(_size, _size, 1.0),
      child: widget.child,
    );
  }
}
```
# State management
Another way to mutate the state of your app is to use a State Management approach. There's a lot of implementation, you can choose one in function of the needs of your app: https://docs.flutter.dev/development/data-and-backend/state-mgmt/options
## Provider

One of the easiest way to implement state management in your app is to use the Provider + ChangeNotifier approach

First define a class that extends ChangeNotifier
```dart
class MySuperList extends ChangeNotifier {

  final List<String> values = [
    '1',
    '2'
  ];

  List<String> get values => _values;

  void add(String value) {
    _values.add(value);
    notifyListeners(); // method to propagate the new value to the listeners
  }
}
```

Then add a ChangeNotifierProvider to the parent of the widget that needs to consume the data (in this example it's at the main.dart level) :

```dart
void main() {
  ChangeNotifierProvider(create: (context) => MySuperList(), child: const MySuperApp());
}
```

Finally in the widget consuming the data :

```dart
return Consumer<MySuperList>(
          builder: (context, listProvider, child) {
            // you can use the data inside the provider 
            listProvider.values.map(
                // do your stuff
            )
          },
        ),
```


# Basic useful widgets

## MaterialApp

Widget wrapping required widgets for building material-based apps : https://api.flutter.dev/flutter/material/MaterialApp-class.html

```dart
return MaterialApp(
  theme: ThemeData(
    // define your app theme
  ),
  home: MySuperHomeWidget(
    // home widget, can be any widget
  )
  debugShowCheckedModeBanner: false, // show or hide debug banner
  routes: <String, WidgetBuilder>{
    '/': (BuildContext context) {
      // another way to define your home route widget
      return MySuperHomeWidget();
    );
  },
    '/about': (BuildContext context) {
      // other route widget
    );
   }
  },
);
```

## Scaffold

Implements the basic material design visual layout structure : https://api.flutter.dev/flutter/material/Scaffold-class.html

```dart
return Scaffold(
      appBar: AppBar(
        // AppBar widget,
      ),
      body: MySuperBody(), // body widget, can be any widget
      floatingActionButton: FloatingActionButton(
        // FloatingActionButton widget
      ),
);
```

## AppBar

App bar widgets, exposing one or more actions in the app header : https://api.flutter.dev/flutter/material/AppBar-class.html

```dart
return AppBar(
        title: Text(
          // title to display in app bar
        ),
        actions: <Widget>[
          // list of widgets representing actions in your app bar (navigation, menus, etc) 
        ],
);
```
## Container

Container widget with painting, positioning and sizing : https://api.flutter.dev/flutter/widgets/Container-class.html

```dart
return Container(
    margin: const EdgeInsets.all(10.0), // container margin
    color: Colors.amber[600], // container color
    width: 48.0, // container width
    height: 48.0, // container height
);
```

## Column

Widget displaying children in vertically array : https://api.flutter.dev/flutter/widgets/Column-class.html

```dart
return Column(
  children: const <Widget>[
    // put your widgets here
  ],
)
```

## Row

Widget displaying children in horizontally array : https://api.flutter.dev/flutter/widgets/Column-class.html

```dart
return Row(
  children: const <Widget>[
   // put your widgets here
  ],
)
```
## Center

A widget that center its child within itself : https://api.flutter.dev/flutter/widgets/Center-class.html

```dart
return Center(
  child: const MySuperChild() // the centered child widget
)
```

## Align

A widget that align its child within itself : https://api.flutter.dev/flutter/widgets/Align-class.html

```dart
return Align(
      alignment: Alignment.topRight, // alignment position
      child: MySuperChild()
)
```

## SizedBox

A widget that size a widget within itself : https://api.flutter.dev/flutter/widgets/SizedBox-class.html

```dart
return SizedBox(
  width: 200.0, // width factor
  height: 300.0, // height factor
  child: MySuperChild(),
)
```
## Text

Display a text : https://api.flutter.dev/flutter/dart-html/Text-class.html

```dart
return Text(
  data: 'My super text'
)
```

## TextField

Text input field :

```dart
return TextField(
  decoration: InputDecoration(
    // input decoration style
  ),
  onChanged: (String value) {
    // onChanged callback, triggered on user input
  }
)
```

## Buttons
### ElevatedButton
A Material Design elevated button : https://api.flutter.dev/flutter/material/ElevatedButton-class.html

```dart
return ElevatedButton(
  style: ButtonStyle(
    // button style
  ),
  onPressed: () {}, // on user press
  child: const Text('Button'), // child widget
),
```
### FilledButton
https://api.flutter.dev/flutter/material/OutlinedButton-class.html
### OutlineButton
https://api.flutter.dev/flutter/material/OutlinedButton-class.html
### TextButton
https://api.flutter.dev/flutter/material/TextButton-class.html

### FloatingActionButton

A Material Design floating action button : https://api.flutter.dev/flutter/material/FloatingActionButton-class.html

```dart
return FloatingActionButton(
  onPressed: () {
    // triggered on user press
  },
  backgroundColor: Colors.green, // button color
  child: const Icon(Icons.navigation), // button icon
),
```
## Card

A Material Design card : https://api.flutter.dev/flutter/material/Card-class.html

```dart
return Card(
  child: // child widget
)
```
## ListTile

Single fixed-height row that wrap text between a leading and/or trailing widget : https://api.flutter.dev/flutter/material/ListTile-class.html

```dart
return ListTile(
  leading: MySuperLeadingWidget(), // leading widget
  title: Text('Title text'),
  trailing: MySuperTrailingWidget(), // trailing widget
),
```

## Radio

A Material Design radio : https://api.flutter.dev/flutter/material/Radio-class.html

```dart
return Radio<SingingCharacter>(
    value: '1', // value of the radio
    groupValue: _selectedValue, // selectedValue
    onChanged: (SingingCharacter? value) { // onChanged callback, called on user input
      setState(() {
      _selectedValue = value;
    });
  },
),
```

## Checkbox

A Material Design checkbox :

```dart
return Checkbox(
      checkColor: Colors.white, // color of the check icon when checked
      fillColor: Colors.red, // color of the fill when checked
      value: true, 
      onChanged: (bool? value) { // on changed triggered by user press
        setState(() {
          isChecked = value!;
        });
      },
    );
```
## Image

A widget that display an image : https://api.flutter.dev/flutter/widgets/Image/Image.asset.html
```yaml
# inside your pub.spec specify the assets
flutter:
  assets:
    - images/cat.png
```
```dart
return Image.asset('images/cat.png')
```

Another way is to display the image from an URL
```dart
return Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg')
```

## Icon

Widget that display an icon, Icons being a material library of icons : https://api.flutter.dev/flutter/widgets/Icon-class.html
```yaml
# inside your pub.spec specify that you're using material design
flutter:
  uses-material-design: true
```
```dart
return Icon(
  Icons.audiotrack, // icon to display
  color: Colors.green, // fill color
  size: 30.0, // size of the icon
),
```


# Navigation
https://docs.flutter.dev/development/ui/navigation
## Navigator
Used for small apps without deep linking. Widget that manage and display a stack of widgets : https://api.flutter.dev/flutter/widgets/Navigator-class.html

This example push a new route into the navigator :
```dart
onPressed: () {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const MySuperPage(),
    ),
  );
},
```

To use named routes that you have defined inside your material app you can do this:
```dart
onPressed: () {
  // Navigate to the new page using a named route.
  Navigator.pushNamed(context, '/mysuperroute');
}
```
## Drawer
https://docs.flutter.dev/cookbook/design/drawer
Drawer is an alternative to tabs for navigate inside your app (you can use it in a Scaffold for example):

```dart
return Drawer(
  child: ListView(
    // Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
    children: [
      const DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Text('Drawer Header'),
      ),
      ListTile(
        title: const Text('Item 1'),
        onTap: () {
          // Update the state of the app (navigate)
          // ...
          // Then close the drawer
          Navigator.pop(context);
        },
      ),
      ListTile(
        title: const Text('Item 2'),
        onTap: () {
          // Update the state of the app (navigate)
          // ...
          // Then close the drawer
          Navigator.pop(context);
        },
      ),
    ],
  ),
);
```


# Async
https://dart.dev/codelabs/async-await
## Future

Promise-like objects, here to handle asynchronous processing :

```dart
void callAsync() async {
  String coucou = await asyncCoucouFunction();
  // you can use asyncCoucouFunction.then(() => {}) also
  print(coucou);
}

Future<String> asyncCoucouFunction() {
  return Future.delayed(Duration(seconds: 2), () => "Coucou");
}
```
## FutureBuilder

Widget that builds itself based on the latest snapshot of interaction with a Future : https://api.flutter.dev/flutter/widgets/FutureBuilder-class.html

```dart
return FutureBuilder<String>(
  future: _coucou, // a previously-obtained Future<String> or null
  builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
    List<Widget> children;
      if (snapshot.hasData) {
        children = <Widget>[
        // build children with data
      ];
      } else if (snapshot.hasError) {
        children = <Widget>[
        // you can display a custom error widget
      ];
      } else {
        children = const <Widget>[
        // here you can handle an ongoing request that haven't finished yet
      ];
  }
  // the final return of the future builder
    return Center(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
      ),
    );
  },
),
```
## Http

Check this library to handle http calls : https://pub.dev/packages/http











