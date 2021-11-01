import 'package:get/get.dart';
import 'package:tackon/common/constant.dart';
import 'package:tackon/screen/dashboard_screen.dart';

final List<GetPage<dynamic>> router = <GetPage<dynamic>>[
  GetPage<dynamic>(
    name: RouteName.dashboard,
    page: () => const DashboardScreen(),
  ),
];
