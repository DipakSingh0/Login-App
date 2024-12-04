// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';
// import 'package:login/src/constants/colors.dart';
// import 'package:login/src/constants/image_strings.dart';
// import 'package:login/src/constants/sizes.dart';
// import 'package:login/src/constants/text_strings.dart';
// import 'package:login/src/features/authentication/models/user_model.dart';
// import 'package:login/src/features/core/controllers/profile_controller.dart';

// class UpdateProfileScreen extends StatelessWidget {
//   const UpdateProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var theme = Theme.of(context);
//     var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
//     final controller = Get.put(ProfileController());

//     return Scaffold(
//         appBar: AppBar(
//             leading: IconButton(
//                 onPressed: () {
//                   Get.back();
//                 },
//                 icon: const Icon(LineAwesomeIcons.angle_left_solid)),
//             title: Text(profileHeading, style: theme.textTheme.headlineLarge),
//             actions: [
//               IconButton(
//                   onPressed: () {},
//                   icon: Icon(
//                       isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon)),
//             ]),
//         body: SingleChildScrollView(
//             child: Container(
//                 padding: const EdgeInsets.all(defaultPading),

//                 // -- futurebuilder to load data from the firebase cloud
//                 child: FutureBuilder<List<UserModel>>(
//                   future: controller.getAllUser(),
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.done) {
//                       if (snapshot.hasData) {
//                         UserModel user = snapshot.data!.first;
//                         // -- controllers
//                         final id = TextEditingController(text: user.id);
//                         final email = TextEditingController(text: user.email);
//                         final password =
//                             TextEditingController(text: user.password);
//                         final fullName =
//                             TextEditingController(text: user.fullName);
//                         final phoneNo =
//                             TextEditingController(text: user.phoneNo);

//                         return Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             // -- profile image with icon
//                             Stack(
//                               children: [
//                                 SizedBox(
//                                     width: 120,
//                                     height: 120,
//                                     child: ClipRRect(
//                                       borderRadius: BorderRadius.circular(100),
//                                       child: const Image(
//                                         image: AssetImage(profileImage),
//                                       ),
//                                     )),
//                                 Positioned(
//                                   bottom: 0,
//                                   right: 0,
//                                   child: Container(
//                                       width: 35,
//                                       height: 35,
//                                       decoration: BoxDecoration(
//                                         borderRadius:
//                                             BorderRadius.circular(100),
//                                         color: primaryColor,
//                                       ),
//                                       child: Icon(LineAwesomeIcons.camera_solid,
//                                           size: 18.0, color: Colors.black)),
//                                 )
//                               ],
//                             ),

//                             const SizedBox(
//                               height: 10,
//                             ),

//                             const Divider(),

//                             // -- form
//                             Form(
//                               child: Column(
//                                 children: [
//                                   TextFormField(
//                                     // initialValue: user.fullName,
//                                     controller: fullName,
//                                     decoration: InputDecoration(
//                                       prefixIcon: const Icon(Icons.person),
//                                       label: Text('fullName'),
//                                     ),
//                                   ),
//                                   const SizedBox(height: formHeight - 20),
//                                   TextFormField(
//                                     // initialValue: user.email,
//                                     controller: email,
//                                     decoration: InputDecoration(
//                                       prefixIcon:
//                                           const Icon(Icons.email_outlined),
//                                       label: Text('email'),
//                                     ),
//                                   ),
//                                   const SizedBox(height: formHeight - 20),
//                                   TextFormField(
//                                     // controller: c
//                                     // initialValue: user.phoneNo,
//                                     controller: phoneNo,
//                                     decoration: InputDecoration(
//                                       prefixIcon: const Icon(Icons.phone),
//                                       label: Text('phoneNo'),
//                                     ),
//                                   ),
//                                   const SizedBox(height: formHeight - 20),
//                                   TextFormField(
//                                     // initialValue: user.password,
//                                     controller: password,
//                                     obscureText: true,
//                                     decoration: InputDecoration(
//                                       prefixIcon: const Icon(Icons.fingerprint),
//                                       suffixIcon: IconButton(
//                                           onPressed: () {},
//                                           icon: const Icon(
//                                               LineAwesomeIcons.eye_slash)),
//                                       label: Text('password'),
//                                     ),
//                                   ),
//                                   const Divider(),
//                                   const SizedBox(height: formHeight),
//                                   SizedBox(
//                                     width: double.infinity,
//                                     child: ElevatedButton(
//                                         onPressed: () async {
//                                           final userData = UserModel(
//                                             id: id.text,
//                                             fullName: fullName.text.trim(),
//                                             email: email.text.trim(),
//                                             password: password.text.trim(),
//                                             phoneNo: phoneNo.text.trim(),
//                                           );

//                                           await controller
//                                               .updateRecord(userData);
//                                         },
//                                         style: ElevatedButton.styleFrom(
//                                             backgroundColor: primaryColor,
//                                             side: BorderSide.none,
//                                             shape: const StadiumBorder()),
//                                         child: Text(editProfile,
//                                             style:
//                                                 TextStyle(color: darkColor))),
//                                   ),
//                                   const SizedBox(height: formHeight),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text.rich(
//                                         TextSpan(
//                                             text: joined,
//                                             style:theme.textTheme.bodyMedium,
//                                             children: [
//                                               TextSpan(
//                                                 text: joinedAt,
//                                                 style: theme.textTheme.bodyLarge,
//                                               )
//                                             ]),
//                                       ),
//                                       ElevatedButton(
//                                           onPressed: () {},
//                                           style: ElevatedButton.styleFrom(
//                                             backgroundColor: Colors.redAccent
//                                                 .withOpacity(0.1),
//                                             elevation: 0,
//                                             foregroundColor: Colors.red,
//                                             shape: const StadiumBorder(),
//                                             side: BorderSide.none,
//                                           ),
//                                           child: const Text(delete)),
//                                     ],
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ],
//                         );
//                       } else if (snapshot.hasError) {
//                         return Center(child: Text(snapshot.error.toString()));
//                       } else {
//                         return const Center(
//                             child: Text('Something went wrong'));
//                       }
//                     } else {
//                       return const Center(child: CircularProgressIndicator());
//                     }
//                   },
//                   // child:
//                 ))));
//   }
// }



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login/src/constants/colors.dart';
import 'package:login/src/constants/image_strings.dart';
import 'package:login/src/constants/sizes.dart';
import 'package:login/src/constants/text_strings.dart';
import 'package:login/src/features/authentication/models/user_model.dart';
import 'package:login/src/features/core/controllers/profile_controller.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final ProfileController controller = Get.put(ProfileController());
  UserModel? user;

  // Controllers for text fields
  late TextEditingController idController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController fullNameController;
  late TextEditingController phoneNoController;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final users = await controller.getAllUser();
    if (users.isNotEmpty) {
      user = users.first;

      // Initialize controllers with user data
      idController = TextEditingController(text: user?.id);
      emailController = TextEditingController(text: user?.email);
      passwordController = TextEditingController(text: user?.password);
      fullNameController = TextEditingController(text: user?.fullName);
      phoneNoController = TextEditingController(text: user?.phoneNo);

      setState(() {}); // Update UI after data is loaded
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
  // bool obscureText = true; 
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(LineAwesomeIcons.angle_left_solid),
        ),
        title: Text(editProfileTitle, style: theme.textTheme.headlineLarge),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon),
          ),
        ],
      ),
      body: user == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(defaultPading),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Profile image with icon
                  Stack(
                    children: [
                      SizedBox(
                        width: 120,
                        height: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: const Image(image: AssetImage(profileImage)),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: primaryColor,
                          ),
                          child: Icon(
                            LineAwesomeIcons.camera_solid,
                            size: 18.0,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: 10),

                  const Divider(),

                  // Form for updating user data
                  Form(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: fullNameController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            label: Text('Full Name'),
                          ),
                        ),
                        const SizedBox(height: formHeight - 20),
                        TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined),
                            label: Text('Email'),
                          ),
                        ),
                        const SizedBox(height: formHeight - 20),
                        TextFormField(
                          controller: phoneNoController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            label: Text('Phone Number'),
                          ),
                        ),
                        const SizedBox(height: formHeight - 20),
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.fingerprint),
                            suffixIcon: IconButton(
                              onPressed: () {
                                
                              },
                              icon: const Icon(LineAwesomeIcons.eye_slash),
                            ),
                            label: const Text('Password'),
                          ),
                        ),
                        const Divider(),
                        const SizedBox(height: formHeight),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              final updatedUser = UserModel(
                                id: idController.text,
                                fullName: fullNameController.text.trim(),
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                                phoneNo: phoneNoController.text.trim(),
                              );

                              await controller.updateRecord(updatedUser);
                              Get.snackbar(
                                "Success",
                                "Profile updated successfully!",
                                snackPosition: SnackPosition.BOTTOM,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              side: BorderSide.none,
                              shape: const StadiumBorder(),
                            ),
                            child: Text(updateProfileButton,
                                style: TextStyle(color: darkColor)),
                          ),
                        ),
                        const SizedBox(height: formHeight),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text.rich(
                              TextSpan(
                                text: joined,
                                style: theme.textTheme.bodyMedium,
                                children: [
                                  TextSpan(
                                    text: joinedAt,
                                    style: theme.textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.redAccent.withOpacity(0.1),
                                elevation: 0,
                                foregroundColor: Colors.red,
                                shape: const StadiumBorder(),
                                side: BorderSide.none,
                              ),
                              child: const Text(delete),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
