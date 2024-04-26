import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gellary_app/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});
  static const String name = '/';
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white,
                  Color(0xffDDCDFF).withOpacity(0.5),
                  Colors.white,
                  Colors.white
                ],
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          'Welcome\n${controller.user.name}!',
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.w200),
                        ),
                      ),
                      Container(
                        width: 120,
                        height: 120,
                        child: Center(child: CircleAvatar(child: Icon(Icons.person),),),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Colors.white,
                              Color(0xffDDCDFF),
                            ],

                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                     onPressed: controller.logOut,
                      label: Text('logout'),
                      icon: Image.asset(
                        'assets/images/logout.png',
                        width: 30,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        Get.defaultDialog(title: "",content: Column(mainAxisSize:MainAxisSize.min,children: [
                          ElevatedButton.icon(
                            onPressed: ()=>controller.uploadImage(ImageSource.gallery),
                            label: Text('Gallery'),
                            icon: Image.asset(
                              'assets/images/gallery.png',
                              width: 30,
                            ),
                          ),
                          ElevatedButton.icon(
                          onPressed: ()=>controller.uploadImage(ImageSource.camera),
                            label: Text('camera'),
                            icon: Image.asset(
                              'assets/images/camera.png',
                              width: 30,
                            ),
                          ),
                        ],));
                      },
                      label: Text('upload'),
                      icon: Image.asset(
                        'assets/images/upload.png',
                        width: 30,
                      ),
                    )
                  ],
                )),
                GetBuilder<HomeController>(
                  builder: (controller) => Expanded(
                    flex: 4,
                    child: controller.isLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        :controller.error.isNotEmpty?Center(child: Text(controller.error),): GridView.builder(
                            padding: EdgeInsets.all(14),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 3,
                                    childAspectRatio: 1),
                            itemCount: controller.images.length,
                            itemBuilder: (context, index) => Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18)),
                                  clipBehavior: Clip.antiAlias,
                                  child: CachedNetworkImage(
                                    imageUrl: controller.images[index],
                                    fit: BoxFit.cover,
                                  ),
                                )),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
