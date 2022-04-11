import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:ota/data/vos/article_vo/article_vo.dart';
import 'package:ota/data/vos/banner_vo/banner_vo.dart';
import 'package:ota/data/vos/light_novel_vo/light_novel_vo.dart';
import 'package:ota/data/vos/manga_vo/manga_vo.dart';
import 'package:ota/providers/home_page_provider.dart';
import 'package:ota/screens/about_us_page.dart';
import 'package:ota/screens/favorite_page.dart';
import 'package:ota/screens/home_page.dart';
import 'package:ota/persistent/hive_constant.dart';
import 'package:ota/resources/const_string.dart';
import 'package:ota/screens/privacy_policy_page.dart';
import 'package:ota/view_point/drawer_view/drawer_session_view.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(BannerVOAdapter());
  Hive.registerAdapter(MangaVOAdapter());
  Hive.registerAdapter(LightNovelVOAdapter());
  Hive.registerAdapter(ArticleVOAdapter());

  await Hive.openBox<BannerVO>(boxNameForBannerVO);
  await Hive.openBox<MangaVO>(boxNameForMangaVO);
  await Hive.openBox<LightNovelVO>(boxNameForLightNovelVO);
  await Hive.openBox<ArticleVO>(boxNameForArticleVO);
  await Hive.openBox<bool>(boxNameForIsFavorite);
  await Hive.openBox<int>(boxNameForPageIndex);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<BottomNavigationBarItem> navigationItems = const [
    BottomNavigationBarItem(
        icon: Icon(Icons.home), label: bottomNavigationBarItemHomeLabel),
    BottomNavigationBarItem(
        icon: Icon(Icons.favorite),
        label: bottomNavigationBarItemFavoriteLabel),
  ];
  final widgets = [
    const HomePage(),
    FavoritePage(),
    const AboutUsPage(),
    const PrivacyPolicyPage(),
  ];

  void drawerHomePage(String currentSelectText, context) {
     HomePageProvider homePageProvider=Provider.of(context,listen: false);

    if (currentSelectText == 'Home') {
      Navigator.pop(context);
    } else {
        homePageProvider.setChangePage=0;
        Navigator.pop(context);
    }
  }

  void drawerFavoritePage(String currentSelectText, context) {
    HomePageProvider homePageProvider = Provider.of(context, listen: false);

    if (currentSelectText == 'Favorite') {
      Navigator.pop(context);
    } else {
      homePageProvider.setChangePage = 1;
      Navigator.pop(context);
    }
  }
  void drawerAboutUsPage(String currentSelectText, context) {
    HomePageProvider homePageProvider = Provider.of(context, listen: false);
    if (currentSelectText == 'About us') {
      Navigator.pop(context);
    } else {
      homePageProvider.setChangePage = 2;
      Navigator.pop(context);
    }
  }

  void drawerPrivacyPage(String currentSelectText, context) {
    HomePageProvider homePageProvider = Provider.of(context, listen: false);
    if (currentSelectText == 'Privacy Policy') {
      Navigator.pop(context);
    } else {
      homePageProvider.setChangePage = 3;
      Navigator.pop(context);
    }
  }

  Future<void> launchEmail() async {

      final Uri params = Uri(
          scheme: 'mailto',
          path: 'thantsin7755@gmail.com',
          query: 'subject=FeedBack Subject&body=body'
      );

      String url = params.toString();
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        print('Could not launch $url');
      }

  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageProvider>(
      create: (_) => HomePageProvider(),
      child: MaterialApp(
        title: 'OTA MYANMAR',
        debugShowCheckedModeBanner: false,
        home: Selector<HomePageProvider, int>(
            selector: (_, homePageProvider) => homePageProvider.getChangePage,
            builder: (_, index, child) {
              HomePageProvider homePageProvider = Provider.of(_, listen: false);
              return Selector<HomePageProvider, String>(
                selector: (_, homePageProvider) =>
              homePageProvider.getSelectText,
              builder: (_, isSelectText, child) =>

              Scaffold(
                  drawer: Drawer(
                    backgroundColor: Colors.white,
                    child:

                     Builder(
                        builder: (context) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const DrawerImageView(),
                              DrawerBosyView(
                                icon: Icon(
                                  Icons.home,
                                  color: isSelectText == 'Home'
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                text: 'Home',
                                selectTileColor: Colors.indigo,
                                isSelect: homePageProvider.getIsSelect('Home'),
                                onTap: (text) {
                                  homePageProvider.setSelectText = text;
                                  drawerHomePage(isSelectText, context);
                                },
                              ),
                              DrawerBosyView(
                                icon: Icon(
                                  Icons.favorite,
                                  color: isSelectText == 'Favorite'
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                text: 'Favorite',
                                selectTileColor: Colors.indigo,
                                isSelect:
                                    homePageProvider.getIsSelect('Favorite'),
                                onTap: (text) {
                                  homePageProvider.setSelectText = text;
                                  drawerFavoritePage(isSelectText, context);
                                },
                              ),
                              const Divider(
                                color: Colors.black,
                              ),
                              DrawerBosyView(
                                icon: Icon(
                                  Icons.help,
                                  color: isSelectText == 'About us'
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                text: 'About us',
                                selectTileColor: Colors.indigo,
                                isSelect:
                                    homePageProvider.getIsSelect('About us'),
                                onTap: (text) {
                                  homePageProvider.setSelectText = text;
                                  drawerAboutUsPage(isSelectText,context);
                                },
                              ),
                              DrawerBosyView(
                                icon: Icon(
                                  Icons.privacy_tip,
                                  color: isSelectText == 'Privacy Policy'
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                text: 'Privacy Policy',
                                selectTileColor: Colors.indigo,
                                isSelect: homePageProvider
                                    .getIsSelect('Privacy Policy'),
                                onTap: (text) {
                                  homePageProvider.setSelectText = text;
                                  drawerPrivacyPage(isSelectText,context);
                                },
                              ),
                              DrawerBosyView(
                                icon: Icon(
                                  Icons.contact_mail,
                                  color: isSelectText == 'Contact us'
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                text: 'Contact us',
                                selectTileColor: Colors.indigo,
                                isSelect:
                                    homePageProvider.getIsSelect('Contact us'),
                                onTap: (text) {
                                  launchEmail().then((value) {
                                    const snackBar =  SnackBar(
                                      backgroundColor: Colors.green,
                                      content: Text('Success',style:  TextStyle(color: Colors.white),),
                                    );
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  }).catchError((error){
                                    final snackBar = SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text(error.toString(),style: const TextStyle(color: Colors.white),),
                                    );
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  });
                                },

                              ),
                              DrawerBosyView(
                                icon: Icon(
                                  Icons.contact_page,
                                  color: isSelectText == 'Facebook Page'
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                text: 'Facebook Page',
                                selectTileColor: Colors.indigo,
                                isSelect:
                                    homePageProvider.getIsSelect('Facebook Page'),
                                onTap: (text) {
                                  launch('https://www.facebook.com/otamm2',forceSafariVC: false,forceWebView: false);
                                },
                              ),
                              const Divider(
                                color: Colors.black,
                              ),
                              DrawerBosyView(
                                icon: Icon(
                                  Icons.exit_to_app,
                                  color: isSelectText == 'Exit'
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                text: 'Exit',
                                selectTileColor: Colors.indigo,
                                isSelect: homePageProvider.getIsSelect('Exit'),
                                onTap: (text) {
                                  if (Platform.isAndroid) {
                                    SystemNavigator.pop();
                                  } else if (Platform.isIOS) {
                                    exit(0);
                                  }
                                },
                              ),
                            ],
                          );
                        }
                      ),
                    ),

                  bottomNavigationBar: BottomNavigationBar(
                    currentIndex: (index<2)?index:0,
                    selectedItemColor: (index<2)?Colors.indigo:Colors.grey,
                    unselectedItemColor: Colors.grey,
                    onTap: (index) {
                      homePageProvider.setChangePage = index;
                      homePageProvider.setSelectText = index==0?'Home':'Favorite';
                    },
                    items: navigationItems,
                  ),
                  appBar: AppBar(
                    backgroundColor: Colors.indigo,
                    centerTitle: true,
                    title:  Text(isSelectText),
                  ),
                  body: widgets[index]
              ),
              );
            }),
      ),
    );
  }
}
