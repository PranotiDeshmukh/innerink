import 'package:flutter/material.dart';
import 'package:innerink_diary/colors/App_color.dart';
import 'package:innerink_diary/screens/silderscreen2.dart';
import 'package:innerink_diary/screens/sliderscreen1.dart';

class Sliderscreens extends StatefulWidget {
  const Sliderscreens({super.key});

  @override
  State<Sliderscreens> createState() => _SliderscreensState();
}

class _SliderscreensState extends State<Sliderscreens> {
  final PageController _controller = PageController();
  //tells pageview which page to show using controller so it can change to another slider 
  int currentpage = 0;
  //current page holds or stores index no (0,1) which number will initailes wil be the currrent page 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Stack(
      children: [
        PageView(//allows horizontal swiping
          controller: _controller,
          onPageChanged: (index){//unpagechanged will change when indev will change as per it 
            setState(() {
              currentpage = index;
            });
          },
          children:const [
            Sliderscreen1(),
            Silderscreen2(),
          ],
        ),

        //dot imdicators 
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: 
              List.generate(2, (index){
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 04),
                  height: 8,
                  width: currentpage == index ? 20:8,
                  decoration: BoxDecoration(
                    color: currentpage == index ? AppColor.secondarycolor : AppColor.ternarycolor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            

        ),
          
        )
      ],
     ), 
    );
  }
}