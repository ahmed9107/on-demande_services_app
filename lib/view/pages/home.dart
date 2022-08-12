import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fixit/utils/constants/constants.dart';
import 'package:fixit/utils/helpers/dimensions.dart';
import 'package:fixit/view/widgets/fade_animation.dart';
import 'package:fixit/view/widgets/main_drawer.dart';
import 'package:fixit/view/widgets/service_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> workers = [
      ['Alfredo Schafer','Plumber', 'https://images.unsplash.com/photo-1506803682981-6e718a9dd3ee?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=c3a31eeb7efb4d533647e3cad1de9257', 4.8],
      ['Michelle Baldwin', 'Cleaner', 'https://images.unsplash.com/photo-1506803682981-6e718a9dd3ee?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=c3a31eeb7efb4d533647e3cad1de9257', 4.6],
      ['Brenon Kalu', 'Driver','https://images.unsplash.com/photo-1506803682981-6e718a9dd3ee?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=c3a31eeb7efb4d533647e3cad1de9257', 4.4]
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Dashboard', style: TextStyle(color: Colors.black),),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: Icon(
              EvaIcons.bellOutline,
              color: Colors.grey.shade700,
              size: Dimensions.iconSize14*2
            ),
          )
        ],
        leading: GestureDetector(
          onTap: () {
            //Navigator.pushNamed(context, '/login');
          },
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: CircleAvatar(
              backgroundImage:NetworkImage(
                'https://uifaces.co/our-content/donated/NY9hnAbp.jpg'
              ),
            ),
          )
        ),
      ),
      drawer: const MainDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FadeAnimation(1, Padding(
              padding: EdgeInsets.only(
                left: Dimensions.height20,
                top: Dimensions.height10,
                right: Dimensions.height10
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent',
                    style: GoogleFonts.roboto(
                      fontSize: Dimensions.font20,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  TextButton(
                    onPressed: () {}, 
                    child: const Text('View all',)
                  )
                ],
              ),
            )),
            FadeAnimation(1.2, Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.height20),
              child: Container(
                padding: EdgeInsets.all(Dimensions.height20),
                height: Dimensions.height210,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimensions.height20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      offset: const Offset(0, 4),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.network(
                            'https://images.pexels.com/photos/355164/pexels-photo-355164.jpeg?crop=faces&fit=crop&h=200&w=200&auto=compress&cs=tinysrgb',
                            width: Dimensions.height35*2)
                        ),
                        const SizedBox(width: 15,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Isabel Kirkland",
                              style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: Dimensions.font20,
                                fontWeight: FontWeight.bold),),
                            SizedBox(height: Dimensions.height5),
                            Text(
                              "Cleaner",
                              style: GoogleFonts.roboto(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: Dimensions.font18)),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: Dimensions.height20),
                    Container(
                      height: Dimensions.height50,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(Dimensions.height15)
                      ),
                      child: Center(
                        child: Text(
                          'View Profile',
                          style: GoogleFonts.roboto(
                            color: Colors.white, fontSize: Dimensions.font18
                          )
                        )
                      ),
                    )
                  ],
                ),
              ),
            )),
            SizedBox(height: Dimensions.height20),
            FadeAnimation(1.3, Padding(
              padding: EdgeInsets.only(left: Dimensions.height20, right: Dimensions.height10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: Dimensions.font20, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () {}, 
                    child: const Text('View all',)
                  )
                ],
              ),
            )),
            Container(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.height20, vertical: Dimensions.height10),
              height: Dimensions.height300,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 6/* AppConstants.services.length */,
                itemBuilder: (BuildContext context, int index) {
                  return FadeAnimation((1.0 + index) / 4,
                  ServiceContainer(
                    image: AppConstants.services[index].imageURL,
                    name: AppConstants.services[index].name,
                    index:index,
                    borderColor: Colors.blue.withOpacity(0),
                    containerColor: Colors.grey.shade100,
                    fontSize: Dimensions.font14,
                    imageHeight: Dimensions.height45,
                  ));
                }
              ),
            ),
            SizedBox(height: Dimensions.height20),
            FadeAnimation(1.3, Padding(
              padding: EdgeInsets.only(left: Dimensions.height20, right: Dimensions.height10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top Rated',
                    style: GoogleFonts.roboto(
                      fontSize: Dimensions.height20, fontWeight: FontWeight.bold),),
                  TextButton(
                    onPressed: () {}, 
                    child: const Text('View all',)
                  )
                ],
              ),
            )),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.height20, vertical: Dimensions.height10),
              height: Dimensions.height120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: workers.length,
                itemBuilder: (BuildContext context, int index) {
                  return FadeAnimation((1.0 + index) / 4,
                  workerContainer(
                    workers[index][0],
                    workers[index][1],
                    workers[index][2],
                    workers[index][3]
                  ));
                }
              ),
            ),
            SizedBox(height: Dimensions.height50*3),
          ]
        )
      )
    );
  }

  workerContainer(String name, String job, String image, double rating) {
    return GestureDetector(
      child: AspectRatio(
        aspectRatio: 3.5,
        child: Container(
          margin: const EdgeInsets.only(right: 20),
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey.shade200,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(image)
              ),
              const SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 5,),
                  Text(job, style: const TextStyle(fontSize: 15),)
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(rating.toString(), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 5,),
                  const Icon(Icons.star, color: Colors.orange, size: 20,)
                ],
              )
            ]
          ),
        ),
      ),
    );
  }
}