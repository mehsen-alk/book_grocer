import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/strings_manager.dart';
import '../../../../../config/values_manager.dart';
import '../../../../../core/app/di.dart';
import '../../bloc/authentication_bloc.dart' as auth;
import '../../common/functions.dart';
import '../../common/widgets.dart';
import 'reset_password_bloc.dart';

class ResetPasswordView extends StatelessWidget {
  final ResetPasswordBloc _resetPasswordBloc = ResetPasswordBloc();
  final auth.AuthenticationBloc _authenticationBloc =
      instance<auth.AuthenticationBloc>();
  final TextEditingController _emailTextEditingController =
      TextEditingController();

  ResetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(AppPadding.p20.h),
        child: BlocBuilder<auth.AuthenticationBloc, auth.AuthenticationState>(
          bloc: _authenticationBloc,
          builder: (context, state) {
            manageDialog(context, state);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Text(
                  AppStrings.resetPassword.tr(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
                  bloc: _resetPasswordBloc,
                  builder: (context, state) {
                    return Column(
                      children: [
                        TextInput(
                          label: AppStrings.email.tr(),
                          controller: _emailTextEditingController,
                          errorText: state.emailErrorMessage?.tr(),
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (email) {
                            _resetPasswordBloc.add(EmailChanged(email));
                          },
                        ),
                        SizedBox(height: AppSize.s20.h),
                        FullOutlinedButton(
                            onPressed: state.emailStatus == Status.accepted
                                ? () {
                                    _resetPasswordBloc.add(
                                        SendVerificationCodeButtonPressed());
                                    _authenticationBloc.add(
                                        auth.SendVerificationCodeButtonPressed(
                                            _emailTextEditingController.text));
                                  }
                                : null,
                            text: AppStrings.sendVerificationCode.tr()),
                      ],
                    );
                  },
                ),
                const SizedBox()
              ],
            );
          },
        ),
      ),
    );
  }
}
