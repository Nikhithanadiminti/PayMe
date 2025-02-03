// import 'package:demo_project/app/modules/bills_and_recharges/bindings/bills_recharges_binding.dart';
// import 'package:demo_project/app/modules/bills_and_recharges/views/bills_recharges_view.dart';
import 'package:demo_project/app/modules/bills_and_recharges/views/bills_and_recharges_view.dart';
import 'package:demo_project/app/modules/footer/views/footer_view.dart';
import 'package:demo_project/app/modules/header/views/header_view.dart';
import 'package:demo_project/app/modules/toMobileNumber/views/to_mobile_number_view.dart';
import 'package:demo_project/app/modules/to_bank_upi_id/views/to_bank_upi_id_view.dart';
import 'package:demo_project/app/modules/to_self_account/views/to_self_account_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';



import '../../purchases/views/purchases_view.dart';
import '../../transit_and_food/views/transit_and_food_view.dart';
import '../../travel/views/travel_view.dart';
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
                                  Get.to(() => const ToMobileNumberView());
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




                        ],
                      ),
                    )

                  ],
                ),
                SizedBox(height: 16),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/light_background_color.png'), // Replace with your image path
                    fit: BoxFit.cover, // Use BoxFit to control how the image fits within the container
                  ), // Background color
                  borderRadius: BorderRadius.circular(12), // Border radius
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Spacing the text to left and right
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'UPI Lite: ', // Text part "UPI Lite:"
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black, // Black color for "UPI Lite"
                            ),
                          ),
                          TextSpan(
                            text: 'Try Now', // Text part "Try Now"
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF007f97), // Blue color for "Try Now"
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 20, // Set a specific height for the container that holds the divider
                      child: VerticalDivider(
                        color: Color(0xFFCCCCCC), // Color of the divider line
                        thickness: 3, // Thickness of the divider
                       // Space from the bottom of the row
                      ),
                    ),


                    GestureDetector(
                      onTap: () {
                        // Add your action for "Try Now" here
                      },

                      child: Row(
                                children: const [
                                  Icon(
                                    Icons.qr_code,
                                    color: Colors.black,
                                    size: 16,
                                  ),
                                  SizedBox(width: 4),
                          Text(
                              'UPI ID: 9494261033@ybl',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black, // Text color
                              ),
                          ),
]
                      )
                    ),
                  ],
                ),
              ),



                SizedBox(height: 16),

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
                         padding: const EdgeInsets.only(top: 10,left: 15,right: 15,bottom: 10),
                         child: Row(
                           children: [
                             Icon(Icons.account_balance_wallet,color: Color(0xFF007f97),),

                             SizedBox(width: 8,),
                             Text(
                                 'PayMe\nWallet'


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
                       padding: const EdgeInsets.only(top: 10,left: 15,right: 15,bottom: 10),                       child: Row(

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
                       padding: const EdgeInsets.only(top: 10,left: 15,right: 15,bottom: 10),
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

              SizedBox(height: 16),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Card with Icons and Labels

                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.00),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/light_background_color.png'), // Replace with your image path
                        fit: BoxFit.cover, // Use BoxFit to control how the image fits within the container
                      ),
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
                          Get.to(()=>BillsAndRechargesView()); // Navigate to another page
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
                             url: '',

                            ),
                            _buildNavigableIcon1(
                              icon: Icons.money,
                              label: 'Loan/\nRepayment',
                               url: '',
                            ),
                            _buildNavigableIcon1(
                              icon: Icons.credit_card,
                              label: 'Credit Card\nPayment',
                              url: '',
                            ),
                            _buildNavigableIcon1(
                              icon: Icons.home,
                              label: 'Rent',
                              url: '',
                            ),
                          ],
                        ),


                      ],
                    ),
                  )

                ],
              ),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.00),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Educational Fees',
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
                                    offset: Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed('/educationalRoute'); // Use appropriate route for educational fees page
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'View All',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF007f97),
                                        ),
                                      ),
                                      SizedBox(width: 4),
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
                              icon: Icons.school,
                              label: 'Tuition Fees',
                            ),
                            _buildNavigableIcon1(
                              icon: Icons.book,
                              label: 'Exam Fees',
                            ),
                            _buildNavigableIcon1(
                              icon: Icons.money_off,
                              label: 'Scholarship',
                            ),
                            _buildNavigableIcon1(
                              icon: Icons.account_balance_wallet,
                              label: 'Fee Payments',

                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),


              SizedBox(height: 16),


              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Card with Icons and Labels

                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.00),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/light_background_color.png'), // Replace with your image path
                        fit: BoxFit.cover, // Use BoxFit to control how the image fits within the container
                      ),
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

                            ),
                            _buildNavigableIcon1(
                              icon: Icons.lock,
                              label: 'Gold Loan',
                            ),
                            _buildNavigableIcon1(
                              icon: Icons.bar_chart,
                              label: 'Mutual Fund\nLoan',
                            ),
                            _buildNavigableIcon1(
                              icon: Icons.bike_scooter,
                              label: 'Bike Loan',
                            ),
                          ],
                        ),


                      ],
                    ),
                  )

                ],
              ),


              SizedBox(height: 16),

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
                                  // Get.to(() => BillsRechargesView());
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

                            ),
                            _buildNavigableIcon1(
                              icon: Icons.directions_car,
                              label: 'Car',
                            ),
                            _buildNavigableIcon1(
                              icon: Icons.monitor_heart_outlined,
                              label: 'Health',
                            ),
                            _buildNavigableIcon1(
                              icon: Icons.handshake,
                              label: 'Term Life',
                            ),
                          ],
                        ),


                      ],
                    ),
                  )

                ],
              ),


              SizedBox(height: 16),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Card with Icons and Labels

                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.00),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/light_background_color.png'), // Replace with your image path
                        fit: BoxFit.cover, // Use BoxFit to control how the image fits within the container
                      ),
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

                            ),
                            _buildNavigableIcon1(
                              icon: Icons.currency_rupee,
                              label: 'Start With\n₹100',
                            ),
                            _buildNavigableIcon1(
                              icon: Icons.assessment,
                              label: 'Large Cap\nFunds',
                            ),
                            _buildNavigableIcon1(
                              icon: Icons.show_chart,
                              label: 'Top Performing...',
                            ),
                          ],
                        ),


                      ],
                    ),
                  )

                ],
              ),


              SizedBox(height: 16),

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
                                  Get.to(()=>TravelView()); // Navigate to another page
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
                              url: "https://www.ixigo.com/?utm_source=Brand_Ggl_Search&utm_medium=paid_search_google&utm_campaign=Ixigo_Brand&utm_source=brand_g&utm_medium=paid_search_google&utm_campaign=ixigo_brand&gad_source=1&gclid=Cj0KCQiAwOe8BhCCARIsAGKeD578pjPF9FgTULxOVm7GBhpSzmxLva2FhYNF1dnrSJ3VZxVGF2u6FT0aAjJKEALw_wcB",
                            ),
                            _buildNavigableIcon1(
                              icon: Icons.directions_bus,
                              label: 'Bus',
                              url:  "https://www.redbus.in/",
                            ),
                            _buildNavigableIcon1(
                              icon: Icons.directions_train_outlined,
                              label: 'Trains',
                              url: "https://www.confirmtkt.com/",
                            ),
                            _buildNavigableIcon1(
                              icon: Icons.business,
                              label: 'Hotels',
                              url: "https://www.easemytrip.com/offers/emtstay.html?gad_source=1&gclid=Cj0KCQiAwOe8BhCCARIsAGKeD57ZKYGaRGbwd2WlVQbKy3ydNEUW6O0JPAG2nS1JDXKpGkeUaxP01BUaAn76EALw_wcB",

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


              SizedBox(height: 16),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Card with Icons and Labels

                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.00),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/light_background_color.png'), // Replace with your image path
                        fit: BoxFit.cover, // Use BoxFit to control how the image fits within the container
                      ),
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
                                  Get.to(()=>TransitAndFoodView()); // Navigate to another page
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
                            ),
                            _buildNavigableIcon1(
                              icon: Icons.directions_subway,
                              label: 'Metro',
                            ),
                            _buildNavigableIcon1(
                              icon: Icons.directions_car,
                              label: 'Recharge\nFASTag',
                            ),
                            _buildNavigableIcon1(
                              icon: Icons.car_repair,
                              label: 'Roadside\nAssistance',
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
                                  Get.to(()=>PurchasesView()); // Navigate to another page
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

                            ),
                            _buildNavigableIcon1(
                              icon: Icons.savings,
                              label: 'Daily Gold Savings',
                            ),
                            _buildNavigableIcon1(
                              icon: Icons.apps,
                              label: 'Google\nPlay',
                            ),
                            _buildNavigableIcon1(
                              icon: Icons.card_giftcard,
                              label: 'Brand\nVouchers',
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
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/main_background_color.png'), // Replace with your image path
                    fit: BoxFit.cover, // Use BoxFit to control how the image fits within the container
                  ), // Light white background
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  icon,
                  size: 35,
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
    //required VoidCallback onTap,
    String? url
  }) {
    return GestureDetector(
      onTap: () {
        if (url != null) _launchUrl(url);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        // Ensures that the column takes minimal space
        children: [

              Container(
                width: 50,

                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white, // Light white background
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  icon,
                  size: 32,
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
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint("Could not launch $url");
    }
  }

}


