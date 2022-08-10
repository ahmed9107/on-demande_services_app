import 'package:fixit/controllers/select_services_controller.dart';
import 'package:fixit/utils/constants/constants.dart';
import 'package:fixit/view/pages/date_time.dart';
import 'package:fixit/view/widgets/fade_animation.dart';
import 'package:fixit/view/widgets/room.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CleaningPage extends StatelessWidget {
  const CleaningPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: GetBuilder<SelectServiceController>(
        builder: (controller) {
          return Container(
            child: controller.selectedRooms.isNotEmpty ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DateAndTime()
                  ),
                );
              },
              backgroundColor: Colors.blue,
              child: GetBuilder<SelectServiceController>(
                builder: (controller) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${controller.selectedRooms.length}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      const SizedBox(width: 2),
                      const Icon(Icons.arrow_forward_ios, size: 18,),
                    ],
                  );
                }
              ),
            ) : null,
          );
        }
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
              child: FadeAnimation(1, Padding(
                padding: const EdgeInsets.only(top: 120.0, right: 20.0, left: 20.0),
                child: Text(
                  'Where do you want \ncleaned?',
                  style: TextStyle(
                    fontSize: 35,
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
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: AppConstants.rooms.length,
            itemBuilder: (BuildContext context, int index) {
              return FadeAnimation(
                (1.2 + index) / 4,
                Room(room:AppConstants.rooms[index],index: index)
              );
            }
          ),
        ),
      )
    );
  }
}