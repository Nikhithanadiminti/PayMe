import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../controllers/select_receiver_bank_account_controller.dart';

class SelectReceiverBankAccountView extends GetView<SelectReceiverBankAccountController> {
  const SelectReceiverBankAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: controller.searchFocusNode.hasFocus
          ? AppBar(
        leading: IconButton(
          icon: const Icon(Icons.cancel), // Back icon
          onPressed: () {
            controller.searchFocusNode.unfocus(); // Remove focus
            controller.searchQuery.value = ''; // Clear search query
          },
        ),
        title: TextField(
          textAlign : TextAlign. center,

          autofocus: true,
          focusNode: controller.searchFocusNode,
          onChanged: (value) => controller.searchQuery.value = value,
          decoration: const InputDecoration(
            hintText: 'Search By Bank Name',
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
          ),
        ),
        actions: [],
      )
          : AppBar(
        leading: IconButton(
          icon: const Icon(Icons.cancel), // Cancel icon
          onPressed: () {
            Get.back(); // Navigate back
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline), // Information icon
            onPressed: () {
              // Handle info button click
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          // AppBar with title
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: 60.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: controller.searchFocusNode.hasFocus
                  ? null
                  : const Text(
                'Select Receiver Bank',
                style: TextStyle(fontSize: 18.0),
              ),
              titlePadding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
            ),
          ),
          // Sticky Search Bar
          SliverPersistentHeader(
            pinned: true,
            delegate: _StickySearchBar(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: TextField(
                  focusNode: controller.searchFocusNode,
                  onChanged: (value) => controller.searchQuery.value = value,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Search By Bank Name',
                    prefixIcon: Icon(Icons.search, color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),

                    ),
                  ),
                ),
              ),
            ),
          ),
          // Conditional Rendering: Show Popular Banks or All Banks
          Obx(() {
            if (controller.searchFocusNode.hasFocus || controller.searchQuery.value.isNotEmpty) {
              return SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'All Banks',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                    ],
                  ),
                ),
              );
            }

            // Show Popular Banks section
            return SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Popular Banks',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemCount: controller.popularBanks.length,
                      itemBuilder: (context, index) {
                        final bank = controller.popularBanks[index];
                        return Column(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle, // Circular shape
                                border: Border.all(color: Colors.black, width: 0.5), // Border color and width
                                image: DecorationImage(
                                  image: AssetImage(bank['image'] ?? 'assets/images/axis logo.png'),
                                  fit: BoxFit.cover, // Ensures the image covers the circle
                                ),
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              bank['name'] as String,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        );

                      },
                    ),

                  ],
                ),
              ),
            );
          }),
          // All Banks List
          Obx(() {
            if (controller.filteredBanks.isEmpty && controller.searchQuery.value.isNotEmpty) {
              return const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'No banks found.',
                    style: TextStyle(color: Colors.grey, fontSize: 16.0),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }

            return SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  final bankName = controller.filteredBanks[index];
                  return ListTile(
                    leading: const Icon(Icons.account_balance, color: Colors.black),
                    title: Text(
                      bankName,
                      style: const TextStyle(color: Colors.black),
                    ),
                    onTap: () {
                      // Handle bank selection
                      Get.snackbar('Bank Selected', bankName,
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.black54,
                          colorText: Colors.white);
                    },
                  );
                },
                childCount: controller.searchQuery.value.isEmpty
                    ? controller.allBanks.length
                    : controller.filteredBanks.length,
              ),
            );
          }),
        ],
      ),
    );
  }
}

// Sticky Search Bar Delegate
class _StickySearchBar extends SliverPersistentHeaderDelegate {
  final Widget child;

  _StickySearchBar({required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 60.0;

  @override
  double get minExtent => 60.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
