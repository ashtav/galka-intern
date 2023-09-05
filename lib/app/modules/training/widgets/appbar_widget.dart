import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Ei.only(l: 20, t: context.viewPadding.top + 20, r: 20),
      child: Row(
        mainAxisAlignment: Maa.spaceBetween,
        children: [
          Row(
            children: [
              const LzImage('profile.png', size: 45).margin(r: 20),
    
              Column(
                mainAxisSize: Mas.min,
                crossAxisAlignment: Caa.start,
                children: [
                  Text('John Doe', style: Gfont.white,),
                  Text('johndoe@gmail.com', style: Gfont.white,),
                ],
              )
            ],
          ),

          InkTouch(
            onTap: (){},
            padding: Ei.all(13),
            color: Colors.white12, radius: Br.circle,
            child: const Icon(Ti.bell, color: Colors.white,),
          )
        ],
      ),
    );
  }
}