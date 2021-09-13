import 'package:flutter/material.dart';

class DrawereWidget extends StatelessWidget {
  const DrawereWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(8),
        children: [
          SizedBox(
            height: 30,
          ),
          //Drawer Head
          DrawerHeader(
              padding: EdgeInsets.fromLTRB(5, 0, 150, 0),
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: ClipOval(
                        child: Image.asset(
                      "assets/images/galgaddot.jpg",
                      fit: BoxFit.fill,
                    )),
                    minRadius: 40,
                    maxRadius: 45,
                  ),
                  Text(
                    "Gal Gaddot",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "+2347060757050",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              )),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.category),
            title: Text("Categories"),
            onTap: () {},
          ),

          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
