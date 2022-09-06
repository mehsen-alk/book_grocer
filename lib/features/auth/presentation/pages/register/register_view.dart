import 'package:book_grocer/features/auth/presentation/widgets/widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/routes_manager.dart';
import '../../../../../config/strings_manager.dart';
import '../../../../../config/values_manager.dart';
import 'register_bloc.dart';

class RegisterView extends StatelessWidget {
  final RegisterBloc _registerBloc = RegisterBloc();

  RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_new),
      ),
      body: SingleChildScrollView(
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
                        label: AppStrings.mobileNumber.tr(),
                        errorText: mobileNumberErrorMessage?.tr(),
                        onChanged: (mobileNumber) {
                          _registerBloc.add(MobileNumberChanged(mobileNumber));
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
                      print(status == Status.accepted);
                      print(status);
                      return FullOutlinedButton(
                          onPressed: (status == Status.accepted ? () {} : null),
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
      ),
    );
  }
}
