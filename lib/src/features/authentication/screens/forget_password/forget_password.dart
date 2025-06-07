import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_distributor_app/common/utils/colors.dart';
import 'package:smart_distributor_app/pages/authentication/widgets/primary_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // -------------- Email validation --------------
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // ------------------Snackbar and submit action---------
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Get.showSnackbar(
        GetSnackBar(
          title: 'OTP Sent',
          message: 'OTP is being sent to your email',
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          borderRadius: 8,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          animationDuration: const Duration(milliseconds: 300),
          isDismissible: true,
          forwardAnimationCurve: Curves.easeOutQuint,
          reverseAnimationCurve: Curves.easeInQuint,
        ),
      );

      Future.delayed(const Duration(seconds: 2), () {
        // Get.offAllNamed('/login'); // required navigation screen
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.black,
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
      //     onPressed: () => Get.back(),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ForgotHeader(),

            const SizedBox(height: 120),

            ResetForm(
              formKey: _formKey,
              emailController: _emailController,
              validateEmail: _validateEmail,
              onSubmit: _submitForm,
            ),
          ],
        ),
      ),
    );
  }
}

class ForgotHeader extends StatelessWidget {
  const ForgotHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      //---------- show full image ------------//
      clipBehavior: Clip.none,
      children: [
    // -------------- First black container ---------
        Container(
          height: 220,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),
        ),

  // ------------ image position ----------
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Center(
            child: Image.asset(
              'assets/images/reset_password.png',
              width: 360,
              height: 350,
              fit: BoxFit.contain,
            ),
          ),
        ),

// ------------ back Icon------------
        Positioned(
          top: 20,
          left: 20,
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Get.back(),
          ),
        ),
      ],
    );
  }
}

class ResetForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final String? Function(String?) validateEmail;
  final VoidCallback onSubmit;

  const ResetForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.validateEmail,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 8, bottom: 24, left: 24, right: 24),
      decoration: const BoxDecoration(color: Colors.white),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // const SizedBox(height: 20),
            const Text(
              'Reset Your Password!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Enter Your Mail Id to Reset your Password',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),

            ForgotActions(
              emailController: emailController,
              validateEmail: validateEmail,
              onSubmit: onSubmit,
            ),
          ],
        ),
      ),
    );
  }
}

class ForgotActions extends StatelessWidget {
  final TextEditingController emailController;
  final String? Function(String?) validateEmail;
  final VoidCallback onSubmit;

  const ForgotActions({
    super.key,
    required this.emailController,
    required this.validateEmail,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const SizedBox(height: 18),
         
          // ---------Input Field with validation
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              floatingLabelStyle: TextStyle(color: AppColors.kBlue),
              prefixIcon: const Icon(Icons.email_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.kBlue),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 16,
              ),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: validateEmail,
            autovalidateMode: AutovalidateMode.disabled,
          ),
          const SizedBox(height: 18),
          
          // ------- Send Reset Link button --------
          PrimaryButton(
            text: 'Reset Password',
            onPressed: onSubmit,
            backgroundColor: AppColors.kBlue,
            textColor: Colors.white,
            borderRadius: 12.0,
            height: 46.0,
          ),
        ],
      ),
    );
  }
}
