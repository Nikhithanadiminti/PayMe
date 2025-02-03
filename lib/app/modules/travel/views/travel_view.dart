import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/travel_controller.dart';

class TravelView extends GetView<TravelController> {
  const TravelView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: Text('Travel',style: TextStyle(color: Colors.white),),
          backgroundColor: const Color(0xFF007f97),
          actions: [
            IconButton(
              icon: const Icon(Icons.help_outline),
              color: Colors.white,
              onPressed: () {
                // Get.to(() => TravelHelpView());
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Carousel slider
                SizedBox(
                  height: 150,
                  child:
                  PageView.builder(
                    controller: controller.pageController,
                    itemCount: controller.carouselImages.length,
                    onPageChanged: (index) {
                      controller.currentIndex.value = index; // Update observable
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          // image: DecorationImage(
                          //   image: Image.asset(controller.carouselImages[index]),
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                        child:Image.asset(controller.carouselImages[index],
                            fit:BoxFit.fill ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 5),

                // Carousel indicators
                Obx(() {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      controller.carouselImages.length,
                          (index) {
                        return Container(
                          width: 10,
                          height: 10,
                          margin: const EdgeInsets.symmetric(horizontal: 4.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: controller.currentIndex.value == index
                                ? const Color(0xFF007f97)
                                : Colors.grey,
                          ),
                        );
                      },
                    ),
                  );
                }),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white38.withOpacity(0.9),
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Travel Bookings",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildOption(
                              icon: Icons.flight_takeoff,
                              label: "Flights",
                              url: "https://www.ixigo.com/?utm_source=Brand_Ggl_Search&utm_medium=paid_search_google&utm_campaign=Ixigo_Brand&utm_source=brand_g&utm_medium=paid_search_google&utm_campaign=ixigo_brand&gad_source=1&gclid=Cj0KCQiAwOe8BhCCARIsAGKeD578pjPF9FgTULxOVm7GBhpSzmxLva2FhYNF1dnrSJ3VZxVGF2u6FT0aAjJKEALw_wcB",
                            ),
                            _buildOption(
                              icon: Icons.directions_bus_filled,
                              label: "Bus",
                                url:  "https://www.redbus.in/",
                            ),
                            _buildOption(
                              icon: Icons.train,
                              label: "Trains",
                              url: "https://www.confirmtkt.com/",
                            ),
                            _buildOption(
                              icon: Icons.hotel,
                              label: "Hotels",
                              url: "https://www.easemytrip.com/offers/emtstay.html?gad_source=1&gclid=Cj0KCQiAwOe8BhCCARIsAGKeD57ZKYGaRGbwd2WlVQbKy3ydNEUW6O0JPAG2nS1JDXKpGkeUaxP01BUaAn76EALw_wcB",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 6,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white38.withOpacity(0.9),
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Travel Services",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildOption(
                              icon: Icons.local_taxi,
                              label: "Airport Cabs",
                              url: "https://airportservices.ae/meet-and-greet/?utm_source=adwords&utm_term=meet%20%26%20assist%20at%20airport&gad_source=1&gclid=Cj0KCQiAwOe8BhCCARIsAGKeD56mXnxMumpn8UcOw6pyROB_VVzAejq1llebfM57yolYFDdpq98tHiIaAiJPEALw_wcB",
                            ),
                            _buildOption(
                              icon: Icons.directions_train_sharp,
                              label: "Metro",
                             url:  "https://www.ltmetro.com/",
                            ),
                            _buildOption(
                              icon: Icons.explore,
                              label: "Travel Activities",

                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}


Future<void> _launchUrl(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    debugPrint("Could not launch $url");
  }
}

Widget _buildOption({required IconData icon, required String label, String? url}) {
  return GestureDetector(
    onTap: () {
      if (url != null) _launchUrl(url);
    },
    child: Column(
      children: [
        Icon(icon, size: 50, color: Color(0xFF007f97)),
        SizedBox(height: 5),
        Text(label, textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
      ],
    ),
  );
}