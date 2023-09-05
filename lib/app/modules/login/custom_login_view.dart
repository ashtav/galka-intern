import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class TestNotifier extends ChangeNotifier {
  double height = 300;
  double pixel = 0;

  void changeHeight(double value, double pixel) {
    height = value;
    this.pixel = pixel;
    notifyListeners();
  }
}

class CustomLoginView extends StatelessWidget {
  const CustomLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = TestNotifier();

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: -100,
              child: notifier.watch((state) => RotationTransition(
                    turns: const AlwaysStoppedAnimation(-(25 / 360)),
                    child: Container(
                      width: context.width + state.height / 4,
                      height: state.height,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: Br.radius(35)),
                    ),
                  ))),
          LzListView(
            padding: Ei.only(t: 90, b: 100),
            onScroll: (controller) {
              double pixel = controller.position.pixels;
              double height = 300;

              notifier.changeHeight(height - pixel, pixel);
            },
            scrollLimit: const [50, 100],
            children: [
              Container(
                padding: Ei.all(20),
                child: Row(
                  children: [
                    Container(
                      padding: Ei.all(3),
                      margin: Ei.only(r: 15),
                      decoration: BoxDecoration(
                          borderRadius: Br.radius(70), color: Colors.white),
                      child: const LzImage(
                        'https://www.surtecsuzuki.com.mx/facturas/img/user5.jpg',
                        size: 80,
                        radius: 70,
                      ),
                    ),
                    Col(
                      children: [
                        Text(
                          'Jane Doe',
                          style: Gfont.fs20.white.bold,
                        ),
                        Text('janedoe@gmail.com', style: Gfont.white),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: Ei.only(t: 50),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BounceScroll(),
                  child: Row(
                    children: [
                      'Mechanical',
                      'Electrical',
                      'Building',
                      'Engineer',
                      'Architecture',
                      'Teater'
                    ].generate((item, i) {
                      return InkTouch(
                        onTap: () {},
                        padding: Ei.sym(v: 15, h: 20),
                        child: Text(
                          item,
                          style: i == 0 ? Gfont.bold : Gfont.normal,
                        ),
                      );
                    }),
                  ),
                ),
              ),
              Container(
                padding: Ei.all(20),
                margin: Ei.all(20),
                decoration: BoxDecoration(
                    color: Colors.blueAccent, borderRadius: Br.radius(10)),
                child: Row(
                  children: [
                    Col(
                      children: [
                        Text(
                          'Mechanical',
                          style: Gfont.fs20.white,
                        ),
                        Text(
                          Faker.words(10),
                          style: Gfont.white,
                        )
                      ],
                    ).margin(r: 15).flexible(),
                    const LzImage(
                      'https://ilisium.co.id/wp-content/uploads/2021/06/web-development-services.png',
                      width: 100,
                    )
                  ],
                ),
              ),
              LzPadder(
                children: [
                  Text('Popular Questions', style: Gfont.fs20.bold),
                  Col(
                    children: [
                      'Tell me about this app',
                      'What is the purpose of life?',
                      'What is consciousness?'
                    ].generate((item, i) {
                      return InkTouch(
                        onTap: () {},
                        padding: Ei.all(20),
                        border: Br.all(),
                        margin: Ei.only(t: 10),
                        radius: Br.radius(10),
                        child: Row(
                          children: [
                            LzImage(Faker.image(), size: 80),
                            Col(
                              children: [
                                Text(
                                  item,
                                  style: Gfont.fs17.bold,
                                ),
                                Text(
                                  Faker.words(7),
                                  style: Gfont.fs15,
                                )
                              ],
                            ).margin(l: 15).flexible()
                          ],
                        ),
                      );
                    }),
                  )
                ],
              )
            ],
          ),
          Poslign(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: Ei.all(20),
                child: LzButton(
                        text: 'Ask Your Question',
                        type: ButtonType.primary,
                        color: Colors.blueAccent,
                        radius: 10,
                        onTap: (state) {})
                    .sized(context.width),
              )),
          Poslign(
              alignment: Alignment.topCenter,
              child: notifier.watch((state) {
                bool isChange = state.pixel > 50;

                return AnimatedContainer(
                    duration: 100.ms,
                    padding:
                        Ei.only(t: context.viewPadding.top + 20, others: 20),
                    decoration: BoxDecoration(
                        color: isChange ? Colors.white : Colors.transparent),
                    child: Row(
                      mainAxisAlignment: Maa.spaceBetween,
                      children: [
                        Icon(
                          Ti.menu2,
                          color: isChange ? Colors.black87 : Colors.white,
                          size: 22,
                        ),
                        Icon(
                          Ti.bell,
                          color: isChange ? Colors.black87 : Colors.white,
                          size: 22,
                        ),
                      ],
                    ));
              }))
        ],
      ),
    );

    // return Scaffold(
    //   backgroundColor: LzColors.hex('0440c2'),
    //   body: Container(
    //     padding: Ei.all(30),
    //     child: Column(
    //       crossAxisAlignment: Caa.start,
    //       mainAxisAlignment: Maa.end,
    //       children: [
    //         Textr('Welcome', style: Gfont.fs(30).white.bold, margin: Ei.only(b: 25)),
    //         Text('Manage your expenses', style: Gfont.fs(17).fcolor(Colors.white70)),
    //         Textr('Seamlessly & intuitively', style: Gfont.fs(20).white, margin: Ei.only(b: 50),),

    //         LzButton(
    //           text: 'Sign in with Google',
    //           icon: Ti.brandGoogle,
    //           onTap: (_){}
    //         ).sized(context.width).margin(b: 15),

    //         LzButton(
    //           text: 'Create an account',
    //           outline: true,
    //           onTap: (_){}
    //         ).sized(context.width).margin(b: 25),

    //         SizedBox(
    //           width: context.width,
    //           child: Textml('Already have an acconut? <b>Sign In</b>', style: Gfont.white, textAlign: Ta.center,))
    //       ],
    //     ),
    //   ),
    // );
  }
}
