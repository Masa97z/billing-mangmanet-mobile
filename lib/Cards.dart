
import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  const Cards({
    super.key, required this.lastUnit, required this.currentUnit, required this.time, required this.cuttentAmunt,
  });
final String lastUnit;
final String currentUnit;
final String time;
final String cuttentAmunt;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      width: 336,
      height: 153,
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8)),
      child: Stack(
        children: [
          Positioned(
            left: 120,
            top: 24,
            child: Text(
              '${time.toString()}',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.black.withOpacity(0.6000000238418579),
                fontSize: 20,
                fontFamily: 'Karma',
                fontWeight: FontWeight.w600,
                height: 0.06,
                letterSpacing: 0.80,
              ),
            ),
          ),
          Positioned(
            left: 120,
            top: 87,
            child: Text(
              '${currentUnit}  kWh',
              style: TextStyle(
                color: Colors.black.withOpacity(0.6000000238418579),
                fontSize: 20,
                fontFamily: 'Karma',
                fontWeight: FontWeight.w600,
                height: 0.06,
                letterSpacing: 0.80,
              ),
            ),
          ),
          Positioned(
            left: 120,
            top: 57,
            child: Text(
              '+${currentUnit}',
              style: TextStyle(
                color: Color(0xFF00A8CD),
                fontSize: 18,
                fontFamily: 'Karma',
                fontWeight: FontWeight.w500,
                height: 0.07,
                letterSpacing: 0.72,
              ),
            ),
          ),

          Positioned(
            left: 92,
            top: 0,
            child: Container(
              width: 4,
              height: 148,
              decoration: ShapeDecoration(
                color: Color(0xFF263238),
                shape: OvalBorder(),
              ),
            ),
          ),

          Positioned(
            left: 14,
            top: 59,
            child: Text(
              '${cuttentAmunt}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Karma',
                fontWeight: FontWeight.w600,
                height: 0.08,
                letterSpacing: 0.64,
              ),
            ),
          ),Positioned(
            left: 14,
            top: 78,
            child: Text(
              'IQD',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Karma',
                fontWeight: FontWeight.w600,
                height: 0.08,
                letterSpacing: 0.64,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
