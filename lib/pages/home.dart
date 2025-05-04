import 'package:flutter/material.dart';
import 'package:plexion/widgets/sidebar.dart';
import 'package:sidebarx/sidebarx.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final SidebarXController _controller = SidebarXController(selectedIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
      children: [
        // side navbar
        // SidebarX(controller: _controller,
        // theme: SidebarXTheme(
        //   hoverColor: Colors.white
        // ),
        // items: [
        //   SidebarXItem(icon: Icons.home, label: "Home")
        // ],
        // ),

        SideBar()
        // searc section
        //footer
      ]
      )
    );
  }
}
