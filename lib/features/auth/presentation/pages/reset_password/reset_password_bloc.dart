import 'package:bloc/bloc.dart';
import 'package:book_grocer/config/app_localizations.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../config/strings_manager.dart';
import '../../../../../core/app/functions.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final BuildContext context;
  ResetPasswordBloc({required this.context}) : super(const ResetPasswordState()) {
    on<EmailChanged>((event, emit) {
      if (isEmailFormatCorrect(event.email ?? '')) {
        emit(state.copyWith(
            emailStatus: Status.accepted, emailErrorMessage: ''));
      } else {
        emit(state.copyWith(
            emailStatus: Status.notAccepted,
            emailErrorMessage: AppStrings.emailFormatNotCorrect.tr(context)));
      }
    });

    on<SendVerificationCodeButtonPressed>((event, emit) {
      emit(state.copyWith(isSendVerificationButton: true));
    });
  }
}
