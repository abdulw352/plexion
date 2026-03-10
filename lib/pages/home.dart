import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:plexion/widgets/search_section.dart';
import 'package:plexion/widgets/sidebar.dart';
import 'package:plexion/theme/colors.dart';
import 'package:sidebarx/sidebarx.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final SidebarXController _controller = SidebarXController(selectedIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: SidebarX(
      //   controller: _controller,
      //   items: const [SidebarXItem(icon: Icons.home, label: "Home")],
      // ),
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: Container(color: Colors.green, height: 80, width: 300),
      ),
      body: Row(
        children: [
          // side navbar
          kIsWeb ? SideBar() : SizedBox(),
          Expanded(
            child: Padding(
              padding: !kIsWeb ? const EdgeInsets.all(8.0) : EdgeInsets.zero,
              child: Column(
                children: [
                  Expanded(child: SearchSection()),
                  //footer
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            "info",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.footerGrey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // SidebarX(controller: _controller,
          // theme: SidebarXTheme(
          //   hoverColor: Colors.white
          // ),
          // items: [
          //   SidebarXItem(icon: Icons.home, label: "Home")
          // ],
          // ),
        ],
      ),
    );
  }
}
