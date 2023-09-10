import 'package:flutter/material.dart';
import 'package:time_luxe/core/models/user_model.dart';

import '../widgets/custom_bottom_sheet.dart';

abstract class Helper {
  static String? uId = '';

  static UserModel? model;

  static void buildBottomSheet({
    required BuildContext context,
    required void Function()? onPressedGallery,
    required void Function()? onPressedCamera,
    required String type,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (context) => CustomBottomSheet(
        context: context,
        type: type,
        onPressedCamera: onPressedCamera,
        onPressedGallery: onPressedGallery,
      ),
    );
  }
}
