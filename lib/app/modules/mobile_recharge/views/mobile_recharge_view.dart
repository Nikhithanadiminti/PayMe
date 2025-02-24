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
          onTap: () {
            Get.back();
          },
          child: const Icon(
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
            icon: const Icon(Icons.help_outline),
            color: Colors.white,
            onPressed: () {
              Get.to(() => MobileRechargeHelp());
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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                    const Icon(Icons.search, color: Colors.grey),
                  ],
                ),
              ),
              const SizedBox(height: 15),

              // Recents section
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white38.withOpacity(0.9),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: const Row(
                        children: [
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
                              leading: const CircleAvatar(
                                backgroundImage: AssetImage("assets/images/vi_image.jpg"),
                                backgroundColor: Colors.transparent,
                              ),
                              title: const Text("Vinayak"),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("8919189632"),
                                  Text("Last Recharge: Yesterday"),
                                ],
                              ),
                              trailing: const Icon(Icons.more_vert),
                              onTap: () {
                                // Show the bottom sheet when tapped on the contact
                                _showContactBottomSheet(context, {
                                  "name": "Vinayak",
                                  "mobile": "8919189632",
                                  "image": "assets/images/vi_image.jpg"
                                });
                              },
                            ),
                            const SizedBox(height: 5),
                            const Divider(color: Colors.grey),
                            const SizedBox(height: 5),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // My Contacts section
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        "My Contacts",
                        style: TextStyle(
                            fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            ListTile(
                              leading: const CircleAvatar(
                                backgroundImage: AssetImage("assets/images/profile_image.png"),
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("Virat"),
                                  Text("7835678490"),
                                ],
                              ),
                              onTap: () {
                                // Show the bottom sheet when tapped on the contact
                                _showContactBottomSheet(context, {
                                  "name": "Virat",
                                  "mobile": "7835678490",
                                  "image": "assets/images/profile_image.png"
                                });
                              },
                            ),
                            const SizedBox(height: 5),
                            const Divider(color: Colors.grey),
                            const SizedBox(height: 5),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showContactBottomSheet(BuildContext context, Map<String, String> contact) {
    TextEditingController nameController = TextEditingController(text: contact["name"]);
    bool isEditing = false; // Track editing state

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
          child: StatefulBuilder(
            builder: (BuildContext context, setState) {
              return Column(
                 mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(contact["image"] ?? "assets/images/default_logo.png"),
                      backgroundColor: Colors.transparent,
                    ),
                    title:  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          contact["name"]!,
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            setState(() {
                              isEditing = true; // Toggle edit mode
                              print("on editing-----$isEditing");
                            });
                          },
                        ),
                      ],
                    ),
                    subtitle: Text(contact["mobile"]!),
                    // trailing: const Icon(Icons.more_vert),
                  ),
                  // Contact details with logo
                  // Row(
                  //   children: [
                  //     CircleAvatar(
                  //         backgroundImage: AssetImage(contact["image"] ?? "assets/images/default_logo.png"),
                  //         radius: 24.0,
                  //       ),
                  //     SizedBox(width: 10),
                  //     Column(
                  //       mainAxisAlignment: MainAxisAlignment.start,
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         SizedBox(height: 10),
                  //         if(!isEditing)
                  //         Row(
                  //           mainAxisAlignment: MainAxisAlignment.start,
                  //           children: [
                  //             Text(
                  //               contact["name"]!,
                  //               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  //             ),
                  //             IconButton(
                  //               icon: Icon(Icons.edit),
                  //               onPressed: () {
                  //                 setState(() {
                  //                   isEditing = true; // Toggle edit mode
                  //                 });
                  //               },
                  //             ),
                  //           ],
                  //         ),
                  //         SizedBox(height: 5),
                  //         Text(
                  //           contact["mobile"]!,
                  //           style: TextStyle(fontSize: 18, color: Colors.black),
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                  SizedBox(height: 10),
                  Divider(color: Colors.grey),
                  SizedBox(height: 10),
                  if (isEditing)
                  // Save Button when editing the nickname
                    Row(
                      children: [
                         TextField(
                            controller: nameController,
                            // autovalidateMode: AutovalidateMode.onUserInteraction,
                            // validator: (value){
                            //   if(value.toString().isEmpty){
                            //     return "Telephone Number is required";
                            //   } else {
                            //     return null;
                            //   }
                            // },
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.phone),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              hintText: 'Enter the number',
                            ),
                          ),
                        ElevatedButton(
                          onPressed: () {
                            String newName = nameController.text.trim();
                            if (newName.isNotEmpty) {
                              // Save new name and update the contact's name
                              contact["name"] = newName;
                              setState(() {
                                isEditing = false; // Exit edit mode after saving
                              });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Name cannot be empty')),
                              );
                            }
                          },
                          child: Text("Save"),
                        ),
                      ],
                    ),
                  // Other actions
                  ListTile(
                    leading: Icon(Icons.history),
                    title: Text('View History'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.delete),
                    title: Text('Delete Account'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}