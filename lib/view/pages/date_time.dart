import 'package:fixit/controllers/datetime_controller.dart';
import 'package:fixit/utils/constants/constants.dart';
import 'package:fixit/utils/helpers/dimensions.dart';
import 'package:fixit/view/pages/home.dart';
import 'package:fixit/view/widgets/fade_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class DateAndTime extends StatelessWidget {
  const DateAndTime({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          );
        },
        child: const Icon(Icons.arrow_forward_ios),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
              child: FadeAnimation(1, Padding(
                padding: EdgeInsets.only(
                  top: Dimensions.height80,
                  right: Dimensions.height20,
                  left: Dimensions.height20),
                child: Text(
                  'Select Date \nand Time',
                  style: GoogleFonts.roboto(
                    fontSize: Dimensions.font16*2,
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
            children: [
              SizedBox(height: Dimensions.height60/2),
              FadeAnimation(1, Row(
                children: [
                  const Text("October 2021"),
                  const Spacer(),
                  IconButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () {}, 
                    icon: Icon(Icons.arrow_drop_down_circle_outlined, color: Colors.grey.shade700,),
                  )
                ],
              )),
              Container(
                height: Dimensions.height80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius10),
                  color: Colors.white,
                  border: Border.all(width: 1.5, color: Colors.grey.shade200),
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: AppConstants.days.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GetBuilder<DateTimeController>(
                      builder: (controller) {
                        return FadeAnimation((1 + index) / 6, GestureDetector(
                          onTap: () {
                            controller.selectedDayIndex(index);
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: Dimensions.height60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.radius5),
                              color: controller.selectedDay == AppConstants.days[index][0] ? Colors.blue.shade100.withOpacity(0.5) : Colors.blue.withOpacity(0),
                              border: Border.all(
                                color: controller.selectedDay == AppConstants.days[index][0] ? Colors.blue : Colors.white.withOpacity(0),
                                width: 1.5,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(AppConstants.days[index][0].toString(), style: GoogleFonts.roboto(fontSize: Dimensions.font20, fontWeight: FontWeight.bold),),
                                SizedBox(height: Dimensions.height10),
                                Text(AppConstants.days[index][1], style: GoogleFonts.roboto(fontSize: Dimensions.font16),),
                              ],
                            ),
                          ),
                        ));
                      }
                    );
                  }
                ),
              ),
              SizedBox(height: Dimensions.height10),
              FadeAnimation(1.2, Container(
                height: Dimensions.height60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.height10),
                  color: Colors.white,
                  border: Border.all(width: 1.5, color: Colors.grey.shade200),
                ),
                child: GetBuilder<DateTimeController>(
                  builder: (controller) {
                    return ScrollablePositionedList.builder(
                      itemScrollController: controller.scrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: AppConstants.hours.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            controller.selectedHourIndex(index);
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: Dimensions.width100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.radius5),
                              color: controller.selectedHour == AppConstants.hours[index] ? Colors.orange.shade100.withOpacity(0.5) : Colors.orange.withOpacity(0),
                              border: Border.all(
                                color: controller.selectedHour == AppConstants.hours[index] ? Colors.orange : Colors.white.withOpacity(0),
                                width: 1.5,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(AppConstants.hours[index], style: GoogleFonts.roboto(fontSize: Dimensions.font20, fontWeight: FontWeight.w500),),
                              ],
                            ),
                          ),
                        );
                      }
                    );
                  }
                ),
              )),
              SizedBox(height: Dimensions.height40),
              FadeAnimation(
                1.2,
                Text(
                  "Repeat",
                  style: GoogleFonts.roboto(fontSize: Dimensions.font18, fontWeight: FontWeight.w600),)),
              SizedBox(height: Dimensions.height10),
              Container(
                height: Dimensions.height50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: AppConstants.repeat.length,
                  itemBuilder: (context, index) {
                    return GetBuilder<DateTimeController>(
                      builder: (controller) {
                        return GestureDetector(
                          onTap: () {
                            controller.selectRepeatIndex(index);
                          },
                          child: FadeAnimation((1.2 + index) / 4, Container(
                            padding: EdgeInsets.symmetric(horizontal: Dimensions.height20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.radius5*3),
                              color: controller.selectedRepeat == index 
                                ? Colors.blue.shade400 : Colors.grey.shade100,
                            ),
                            margin: EdgeInsets.only(right: Dimensions.height20),
                            child: Center(child: Text(AppConstants.repeat[index], 
                              style: GoogleFonts.roboto(
                                fontSize: Dimensions.font18,
                                color: controller.selectedRepeat == index ? Colors.white : Colors.grey.shade800),)
                            ),
                          )),
                        );
                      }
                    );
                  },
                )
              ),
              SizedBox(height: Dimensions.height40),
              FadeAnimation(1.4, Text(
                "Additional Service",
                style: GoogleFonts.roboto(fontSize: Dimensions.font18, fontWeight: FontWeight.w600),)),
              SizedBox(height: Dimensions.height10),
              Container(
                height: Dimensions.height120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius10),
                  color: Colors.white,
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: AppConstants.exteraCleaning.length,
                  itemBuilder: (context, index) {
                    return GetBuilder<DateTimeController>(
                      builder: (controller) {
                        return GestureDetector(
                          onTap: () {
                            controller.selectExteraCleaning(index);
                          },
                          child: FadeAnimation((1.4 + index) / 4, Container(
                            width: Dimensions.height50*2.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.radius5*3),
                              color: controller.selectedExteraCleaning.contains(index) ? Colors.blue.shade400 : Colors.transparent,
                            ),
                            margin: EdgeInsets.only(right: Dimensions.height20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.network(AppConstants.exteraCleaning[index][1], height: Dimensions.height40),
                                SizedBox(height: Dimensions.height10),
                                Text(
                                  AppConstants.exteraCleaning[index][0],
                                  style: GoogleFonts.roboto(
                                    fontSize: Dimensions.font16,
                                    fontWeight: FontWeight.w500,
                                    color: controller.selectedExteraCleaning.contains(index) 
                                      ? Colors.white 
                                      : Colors.grey.shade800),),
                                SizedBox(height: Dimensions.height5),
                                Text(
                                  "+${AppConstants.exteraCleaning[index][2]}\$",
                                  style: GoogleFonts.roboto(color: Colors.black),)
                              ],
                            )
                          ))
                        );
                      }
                    );
                  },  
                )
              ),
            ],
          ), 
        ),
      )
    );
  }
}