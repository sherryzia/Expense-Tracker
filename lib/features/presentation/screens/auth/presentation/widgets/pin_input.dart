import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_constants.dart';

/// Row of circular single-digit boxes for PIN / OTP entry.
///
/// Focus advances automatically on input and returns on backspace.
class PinInput extends StatefulWidget {
  const PinInput({super.key});

  @override
  State<PinInput> createState() => _PinInputState();
}

class _PinInputState extends State<PinInput> {
  late final List<TextEditingController> _controllers;
  late final List<FocusNode> _focusNodes;

  static const int _length = AppConstants.pinLength;

  @override
  void initState() {
    super.initState();
    _controllers = List<TextEditingController>.generate(
      _length,
      (_) => TextEditingController(),
    );
    _focusNodes = List<FocusNode>.generate(_length, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (final TextEditingController controller in _controllers) {
      controller.dispose();
    }
    for (final FocusNode node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onChanged(int index, String value) {
    if (value.isEmpty) {
      if (index > 0) _focusNodes[index - 1].requestFocus();
    } else if (index < _length - 1) {
      _focusNodes[index + 1].requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(_length, (int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7),
          child: SizedBox(
            width: 46,
            height: 54,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.inputFill,
                border: Border.all(color: AppColors.primary, width: 1.5),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: TextField(
                  controller: _controllers[index],
                  focusNode: _focusNodes[index],
                  onChanged: (String value) => _onChanged(index, value),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(1),
                  ],
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: const InputDecoration(
                    counterText: '',
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}