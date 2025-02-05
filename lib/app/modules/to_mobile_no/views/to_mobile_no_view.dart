import 'package:demo_project/app/modules/scanned_payment_details/views/scanned_payment_details_view.dart';
import 'package:demo_project/app/modules/to_mobile_num_payment_details/views/to_mobile_num_payment_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/to_mobile_no_controller.dart';

class ToMobileNoView extends GetView<ToMobileNoController> {
  const ToMobileNoView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    ScrollController _scrollController = ScrollController(); // Add the ScrollController here

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF007f97),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
           Get.back(); // Back navigation
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: () {
              controller.fetchContacts(); // Refresh action to re-fetch contacts
            },
          ),
          IconButton(
            icon: const Icon(Icons.help_outline, color: Colors.white),
            onPressed: () {
              controller.fetchContacts(); // Refresh action to re-fetch contacts
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Background container with gradient for a modern look
          GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF007f97), Color(0xFF00bfae)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Send Money',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'To any UPI app',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 20.0),

                  // Search TextField with Obx for hint text cycling
                  Obx(() => TextField(
                    controller: searchController,
                    onChanged: (query) {
                      controller.searchQuery.value = query; // Update search query
                      controller.filterContacts(); // Filter the contacts based on the query
                    },
                    decoration: InputDecoration(
                      hintText: controller.hintTexts[controller.currentHintIndex.value],
                      hintStyle: const TextStyle(color: Colors.grey),
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black, // Black color when focused
                          width: 1, // You can adjust the width as needed
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey, // Grey color when not focused
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  )),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),

          // Main content area for contacts list
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }

              if (controller.filteredContacts.isEmpty) {
                return const Center(
                  child: Text(
                    'No contacts found',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                );
              }

              return NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification notification) {
                  if (notification.metrics.pixels > 200) {
                    // Show the scroll-to-top button
                    controller.showScrollToTopButton.value = true;
                  } else {
                    controller.showScrollToTopButton.value = false;
                  }
                  return true;
                },
                child: ListView.builder(
                  controller: _scrollController, // Attach the ScrollController here
                  itemCount: controller.filteredContacts.length,
                  itemBuilder: (context, index) {
                    final contact = controller.filteredContacts[index];
                    return Card(
                      elevation: 2.0,
                      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16.0),
                        title: Text(
                          contact.displayName ?? 'No Name',
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        subtitle: Text(
                          contact.phones.isNotEmpty
                              ? contact.phones.first.number ?? 'No phone number'
                              : 'No phone number',
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.black54,
                          ),
                        ),
                        leading: contact.photo == null
                            ? CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          child: Icon(Icons.person, color: Colors.white),
                        )
                            : CircleAvatar(
                          backgroundImage: MemoryImage(contact.photo!),
                        ),
                        onTap: () {
                          controller.setSelectedContactName(contact.displayName ?? 'No Name');
                          Get.to(ToMobileNumPaymentDetailsView(contactName: contact.displayName ?? 'No Name', contactImage: contact.photo, ));
                        },
                      ),
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),

      // Floating button to scroll to top
      floatingActionButton: Obx(() {
        return Visibility(
          visible: controller.showScrollToTopButton.value, // Use the reactive state to toggle visibility
          child: FloatingActionButton(
            onPressed: () {
              // Scroll to the top of the list using the ScrollController
              _scrollController.animateTo(
                0.0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            backgroundColor:Color(0xFF007f97),
            child: const Icon(Icons.arrow_upward,color:Colors.white,),
          ),
        );
      }),
    );
  }
}

