import 'package:fixit/controllers/select_services_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Room extends StatelessWidget {
  final List room;
  final int index;
  const Room({Key? key, required this.room, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectServiceController>(
      builder: (controller) {
        return GestureDetector(
          onTap: () {
            controller.selectedRoomIndex(index);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            margin: const EdgeInsets.only(bottom: 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: controller.selectedRooms.contains(index) ? room[2].shade50.withOpacity(0.5) : Colors.grey.shade100,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Image.asset(room[1], width: 35, height: 35,),
                        const SizedBox(width: 10.0,),
                        Text(room[0], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                      ],
                    ),
                    const Spacer(),
                      controller.selectedRooms.contains(index) ? 
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: Colors.greenAccent.shade100.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Icon(Icons.check, color: Colors.green, size: 20,)
                      ) : 
                      const SizedBox()
                  ],
                ),
                (controller.selectedRooms.contains(index) && room[3] >= 1) ?
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20.0,),
                      Text("How many ${room[0]}s?", style: const TextStyle(fontSize: 15),),
                      const SizedBox(height: 10.0,),
                      SizedBox(
                        height: 45,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                room[3] = index + 1;
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 10.0),
                                padding: const EdgeInsets.all(10.0),
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: room[3] == index + 1 
                                    ? room[2].withOpacity(0.5)
                                    : room[2].shade200.withOpacity(0.5),
                                  ),
                                  child: Center(
                                    child: Text((index + 1).toString() ,
                                    style: const TextStyle(fontSize: 22, color: Colors.white)
                                  )
                                ),
                              ),
                            );
                          }
                        ),
                      )
                    ],
                  ),
                ) : const SizedBox()
              ],
            )
          ),
        );
      }
    );
  }
}