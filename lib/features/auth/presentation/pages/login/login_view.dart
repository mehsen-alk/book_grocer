import 'package:book_grocer/config/routes_manager.dart';
import 'package:book_grocer/config/strings_manager.dart';
import 'package:book_grocer/config/values_manager.dart';
import 'package:book_grocer/features/auth/presentation/pages/login/login_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/widgets.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final LoginBloc _bloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_new),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppPadding.p20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Text(
              AppStrings.signIn,
              style: Theme.of(context).textTheme.titleLarge,
            ).tr(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BlocSelector<LoginBloc, LoginState, String?>(
                    bloc: _bloc,
                    selector: (state) => state.emailErrorMessage,
                    builder: (context, errorText) {
                      return TextInput(
                        label: AppStrings.email.tr(),
                        errorText: errorText?.tr(),
                        onChanged: (email) => _bloc.add(EmailChanged(email)),
                      );
                    }),
                SizedBox(height: AppSize.s20.h),
                BlocSelector<LoginBloc, LoginState, String?>(
                    bloc: _bloc,
                    selector: (state) => state.passwordErrorMessage,
                    builder: (context, errorText) {
                      return TextInput(
                        label: AppStrings.password.tr(),
                        errorText: errorText?.tr(),
                        onChanged: (password) =>
                            _bloc.add(PasswordChanged(password)),
                      );
                    }),
                TextButton(
                  onPressed: () {},
                  child: const Text(AppStrings.forgetYourPassword).tr(),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BlocSelector<LoginBloc, LoginState, Status>(
                  bloc: _bloc,
                  selector: (state) => state.status,
                  builder: (context, status) {
                    return FullOutlinedButton(
                        onPressed: (status == Status.accepted ? () {} : null),
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
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}
