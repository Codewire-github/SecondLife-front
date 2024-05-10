import 'package:flutter/material.dart';
import 'package:secondlife/common/colors.dart';
import 'package:secondlife/common/dummy_data.dart';
import 'package:secondlife/common/widgets/coupon.dart';
import 'package:secondlife/local_storage/const.dart';

class ProfileScreenUser extends StatefulWidget {
  const ProfileScreenUser({super.key});

  @override
  State<ProfileScreenUser> createState() => _ProfileScreenUserState();
}

class _ProfileScreenUserState extends State<ProfileScreenUser> {
  int avatarOption = 1;
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
                    'assets/img/avatars/${avatarOption}.png',
                    key: UniqueKey(),
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
                "$useremail",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w100),
              ),
              SizedBox(height: 20),
              Container(
                height: 80,
                width: 250,
                decoration: BoxDecoration(
                    color: secondaryGreenColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "100 ECOINS",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w800),
                    ),
                    Text(
                      "Rewards",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      couponData.length,
                      (index) {
                        Map<String, dynamic> data = couponData[index];
                        return Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: couponCard(
                            context,
                            data['couponName'],
                            data['discount'],
                            data['couponCode'],
                            data['daysLeft'],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
