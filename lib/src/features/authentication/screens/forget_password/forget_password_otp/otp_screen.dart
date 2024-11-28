import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/src/constants/sizes.dart';
import 'package:login/src/constants/text_strings.dart';
import 'package:login/src/features/authentication/controllers/otp_controller.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var otpController = Get.put(OTPController());
    var otp;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(defaultPading),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: defaultPading * 6  ,
                  ),
                  Text(otpTitle,
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold, fontSize: 80)),
                  Text(
                    otpSubTitle.toUpperCase(),
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  Text(
                     "$otpMessage user@gmail.com",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 30,),
                  OtpTextField(
                    numberOfFields: 6,
                    fillColor: Colors.black.withOpacity(0.1),
                    filled: true,
                    onSubmit: (code){
                      // print("Otp is => $code");
                      otp = code;
                      OTPController.instance.verifyOTP(otp);  //instance created explicitly
                    } ,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: (){
                        OTPController.instance.verifyOTP(otp);
                       }, 
                      child: Text("Next")),
                  ),
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
