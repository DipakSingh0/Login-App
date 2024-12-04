import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login/src/constants/colors.dart';
import 'package:login/src/constants/image_strings.dart';
import 'package:login/src/constants/sizes.dart';
import 'package:login/src/constants/text_strings.dart';
import 'package:login/src/features/authentication/models/user_model.dart';
import 'package:login/src/features/core/controllers/profile_controller.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    final controller = Get.put(ProfileController());

    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(LineAwesomeIcons.angle_left_solid)),
            title: Text(profileHeading, style: theme.textTheme.headlineLarge),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                      isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon)),
            ]),
        body: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(defaultPading),
                child: FutureBuilder<List<UserModel>>(
                  future: controller.getAllUser(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        // UserModel user = snapshot.data as UserModel;

                        UserModel user = snapshot.data!.first;
                        // final id = TextEditingController(text: user.id);

                        // -- controllers
                        final id = TextEditingController(text: user.id);
                        final email = TextEditingController(text: user.email);
                        final password =TextEditingController(text: user.password);
                        final fullName =TextEditingController(text: user.fullName);
                        final phoneNo = TextEditingController(text: user.phoneNo);

                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // -- profile image
                            Stack(
                              children: [
                                SizedBox(
                                    width: 120,
                                    height: 120,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: const Image(
                                        image: AssetImage(profileImage),
                                      ),
                                    )),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                      width: 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: primaryColor,
                                      ),
                                      child: Icon(LineAwesomeIcons.camera_solid,
                                          size: 18.0, color: Colors.black)),
                                )
                              ],
                            ),

                            const SizedBox(
                              height: 10,
                            ),

                            const Divider(),

                            // -- form
                            Form(
                              child: Column(
                                children: [
                                  TextFormField(
                                    // initialValue: user.fullName,
                                    controller: fullName,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(Icons.person),
                                      label: Text('fullName'),
                                    ),
                                  ),
                                  const SizedBox(height: formHeight - 20),
                                  TextFormField(
                                    // initialValue: user.email,
                                    controller: email,
                                    decoration: InputDecoration(
                                      prefixIcon:
                                          const Icon(Icons.email_outlined),
                                      label: Text('email'),
                                    ),
                                  ),
                                  const SizedBox(height: formHeight - 20),
                                  TextFormField(
                                    // controller: c
                                    // initialValue: user.phoneNo,
                                    controller: phoneNo,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(Icons.phone),
                                      label: Text('phoneNo'),
                                    ),
                                  ),
                                  const SizedBox(height: formHeight - 20),
                                  TextFormField(
                                    // initialValue: user.password,
                                    controller: password,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(Icons.fingerprint),
                                      suffixIcon: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                              LineAwesomeIcons.eye_slash)),
                                      label: Text('password'),
                                    ),
                                  ),
                                  const Divider(),
                                  const SizedBox(height: formHeight),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                        onPressed: () async {
                                          final userData = UserModel(
                                            id: id.text,
                                            fullName: fullName.text.trim(),
                                            email: email.text.trim(),
                                            password: password.text.trim(),
                                            phoneNo: phoneNo.text.trim(),
                                          );

                                          await controller
                                              .updateRecord(userData);

                                          // Get.to(() =>const UpdateProfileScreen());
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: primaryColor,
                                            side: BorderSide.none,
                                            shape: const StadiumBorder()),
                                        child: Text(editProfile,
                                            style:
                                                TextStyle(color: darkColor))),
                                  ),
                                  const SizedBox(height: formHeight),
                                ],
                              ),
                            ),

                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Text.rich(
                            //       TextSpan(
                            //           text: joinedAt,
                            //           style: TextStyle(
                            //               fontWeight: FontWeight.bold,
                            //               fontSize: 12),
                            //           children: [
                            //             TextSpan(
                            //               text: joinedAt,
                            //               style: TextStyle(
                            //                   fontWeight: FontWeight.bold,
                            //                   fontSize: 12),
                            //             )
                            //           ]),
                            //     ),
                            //     ElevatedButton(
                            //         onPressed: () {},
                            //         style: ElevatedButton.styleFrom(
                            //           backgroundColor:
                            //               Colors.redAccent.withOpacity(0.1),
                            //           elevation: 0,
                            //           foregroundColor: Colors.red,
                            //           shape: const StadiumBorder(),
                            //           side: BorderSide.none,
                            //         ),
                            //         child: const Text(delete)),
                            //   ],
                            // )
                          ],
                        );
                        //  ListView.builder(
                        //     shrinkWrap: true,
                        //     itemCount: snapshot.data!.length,
                        //     itemBuilder: (c, index) {
                        //       return Column(
                        //         children: [
                        //           ListTile(
                        //             iconColor: Colors.blue,
                        //             tileColor: Colors.blue.withOpacity(0.1),
                        //             leading: const Icon(LineAwesomeIcons.user),
                        //             title: Text(
                        //                 "Name : ${snapshot.data![index].fullName}"),
                        //             subtitle: Column(
                        //               crossAxisAlignment:
                        //                   CrossAxisAlignment.start,
                        //               children: [
                        //                 Text(snapshot.data![index].phoneNo),
                        //                 Text(snapshot.data![index].email),
                        //               ],
                        //             ),
                        //           ),
                        //           const SizedBox(
                        //             height: 10,
                        //           ),
                        //         ],
                        //       );
                        //     });
                      } else if (snapshot.hasError) {
                        return Center(child: Text(snapshot.error.toString()));
                      } else {
                        return const Center(
                            child: Text('Something went wrong'));
                      }
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                  // child:
                ))));
  }
}
