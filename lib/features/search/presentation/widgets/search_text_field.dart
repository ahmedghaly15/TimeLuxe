import 'package:flutter/material.dart';

import '../../../../core/global/app_text_styles.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Search",
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
