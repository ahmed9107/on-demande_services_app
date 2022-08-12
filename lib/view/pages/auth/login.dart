import 'package:fixit/controllers/auth/login_controller.dart';
import 'package:fixit/utils/helpers/dimensions.dart';
import 'package:fixit/view/widgets/big_text.dart';
import 'package:fixit/view/widgets/custom_button.dart';
import 'package:fixit/view/widgets/custom_input_field.dart';
import 'package:fixit/view/widgets/custom_loader.dart';
import 'package:fixit/view/widgets/fade_animation.dart';
import 'package:fixit/view/widgets/signup_login_text.dart';
import 'package:fixit/view/widgets/small_text.dart';
import 'package:fixit/view/widgets/socialmedia_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginController>(
        builder: (controller) {
          return !controller.isLoaded ? SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: Dimensions.screenHeight *0.05),
                FadeAnimation(
                  1.5, SizedBox(
                    height: Dimensions.screenHeight *0.20,
                    child: Center(child: Image.asset(
                      'assets/images/a.png',
                      color: Theme.of(context).primaryColorLight,
                      width: Dimensions.width100
                    )),
                  ),
                ),
                SizedBox(height: Dimensions.height15),
                FadeAnimation(
                  1.5, Container(
                    margin: EdgeInsets.only(left: Dimensions.width15, right:Dimensions.width15),
                    width: double.maxFinite,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(text: 'Welcome', size: Dimensions.font32),
                        SizedBox(height: Dimensions.height10),
                        const SmallText(text: 'Sign in to your account'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: Dimensions.height25),
                FadeAnimation(
                  1.5, CustomInputField(
                    type: TextInputType.emailAddress,
                    hint: 'enterEmail'.tr,
                    controller:controller.emailController,
                    bgColor: controller.emailError
                      ? Colors.red.withOpacity(0.5)
                      : Theme.of(context).cardColor,
                    suffixIcon: Icons.email,
                  ),
                ),
                FadeAnimation(
                  1.5, CustomInputField(
                    type: TextInputType.text,
                    hint: 'enterPass'.tr,
                    obscure: controller.isHidePassword,
                    controller:controller.passwordController,
                    bgColor: controller.emptyError
                      ? Colors.red.withOpacity(0.5)
                      : Theme.of(context).cardColor,
                    suffixIcon: Icons.remove_red_eye,
                    showPass: () {controller.showPassword();},
                  )
                ),
                SizedBox(height: Dimensions.height10),
                FadeAnimation(
                  1.5, Container(
                  margin: EdgeInsets.only(right: Dimensions.height15),
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: () {
                      controller.goToForgetPass();
                    },
                    child: Text(
                      'forgetPass'.tr,
                      textAlign: TextAlign.end,
                      style: GoogleFonts.roboto(
                        color: Theme.of(context).primaryColorLight
                      ),
                    ),
                  ),
                )),
                SizedBox(height: Dimensions.height15),
                FadeAnimation(
                  1.5, CustomButton(
                  text: 'login'.tr, 
                  onPressed: () {
                    controller.login();
                  }
                )),
                SizedBox(height: Dimensions.height20),
                FadeAnimation(
                  1.5, SocialMediaAuth()),
                SizedBox(height: Dimensions.height25),
                FadeAnimation(
                  1.5, CustomTextSignUpOrSignIn(
                    onTap: () {
                      controller.goToSignUp();
                    },
                    textone: 'loginTextOwn'.tr,
                    texttwo: 'loginTextTwo'.tr,
                  ),
                ),
              ],
            ),
          ) : const CustomLoader();
        }
      ),
    );
  }
}