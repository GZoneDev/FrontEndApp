import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:receptico/core/asset/asset_path.dart';
import 'package:receptico/core/router/router.dart';
import 'package:receptico/generated/l10n.dart';

import '../widget/widget.dart';

@RoutePage()
class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    final router = AutoRouter.of(context);
    final localization = S.of(context);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Positioned(
            top: -91,
            right: -94,
            child: CircleWidget(width: 238, height: 238),
          ),
          const Positioned(
            bottom: -58,
            left: -71,
            child: CircleWidget(width: 170, height: 170),
          ),
          Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                      bottom: orientation == Orientation.portrait ? 60.0 : 0,
                    ),
                    child: SvgPicture.asset(
                      AssetPath.logoPath,
                      width: 282,
                      height: 282,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 34.0),
                    child: Text(
                      localization.wantToCookQuestion,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  TextButtonWidget(
                    text: localization.loginButton,
                    onPressed: () {
                      router.goTo(LoginRoute());
                    },
                  ),
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: () {
                      router.goTo(RegisterRoute());
                    },
                    child: Text(
                      localization.registerLink,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
