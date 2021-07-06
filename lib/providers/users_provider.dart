import 'package:admin_dashboard/models/http/users_response.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/api/CafeApi.dart';
import 'package:admin_dashboard/models/usuario.dart';

class UsersProvider extends ChangeNotifier {
  List<Usuario> users = [];
  bool isLoading = true;

  UsersProvider() {
    this.getPaginatedUsers();
  }

  getPaginatedUsers() async {
    final resp = await CafeApi.httpGet('/usuarios?limite=100&desde=0');
    final usersResponse = UsersResponse.fromMap(resp);

    this.users = [...usersResponse.usuarios];
    isLoading = false;

    notifyListeners();
  }
}
