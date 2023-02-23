import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:ummobile/modules/app_bar/modules/questionnaire/views/subpages/responses_list/user_responses_list.dart';
import 'package:ummobile/modules/login/controllers/login_controller.dart';
import 'package:ummobile/modules/login/controllers/questionnaire_response_controller.dart';
import 'package:ummobile/modules/login/views/Screen/mobile_login.dart';
import 'package:ummobile/statics/Widgets/badge.dart' as badges;
import 'package:url_launcher/link.dart';

import 'Screen/desktop_login.dart';
import 'widgets/widgets_export.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  @override
  void initState() {
    Get.put(LoginController(context));
    Get.put(QuestionnaireResponseController());
    Get.find<QuestionnaireResponseController>().refreshContent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScreenTypeLayout.builder(
      mobile: (BuildContext context) => MobileLogin(),
      tablet: (BuildContext context) => MobileLogin(),
      desktop: (BuildContext context) => DesktopLogin(),
      watch: (BuildContext context) => Container(color: Colors.purple),
    ));
  }
}
