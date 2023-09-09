import 'package:flutter/material.dart';

import '../global/app_text_styles.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
    required this.onTap,
    required this.hint,
  }) : super(key: key);

  final VoidCallback onTap;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppTextStyles.textStyle32.copyWith(
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
        suffixIcon: GestureDetector(
          onTap: onTap,
          child: const Icon(
            Icons.search,
            color: Colors.white,
            size: 40,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
