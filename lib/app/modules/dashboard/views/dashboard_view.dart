import 'package:demo_project/app/modules/footer/views/footer_view.dart';
import 'package:demo_project/app/modules/header/views/header_view.dart';
import 'package:demo_project/app/modules/to_bank_upi_id/views/to_bank_upi_id_view.dart';
import 'package:demo_project/app/modules/to_self_account/views/to_self_account_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';


import '../controllers/dashboard_controller.dart';


class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);



  @override

  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: HeaderView(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [

               Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Card with Icons and Labels

                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16.00),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4), // Shadow color with transparency
                            spreadRadius: 2, // How wide the shadow spreads
                            blurRadius: 5,   // How soft the shadow looks
                            offset: Offset(0, 3), // Position of the shadow (x, y)
                          ),
                        ],

                      ),

                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          const Text(
                            'Transfer Money',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildNavigableIcon(
                                icon: Icons.person,
                                label: 'To Mobile\nNumber',
                                onTap: () {
                                  // Get.to(() => const ToMobileNumberPage());
                                },
                                notificationDot: true,

                              ),
                              _buildNavigableIcon(
                                icon: Icons.account_balance,
                                label: 'To Bank/\nUPI ID',
                                onTap: () {
                                  Get.to(() => const ToBankUpiIdView());
                                },
                              ),
                              _buildNavigableIcon(
                                icon: Icons.account_balance_wallet,
                                label: 'To Self\nAccount',
                                onTap: () {
                                  Get.to(() => const ToSelfAccountView());
                                },
                              ),
                              _buildNavigableIcon(
                                icon: Icons.account_balance_wallet,
                                label: 'Check Bank\nBalance',
                                onTap: () {
                                  // Get.to(() => const ToMobileNumberPage());
                                },
                              ),
                            ],
                          ),


                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black, // Border color
                                    width: 1, // Border width
                                  ),
                                  borderRadius: BorderRadius.circular(8), // Rounded corners
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      'UPI Lite: ',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      'Try Now',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF007f97),
                                      ),
                                    ),
                                  ],

                                ),
                              ),

                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black, // Border color
                                    width: 1, // Border width
                                  ),
                                  borderRadius: BorderRadius.circular(8), // Rounded corners
                                ),
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.qr_code,
                                      color: Colors.black,
                                      size: 20,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      'UPI ID: obulakiran...',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Icon(Icons.keyboard_arrow_right ,
                                      color: Colors.black,
                                      size: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )


                        ],
                      ),
                    )

                  ],
                ),


                SizedBox(height: 8,),

                Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [

                   GestureDetector(
                     onTap: () {
                       Get.toNamed('/exploreRewards'); // Navigate to Explore Rewards page
                     },
                     child: Container(

                       decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(12),
                         boxShadow: [
                           BoxShadow(
                             color: Colors.grey.withOpacity(0.4), // Shadow color with transparency
                             spreadRadius: 2, // How wide the shadow spreads
                             blurRadius: 5,   // How soft the shadow looks
                             offset: Offset(0, 3), // Position of the shadow (x, y)
                           ),
                         ],

                       ),
                       child: Padding(
                         padding: const EdgeInsets.only(top: 4,left: 8,right: 8,bottom: 4),
                         child: Row(
                           children: [
                             Icon(Icons.account_balance_wallet,color: Color(0xFF007f97),),

                             SizedBox(width: 8,),
                             Text(
                                 'WePay\nWallet'


                             )
                           ],
                         ),
                       ),
                     ),
                   ),

                   GestureDetector(
                     onTap: () {
                       Get.toNamed('/exploreRewards'); // Navigate to Explore Rewards page
                     },
                   child:Container(
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(12),
                       boxShadow: [
                         BoxShadow(
                           color: Colors.grey.withOpacity(0.4), // Shadow color with transparency
                           spreadRadius: 2, // How wide the shadow spreads
                           blurRadius: 5,   // How soft the shadow looks
                           offset: Offset(0, 3), // Position of the shadow (x, y)
                         ),
                       ],

                     ),
                     child: Padding(
                       padding: const EdgeInsets.only(top: 4,left: 8,right: 8,bottom: 4),                       child: Row(

                         children: [
                           Icon(Icons.card_giftcard,color: Color(0xFF007f97),),

                           SizedBox(width: 8,),
                           Text(
                               'Explore\nRewards'
                           )
                         ],
                       ),
                     ),
                   ),
                   ),
                   GestureDetector(
                     onTap: () {
                       Get.toNamed('/exploreRewards'); // Navigate to Explore Rewards page
                     },
                     child: Container(
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(12),
                       boxShadow: [
                         BoxShadow(
                           color: Colors.grey.withOpacity(0.4), // Shadow color with transparency
                           spreadRadius: 2, // How wide the shadow spreads
                           blurRadius: 5,   // How soft the shadow looks
                           offset: Offset(0, 3), // Position of the shadow (x, y)
                         ),
                       ],

                     ),
                     child: Padding(
                       padding: const EdgeInsets.only(top: 4,left: 8,right: 8,bottom: 4),
                       child: Row(

                         children: [
                           Icon(Icons.share,color: Color(0xFF007f97),),

                           SizedBox(width: 8,),
                           Text(
                               'Refer & Get\n₹50'
                           )
                         ],
                       ),
                     ),
                   ),
                      ),
                 ],
               ),

              SizedBox(height: 8,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Card with Icons and Labels

                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.00),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4), // Shadow color with transparency
                          spreadRadius: 2, // How wide the shadow spreads
                          blurRadius: 5,   // How soft the shadow looks
                          offset: Offset(0, 3), // Position of the shadow (x, y)
                        ),
                      ],

                    ),

                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[

                        Row(

                         mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            const Text(
                              'Recharge & Pay Bills',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),



                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: Offset(0, 1), // Offset for the shadow
                          ),
                        ],
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed('/yourRoute'); // Navigate to another page
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.min, // Ensures minimal space usage
                            children: [
                              Text(
                                'View All',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF007f97),
                                ),
                              ),
                              SizedBox(width: 4), // Minimal spacing between text and icon
                              Icon(
                                Icons.arrow_right_alt_outlined,
                                size: 16,
                                color: Color(0xFF007f97),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    ],
                        ),

                        const SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildNavigableIcon1(
                              icon: Icons.phone_iphone,
                              label: 'Mobile\nRecharge',
                              onTap: () {
                                // Get.to(() => const ToMobileNumberPage());
                              },

                            ),
                            _buildNavigableIcon1(
                              icon: Icons.money,
                              label: 'Loan/\nRepayment',
                              onTap: () {
                                // Get.to(() => const ToMobileNumberPage());
                              },
                            ),
                            _buildNavigableIcon1(
                              icon: Icons.credit_card,
                              label: 'Credit Card\nPayment',
                              onTap: () {
                                // Get.to(() => const ToMobileNumberPage());
                              },
                            ),
                            _buildNavigableIcon1(
                              icon: Icons.home,
                              label: 'Rent',
                              onTap: () {
                                // Get.to(() => const ToMobileNumberPage());
                              },
                            ),
                          ],
                        ),


                      ],
                    ),
                  )

                ],
              ),


              SizedBox(height: 8),


              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Card with Icons and Labels

                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.00),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4), // Shadow color with transparency
                          spreadRadius: 2, // How wide the shadow spreads
                          blurRadius: 5,   // How soft the shadow looks
                          offset: Offset(0, 3), // Position of the shadow (x, y)
                        ),
                      ],

                    ),

                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[

                        Row(

                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            const Text(
                              'Loan',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),



                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    offset: Offset(0,1), // Offset for the shadow
                                  ),
                                ],
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed('/yourRoute'); // Navigate to another page
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min, // Ensures minimal space usage
                                    children: [
                                      Text(
                                        'View All',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF007f97),
                                        ),
                                      ),
                                      SizedBox(width: 4), // Minimal spacing between text and icon
                                      Icon(
                                        Icons.arrow_right_alt_outlined,
                                        size: 16,
                                        color: Color(0xFF007f97),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),

                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildNavigableIcon1(
                              icon: Icons.credit_score,
                              label: 'Credit Score',
                              onTap: () {
                                // Get.to(() => const ToMobileNumberPage());
                              },

                            ),
                            _buildNavigableIcon1(
                              icon: Icons.lock,
                              label: 'Gold Loan',
                              onTap: () {
                                // Get.to(() => const ToMobileNumberPage());
                              },
                            ),
                            _buildNavigableIcon1(
                              icon: Icons.bar_chart,
                              label: 'Mutual Fund\nLoan',
                              onTap: () {
                                // Get.to(() => const ToMobileNumberPage());
                              },
                            ),
                            _buildNavigableIcon1(
                              icon: Icons.bike_scooter,
                              label: 'Bike Loan',
                              onTap: () {
                                // Get.to(() => const ToMobileNumberPage());
                              },
                            ),
                          ],
                        ),


                      ],
                    ),
                  )

                ],
              ),


              SizedBox(height: 8,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Card with Icons and Labels

                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.00),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4), // Shadow color with transparency
                          spreadRadius: 2, // How wide the shadow spreads
                          blurRadius: 5,   // How soft the shadow looks
                          offset: Offset(0, 3), // Position of the shadow (x, y)
                        ),
                      ],

                    ),

                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[

                        Row(

                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            const Text(
                              'Insurance',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),



                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    offset: Offset(0, 1), // Offset for the shadow
                                  ),
                                ],
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed('/yourRoute'); // Navigate to another page
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min, // Ensures minimal space usage
                                    children: [
                                      Text(
                                        'View All',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF007f97),
                                        ),
                                      ),
                                      SizedBox(width: 4), // Minimal spacing between text and icon
                                      Icon(
                                        Icons.arrow_right_alt_outlined,
                                        size: 16,
                                        color: Color(0xFF007f97),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),

                        const SizedBox(height: 15),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildNavigableIcon1(
                              icon: Icons.directions_bike,
                              label: 'Bike',
                              onTap: () {
                                // Get.to(() => const ToMobileNumberPage());
                              },

                            ),
                            _buildNavigableIcon1(
                              icon: Icons.directions_car,
                              label: 'Car',
                              onTap: () {
                                // Get.to(() => const ToMobileNumberPage());
                              },
                            ),
                            _buildNavigableIcon1(
                              icon: Icons.monitor_heart_outlined,
                              label: 'Health',
                              onTap: () {
                                // Get.to(() => const ToMobileNumberPage());
                              },
                            ),
                            _buildNavigableIcon1(
                              icon: Icons.handshake,
                              label: 'Term Life',
                              onTap: () {
                                // Get.to(() => const ToMobileNumberPage());
                              },
                            ),
                          ],
                        ),


                      ],
                    ),
                  )

                ],
              ),


              SizedBox(height: 8,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Card with Icons and Labels

                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.00),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4), // Shadow color with transparency
                          spreadRadius: 2, // How wide the shadow spreads
                          blurRadius: 5,   // How soft the shadow looks
                          offset: Offset(0, 3), // Position of the shadow (x, y)
                        ),
                      ],

                    ),

                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[

                        Row(

                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            const Text(
                              'Wealth',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),



                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    offset: Offset(0, 1), // Offset for the shadow
                                  ),
                                ],
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed('/yourRoute'); // Navigate to another page
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min, // Ensures minimal space usage
                                    children: [
                                      Text(
                                        'View All',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF007f97),
                                        ),
                                      ),
                                      SizedBox(width: 4), // Minimal spacing between text and icon
                                      Icon(
                                        Icons.arrow_right_alt_outlined,
                                        size: 16,
                                        color: Color(0xFF007f97),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),

                        const SizedBox(height: 15),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildNavigableIcon1(
                              icon: Icons.trending_up,
                              label: 'Best SIP\nFunds',
                              onTap: () {
                                // Get.to(() => const ToMobileNumberPage());
                              },

                            ),
                            _buildNavigableIcon1(
                              icon: Icons.currency_rupee,
                              label: 'Start With\n₹100',
                              onTap: () {
                                // Get.to(() => const ToMobileNumberPage());
                              },
                            ),
                            _buildNavigableIcon1(
                              icon: Icons.assessment,
                              label: 'Large Cap\nFunds',
                              onTap: () {
                                // Get.to(() => const ToMobileNumberPage());
                              },
                            ),
                            _buildNavigableIcon1(
                              icon: Icons.show_chart,
                              label: 'Top Performing...',
                              onTap: () {
                                // Get.to(() => const ToMobileNumberPage());
                              },
                            ),
                          ],
                        ),


                      ],
                    ),
                  )

                ],
              ),


              SizedBox(height: 8,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Card with Icons and Labels

                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.00),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4), // Shadow color with transparency
                          spreadRadius: 2, // How wide the shadow spreads
                          blurRadius: 5,   // How soft the shadow looks
                          offset: Offset(0, 3), // Position of the shadow (x, y)
                        ),
                      ],

                    ),

                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[

                        Row(

                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            const Text(
                              'Travel',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),



                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    offset: Offset(0, 1), // Offset for the shadow
                                  ),
                                ],
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed('/yourRoute'); // Navigate to another page
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min, // Ensures minimal space usage
                                    children: [
                                      Text(
                                        'View All',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF007f97),
                                        ),
                                      ),
                                      SizedBox(width: 4), // Minimal spacing between text and icon
                                      Icon(
                                        Icons.arrow_right_alt_outlined,
                                        size: 16,
                                        color: Color(0xFF007f97),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),

                        const SizedBox(height: 15),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildNavigableIcon1(
                              icon: Icons.flight_takeoff,
                              label: 'Flights',
                              onTap: () {
                                // Get.to(() => const ToMobileNumberPage());
                              },

                            ),
                            _buildNavigableIcon1(
                              icon: Icons.directions_bus,
                              label: 'Bus',
                              onTap: () {
                                // Get.to(() => const ToMobileNumberPage());
                              },
                            ),
                            _buildNavigableIcon1(
                              icon: Icons.directions_train_outlined,
                              label: 'Trains',
                              onTap: () {
                                // Get.to(() => const ToMobileNumberPage());
                              },
                            ),
                            _buildNavigableIcon1(
                              icon: Icons.business,
                              label: 'Hotels',
                              onTap: () {
                                // Get.to(() => const ToMobileNumberPage());
                              },
                            ),
                          ],
                        ),


                      ],
                    ),
                  )

                ],
              ),

              SizedBox(height: 8),


              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        // Carousel Slider
                        Obx(() {
                          return Column(
                            children: [
                              SizedBox(
                                height: 150,
                                child: PageView.builder(
                                  controller: controller.pageController,
                                  itemCount: controller.carouselImages.length,
                                  onPageChanged: controller.updateIndex, // Update the index when page changes
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: const EdgeInsets.symmetric(horizontal: 1.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12.0),
                                        image: DecorationImage(
                                          image: AssetImage(controller.carouselImages[index]),
                                          fit: BoxFit.cover,  // Ensure the image fills the container
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  controller.carouselImages.length,
                                      (index) => Obx(() {
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
                                  }),
                                ),
                              ),
                            ],
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),


              SizedBox(height: 8,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Card with Icons and Labels

                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.00),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4), // Shadow color with transparency
                          spreadRadius: 2, // How wide the shadow spreads
                          blurRadius: 5,   // How soft the shadow looks
                          offset: Offset(0, 3), // Position of the shadow (x, y)
                        ),
                      ],

                    ),

                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[

                        Row(

                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            const Text(
                              'Transit & Food',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),



                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    offset: Offset(0, 1), // Offset for the shadow
                                  ),
                                ],
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed('/yourRoute'); // Navigate to another page
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min, // Ensures minimal space usage
                                    children: [
                                      Text(
                                        'View All',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF007f97),
                                        ),
                                      ),
                                      SizedBox(width: 4), // Minimal spacing between text and icon
                                      Icon(
                                        Icons.arrow_right_alt_outlined,
                                        size: 16,
                                        color: Color(0xFF007f97),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),

                        const SizedBox(height: 15),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildNavigableIcon1(
                              icon: Icons.credit_card,
                              label: 'Buy FASTag',
                              onTap: () {
                                // Get.to(() => const ToMobileNumberPage());
                              },

                            ),
                            _buildNavigableIcon1(
                              icon: Icons.directions_subway,
                              label: 'Metro',
                              onTap: () {
                                // Get.to(() => const ToMobileNumberPage());
                              },
                            ),
                            _buildNavigableIcon1(
                              icon: Icons.directions_car,
                              label: 'Recharge\nFASTag',
                              onTap: () {
                                // Get.to(() => const ToMobileNumberPage());
                              },
                            ),
                            _buildNavigableIcon1(
                              icon: Icons.car_repair,
                              label: 'Roadside\nAssistance',
                              onTap: () {
                                // Get.to(() => const ToMobileNumberPage());
                              },
                            ),
                          ],
                        ),


                      ],
                    ),
                  )

                ],
              ),


              SizedBox(height: 8,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Card with Icons and Labels

                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.00),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4), // Shadow color with transparency
                          spreadRadius: 2, // How wide the shadow spreads
                          blurRadius: 5,   // How soft the shadow looks
                          offset: Offset(0, 3), // Position of the shadow (x, y)
                        ),
                      ],

                    ),

                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[

                        Row(

                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            const Text(
                              'Purchases',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),



                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    offset: Offset(0, 1), // Offset for the shadow
                                  ),
                                ],
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed('/yourRoute'); // Navigate to another page
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min, // Ensures minimal space usage
                                    children: [
                                      Text(
                                        'View All',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF007f97),
                                        ),
                                      ),
                                      SizedBox(width: 4), // Minimal spacing between text and icon
                                      Icon(
                                        Icons.arrow_right_alt_outlined,
                                        size: 16,
                                        color: Color(0xFF007f97),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),

                        const SizedBox(height: 15),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildNavigableIcon1(
                              icon: Icons.attach_money,
                              label: 'Gold',
                              onTap: () {
                                // Get.to(() => const ToMobileNumberPage());
                              },

                            ),
                            _buildNavigableIcon1(
                              icon: Icons.savings,
                              label: 'Daily Gold Savings',
                              onTap: () {
                                // Get.to(() => const ToMobileNumberPage());
                              },
                            ),
                            _buildNavigableIcon1(
                              icon: Icons.apps,
                              label: 'Google\nPlay',
                              onTap: () {
                                // Get.to(() => const ToMobileNumberPage());
                              },
                            ),
                            _buildNavigableIcon1(
                              icon: Icons.card_giftcard,
                              label: 'Brand\nVouchers',
                              onTap: () {
                                // Get.to(() => const ToMobileNumberPage());
                              },
                            ),
                          ],
                        ),


                      ],
                    ),
                  )

                ],
              ),




            ],
          ),
        )


      ),
      bottomNavigationBar: FooterView(),
    );
  }

  Widget _buildNavigableIcon({
    required IconData icon,
    required String label,
    bool notificationDot = false,
    required VoidCallback onTap ,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [

          Stack(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Color(0xFF007f97), // Light white background
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              if (notificationDot)
                Positioned(
                  right: 1,
                  top: 1,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),

            ],
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigableIcon1({
    required IconData icon,
    required String label,
    bool notificationDot = false,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        // Ensures that the column takes minimal space
        children: [

              Container(
                width: 60,

                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white, // Light white background
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  size: 30,
                  color: Color(0xFF007f97),
                ),
              ),
          const SizedBox(height: 8),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 90),
            // Limits the text width to avoid overflow
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

}
