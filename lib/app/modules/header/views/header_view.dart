import 'package:demo_project/app/modules/profile/views/profile_view.dart';
import 'package:demo_project/app/modules/profileDetails/views/profile_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/header_controller.dart';

class HeaderView extends GetView<HeaderController> implements PreferredSizeWidget {
  const HeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF007f97),
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: (){
            Get.to(ProfileView());
          },
          child: Container(
          
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
          
              borderRadius: BorderRadius.circular(8),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset('assets/images/testing.jpg',
                  width: 40,
                  height:25,
                ),
              ),
            ),
          ),
        ),
      ),


      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align both texts to the start
        children: [
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                // const SizedBox(width: 5),
                const Text(
                  'Add Address',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const Icon(
                  Icons.arrow_drop_down,
                  size: 16,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          const SizedBox(height: 2), // Optional: small space between the two lines
          const Text(
            'Nanakramguda',
            style: TextStyle(
              fontSize: 13,
              color: Colors.white,
            ),
          ),
        ],
      ),

      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.help_outline,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight); // Corrected the getter name
}
