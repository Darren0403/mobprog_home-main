import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobprog_home/navigation_provider.dart';
import 'package:mobprog_home/widgets/bar%20graph/bar_graph.dart';
import 'package:mobprog_home/widgets/drawer_item.dart';
import 'package:mobprog_home/widgets/drawer_items.dart';
import 'package:mobprog_home/widgets/home_carousel.dart';
import 'package:mobprog_home/constants.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final user = FirebaseAuth.instance.currentUser;

  signout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Pasang GlobalKey di sini
      drawer: const NavigationDrawerWidget(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              onPressed: () {
                _scaffoldKey.currentState!.openDrawer(); // Gunakan key untuk membuka drawer
              },
              icon: const Icon(Icons.menu),
            ),
            backgroundColor: Constants.colorBlue4,
            elevation: 0,
            pinned: true,
            expandedHeight: 250.0,
            stretch: true,
            flexibleSpace: const FlexibleSpaceBar(
              stretchModes: [
                StretchMode.zoomBackground,
              ],
              background: CarouselHome(),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SafeArea(
                  child: Column(
                    children: [
                      // User Email
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 10, left: 10),
                            child: Text(
                              '${user!.email}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Task Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            padding: const EdgeInsets.symmetric(
                              vertical: 36,
                              horizontal: 42,
                            ),
                            decoration: BoxDecoration(
                              color: Constants.colorGrey7,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Column(
                              children: [
                                Text(
                                  '1',
                                  style: TextStyle(
                                    color: Constants.colorBlack,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  Constants.taskText1,
                                  style: TextStyle(color: Constants.colorBlack),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            padding: const EdgeInsets.symmetric(
                              vertical: 36,
                              horizontal: 38,
                            ),
                            decoration: BoxDecoration(
                              color: Constants.colorGrey7,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Column(
                              children: [
                                Text(
                                  '3',
                                  style: TextStyle(
                                    color: Constants.colorBlack,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  Constants.taskText2,
                                  style: TextStyle(color: Constants.colorBlack),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      // Bar Graph
                      Container(
                        margin: const EdgeInsets.only(left: 6, right: 6, top: 10),
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: Constants.colorBlue3,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const BarGraph(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() => signout()),
        child: const Icon(Icons.logout_rounded),
      ),
    );
  }
}


class BarGraph extends StatefulWidget {
  const BarGraph({super.key});

  @override
  State<BarGraph> createState() => _BarGraphState();
}

class _BarGraphState extends State<BarGraph> {
  List<double> userAktif = [10, 2, 5, 6, 12, 8, 15];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: MyBarGraph(userAktif: userAktif),
    );
  }
}

// class HomeTest extends StatefulWidget {
//   const HomeTest({super.key});

//   @override
//   State<HomeTest> createState() => _HomeTestState();
// }

// class _HomeTestState extends State<HomeTest> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: NavigationDrawerWidget(),
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             leading: IconButton(
//               onPressed: () {},
//               icon: const Icon(Icons.menu_sharp),
//             ),
//             backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//             elevation: 0,
//             pinned: true,
//             centerTitle: false,
//             expandedHeight: 300.0,
//             stretch: true,
//             flexibleSpace: const FlexibleSpaceBar(
//               stretchModes: [
//                 StretchMode.zoomBackground,
//               ],
//               background: Image(
//                 image: AssetImage(
//                     'assets/87773.jpg'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           SliverAppBar(
//             backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//             elevation: 0,
//             pinned: true,
//             bottom: const PreferredSize(
//                 preferredSize: Size.fromHeight(-10.0), child: SizedBox()),
//             flexibleSpace: const CarouselHome(),
//           ),
//           SliverList(
//             delegate: SliverChildBuilderDelegate(
//               (BuildContext context, int index) {
//                 return Padding(
//                   padding:
//                       const EdgeInsets.only(left: 8, bottom: 20, right: 10),
//                   child: Container(
//                     margin: const EdgeInsets.only(left: 6, right: 6, top: 10),
//                     padding: const EdgeInsets.all(18),
//                     decoration: BoxDecoration(
//                       color: Constants.colorBlue3,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     // height: 200,
//                     // width: MediaQuery.of(context).size.width,
//                     child: const BarGraph(),
//                   ),
//                 );
//               },
//               // childCount: 20,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({super.key});
  final EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    final EdgeInsets spaceArea =
        EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top);

    final provider = Provider.of<NavigationProvider>(context);
    final isExpanded = provider.isExpanded;

    return Container(
      width: isExpanded ? MediaQuery.of(context).size.width * 0.2 : null,
      child: Drawer(
        child: Container(
          color: const Color(0xff1a2f45),
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 24).add(spaceArea),
                width: double.infinity,
                color: Colors.white12,
                child: buildHeader(isExpanded),
              ),
              const SizedBox(height: 24),
              buildList(items: itemsFirst, isExpanded: isExpanded),
              const SizedBox(height: 24),
              const Divider(color: Colors.white70),
              const SizedBox(height: 24),
              buildList(
                  indexOffset: itemsFirst.length,
                  items: itemsSecond,
                  isExpanded: isExpanded),
              const SizedBox(height: 24),
              const Divider(color: Colors.white70),
              const SizedBox(height: 24),
              buildList(
                  indexOffset: itemsSecond.length,
                  items: itemsThird,
                  isExpanded: isExpanded),
              const Spacer(),
              buildCollapseIcon(context, isExpanded),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildList(
          {required bool isExpanded,
          required List<DrawerItem> items,
          int indexOffset = 0}) =>
      ListView.separated(
        padding: isExpanded ? EdgeInsets.zero : padding,
        shrinkWrap: true,
        primary: true,
        itemCount: items.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final item = items[index];

          return buildMenuItem(
            isExpanded: isExpanded,
            text: item.title,
            icon: item.icon,
            onClicked: () => selectItem(context, indexOffset + index),
          );
        },
      );

  void selectItem(BuildContext context, int index) {
    navigateTo(page) => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => page),
        );

    Navigator.of(context).pop();

    switch (index) {
      case 0:
        navigateTo(const MyHomePage());
        break;
      case 1:
        navigateTo(const MyHomePage());
        break;
      case 2:
        navigateTo(const MyHomePage());
        break;
      case 3:
        navigateTo(const MyHomePage());
        break;
      case 4:
        navigateTo(const MyHomePage());
        break;
      case 5:
        navigateTo(const MyHomePage());
        break;
      case 6:
        navigateTo(const MyHomePage());
        // masukkin logika logout dari fungsi yang udah ada
        break;
    }
  }

  Widget buildMenuItem({
    required bool isExpanded,
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    const color = Colors.white;
    final leading = Icon(icon, color: color);

    return Material(
      color: Colors.transparent,
      child: isExpanded
          ? ListTile(title: leading, onTap: onClicked)
          : ListTile(
              leading: leading,
              title: Text(
                text,
                style: const TextStyle(color: color, fontSize: 16),
              ),
              onTap: onClicked,
            ),
    );
  }

  Widget buildCollapseIcon(BuildContext context, bool isExpanded) {
    const double size = 52;
    final icon = isExpanded ? Icons.arrow_forward_ios : Icons.arrow_back_ios;
    final alignment = isExpanded ? Alignment.center : Alignment.centerRight;
    final margin = isExpanded ? null : const EdgeInsets.only(right: 16);
    final width = isExpanded ? double.infinity : size;

    return Container(
      alignment: alignment,
      margin: margin,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child: Container(
            width: width,
            height: size,
            child: Icon(icon),
          ),
          onTap: () {
            final provider =
                Provider.of<NavigationProvider>(context, listen: false);

            provider.toggleExpanded();
          },
        ),
      ),
    );
  }

  Widget buildHeader(bool isExpanded) => isExpanded
      ? const FlutterLogo(size: 48)
      : const Row(
          children: [
            SizedBox(width: 24),
            FlutterLogo(
              size: 48,
            ),
            SizedBox(width: 16),
            Text(
              'GacorTask',
              style: TextStyle(fontSize: 32, color: Colors.white),
            ),
          ],
        );
}
