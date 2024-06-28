

import 'package:eebbiill/constanats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Container(
      width: 336,
      height: 216,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 328,
              height: 216,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 328,
                      height: 216,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x0A000000),
                            blurRadius: 48,
                            offset: Offset(0, 2),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 11.90,
                    top: 9.79,
                    child: Container(
                      width: 21.24,
                      height: 169.17,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 2.55,
                            top: 0,
                            child: Container(
                              width: 16.99,
                              height: 149.59,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 16.99,
                                      height: 149.59,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFFECEEF4),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                            topRight: Radius.circular(12),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    top: 86.68,
                                    child: Container(
                                      width: 16.99,
                                      height: 62.91,
                                      decoration: ShapeDecoration(
                                        color: btnColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                            topRight: Radius.circular(12),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 192,
                            child: SizedBox(
                              width: 20.39,
                              child: Text(
                                'Jan',
                                style: TextStyle(
                                  color: Color(0xFF9398AB),
                                  fontSize: 12,
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 56.93,
                    top: 9.79,
                    child: Container(
                      width: 21.24,
                      height: 169.17,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 1.70,
                            top: 0,
                            child: Container(
                              width: 16.99,
                              height: 149.59,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 16.99,
                                      height: 149.59,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFFECEEF4),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                            topRight: Radius.circular(12),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    top: 109.75,
                                    child: Container(
                                      width: 16.99,
                                      height: 39.84,
                                      decoration: ShapeDecoration(
                                        color: btnColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                            topRight: Radius.circular(12),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 192,
                            child: SizedBox(
                              width: 20.39,
                              child: Text(
                                'Feb',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF9398AB),
                                  fontSize: 12,
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 100.27,
                    top: 9.79,
                    child: Container(
                      width: 21.24,
                      height: 169.17,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 2.55,
                            top: 0,
                            child: Container(
                              width: 16.99,
                              height: 149.59,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 16.99,
                                      height: 149.59,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFFECEEF4),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                            topRight: Radius.circular(12),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    top: 58.72,
                                    child: Container(
                                      width: 16.99,
                                      height: 90.87,
                                      decoration: ShapeDecoration(
                                        color: btnColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                            topRight: Radius.circular(12),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 192,
                            child: SizedBox(
                              width: 20.39,
                              child: Text(
                                'Apr',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF9398AB),
                                  fontSize: 12,
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 145.31,
                    top: 9.79,
                    child: Container(
                      width: 23.79,
                      height: 169.17,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 3.40,
                            top: 0,
                            child: Container(
                              width: 16.99,
                              height: 149.59,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 16.99,
                                      height: 149.59,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFFECEEF4),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                            topRight: Radius.circular(12),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    top: 64.31,
                                    child: Container(
                                      width: 16.99,
                                      height: 85.28,
                                      decoration: ShapeDecoration(
                                        color: btnColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                            topRight: Radius.circular(12),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0.85,
                            top: 192,
                            child: SizedBox(
                              width: 22.94,
                              child: Text(
                                'May',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF9398AB),
                                  fontSize: 12,
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 192.89,
                    top: 9.79,
                    child: Container(
                      width: 28.04,
                      height: 169.17,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 5.10,
                            top: -6.64,
                            child: Container(
                              width: 149.01,
                              height: 156.23,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 6.64,
                                    child: Container(
                                      width: 16.99,
                                      height: 149.59,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFFECEEF4),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                            topRight: Radius.circular(12),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    top: 59.07,
                                    child: Container(
                                      width: 16.99,
                                      height: 97.17,
                                      decoration: ShapeDecoration(
                                        color: btnColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                            topRight: Radius.circular(12),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 192,
                            child: SizedBox(
                              width: 27.19,
                              child: Text(
                                'June',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF9398AB),
                                  fontSize: 12,
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 244.73,
                    top: 9.79,
                    child: Container(
                      width: 25.49,
                      height: 169.17,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 4.25,
                            top: 0,
                            child: Container(
                              width: 17.03,
                              height: 149.59,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 16.99,
                                      height: 149.59,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFFECEEF4),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                            topRight: Radius.circular(12),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    top: 41.24,
                                    child: Container(
                                      width: 16.99,
                                      height: 108.35,
                                      decoration: ShapeDecoration(
                                        color: btnColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                            topRight: Radius.circular(12),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0.42,
                            top: 192,
                            child: SizedBox(
                              width: 23.79,
                              child: Text(
                                'July',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF9398AB),
                                  fontSize: 12,
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 293.16,
                    top: 9.79,
                    child: Container(
                      width: 22.94,
                      height: 169.17,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 2.55,
                            top: 0,
                            child: Container(
                              width: 16.99,
                              height: 149.59,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 16.99,
                                      height: 149.59,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFFECEEF4),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                            topRight: Radius.circular(12),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    top: 56.62,
                                    child: Container(
                                      width: 16.99,
                                      height: 92.97,
                                      decoration: ShapeDecoration(
                                        color: btnColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                            topRight: Radius.circular(12),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0.85,
                            top: 192,
                            child: SizedBox(
                              width: 22.09,
                              child: Text(
                                'Aug',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0xFF9398AB),
                                  fontSize: 12,
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 11.90,
                    top: 188.74,
                    child: Container(
                      width: 67.98,
                      height: 11.18,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 5.10,
                            top: 0,
                            child: Container(
                              width: 10.20,
                              height: 8.39,
                              decoration: ShapeDecoration(
                                color: Color(0xFFEDEFF5),
                                shape: OvalBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 223,
                    top: 193.63,
                    child: Container(
                      width: 63.73,
                      height: 11.18,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 220,
            top: 188.74,
            child: Container(
              width: 10.20,
              height: 8.39,
              decoration: ShapeDecoration(
                color: Color(0xFF3B6CF2),
                shape: OvalBorder(),
              ),
            ),
          ),
          Positioned(
            left: 238,
            top: 182,
            child:  Text(
                'الاستهلاك',
                style: TextStyle(
                  color: Color(0xFF29292F),
                  fontSize: 14,
                  fontFamily: 'Karma',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                )
            ),
          ),
          Positioned(
            left: 33,
            top: 182,
            child: SizedBox(
              width: 45,
              height: 14.68,
              child: Text(
                'المعدل',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Karma',
                  fontWeight: FontWeight.w500,
                  height: 0,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
