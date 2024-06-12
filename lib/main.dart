import 'package:flutter/material.dart';
import 'registration_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Design Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ResponsiveHomePage(),
    );
  }
}

class ResponsiveHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Responsive Design Example'),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return WideScreenLayout();
            } else {
              return NarrowScreenLayout();
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RegistrationScreen()),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class WideScreenLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: Colors.blue,
            child: Center(
              child: Text(
                'Wide Screen Layout',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.green,
            child: Center(
              child: Text(
                'Additional Content',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class NarrowScreenLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: Colors.blue,
            child: Center(
              child: Text(
                'Narrow Screen Layout',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.green,
            child: Center(
              child: Text(
                'Additional Content',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
