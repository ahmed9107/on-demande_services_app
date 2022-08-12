import 'package:fixit/controllers/select_services_controller.dart';
import 'package:fixit/utils/constants/constants.dart';
import 'package:fixit/utils/helpers/dimensions.dart';
import 'package:fixit/view/pages/cleaning.dart';
import 'package:fixit/view/widgets/fade_animation.dart';
import 'package:fixit/view/widgets/service_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectService extends StatelessWidget {
  const SelectService({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GetBuilder<SelectServiceController>(
        builder: (controller) {
          return Container(
            child: controller.selectedService >= 0 ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CleaningPage(),
                  ),
                );
              },
              backgroundColor: Colors.blue,
              child: const Icon(Icons.arrow_forward_ios, size: 20,),
            ) : null,
          );
        }
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
              child: FadeAnimation(1.2, Padding(
                padding: EdgeInsets.only(
                  top: Dimensions.height50*2,
                  right: Dimensions.height20,
                  left: Dimensions.height20),
                child: Text(
                  'Which service \ndo you need?',
                  style: GoogleFonts.roboto(
                    fontSize: Dimensions.font20*2,
                    color: Colors.grey.shade900,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ))
          ];
        },
        body: Padding(
          padding: EdgeInsets.all(Dimensions.height20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: AppConstants.services.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GetBuilder<SelectServiceController>(
                      builder: (controller) {
                        return FadeAnimation(
                          (1.0 + index) / 4,
                          ServiceContainer(
                            onTap: (){
                              controller.selectServiceIndex(index);
                            },
                            image: AppConstants.services[index].imageURL,
                            name: AppConstants.services[index].name,
                            index: index,
                            containerColor: controller.selectedService == index 
                              ? Colors.blue.shade50 
                              : const Color(0xFFF5F5F5),
                            borderColor: controller.selectedService == index
                              ? Colors.blue
                              : Colors.blue.withOpacity(0),
                            fontSize: Dimensions.font20,
                            imageHeight: Dimensions.height80,
                          )
                        );
                      }
                    );
                  }
                ),
              ),
            ]
          ),
        ),
      )
    );
  }
}
