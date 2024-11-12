import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            toolbarHeight: 70,
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            title: const Text("C U S T O M I Z E D"),
            leading: Builder(
              builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.menu,
                      size: 32,
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                );
              },
            ),
            actions: [
              InkWell(
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => ProfilePage()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.person,
                      size: 32,
                    ),
                    onPressed: () {
                      // Scaffold.of(context).openDrawer();
                    },
                  ),
                ),
              )
            ],
          ),
          // drawer: MyDrawer(),
          body: Column(
            children: [
              Center(
                  child: Text("profile page",
                      style: Theme.of(context).textTheme.bodyLarge)),
            ],
          )),
    );
  }
}
