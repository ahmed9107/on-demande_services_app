import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fixit/controllers/auth/forget_password_controller.dart';
import 'package:fixit/utils/helpers/dimensions.dart';
import 'package:fixit/view/widgets/big_text.dart';
import 'package:fixit/view/widgets/custom_button.dart';
import 'package:fixit/view/widgets/custom_input_field.dart';
import 'package:fixit/view/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ForgetPassController controller = Get.put(ForgetPassController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back_ios,
          color: Theme.of(context).primaryColorLight)
        ),
        title: const BigText(
          text: 'Reset Password',
        ),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: Dimensions.height15, horizontal: Dimensions.height15),
        child: ListView(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            const BigText(
              text: 'New Password',
            ),
            const SizedBox(
              height: 10.0,
            ),
            const SmallText(text: 'Entre new password'),
            const SizedBox(
              height: 65.0,
            ),
            CustomInputField(
              type: TextInputType.text,
              controller: controller.newPass,
              bgColor: Theme.of(context).cardColor,
              hint: 'Enter your paswword',
              suffixIcon: EvaIcons.shieldOutline,
            ),
            CustomInputField(
              type: TextInputType.text,
              controller: controller.rePassword,
              bgColor: Theme.of(context).cardColor,
              hint: 'Re-Enter your paswword',
              suffixIcon: EvaIcons.shield,
            ),
            CustomButton(
              onPressed: () {
                controller.goToLogin();
              },
              text: 'Reset Password'),
          ],
        ),
      ),
    );
  }
}
