import 'package:fixit/controllers/auth/forget_password_controller.dart';
import 'package:fixit/utils/helpers/dimensions.dart';
import 'package:fixit/view/widgets/big_text.dart';
import 'package:fixit/view/widgets/custom_button.dart';
import 'package:fixit/view/widgets/custom_input_field.dart';
import 'package:fixit/view/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ForgetPassController controller = Get.put(ForgetPassController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: BigText(
          text: 'forgetPass'.tr
        ),
        elevation: 0.0,
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).primaryColorLight
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: Dimensions.height15, horizontal: Dimensions.height15),
        child: ListView(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            BigText(
              text: 'checkMail'.tr,
            ),
            const SizedBox(
              height: 10.0,
            ),
            SmallText(text: 'enterEmailtwo'.tr),
            const SizedBox(
              height: 65.0,
            ),
            CustomInputField(
              type: TextInputType.emailAddress,
              controller: controller.email,
              bgColor: Theme.of(context).cardColor,
              hint: 'enterEmail'.tr,
              suffixIcon: Icons.email_outlined,
            ),
            CustomButton(
              onPressed: () {
                controller.checkEmail();
              },
              text: 'checkMail'.tr),
          ],
        ),
      ),
    );
  }
}
