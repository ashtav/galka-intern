import 'package:appfetch/app/modules/training/pages/account_view.dart';
import 'package:appfetch/app/modules/training/pages/home_view.dart';
import 'package:appfetch/app/modules/training/pages/shop_view.dart';
import 'package:appfetch/app/modules/training/pages/support_view.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = NavbarNotifier();

    List<Widget> pages = const [
      HomeView(),
      ShopView(),
      None(),
      SupportView(),
      AccountView()
    ];

    return Scaffold(
      body: notifier.watch((state) => Stack(
            children: [
              Stack(
                  children: List<Widget>.generate(5, (int index) {
                bool isActive = state.index == index;

                return IgnorePointer(
                  ignoring: !isActive,
                  child: AnimatedOpacity(
                    duration: 250.ms,
                    opacity: isActive ? 1 : 0,
                    child: Navigator(
                      onGenerateRoute: (RouteSettings settings) {
                        return MaterialPageRoute(
                          builder: (_) => pages[index],
                          settings: settings,
                        );
                      },
                    ),
                  ),
                );
              })),
            ],
          )),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(border: Br.only(['b'])),
        child: Intrinsic(
          children: [Ti.home, Ti.buildingStore, Ti.plus, Ti.message2, Ti.user]
              .generate((icon, i) {
            List<String> labels = ['Home', 'Shop', '', 'Support', 'Account'];

            return Expanded(child: notifier.watch(
              (state) {
                bool isActive = state.index == i;
                Color colorActive = isActive ? Colors.black : Colors.grey;

                return InkTouch(
                  onTap: () {
                    notifier.onNavigate(i);
                  },
                  padding: Ei.sym(v: 13, h: 5),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: Maa.center,
                    children: [
                      Icon(
                        icon,
                        color: colorActive,
                      ),
                      if (i != 2)
                        Textr(
                          labels[i],
                          style: Gfont.fs12.fcolor(colorActive),
                          margin: Ei.only(t: 5),
                        )
                    ],
                  ),
                );
              },
            ));
          }),
        ),
      ),
    );
  }
}

class NavbarNotifier extends ChangeNotifier {
  int index = 0;

  void onNavigate(int value) {
    index = value;
    notifyListeners();
  }
}
