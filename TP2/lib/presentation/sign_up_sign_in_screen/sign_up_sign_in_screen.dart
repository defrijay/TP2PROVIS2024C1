import 'package:defrizal_yahdiyan_risyad_s_application2/core/utils/validation_functions.dart';
import 'package:defrizal_yahdiyan_risyad_s_application2/widgets/custom_text_form_field.dart';
import 'package:defrizal_yahdiyan_risyad_s_application2/widgets/custom_elevated_button.dart';
import 'package:defrizal_yahdiyan_risyad_s_application2/widgets/custom_outlined_button.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'models/sign_up_sign_in_model.dart';
import 'package:flutter/material.dart';
import 'package:defrizal_yahdiyan_risyad_s_application2/core/app_export.dart';
import 'bloc/sign_up_sign_in_bloc.dart';

class SignUpSignInScreen extends StatelessWidget {
  SignUpSignInScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<SignUpSignInBloc>(
      create: (context) => SignUpSignInBloc(SignUpSignInState(
        signUpSignInModelObj: SignUpSignInModel(),
      ))
        ..add(SignUpSignInInitialEvent()),
      child: SignUpSignInScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.5, 0),
              end: Alignment(0.5, 1),
              colors: [
                appTheme.blueGray600,
                theme.colorScheme.onPrimary,
                appTheme.teal300,
              ],
            ),
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.imgSignUpSignIn,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Form(
                key: _formKey,
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 39.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "msg_selamat_datang_di".tr,
                          style: CustomTextStyles
                              .titleSmallClashDisplayVariableOnPrimaryContainer,
                        ),
                      ),
                      SizedBox(height: 1.v),
                      Text(
                        "lbl_digi_sehat".tr.toUpperCase(),
                        style: theme.textTheme.displayMedium,
                      ),
                      SizedBox(height: 52.v),
                      CustomImageView(
                        imagePath: ImageConstant.imgGroup481883,
                        width: 213.h,
                      ),
                      _buildEmail(context),
                      SizedBox(height: 14.v),
                      _buildPassword(context),
                      SizedBox(height: 10.v),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "msg_lupa_kata_sandi".tr,
                          style: theme.textTheme.labelMedium,
                        ),
                      ),
                      SizedBox(height: 22.v),
                      _buildMASUK(context),
                      SizedBox(height: 12.v),
                      _buildDAFTAR(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return BlocSelector<SignUpSignInBloc, SignUpSignInState,
        TextEditingController?>(
      selector: (state) => state.emailController,
      builder: (context, emailController) {
        return CustomTextFormField(
          controller: emailController,
          hintText: "lbl_email".tr,
          textInputType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || (!isValidEmail(value, isRequired: true))) {
              return "err_msg_please_enter_valid_email".tr;
            }
            return null;
          },
        );
      },
    );
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return BlocSelector<SignUpSignInBloc, SignUpSignInState,
        TextEditingController?>(
      selector: (state) => state.passwordController,
      builder: (context, passwordController) {
        return CustomTextFormField(
          controller: passwordController,
          hintText: "lbl_password".tr,
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
          validator: (value) {
            if (value == null || (!isValidPassword(value, isRequired: true))) {
              return "err_msg_please_enter_valid_password".tr;
            }
            return null;
          },
          obscureText: true,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildMASUK(BuildContext context) {
    return CustomElevatedButton(
      text: "lbl_masuk".tr,
      margin: EdgeInsets.symmetric(horizontal: 25.h),
      buttonStyle: CustomButtonStyles.none,
      decoration: CustomButtonStyles.gradientAmberToPrimaryDecoration,
    );
  }

  /// Section Widget
  Widget _buildDAFTAR(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.h),
      child: OutlineGradientButton(
        padding: EdgeInsets.only(
          left: 2.h,
          top: 2.v,
          right: 2.h,
          bottom: 2.v,
        ),
        strokeWidth: 2.h,
        gradient: LinearGradient(
          begin: Alignment(0.02, 0),
          end: Alignment(0.99, 1),
          colors: [
            appTheme.amber800,
            theme.colorScheme.primary,
          ],
        ),
        corners: Corners(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
          bottomLeft: Radius.circular(4),
          bottomRight: Radius.circular(4),
        ),
        child: CustomOutlinedButton(
          text: "lbl_daftar".tr,
        ),
      ),
    );
  }
}
