import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  final MaterialColor color = Colors.indigo;

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  AnimationController logoAnimationController;
  Animation<double> logoAnimation;

  @override
  void initState() {
    super.initState();

    logoAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 300));
    logoAnimation = CurvedAnimation(
        parent: logoAnimationController, curve: Curves.ease);
    logoAnimation.addListener(() => this.setState(() {}));
    logoAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage('assets/login_background.jpg'),
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlutterLogo(size: logoAnimation.value * 100, colors: color),
                SizedBox(height: 10.0),
                //Username
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    hintText: 'Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                //Password
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        _usernameController.clear();
                        _passwordController.clear();
                      },
                      splashColor: Colors.blueAccent[50],
                      child: Text('Cancel'),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                    Builder(
                      builder:(context) => RaisedButton(
                        color: Colors.transparent,
                        splashColor: Colors.blueAccent[50],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        onPressed: () {
                          Scaffold.of(context).showSnackBar(SnackBar(content: Text('Hi! ${_usernameController.text}')));
                        },
                        child: Text('Login'),
                      ),
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
