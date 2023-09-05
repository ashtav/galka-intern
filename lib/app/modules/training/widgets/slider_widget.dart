import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Ei.only(t: 135),
      child: Col(
        children: [
          const Center(child: LzImage('logo.png')),

          Container(
              margin: Ei.only(t: 46, b: 15),
              child: CarouselSlider(
                options: CarouselOptions(
                    padEnds: false, height: 150, enableInfiniteScroll: false),
                items: List.generate(2, (i) {
                  List<String> bulan = ['Bulan Sekarang', 'Bulan Lalu'];

                  return Container(
                    padding: Ei.only(r: 20, l: i == 0 ? 20 : 0),
                    child: InkTouch(
                      onTap: () {},
                      radius: Br.radius(10),
                      color: Colors.white,
                      child: Col(
                        children: [
                          Textr(
                            bulan[i],
                            padding: Ei.all(20),
                          ),
                          Intrinsic(
                              children: ['Poin Pribadi', 'Poin Group']
                                  .generate((item, i) {
                            return Expanded(
                              child: Container(
                                padding: Ei.sym(h: 20),
                                decoration: BoxDecoration(
                                    border: Br.only(['l'], except: i == 0)),
                                child: Col(
                                  children: [
                                    Textr(
                                      '0,0',
                                      style: Gfont.fs(25).bold, margin: Ei.only(b: 5),
                                    ),
                                    Text(item, style: Gfont.muted),
                                  ],
                                ),
                              ),
                            );
                          }))
                        ],
                      ),
                    ),
                  );
                }),
              )),

          // indicator
          Container(
              padding: Ei.all(20),
              child: LzSlidebar(
                activeColor: Colors.white,
                active: 0,
                length: 2,
                size: (int i) => [i == 0 ? 25 : 10, 10],
              ))
        ],
      ),
    );
  }
}
