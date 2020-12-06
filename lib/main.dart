import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Page1(),
    ));

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animate Page Route Transition'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Go to Page 2'),
          onPressed: () {
            Navigator.of(context).push(_createRoute());
          },
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Page2(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        //var begin = Offset(0.0, 0.0); //(dx, dy) (horizon, vertical) //No animation
        //var begin = Offset(0.0, 1.0); // From down to up
        var begin = Offset(1.0, 0.0); // From right to left
        //var begin = Offset(1.0, 1.0); // From bottom right corner
        //var begin = Offset.fromDirection(-0.4, 0.2); //(direction, distance)
        var end = Offset.zero;
        var curve = Curves.ease;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      });
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page2 Title'),
      ),
      body: Center(
        child: Text('This is Page2'),
      ),
    );
  }
}
