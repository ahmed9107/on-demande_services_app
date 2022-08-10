import 'package:fixit/controllers/select_services_controller.dart';
import 'package:fixit/utils/constants/constants.dart';
import 'package:fixit/view/pages/cleaning.dart';
import 'package:fixit/view/widgets/fade_animation.dart';
import 'package:fixit/view/widgets/service_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectService extends StatelessWidget {
  const SelectService({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                padding: const EdgeInsets.only(top: 120.0, right: 20.0, left: 20.0),
                child: Text(
                  'Which service \ndo you need?',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.grey.shade900,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ))
          ];
        },
        body: Padding(
          padding: const EdgeInsets.all(20.0),
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
                    return FadeAnimation(
                      (1.0 + index) / 4,
                      ServiceContainer(
                        image: AppConstants.services[index].imageURL,
                        name: AppConstants.services[index].name,
                        index: index
                      )
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
