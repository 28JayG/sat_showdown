import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new LoginPage(),
      title: 'MyApp',
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  final MaterialColor color = Colors.indigo;

  final _usernamecontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  AnimationController logoAnimationController;
  Animation<double> logoAnimation;

  @override
  void initState() {
    super.initState();

    logoAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 400));
    logoAnimation = new CurvedAnimation(
        parent: logoAnimationController, curve: Curves.ease);
    logoAnimation.addListener(() => this.setState(() {}));
    logoAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage('assets/login_background.jpg'),
            fit: BoxFit.cover,
          ),
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new FlutterLogo(size: logoAnimation.value * 100, colors: color),
                new SizedBox(height: 10.0),
                //Username
                new TextField(
                  controller: _usernamecontroller,
                  decoration: new InputDecoration(
                    hintText: 'Username',
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                new SizedBox(height: 10.0),
                //Password
                new TextField(
                  controller: _passwordcontroller,
                  obscureText: true,
                  decoration: new InputDecoration(
                    hintText: 'Password',
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                new ButtonBar(
                  children: <Widget>[
                    new FlatButton(
                      onPressed: () {
                        _usernamecontroller.clear();
                        _passwordcontroller.clear();
                      },
                      splashColor: Colors.purple,
                      child: new Text('Cancel'),
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0)),
                    ),
                    new RaisedButton(
                      color: Colors.transparent,
                      splashColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      onPressed: () {
                        print('To be continued...');
                      },
                      child: new Text('Login'),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
