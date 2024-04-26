import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gellary_app/controller/login_controller.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});
  static const String name = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xffDDCDFF),
                  Colors.white,
                ],
              ),
            ),
          ),
          Column(
            children: [
              Spacer(),
              Center(
                child: Image.asset(
                  'assets/images/photos.png',
                  height: 450,
                ),
              ),
            ],
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Stack(
              children: [
                PositionedDirectional(
                  child: Image.asset(
                    'assets/images/Group.png',
                    height: 280,
                  ),
                  start: -40,
                  top: -100,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'My\nGallery',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: EdgeInsets.all(28),
                      padding: EdgeInsets.all(24),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Colors.white.withOpacity(0.3)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Log in',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: controller.emailController,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 10),
                                hintText: 'User Name',
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide.none)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: controller.passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 10),
                                hintText: 'Password',
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide.none)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GetBuilder<LoginController>(

                            builder: (controller)=>ElevatedButton(
                                onPressed: controller.login,
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xff7BB3FF),
                                    shape: RoundedRectangleBorder(borderRadius:
                                    BorderRadius.circular(12))),
                                child:controller.isLoading?Center(child:
                                CircularProgressIndicator(color: Colors.white,)
                                  ,): Text(
                                  'Submit',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
