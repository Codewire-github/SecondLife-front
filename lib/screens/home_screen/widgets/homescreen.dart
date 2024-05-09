import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:secondlife/common/colors.dart';
import 'package:secondlife/common/dummy_data.dart';
import 'package:secondlife/common/widgets/coupon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 50, 30, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: primaryGreenColor, width: 2.5),
                  ),
                  child: ClipOval(
                    child: Image.asset("assets/img/avatars/1.png"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome,",
                  style: TextStyle(fontSize: 22, color: Colors.grey[700]),
                ),
                SizedBox(width: 10),
                Text(
                  "Ishan Awal",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Stores, Coupons and Rewards",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
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
            SizedBox(
              height: screenHeight * 0.05,
            ),
            Text(
              "Activities",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
