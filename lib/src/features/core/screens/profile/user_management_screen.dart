import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login/src/constants/sizes.dart';
import 'package:login/src/constants/text_strings.dart';
import 'package:login/src/features/authentication/models/user_model.dart';
import 'package:login/src/features/core/controllers/profile_controller.dart';


class UserManagementScreen extends StatelessWidget {
  const UserManagementScreen({super.key});

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
            title: Text(userScreenHeading, style: theme.textTheme.headlineLarge),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                      isDark ? LineAwesomeIcons.moon : LineAwesomeIcons.sun)),
            ]),
        body: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(defaultPading),
                child: FutureBuilder<List<UserModel>>(
                    future: controller.getAllUser(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                    
                          return   
                            ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (c, index) {
                              return Column(
                                children: [
                                  ListTile(
                                    iconColor: Colors.blue,
                                    tileColor: Colors.blue.withOpacity(0.1),
                                    leading: const Icon(LineAwesomeIcons.user),
                                    title: Text(
                                        "Name : ${snapshot.data![index].fullName}"),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(snapshot.data![index].phoneNo),
                                        Text(snapshot.data![index].email),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              );
                            });
                      } else if (snapshot.hasError) {
                        return Center(child: Text(snapshot.error.toString()));
                      } else {
                        return const Center(
                            child: Text('Something went wrong'));
                      }
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }))));
                        }
                      }
             
 
