import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/routes_manager.dart';
import '../../../../../config/strings_manager.dart';
import '../../../../../config/values_manager.dart';
import '../../../data/models/requests.dart';
import '../../bloc/authentication_bloc.dart';
import '../../common/functions.dart';
import '../../common/widgets.dart';
import 'register_bloc.dart';

class RegisterView extends StatelessWidget {
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
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RegisterBloc(),
          ),
          BlocProvider(
            create: (context) => AuthenticationBloc(),
          ),
        ],
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            manageDialog(context, state);
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
                          selector: (state) => state.nameErrorMessage,
                          builder: (context, errorMessage) {
                            return TextInput(
                              controller: _nameTextEditingController,
                              label: AppStrings.name.tr(),
                              errorText: errorMessage?.tr(),
                              onChanged: (name) {
                                BlocProvider.of<RegisterBloc>(context)
                                    .add(NameChanged(name));
                              },
                            );
                          },
                        ),
                        SizedBox(height: AppSize.s20.h),
                        BlocSelector<RegisterBloc, RegisterState, String?>(
                          selector: (state) => state.emailErrorMessage,
                          builder: (context, emailErrorMessage) {
                            return TextInput(
                              keyboardType: TextInputType.emailAddress,
                              controller: _emailTextEditingController,
                              label: AppStrings.email.tr(),
                              errorText: emailErrorMessage?.tr(),
                              onChanged: (email) {
                                BlocProvider.of<RegisterBloc>(context)
                                    .add(EmailChanged(email));
                              },
                            );
                          },
                        ),
                        SizedBox(height: AppSize.s20.h),
                        BlocSelector<RegisterBloc, RegisterState, String?>(
                          selector: (state) => state.mobileNumberErrorMessage,
                          builder: (context, mobileNumberErrorMessage) {
                            return TextInput(
                              keyboardType: TextInputType.phone,
                              controller: _mobileNumberTextEditingController,
                              label: AppStrings.mobileNumber.tr(),
                              errorText: mobileNumberErrorMessage?.tr(),
                              onChanged: (mobileNumber) {
                                BlocProvider.of<RegisterBloc>(context)
                                    .add(MobileNumberChanged(mobileNumber));
                              },
                            );
                          },
                        ),
                        SizedBox(height: AppSize.s20.h),
                        BlocSelector<RegisterBloc, RegisterState, String?>(
                          selector: (state) => state.passwordErrorMessage,
                          builder: (context, passwordErrorMessage) {
                            return TextInput(
                              controller: _passwordTextEditingController,
                              label: AppStrings.password.tr(),
                              errorText: passwordErrorMessage?.tr(),
                              onChanged: (password) {
                                BlocProvider.of<RegisterBloc>(context)
                                    .add(PasswordChanged(password));
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
                          selector: (state) => state.status,
                          builder: (context, status) {
                            return FullOutlinedButton(
                                onPressed: (status == Status.accepted
                                    ? () {
                                        BlocProvider.of<AuthenticationBloc>(
                                                context)
                                            .add(RegisterButtonPressed(RegisterRequest(
                                                _nameTextEditingController.text,
                                                _emailTextEditingController
                                                    .text,
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
      ),
    );
  }
}
