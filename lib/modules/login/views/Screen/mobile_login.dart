import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/link.dart';

import '../../../app_bar/modules/questionnaire/views/subpages/responses_list/user_responses_list.dart';
import '../../controllers/login_controller.dart';
import '../../controllers/questionnaire_response_controller.dart';
import '../widgets/gradient.dart';
import '../widgets/login_fields.dart';
import '../widgets/login_grid.dart';
import '../widgets/logo.dart';
import 'package:ummobile/statics/Widgets/badge.dart' as badges;

class MobileLogin extends StatelessWidget {
  const MobileLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GradientBG(),
        ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            LoginLogo(),
            GetX<LoginController>(
              init: LoginController(context),
              builder: (_) {
                if (_.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return (_.showQuickLogins.value)
                      ? LoginSessionsGrid()
                      : LoginFields();
                }
              },
            )
          ],
        ),
        SafeArea(
          child: Container(
            child: Link(
              uri: Uri.parse('https://www.um.edu.mx/privacidad'),
              builder: (context, followLink) => GestureDetector(
                onTap: followLink,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'privacy_policy'.tr.capitalizeFirst!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        GetX<QuestionnaireResponseController>(
            init: QuestionnaireResponseController(),
            builder: (_) {
              return Align(
                alignment: Alignment.topRight,
                child: Visibility(
                  visible: _.hasResponses.value,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, kToolbarHeight, 8, 0),
                    child: FloatingActionButton(
                      child: badges.Badge(
                        top: -6,
                        right: -6,
                        value: _.responseCount.toString(),
                        child: Icon(
                          Icons.assignment,
                        ),
                      ),
                      elevation: 0,
                      highlightElevation: 0,
                      backgroundColor: Colors.transparent,
                      onPressed: () {
                        Get.to(() => HealthQuestionnaireResponses());
                      },
                    ),
                  ),
                ),
              );
            }),
      ],
    );
  }
}
