import 'package:admin_dashboard/providers/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/models/usuario.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:provider/provider.dart';

class UserView extends StatefulWidget {
  const UserView({Key? key, required this.uid}) : super(key: key);

  final String uid;

  @override
  _UserViewState createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  Usuario? user;
  @override
  void initState() {
    super.initState();
    final usersProvider = Provider.of<UsersProvider>(context, listen: false);

    usersProvider.getUserById(widget.uid).then(
          (userDB) => setState(() {
            this.user = userDB;
          }),
        );
    print(widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text("User View", style: CustomLabels.h1),
          SizedBox(height: 10),
          if (user == null)
            WhiteCard(
              child: Container(
                alignment: Alignment.center,
                height: 300,
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
