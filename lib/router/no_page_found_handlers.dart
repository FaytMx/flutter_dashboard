import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/providers/side_menu_provider.dart';
import 'package:admin_dashboard/ui/views/no_page_found_view.dart';

class NoPageFoundHandlers {
  static Handler noPageFound = new Handler(handlerFunc: (context, params) {
    Provider.of<SideMenuProvider>(context!, listen: false)
        .setCurrentPageUrl("/404");
    return NoPageFoundView();
  });
}
