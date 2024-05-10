import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:secondlife/common/widgets/customButtons.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:secondlife/local_storage/const.dart';

class ProfileScreenRecycler extends StatefulWidget {
  const ProfileScreenRecycler({super.key});

  @override
  State<ProfileScreenRecycler> createState() => _ProfileScreenRecyclerState();
}

class _ProfileScreenRecyclerState extends State<ProfileScreenRecycler> {
  int? avatarOption;
  String? username = "";
  String? useremail = "";

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final loadedUsername = await storage.read(key: name) ?? "";
    final loadedUseremail = await storage.read(key: email) ?? "";
    final loadedAvatarOption = await storage.read(key: avatar) ?? "";

    setState(() {
      username = loadedUsername;
      useremail = loadedUseremail;
      avatarOption = int.parse(loadedAvatarOption);
    });
  }

  double latitude = 24.2;
  double longitude = 42.3;
  String name = "Dia's thrift";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 50, 40, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Profile",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 40),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/img/avatars/$avatarOption.png',
                    width: 150.0,
                    height: 150.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "$username",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              Text(
                "Location",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w100),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              CustomLargeButton(
                label: "Generate QR",
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: PrettyQr(
                          typeNumber: 5,
                          data: "$latitude,$longitude,$name",
                          size: 200,
                        ),
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
