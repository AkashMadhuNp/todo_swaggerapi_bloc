import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:intl/intl.dart';

class TopPart extends StatelessWidget {
  const TopPart({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            margin: const EdgeInsets.only(
              right: 10
            ),
          
            height: 150,
            width: 200,
            
          
            decoration: BoxDecoration(
              color:const Color.fromARGB(119, 7, 131, 198), 


              borderRadius: BorderRadius.circular(15),
              
            ),
            child: Padding(padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat.EEEE().format(DateTime.now()).toUpperCase(),
                  style:const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2
                  ),
                  ),
          
                  Padding(padding: const EdgeInsets.only(
                    bottom: 10
                  ),
                  
                  child: Text(DateFormat.yMMMd().format(DateTime.now())),)
              ],
            ),
            ),
          ),
        ),

       // SizedBox(width: 50,),


        Container(
          height: 150,
          
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),

          ),
           child: Row(
            children: [
              Padding(padding: const EdgeInsets.all(12),
              
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(50),
                child: AnalogClock(
                  dateTime: DateTime.now(), 
                  dialColor: const Color.fromARGB(255, 43, 148, 233),
                  centerPointColor: Colors.white,
                  markingColor: Colors.white,
                  dialBorderColor: Colors.white,
                  hourNumberColor: Colors.white,
                  hourNumberSizeFactor: 1.25,
                  
                ),
              ),
              )
            ],
           ),
        )
      ],
    );
  }
}