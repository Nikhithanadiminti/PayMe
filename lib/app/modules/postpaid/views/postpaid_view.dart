import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/postpaid_controller.dart';

class PostpaidView extends GetView<PostpaidController> {
  const PostpaidView({super.key});

  @override
  Widget build(BuildContext context) {
    PostpaidController postpaidController = Get.put(PostpaidController());

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Postpaid Bill',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF007f97),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            color: Colors.white,
            onPressed: () {
              // Get.to(() => PostpaidHelpView());
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
                child: PageView.builder(
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
                      ),
                      child: Image.asset(
                        controller.carouselImages[index],
                        fit: BoxFit.fill,
                      ),
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
              SizedBox(height: 10),
              // Search Box
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
              const SizedBox(height: 15),

              // Recents section
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
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
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: postpaidController.recentContactsList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                backgroundImage: AssetImage(
                                  postpaidController
                                      .recentContactsList[index]["image"]!,
                                ),
                                backgroundColor: Colors.transparent,
                              ),
                              title: Text(
                                postpaidController
                                    .recentContactsList[index]["name"]!,
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(postpaidController
                                      .recentContactsList[index]["mobile"]!),
                                  Text(postpaidController
                                      .recentContactsList[index]["last_recharge"]!),
                                ],
                              ),
                              trailing: IconButton(
                                icon: Icon(Icons.more_vert),
                                onPressed: () {
                                  // Pass the contact data when the more_vert icon is pressed
                                  _showContactBottomSheet(context,
                                      postpaidController
                                          .recentContactsList[index]);
                                },
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
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
                "assets/images/bharat_connect.webp", height: 50, width: 50),
            SizedBox(width: 10),
            Text(
                "By proceeding further, you allow PayMe \nto fetch your current and future dates and \nremind you")
          ],
        ),
      ),
    );
  }

  void _showContactBottomSheet(BuildContext context, Map<String, String> contact) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Contact details with logo
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                        contact["image"] ?? "assets/images/default_logo.png"),
                    // Add the logo image here
                    radius: 24.0,
                  ),
                  SizedBox(width: 10), // Space between logo and name
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contact["name"]!,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        contact["mobile"]!,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Divider between contact info and options
              Divider(
                color: Colors.grey, // Color of the line
                thickness: 1, // Thickness of the line
              ),
              SizedBox(height: 16),

              // Options
              ListTile(
                leading: Icon(Icons.edit),
                title: Text('Update Nickname'),
                onTap: () {
                  Navigator.pop(context); // Close the bottom sheet
                },
              ),
              ListTile(
                leading: Icon(Icons.history),
                title: Text('View History'),
                onTap: () {
                  Navigator.pop(context); // Close the bottom sheet
                },
              ),
              ListTile(
                leading: Icon(Icons.delete),
                title: Text('Delete Account'),
                onTap: () {
                  Navigator.pop(context); // Close the bottom sheet
                },
              ),
            ],
          ),
        );
      },
    );
  }
}