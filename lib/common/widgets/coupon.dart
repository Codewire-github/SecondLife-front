import "package:dotted_line/dotted_line.dart";
import "package:flutter/material.dart";
import "package:secondlife/common/colors.dart";

Widget couponCard(BuildContext context, String couponName, int discount,
    String CouponCode, int daysLeft) {
  return Container(
    width: MediaQuery.sizeOf(context).width * 0.65,
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Color(0x000000).withOpacity(0.6),
          offset: Offset(2, 4),
          blurRadius: 16,
          spreadRadius: -10,
        )
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          couponName,
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: generateRandomDarkColor()),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            const Text(
              "Enjoy ",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Text(
              "$discount% off",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            Text(
              " on store near you.",
              style: TextStyle(fontWeight: FontWeight.w500),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              color: generateRandomLightColor(),
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            "Coupon code: $CouponCode",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        DottedLine(
          direction: Axis.horizontal,
          lineThickness: 2,
          dashLength: 10,
          dashGapLength: 3,
          dashColor: secondaryGreenColor,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "$daysLeft days remaining",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
        ),
      ],
    ),
  );
}
