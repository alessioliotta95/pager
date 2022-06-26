import 'package:flutter/material.dart';
import 'package:pager/pager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pagination Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPage = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pagination Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              margin: const EdgeInsets.all(32),
              color: Colors.blue,
              child: Center(
                child: Text(
                  "PAGE: $_currentPage",
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            Pager(
                currentPage: _currentPage,
                totalPages: 5,
                onPageChanged: (page) {
                  setState(() {
                    _currentPage = page;
                  });
                })
          ],
        ),
      ),
    );
  }
}
