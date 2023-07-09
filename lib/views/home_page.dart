import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:motion_tab_bar_v2/motion-badge.widget.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';

import 'drawer_class.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  final bool isloading = true;
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 4,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerClass(),
      bottomNavigationBar: MotionTabBar(
          initialSelectedTab: "Home",
          useSafeArea: true, // default: true, apply safe area wrapper
          labels: const ["Dashboard", "Home", "Profile", "Settings"],
          icons: const [Icons.dashboard, Icons.home, Icons.people_alt, Icons.settings],

          // optional badges, length must be same with labels
          badges: [
            // Default Motion Badge Widget
            const MotionBadgeWidget(
              text: '99+',
              textColor: Colors.white, // optional, default to Colors.white
              color: Colors.red, // optional, default to Colors.red
              size: 18, // optional, default to 18
            ),

            // custom badge Widget
            Container(
              color: Colors.black,
              padding: const EdgeInsets.all(2),
              child: const Text(
                '48',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),

            // allow null
            null,

            // Default Motion Badge Widget with indicator only
            const MotionBadgeWidget(
              isIndicator: true,
              color: Colors.red, // optional, default to Colors.red
              size: 5, // optional, default to 5,
              show: true, // true / false
            ),
          ],
          tabSize: 50,
          tabBarHeight: 55,
          textStyle: const TextStyle(
            fontSize: 12,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          tabIconColor: Colors.blue[600],
          tabIconSize: 28.0,
          tabIconSelectedSize: 26.0,
          tabSelectedColor: Colors.blue[900],
          tabIconSelectedColor: Colors.white,
          tabBarColor: const Color(0xFFAFAFAF),
          onTabItemSelected: (int value) {
            setState(() {
              _tabController!.index = value;
            });
          },
        ),
      body: TabBarView(
          physics: NeverScrollableScrollPhysics(), // swipe navigation handling is not supported
          controller: _tabController,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
             Center(
              child: Text("Your Dashboard")
            ),
             Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset('assets/images/logobg.png'),
                        Positioned(
                          top: Get.height*0.07,
                          left: 0,
                          right: 0,
                          child: Text(
                            'COMPANY \nLOGO',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0,right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Welcome,",style: TextStyle(
                                  fontSize: 19,fontWeight: FontWeight.bold
                              ),),
                              Text("Mr Alwan",style: TextStyle(color: Colors.blue,
                                  fontSize: 29,fontWeight: FontWeight.bold
                              ),)
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.card_travel),
                              IconButton(onPressed: (){}, icon: Icon(Icons.notifications)),
                              Image.asset('assets/images/person.png')
                            ],
                          )

                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          height: Get.height * 0.07,
                          width: Get.height * 0.4,
                          child: Material(
                            elevation: 4, // Controls the shadow depth
                            shadowColor: Colors.grey, // Defines the shadow color
                            color: Colors.white,
                            child: TextField(
                              style: TextStyle(fontSize: 17),
                              decoration: InputDecoration(
                                hintText: 'Find Any Items...',
                                contentPadding: EdgeInsets.only(left: 20),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ),

                        IconButton(onPressed: (){}, icon: Icon(Icons.grading,size: 35,color: Colors.green,))
                      ],
                    ),
                    SizedBox(height: Get.height*0.02,),
                    CarouselSlider(
                      options: CarouselOptions(height:Get.height*0.3),
                      items: [
                        Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/images/banner1.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset('assets/images/banner2.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: Get.height*0.02,),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0,right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Top Categories",style: TextStyle(
                              fontSize: 23,color: Colors.blueAccent,fontWeight: FontWeight.bold
                          ),),
                          Text("View More",style: TextStyle(
                              fontSize: 16,color: Colors.blueAccent
                          ),)
                        ],
                      ),
                    ),
                    SizedBox(height: Get.height*0.02,),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0,right: 15),
                      child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    height: Get.height * 0.2,
                                    width: Get.height * 0.2,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),  // Shadow color
                                          spreadRadius: 2,  // Spread radius of the shadow
                                          blurRadius: 5,    // Blur radius of the shadow
                                          offset: Offset(0, 3),  // Offset of the shadow
                                        ),
                                      ],
                                    ),
                                    child: Image.asset('assets/images/gorve.png'),
                                  ),
                                  SizedBox(height: Get.height*0.02,),
                                  Text("Salt NIC",style: TextStyle(
                                      fontSize: 17,color: Colors.grey[600],fontWeight: FontWeight.bold
                                  ),)

                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    height: Get.height * 0.2,
                                    width: Get.height * 0.2,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),  // Shadow color
                                          spreadRadius: 2,  // Spread radius of the shadow
                                          blurRadius: 5,    // Blur radius of the shadow
                                          offset: Offset(0, 3),  // Offset of the shadow
                                        ),
                                      ],
                                    ),
                                    child: Image.asset('assets/images/image 89smoke.png'),
                                  ),
                                  SizedBox(height: Get.height*0.02,),
                                  Text("Disposp",style: TextStyle(
                                      fontSize: 17,color: Colors.grey[600],fontWeight: FontWeight.bold
                                  ),)

                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    height: Get.height * 0.2,
                                    width: Get.height * 0.2,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),  // Shadow color
                                          spreadRadius: 2,  // Spread radius of the shadow
                                          blurRadius: 5,    // Blur radius of the shadow
                                          offset: Offset(0, 3),  // Offset of the shadow
                                        ),
                                      ],
                                    ),
                                    child: Image.asset('assets/images/gorve.png'),
                                  ),
                                  SizedBox(height: Get.height*0.02,),
                                  Text("Salt NIC",style: TextStyle(
                                      fontSize: 17,color: Colors.grey[600],fontWeight: FontWeight.bold
                                  ),)

                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    height: Get.height * 0.2,
                                    width: Get.height * 0.2,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),  // Shadow color
                                          spreadRadius: 2,  // Spread radius of the shadow
                                          blurRadius: 5,    // Blur radius of the shadow
                                          offset: Offset(0, 3),  // Offset of the shadow
                                        ),
                                      ],
                                    ),
                                    child: Image.asset('assets/images/gorve.png'),
                                  ),
                                  SizedBox(height: Get.height*0.02,),
                                  Text("Salt NIC",style: TextStyle(
                                      fontSize: 17,color: Colors.grey[600],fontWeight: FontWeight.bold
                                  ),)

                                ],
                              ),
                            ],
                          )
                      ),
                    ),
                    SizedBox(height: Get.height*0.02,),
                    Padding(
                      padding: EdgeInsets.only(left: 15,right: 15),
                      child: Image.asset('assets/images/greav.png'),
                    ),

                  ],
                ),
              )
            ),
             Center(
              child: Text("Your Profile"),
            ),
            const Center(
              child: Text("Settings"),
            ),
          ],
        ),

    );
  }
}
