import 'package:fixit/controllers/auth/verify_code_controller.dart';
import 'package:fixit/view/widgets/big_text.dart';
import 'package:fixit/view/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
class VerifyCode extends StatelessWidget {
  const VerifyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyCodeController controller = Get.put(VerifyCodeController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back_ios,
          color: Theme.of(context).primaryColorLight)
        ),
        title: const BigText(
          text: 'Verification Code',
        ),
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            const BigText(
              text: 'Check code',
            ),
            const SizedBox(
              height: 10.0,
            ),
            const SmallText(
                text: 'Enter the verification code send to ahmed@gmail.com'),
            const SizedBox(
              height: 65.0,
            ),
            OtpTextField(
              fieldWidth: 50.0,
              borderRadius: BorderRadius.circular(10),
              numberOfFields: 5,
              borderColor: Theme.of(context).scaffoldBackgroundColor,
              showFieldAsBox: true,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) {
                controller.goToResetPassPage();
              }, // end onSubmit
            ),
            //const CustomButtonAuth(text: 'Sign Up')
          ],
        ),
      ),
    );
  }
}
