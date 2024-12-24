import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receptico/core/router/router.dart';
import 'package:receptico/generated/l10n.dart';

import 'package:flutter/cupertino.dart';

import '../block/block.dart';
import '../model/user.dart';
import '../widget/widget.dart';

@RoutePage()
class RestorePasswordPage extends StatefulWidget {
  const RestorePasswordPage({super.key});

  @override
  State<RestorePasswordPage> createState() => _RestorePasswordPageState();
}

class _RestorePasswordPageState extends State<RestorePasswordPage> {
  late bool _isError;
  AuthLoginFailure _authState = AuthLoginFailure();
  final _emailOrPhoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _isError = false;
  }

  void _clearFailMessage() {
    if (_isError) {
      _isError = false;
      //setState(() => _authState = AuthLoginFailure());
    }
  }

  void _submit() {
    // context.read<AuthBloc>().add(
    //       AuthLogin(
    //         user: LoginUser(
    //           email: _emailController.text,
    //         ),
    //       ),
    //     );
  }

  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);
    final localization = S.of(context);
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoginFailure) {
            _isError = true;
            setState(() => _authState = state);
          }
        },
        child: Stack(
          children: [
            const ScreenBackgroundWidget(),
            Container(
              alignment: Alignment.center,
              child: SizedBox(
                //width: 278,
                width: 350,
                height: 458,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TitleWidget(
                        title: 'Відновлення паролю',
                        subtitle:
                            'Введіть Email або номер телефону, який Ви використовували для реєстрації, і ми надішлемо Вам інструкцію',
                      ),
                      const SizedBox(height: 37),
                      SizedBox(
                        width: 278,
                        child: Column(
                          children: [
                            TextInputWidget(
                              controller: _emailOrPhoneController,
                              placeholder: localization.emailOrPhonePlaceholder,
                              onTap: _clearFailMessage,
                              errorMessage: _authState.emailError,
                              margin: EdgeInsets.only(bottom: 19.0),
                              marginWithError: EdgeInsets.only(bottom: 16.0),
                            ),
                            TextButtonWidget(
                              height: 50,
                              text: 'Відновити пароль',
                              onPressed: _submit,
                            ),
                            const SizedBox(height: 22),
                            Container(
                              //color: Colors.black,
                              //alignment: AlignmentDirectional.,
                              padding: EdgeInsets.only(right: 53),
                              child: Row(
                                spacing: 16,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    CupertinoIcons.chevron_back,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Повернутися до входу',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro Text', // Назва шрифту
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      height: 20 / 15,
                                      letterSpacing: 0.24,
                                      //decoration: TextDecoration.none,
                                      //textBaseline: TextBaseline.alphabetic,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              alignment: AlignmentDirectional.center,
                              color: Colors.black,
                              width: 172,
                              height: 50,
                            ),
                            //onTap: onTap,
                            // child: Text(
                            //   'Повернутися до входу',
                            //   style: TextStyle(
                            //       //color: fontColor,
                            //       //fontSize: fontSize,
                            //       ),
                            // ),
                            // child: Row(
                            //   //mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     //SizedBox(width: ),
                            //     Icon(
                            //       CupertinoIcons.left_chevron,
                            //       weight: 0.5,
                            //       color: Colors.white,
                            //     ),

                            //     Text(
                            //       'Повернутися до входу',
                            //       textAlign: TextAlign.center,
                            //       style: TextStyle(
                            //           //color: fontColor,
                            //           //fontSize: fontSize,
                            //           ),
                            //     ),
                            //   ],
                            //),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
