import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../../core/global/app_colors.dart';
import '../../../../core/global/app_text_styles.dart';

class MyCardForm extends StatefulWidget {
  const MyCardForm({super.key});

  @override
  State<MyCardForm> createState() => _MyCardFormState();
}

class _MyCardFormState extends State<MyCardForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expirationDateController =
      TextEditingController();
  final TextEditingController cardHolderController = TextEditingController();
  final TextEditingController cvvNumberController = TextEditingController();

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: CustomTextFormField(
                backgroundColor: Colors.white.withOpacity(0),
                hint: "Enter Card Number",
                hintStyle: AppTextStyles.textStyle16.copyWith(
                  color: AppColors.hintColor,
                  fontWeight: FontWeight.w600,
                ),
                controller: cardNumberController,
                textCapitalization: TextCapitalization.none,
                keyboardType: TextInputType.number,
                focusedBorderColor: AppColors.primaryColor,
                focusedBorderWidth: 1,
                enabledBorderColor: Colors.white,
                enabledBorderWidth: 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: CustomTextFormField(
                backgroundColor: Colors.white.withOpacity(0),
                hint: "Expiration Date",
                hintStyle: AppTextStyles.textStyle16.copyWith(
                  color: AppColors.hintColor,
                  fontWeight: FontWeight.w600,
                ),
                controller: expirationDateController,
                textCapitalization: TextCapitalization.none,
                keyboardType: TextInputType.datetime,
                focusedBorderColor: AppColors.primaryColor,
                focusedBorderWidth: 1,
                enabledBorderColor: Colors.white,
                enabledBorderWidth: 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: CustomTextFormField(
                backgroundColor: Colors.white.withOpacity(0),
                hint: "Cardholder Now",
                hintStyle: AppTextStyles.textStyle16.copyWith(
                  color: AppColors.hintColor,
                  fontWeight: FontWeight.w600,
                ),
                controller: cardHolderController,
                textCapitalization: TextCapitalization.none,
                keyboardType: TextInputType.datetime,
                focusedBorderColor: AppColors.primaryColor,
                focusedBorderWidth: 1,
                enabledBorderColor: Colors.white,
                enabledBorderWidth: 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: CustomTextFormField(
                backgroundColor: Colors.white.withOpacity(0),
                hint: "Cvv Number",
                hintStyle: AppTextStyles.textStyle16.copyWith(
                  color: AppColors.hintColor,
                  fontWeight: FontWeight.w600,
                ),
                controller: cvvNumberController,
                textCapitalization: TextCapitalization.none,
                keyboardType: TextInputType.datetime,
                focusedBorderColor: AppColors.primaryColor,
                focusedBorderWidth: 1,
                enabledBorderColor: Colors.white,
                enabledBorderWidth: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void disposeControllers() {
    cardHolderController.dispose();
    expirationDateController.dispose();
    cardHolderController.dispose();
    cvvNumberController.dispose();
  }
}
