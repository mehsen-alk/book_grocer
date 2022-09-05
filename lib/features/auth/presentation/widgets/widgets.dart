import 'package:flutter/material.dart';

import '../../../../config/values_manager.dart';

class TextInput extends StatelessWidget {
  const TextInput(
      {Key? key,
      TextEditingController? emailEditingController,
      required String label,
      String? errorText,
      Function(String)? onChanged})
      : _emailEditingController = emailEditingController,
        _label = label,
        _errorText = errorText,
        _onChanged = onChanged,
        super(key: key);

  final TextEditingController? _emailEditingController;
  final String _label;
  final String? _errorText;
  final Function(String)? _onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: _errorText == null ? AppSize.s56 : AppSize.s56 + 20,
      child: TextField(
        minLines: null,
        maxLines: null,
        expands: true,
        onChanged: _onChanged,
        controller: _emailEditingController,
        decoration: InputDecoration(
          errorText: _errorText,
          label: Text(_label),
        ),
      ),
    );
  }
}

class FullOutlinedButton extends StatelessWidget {
  const FullOutlinedButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  final Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppSize.s56,
      child: OutlinedButton(onPressed: onPressed, child: Text(text)),
    );
  }
}
