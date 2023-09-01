import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class CustomLoginView extends StatelessWidget {
  const CustomLoginView({super.key});

  @override
  Widget build(BuildContext context) {

    Utils.setSystemUI(
      navBarColor: LzColors.hex('0440c2'),
      navBarIconColor: Brightness.light
    );

    

    return Scaffold(
      backgroundColor: LzColors.hex('0440c2'),
      body: Container(
        padding: Ei.all(30),
        child: Column(
          crossAxisAlignment: Caa.start,
          mainAxisAlignment: Maa.end,
          children: [
            Textr('Welcome', style: Gfont.fs(30).white.bold, margin: Ei.only(b: 25)),
            Text('Manage your expenses', style: Gfont.fs(17).fcolor(Colors.white70)),
            Textr('Seamlessly & intuitively', style: Gfont.fs(20).white, margin: Ei.only(b: 50),),

            LzButton(
              text: 'Sign in with Google',
              icon: Ti.brandGoogle,
              onTap: (_){}
            ).sized(context.width).margin(b: 15),

            LzButton(
              text: 'Create an account',
              outline: true,
              onTap: (_){}
            ).sized(context.width).margin(b: 25),

            SizedBox(
              width: context.width,
              child: Textml('Already have an acconut? <b>Sign In</b>', style: Gfont.white, textAlign: Ta.center,))
          ],
        ),
      ),
    );
  }
}