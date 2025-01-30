import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/mobile_recharge_controller.dart';
import 'help_view.dart';

class MobileRechargeView extends GetView<MobileRechargeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "Mobile Recharge",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF007f97),
        actions: [
          IconButton(
            icon: Icon(Icons.help_outline),
            color: Colors.white,
            onPressed: () {
              Get.to(()=> MobileRechargeHelp());
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
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search by name or number",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Icon(Icons.search, color: Colors.grey),
                    ],
                  ),
                ),
    // Recents section
    const SizedBox(height: 15),

            Container(
              margin: EdgeInsets.only(left: 10,right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white38.withOpacity(0.9),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: const [
                        Text(
                          "Recents",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                          leading: CircleAvatar(
                          backgroundImage: AssetImage(
                          "assets/images/vi_image.jpg", // Update with logo assets
                          ),
                          backgroundColor: Colors.transparent,
                          ),
                          title: Text("Vinayak"),
                          subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text("8919189632"),
                          Text("Last Recharge: Yesterday"),
                          ],
                          ),
                          trailing: const Icon(Icons.more_vert),
                          ),
                          SizedBox(height: 5),
                          Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 5),
                        ],
                      );
                      },
                      ),
                ],
              ),
            ),
    //}),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(left: 10,right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: 8.0,),
                      child: Text(
                        "My Contacts",
                        style: TextStyle(fontSize: 16,
                            color: Colors.black,fontWeight: FontWeight.bold),),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: AssetImage(
                                    "assets/images/profile_image.png"
                                  ),
                                ),
                                title: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Om Shankar"
                                    ),
                                    Text(
                                      "7835678490"
                                    ),
                                  ],
                                ),

                              ),
                            SizedBox(height: 5),
                            Container(
                              height: 1,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 5),
                          ],
                        );
                      },

                    ),
                  ],
                ),
              )
    ],
    ),
    ),
    )
    );
  }
}


