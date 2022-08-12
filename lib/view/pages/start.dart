import 'package:fixit/controllers/start_page_controller.dart';
import 'package:fixit/utils/constants/constants.dart';
import 'package:fixit/utils/helpers/dimensions.dart';
import 'package:fixit/view/widgets/fade_animation.dart';
import 'package:fixit/view/widgets/service_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartPage extends StatelessWidget {
  const StartPage({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: Dimensions.height50*2),
          Container(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.height50),
            height: MediaQuery.of(context).size.height * 0.45,
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 9,
              itemBuilder: (BuildContext context, int index) {
                return FadeAnimation((1.0 + index) / 4,
                  GetBuilder<StartController>(
                    builder: (controller) {
                      return ServiceContainer(
                        image: AppConstants.services[index].imageURL,
                        name: AppConstants.services[index].name,
                        index: index,
                        borderColor: controller.selectedService == index ? Colors.blue.shade100 : Colors.grey.withOpacity(0),
                        containerColor: controller.selectedService == index ? Colors.white : Colors.grey.shade100,
                        fontSize: Dimensions.font14,
                        imageHeight: Dimensions.height60/2,
                      );
                    }
                  )
                );
              }
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.height80),
                  topRight: Radius.circular(Dimensions.height80),
                )
              ),
              child: Column(
                children: [
                  SizedBox(height: Dimensions.height50),
                  FadeAnimation(1.5, Container(
                    padding: EdgeInsets.symmetric(horizontal: Dimensions.height40),
                    child: Center(
                      child: Text(
                        'Easy, reliable way to take \ncare of your home',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: Dimensions.font24,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade900,
                        ),
                      ),
                    ),
                  )),
                  SizedBox(height: Dimensions.height20),
                  FadeAnimation(1.5, Container(
                    padding: EdgeInsets.symmetric(horizontal: Dimensions.height60),
                    child: Center(
                      child: Text(
                        'We provide you with the best people to help take care of your home.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: Dimensions.font16,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  )),
                  FadeAnimation(1.5, Padding(
                    padding: EdgeInsets.all(Dimensions.height50),
                    child: MaterialButton(
                      elevation: 0,
                      color: Colors.black,
                      onPressed: () {
                        Get.find<StartController>().getStarted();
                        /* Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SelectService(),
                          ),
                        ); */
                      },
                      height: Dimensions.height50*1.1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Dimensions.radius10)
                      ),
                      child: Center(
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Dimensions.font18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  )),
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}
