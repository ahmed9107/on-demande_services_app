import 'package:fixit/utils/constants/constants.dart';
import 'package:fixit/utils/helpers/dimensions.dart';
import 'package:fixit/view/pages/select_service.dart';
import 'package:fixit/view/widgets/fade_animation.dart';
import 'package:fixit/view/widgets/start_service_container.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({ Key? key }) : super(key: key);

  /* List<Service> services = [
    Service('Cleaning', 'https://img.icons8.com/external-vitaliy-gorbachev-flat-vitaly-gorbachev/2x/external-cleaning-labour-day-vitaliy-gorbachev-flat-vitaly-gorbachev.png'),
    Service('Plumber', 'https://img.icons8.com/external-vitaliy-gorbachev-flat-vitaly-gorbachev/2x/external-plumber-labour-day-vitaliy-gorbachev-flat-vitaly-gorbachev.png'),
    Service('Electrician', 'https://img.icons8.com/external-wanicon-flat-wanicon/2x/external-multimeter-car-service-wanicon-flat-wanicon.png'),
    Service('Painter', 'https://img.icons8.com/external-itim2101-flat-itim2101/2x/external-painter-male-occupation-avatar-itim2101-flat-itim2101.png'),
    Service('Carpenter', 'https://img.icons8.com/fluency/2x/drill.png'),
    Service('Gardener', 'https://img.icons8.com/external-itim2101-flat-itim2101/2x/external-gardener-male-occupation-avatar-itim2101-flat-itim2101.png'),
    Service('Tailor', 'https://img.icons8.com/fluency/2x/sewing-machine.png'),
    Service('Maid', 'https://img.icons8.com/color/2x/housekeeper-female.png'),
    Service('Driver', 'https://img.icons8.com/external-sbts2018-lineal-color-sbts2018/2x/external-driver-women-profession-sbts2018-lineal-color-sbts2018.png'),
  ]; */
  
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
                  StartServiceContainer(
                    image: AppConstants.services[index].imageURL,
                    name: AppConstants.services[index].name,
                    index: index
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SelectService(),
                          ),
                        );
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
