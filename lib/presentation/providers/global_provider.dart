import 'package:flutter/material.dart';
import 'package:wrk/common/utils/route_util.dart';

class GlobalProvider extends ChangeNotifier {
  final BuildContext context;
  GlobalProvider({
    required this.context,
  });

  RouteUtil get routeUtil => RouteUtil(context: context);
}
