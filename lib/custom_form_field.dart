import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({super.key,  this.validator, required this.child});
  final String? Function(String?)? validator;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: validator,
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            child,
            Text(state.errorText ?? '', style: TextStyle(color: Colors.red)),
          ],
        );
      },
    );
  }
}
