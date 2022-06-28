# Pager

Numeric pagination suitable for multiple cases, such as, custom paged table.

<p align="center">
  <img src="https://media.giphy.com/media/r8zXyoxgJVgEQpGYLe/giphy.gif">
</p>

## Getting started

You should ensure that you add the pager as a dependency in your flutter project.
```yaml
dependencies:
 pager: ^0.0.3
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

Complete example
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



