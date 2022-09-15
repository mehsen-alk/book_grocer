import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/color_manager.dart';
import '../../../../../config/routes_manager.dart';
import '../../../../../config/strings_manager.dart';
import '../../../../../config/values_manager.dart';
import '../../../../../core/app/di.dart';
import '../../../../../core/app/functions.dart';
import '../../../data/models/requests.dart';
import '../../bloc/authentication_bloc.dart';
import '../../widgets/widgets.dart';
import 'login_bloc.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final LoginBloc _loginBloc = LoginBloc();
  final AuthenticationBloc _authenticationBloc = instance<AuthenticationBloc>();
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, Routes.onBoardingRoute),
        ),
      ),
      body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        bloc: _authenticationBloc,
        builder: (context, state) {
          if (state is LoginInProgress) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              dismissDialog(context);
              showDialog(
                  context: context,
                  builder: (_) => Center(
                      child: Container(
                          color: ColorManager.white,
                          child: const Text('loading'))));
            });
          } else if (state is LoginFailed) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              dismissDialog(context);

              showDialog(
                  context: context,
                  builder: (_) => Center(
                      child: Container(
                          color: ColorManager.white,
                          child: Text(state.message.tr()))));
            });
          } else if (state is LoginSuccess) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              dismissDialog(context);

              Navigator.pushReplacementNamed(context, Routes.homeRoute);
            });
          }

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(AppPadding.p20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: AppSize.s60.h),
                  Text(
                    AppStrings.signIn,
                    style: Theme.of(context).textTheme.titleLarge,
                  ).tr(),
                  SizedBox(height: AppSize.s60.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      BlocSelector<LoginBloc, LoginState, String?>(
                          bloc: _loginBloc,
                          selector: (state) => state.emailErrorMessage,
                          builder: (context, errorText) {
                            return TextInput(
                              controller: _emailTextEditingController,
                              label: AppStrings.email.tr(),
                              errorText: errorText?.tr(),
                              onChanged: (email) =>
                                  _loginBloc.add(EmailChanged(email)),
                            );
                          }),
                      SizedBox(height: AppSize.s20.h),
                      BlocSelector<LoginBloc, LoginState, String?>(
                          bloc: _loginBloc,
                          selector: (state) => state.passwordErrorMessage,
                          builder: (context, errorText) {
                            return TextInput(
                              controller: _passwordTextEditingController,
                              label: AppStrings.password.tr(),
                              errorText: errorText?.tr(),
                              onChanged: (password) =>
                                  _loginBloc.add(PasswordChanged(password)),
                            );
                          }),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.forgetPassword);
                        },
                        child: const Text(AppStrings.forgetYourPassword).tr(),
                      )
                    ],
                  ),
                  SizedBox(height: AppSize.s60.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      BlocSelector<LoginBloc, LoginState, Status>(
                        bloc: _loginBloc,
                        selector: (state) => state.status,
                        builder: (context, status) {
                          return FullOutlinedButton(
                              onPressed: (status == Status.accepted
                                  ? () {
                                      _authenticationBloc.add(
                                          LoginButtonPressed(LoginRequest(
                                              _emailTextEditingController.text,
                                              _passwordTextEditingController
                                                  .text)));
                                    }
                                  : null),
                              text: AppStrings.signIn.tr());
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(AppStrings.notHaveAccountYet).tr(),
                          TextButton(
                              onPressed: () => Navigator.pushReplacementNamed(
                                  context, Routes.registerRoute),
                              child: const Text(AppStrings.signUp).tr()),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
