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
import 'register_bloc.dart';

class RegisterView extends StatelessWidget {
  final RegisterBloc _registerBloc = RegisterBloc();
  final AuthenticationBloc _authenticationBloc = instance<AuthenticationBloc>();
  final TextEditingController _nameTextEditingController =
      TextEditingController();
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _mobileNumberTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  RegisterView({Key? key}) : super(key: key);

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
          if (state is RegisterInProgress) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              dismissDialog(context);
              showDialog(
                  context: context,
                  builder: (_) => Center(
                      child: Container(
                          color: ColorManager.white,
                          child: const Text('loading'))));
            });
          } else if (state is RegisterFailed) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              dismissDialog(context);

              showDialog(
                  context: context,
                  builder: (_) => Center(
                      child: Container(
                          color: ColorManager.white,
                          child: Text(state.message.tr()))));
            });
          } else if (state is RegisterSuccess) {
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
                children: [
                  SizedBox(height: AppSize.s60.h),
                  Text(
                    AppStrings.signUp,
                    style: Theme.of(context).textTheme.titleLarge,
                  ).tr(),
                  SizedBox(height: AppSize.s60.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      BlocSelector<RegisterBloc, RegisterState, String?>(
                        bloc: _registerBloc,
                        selector: (state) => state.nameErrorMessage,
                        builder: (context, errorMessage) {
                          return TextInput(
                            controller: _nameTextEditingController,
                            label: AppStrings.name.tr(),
                            errorText: errorMessage?.tr(),
                            onChanged: (name) {
                              _registerBloc.add(NameChanged(name));
                            },
                          );
                        },
                      ),
                      SizedBox(height: AppSize.s20.h),
                      BlocSelector<RegisterBloc, RegisterState, String?>(
                        bloc: _registerBloc,
                        selector: (state) => state.emailErrorMessage,
                        builder: (context, emailErrorMessage) {
                          return TextInput(
                            controller: _emailTextEditingController,
                            label: AppStrings.email.tr(),
                            errorText: emailErrorMessage?.tr(),
                            onChanged: (email) {
                              _registerBloc.add(EmailChanged(email));
                            },
                          );
                        },
                      ),
                      SizedBox(height: AppSize.s20.h),
                      BlocSelector<RegisterBloc, RegisterState, String?>(
                        bloc: _registerBloc,
                        selector: (state) => state.mobileNumberErrorMessage,
                        builder: (context, mobileNumberErrorMessage) {
                          return TextInput(
                            controller: _mobileNumberTextEditingController,
                            label: AppStrings.mobileNumber.tr(),
                            errorText: mobileNumberErrorMessage?.tr(),
                            onChanged: (mobileNumber) {
                              _registerBloc
                                  .add(MobileNumberChanged(mobileNumber));
                            },
                          );
                        },
                      ),
                      SizedBox(height: AppSize.s20.h),
                      BlocSelector<RegisterBloc, RegisterState, String?>(
                        bloc: _registerBloc,
                        selector: (state) => state.passwordErrorMessage,
                        builder: (context, passwordErrorMessage) {
                          return TextInput(
                            controller: _passwordTextEditingController,
                            label: AppStrings.password.tr(),
                            errorText: passwordErrorMessage?.tr(),
                            onChanged: (password) {
                              _registerBloc.add(PasswordChanged(password));
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.s60.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      BlocSelector<RegisterBloc, RegisterState, Status>(
                        bloc: _registerBloc,
                        selector: (state) => state.status,
                        builder: (context, status) {
                          return FullOutlinedButton(
                              onPressed: (status == Status.accepted
                                  ? () {
                                      instance<AuthenticationBloc>().add(
                                          RegisterButtonPressed(RegisterRequest(
                                              _nameTextEditingController.text,
                                              _emailTextEditingController.text,
                                              _mobileNumberTextEditingController
                                                  .text,
                                              _passwordTextEditingController
                                                  .text)));
                                    }
                                  : null),
                              text: AppStrings.signUp.tr());
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(AppStrings.alreadyHaveAccount).tr(),
                          TextButton(
                              onPressed: () => Navigator.pushReplacementNamed(
                                  context, Routes.loginRoute),
                              child: const Text(AppStrings.signIn).tr()),
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
