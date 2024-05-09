import 'package:flutter/material.dart';
import 'package:secondlife/common/widgets/customButtons.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class ProfileScreenRecycler extends StatefulWidget {
  const ProfileScreenRecycler({super.key});

  @override
  State<ProfileScreenRecycler> createState() => _ProfileScreenRecyclerState();
}

class _ProfileScreenRecyclerState extends State<ProfileScreenRecycler> {
  int avatarOption = 2;
  String qrData = 'Thrift store';
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
                "Nikita Khuju",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              Text(
                "abc@gmail.com",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w100),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromARGB(255, 10, 150, 71), width: 3),
                      borderRadius: BorderRadius.circular(15)),
                  child: TextField(
                    //controller: _controller,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            left: 30, right: 18, top: 18, bottom: 18),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none, // Increased border width
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Enter your data here',
                        hintStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 187, 186, 186))),
                  ),
                ),
              ),
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
                          data: qrData,
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
