import 'package:admin_dashboard/ui/shared/navbar.dart';
import 'package:admin_dashboard/ui/shared/sidebar.dart';
import 'package:flutter/material.dart';

class DashboardLayout extends StatelessWidget {
  const DashboardLayout({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffedf1f2),
      body: Stack(
        children: [
          Row(
            children: [
              if (size.width >= 700) Sidebar(),
              Expanded(
                child: Column(
                  children: [
                    //navbar
                    Navbar(),
                    //view
                    Expanded(child: child),
                  ],
                ),
              )
            ],
          ),
          if (size.width < 700) Sidebar(),
        ],
      ),
    );
  }
}
