import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import 'package:time_luxe/TimeLuxe/presentation/view/manager/time_luxe_cubit.dart';
import 'package:time_luxe/core/global/app_assets.dart';

import '../../../../core/global/app_colors.dart';
import '../../../../core/models/user_model.dart';
import '../../../../core/utils/helper.dart';

class EditProfileImage extends StatelessWidget {
  const EditProfileImage({
    Key? key,
    required this.profileImage,
    required this.userModel,
    required this.cubit,
  }) : super(key: key);

  final File? profileImage;
  final UserModel userModel;
  final TimeLuxeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: <Widget>[
        CircleAvatar(
          backgroundColor: AppColors.primaryColor,
          radius: 110.r,
          backgroundImage: (profileImage == null
              ? NetworkImage(userModel.image!)
              : FileImage(profileImage!)) as ImageProvider,
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 8.0.h),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 28.r,
            child: GestureDetector(
              onTap: () => Helper.buildBottomSheet(
                type: "Profile",
                context: context,
                onPressedCamera: () => cubit.getProfileImage(
                  source: ImageSource.camera,
                ),
                onPressedGallery: () => cubit.getProfileImage(
                  source: ImageSource.gallery,
                ),
              ),
              child: SvgPicture.asset(
                AppAssets.cameraIcon,
                color: const Color(0xFF0FA958),
                height: 35.h,
                width: 35.h,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
