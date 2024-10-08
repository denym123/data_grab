
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';

class DefaultInputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final List<String>? masks;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool obscureText;
  final ValueNotifier<bool> _obscureTextVN;
  DefaultInputField({
    super.key,
    required this.label,
    required this.controller,
    this.masks,
    this.keyboardType,
    this.validator,
    this.obscureText = false,
  }) : _obscureTextVN = ValueNotifier<bool>(obscureText);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 2.h),
          child: Text(
            label,
            style: context.textStyles.regular.copyWith(
              fontSize: 14.sp,
            ),
          ),
        ),
        ValueListenableBuilder(
            valueListenable: _obscureTextVN,
            builder: (_, obscureTextVNValue, child) {
              return TextFormField(
                controller: controller,
                inputFormatters: masks != null
                    ? [
                  TextInputMask(
                    mask: masks,
                  ),
                ]
                    : null,
                keyboardType: keyboardType,
                validator: validator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText: obscureTextVNValue,
                decoration: InputDecoration(
                  fillColor: const Color(0XFFF5F9FE),
                  filled: true,
                  suffixIcon: obscureText
                      ? Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 16.w, 0),
                    child: IconButton(
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        _obscureTextVN.value = !obscureTextVNValue;
                      },
                      icon: SizedBox(
                        height: 24.h,
                        width: 24.w,
                        child: Icon(
                          _obscureTextVN.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: context.colors.primary,
                        ),
                      ),
                    ),
                  )
                      : null,
                  contentPadding: EdgeInsets.fromLTRB(24.w, 18.h, 24.w, 18.h),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.r),
                    borderSide: BorderSide(width: 1.w),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      4.r,
                    ),
                    borderSide: BorderSide(width: 1.w),
                  ),
                ),
              );
            }),
      ],
    );
  }
}
