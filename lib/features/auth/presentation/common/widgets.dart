import 'package:flutter/material.dart';

import '../../../../config/values_manager.dart';

class TextInput extends StatelessWidget {
  const TextInput(
      {Key? key,
      TextEditingController? controller,
      String? label,
      String? hintText,
      String? errorText,
      Function(String)? onChanged,
      TextInputType? keyboardType,
      bool? enabled = true})
      : _textEditingController = controller,
        _label = label,
        _hintText = hintText,
        _errorText = errorText,
        _onChanged = onChanged,
        _keyboardType = keyboardType,
        _enabled = enabled,
        super(key: key);

  final TextEditingController? _textEditingController;
  final String? _label;
  final String? _hintText;
  final String? _errorText;
  final Function(String)? _onChanged;
  final TextInputType? _keyboardType;
  final bool? _enabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: _errorText == null ? AppSize.s56 : AppSize.s56 + 20,
      child: TextField(
        enabled: _enabled,
        keyboardType: _keyboardType,
        minLines: null,
        maxLines: null,
        expands: true,
        onChanged: _onChanged,
        controller: _textEditingController,
        decoration: InputDecoration(
          hintText: _hintText,
          errorText: _errorText,
          label: _label == null ? null : Text(_label!) ,
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
