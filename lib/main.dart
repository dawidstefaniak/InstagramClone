import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MaterialColor white = const MaterialColor(
    0xFFFFFFFF,
    const <int, Color>{
      50: const Color(0xFFFFFFFF),
      100: const Color(0xFFFFFFFF),
      200: const Color(0xFFFFFFFF),
      300: const Color(0xFFFFFFFF),
      400: const Color(0xFFFFFFFF),
      500: const Color(0xFFFFFFFF),
      600: const Color(0xFFFFFFFF),
      700: const Color(0xFFFFFFFF),
      800: const Color(0xFFFFFFFF),
      900: const Color(0xFFFFFFFF),
    },
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram',
      theme: ThemeData(
        primarySwatch: white,
      ),
      home: MyHomePage(title: 'Instagram'),
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

  _getAppBar() {
    return AppBar(
      title: Text(widget.title),
      centerTitle: true,
      leading: Icon(Icons.camera_alt),
      actions: <Widget>[Icon(Icons.navigation)],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: _getBody(),
    );
  }

  _getBody() {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Text(
                "Stories",
                style: TextStyle(fontSize: 16),
              ),
              Spacer(),
              Icon(
                Icons.play_arrow,
              ),
              Text(
                "Watch All",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        Container(
          height: 90,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) return _getFirstStory();
                if (index%2 == 1) return SizedBox(width: 12,);
                else return _getStory();
              }
          ),
        ),
        _getPostColumn()
      ],
    );
  }

  _getFirstStory() {
    var firstStory = Column(children: <Widget>[
      Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage("assets/images/profile1.jpg"),
          ),
        ),
        width: 60,
        height: 60,
        child: Align(
          alignment: Alignment.bottomRight,
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
                border: Border.all(width: 2, color: Colors.white)),
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 15,
            ),
          ),
        ),
      ),
      Text("You")
    ]);
    return firstStory;
  }

  Widget _getStory() {
    var story = Column(children: <Widget>[
      Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage("assets/images/profile1.jpg"),
          ),
        ),
        width: 60,
        height: 60,
      ),
      Text("donnag144")
    ]);

    return story;
  }

  _getPostColumn() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("assets/images/profile1.jpg"),
                  ),
                ),
              ),
            ),
            Text(
              'donnag144',
              style: TextStyle(fontSize: 16),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(
                '...',
                style: TextStyle(fontSize: 22),
              ),
            )
          ],
        ),
        Image.asset(
          "assets/images/profile1.jpg",
          height: 350,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.favorite,
                color: Colors.red,
                size: 32,
              ),
              SizedBox(
                width: 15,
              ),
              Icon(Icons.comment, size: 32),
              SizedBox(
                width: 15,
              ),
              Icon(Icons.navigation),
              Spacer(),
              Icon(Icons.save_alt)
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Liked by tracyamalone and 10 others",
              style: TextStyle(fontSize: 15.5),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16, top: 8),
          child: Row(
            children: <Widget>[
              Text(
                "donnaq144",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 5,
              ),
              Text("Because every house in Colorado needs ")
            ],
          ),
        )
      ],
    );
  }
}
