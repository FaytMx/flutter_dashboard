import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class IconsView extends StatelessWidget {
  const IconsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text("Icons", style: CustomLabels.h1),
          SizedBox(height: 10),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            children: [
              WhiteCard(
                title: "ac_unit_outlined",
                child: Center(
                  child: Icon(Icons.ac_unit_outlined),
                ),
                width: 170,
              ),
              WhiteCard(
                title: "access_alarm_outlined",
                child: Center(
                  child: Icon(Icons.access_alarm_outlined),
                ),
                width: 170,
              ),
              WhiteCard(
                title: "accessible_outlined",
                child: Center(
                  child: Icon(Icons.accessible_outlined),
                ),
                width: 170,
              ),
              WhiteCard(
                title: "alarm_add_outlined",
                child: Center(
                  child: Icon(Icons.alarm_add_outlined),
                ),
                width: 170,
              ),
              WhiteCard(
                title: "account_tree_outlined",
                child: Center(
                  child: Icon(Icons.account_tree_outlined),
                ),
                width: 170,
              ),
              WhiteCard(
                title: "panorama_vertical_select_outlined",
                child: Center(
                  child: Icon(Icons.panorama_vertical_select_outlined),
                ),
                width: 170,
              ),
              WhiteCard(
                title: "notifications_active_outlined",
                child: Center(
                  child: Icon(Icons.notifications_active_outlined),
                ),
                width: 170,
              ),
              WhiteCard(
                title: "no_drinks_outlined",
                child: Center(
                  child: Icon(Icons.no_drinks_outlined),
                ),
                width: 170,
              ),
            ],
          )
        ],
      ),
    );
  }
}
