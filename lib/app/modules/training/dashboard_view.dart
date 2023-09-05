import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'widgets/appbar_widget.dart';
import 'widgets/slider_widget.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(height: context.height),
          Container(
            width: context.width,
            height: 520,
            decoration: BoxDecoration(color: LzColors.hex('2D2D2D')),
            child: const Stack(
              children: [
                Positioned(top: -71, left: -118, child: Bubble()),
                Positioned(bottom: -100, right: -100, child: Bubble()),
              ],
            ),
          ),
          const Positioned.fill(
            child: LzListView(
              padding: Ei.zero,
              children: [
                SliderWidget(),
              ],
            ),
          ),
          const Positioned(child: AppbarWidget())
        ],
      ),
    );
  }
}

class Bubble extends StatelessWidget {
  const Bubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 307,
      height: 307,
      decoration: BoxDecoration(
          color: LzColors.hex('EDEDED').darken(.78), shape: BoxShape.circle),
    );
  }
}
