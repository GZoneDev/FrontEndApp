import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receptico/core/router/router.dart';
import 'package:receptico/generated/l10n.dart';

import '../block/block.dart';
import '../model/user.dart';
import '../widget/widget.dart';

@RoutePage()
class RestorePhonePage extends StatefulWidget {
  const RestorePhonePage({super.key});

  @override
  State<RestorePhonePage> createState() => _RestorePhonePageState();
}

class _RestorePhonePageState extends State<RestorePhonePage> {
  late bool _isError;
  AuthLoginFailure _authState = AuthLoginFailure();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _isError = false;
  }

  void _clearFailMessage() {
    if (_isError) {
      _isError = false;
      setState(() => _authState = AuthLoginFailure());
    }
  }

  void _submit() {
    context.read<AuthBloc>().add(
          AuthLogin(
            user: LoginUser(
              email: _emailController.text,
              password: _passwordController.text,
            ),
          ),
        );
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
                width: 278,
                height: 458,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TitleWidget(
                        title: 'localization.loginTitle',
                        subtitle: 'localization.loginSubtitle',
                      ),
                      const SizedBox(height: 16),
                      TextInputWidget(
                        controller: _emailController,
                        placeholder: 'localization.emailOrPhonePlaceholder',
                        onTap: _clearFailMessage,
                        errorMessage: _authState.emailError,
                        margin: EdgeInsets.only(bottom: 10.0),
                        marginWithError: EdgeInsets.only(bottom: 7.0),
                      ),
                      TextInputWidget(
                        controller: _emailController,
                        placeholder: 'localization.emailOrPhonePlaceholder',
                        onTap: _clearFailMessage,
                        errorMessage: _authState.emailError,
                        margin: EdgeInsets.only(bottom: 10.0),
                        marginWithError: EdgeInsets.only(bottom: 7.0),
                      ),
                      TextInputWidget(
                        controller: _emailController,
                        placeholder: 'localization.emailOrPhonePlaceholder',
                        onTap: _clearFailMessage,
                        errorMessage: _authState.emailError,
                        margin: EdgeInsets.only(bottom: 10.0),
                        marginWithError: EdgeInsets.only(bottom: 7.0),
                      ),
                      TextButtonWidget(
                        text: 'localization.loginButton',
                        onPressed: _submit,
                      ),
                      const SizedBox(height: 16),
                      FooterWidget(
                        text: localization.noAccountQuestion,
                        linkText: localization.createAccount,
                        onTab: () {
                          router.goTo(RegisterRoute());
                          _clearFailMessage();
                        },
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
