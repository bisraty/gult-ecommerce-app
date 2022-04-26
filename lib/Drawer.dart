

import 'package:flutter/material.dart';


class Home_drawer extends StatefulWidget {
  @override
  _Home_drawerState createState() => _Home_drawerState();
}

class _Home_drawerState extends State<Home_drawer> {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color:  Color(0xffEAF4FC),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  // CircleAvatar(
                  //   backgroundColor: Colors.white,
                  //   radius: 25,
                  // ),
                  // SizedBox(
                  //   width: 10,
                  // ),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //
                  //
                  //   ],
                  // )
                ],
              ),
            ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  Divider(color: Colors.teal),
                  buildMenuItem(
                    text: 'home',
                    icon: Icons.home_outlined,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  buildMenuItem(
                    text: 'fitness',
                    icon: Icons.fitness_center_outlined,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  buildMenuItem(
                    text: 'nutrition',
                    icon: Icons.emoji_food_beverage_outlined,
                    onClicked: () => selectedItem(context, 2),
                  ),

                  Divider(color: Colors.teal),
                  // buildMenuItem(
                  //   text: 'About us',
                  //   icon: Icons.info,
                  //   onClicked: () => selectedItem(context, 4),
                  // ),
                  buildMenuItem(
                    text: 'unsubscribe',
                    icon: Icons.article,
                    onClicked: () => selectedItem(context, 5),
                  ),
                  buildMenuItem(
                    text:  "Logout",
                    icon: Icons.logout,
                    onClicked: () => selectedItem(context, 6),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    String text,
    IconData icon,
    VoidCallback onClicked,
  }) {
    final color = Colors.teal;
    final hoverColor = Colors.black;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => Homepage(),
        // ));
        break;

      case 1:
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => Fitnesspage(),
        // ));
        break;

      case 2:
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => Nutrationpage(),
        // ));
        break;

      case 3:
      // Navigator.of(context).push(MaterialPageRoute(
      //   builder: (context) => SavedBlog(),
      // ));
        break;
      case 5:
        // _showMyDialog();

        break;
      case 6:
        // logout();
        break;
    }
  }

  // logout() async {
  //   final pref = await SharedPreferences.getInstance();
  //   await pref.clear();
  //   Navigator.pushAndRemoveUntil(context,
  //       MaterialPageRoute(builder: (context) => Login()),
  //           (route) => false);
  //
  // }
  // Future<void> _showMyDialog() async {
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false, // user must tap button!
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text("unsubscribe/ከደንበኝነት ምዝገባ ይውጡ"),
  //         content: SingleChildScrollView(
  //           child: ListBody(
  //             children: <Widget>[
  //
  //               Text('In order to unsubscribe you have to send stop to 9711 \n'),
  //               Text('ከደንበኝነት ምዝገባ ለመውጣት ወደ 9711 stop መላክ አለብዎት '),
  //             ],
  //           ),
  //         ),
  //         actions: <Widget>[
  //           TextButton(
  //             child: Text('close'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //           TextButton(
  //             child: Text('send'),
  //             onPressed: () {
  //               setState(() {
  //                 launch('sms:8888?body= stop');
  //               });
  //
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
// share_app() async {
//   await Share.share(
//       'https://play.google.com/store'
//   );
// }
}
