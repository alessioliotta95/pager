# Pager

Numeric pagination suitable for multiple cases, such as, custom paged table.

<p align="center">
  <img src="https://media.giphy.com/media/r8zXyoxgJVgEQpGYLe/giphy.gif">
  
</p>
<p align="center">
  <img src= "https://media3.giphy.com/media/jCE3XUgsvzhyq31tQJ/giphy.gif">
</p>

## Getting started

You should ensure that you add the pager as a dependency in your flutter project.
```yaml
dependencies:
 pager: ^0.0.6
```

## Example Project

There is a example project in the `example` folder. Check it out. Otherwise, keep reading to get up and running.

## Usage

Need to include the import the package to the dart file where it will be used, use the below command,

```dart
import 'package:pager/pager.dart';

```
**Pager**

Basic Widget

```dart

new Pager(
            currentPage: _currentPage,
            totalPages: 5,
            onPageChanged: (page) {},
          ),

```

Example 1

```dart
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
              },
            ),
          ],
        ),
      ),
    );
  }
}
```

Complete example 2

```dart
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
  late int _itemsPerPage;
  List<int> pages = [5, 10, 18, 50, 100];
  late int _totalPages;
  final int _totalElements = 100;
  @override
  void initState() {
    super.initState();
    _currentPage = 1;
    _itemsPerPage = pages.first;
    _totalPages = (_totalElements / _itemsPerPage) as int;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pagination Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pagination Example'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 180,
                  width: 400,
                  color: Colors.blue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "TOTAL ELEMENT: $_totalElements",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text(
                        "PAGE: $_currentPage",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text(
                        "ITEMS PER PAGE: $_itemsPerPage",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text(
                        "TOTAL PAGES: $_totalPages",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                Pager(
                  currentItemsPerPage: _itemsPerPage,
                  currentPage: _currentPage,
                  totalPages: _totalPages,
                  onPageChanged: (page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  showItemsPerPage: true,
                  onItemsPerPageChanged: (itemsPerPage) {
                    setState(() {
                      _itemsPerPage = itemsPerPage;
                      _totalPages = (_totalElements / _itemsPerPage).ceil();
                      _currentPage = 1;
                    });
                  },
                  itemsPerPageList: pages,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```
