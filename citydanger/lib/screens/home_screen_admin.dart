/*=============== Owned packages ===================*/
import 'package:citydanger/locator.dart';
import 'package:citydanger/navi.router.dart';
import 'package:citydanger/widgets/issue_container.dart';
import 'package:citydanger/widgets/infinite_scroll.dart';
import 'package:citydanger/view_models/home_page_view_model.dart';
/*=============== Extern packages ==================*/
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:shimmer/shimmer.dart';

class HomePageAdmin extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
      viewModelBuilder: () => locator<HomePageViewModel>(),
      disposeViewModel: false,
      onModelReady: (homeModel) =>
          homeModel.getIssueList.isEmpty ? homeModel.getIssues() : null,
      fireOnModelReadyOnce: false,
      builder: (context, homeModel, child) => WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () => {_openDrawer()}),
            elevation: 0,
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor: Theme.of(context).primaryColor,
            title: Text(
              'City Danger Alert',
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                const SizedBox(
                  height: 60,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.logout,
                    color: Colors.white,
                    size: 30,
                  ),
                  title: const Text(
                    "Sign Out",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  onTap: () {
                    homeModel.navigationService.navigateTo(Routes.loginScreen);
                  },
                ),
              ],
            ),
          ),
          body: Container(
            child: homeModel.issueBusy
                ? Shimmer.fromColors(
                    baseColor: Colors.grey,
                    enabled: true,
                    highlightColor: Colors.grey,
                    child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Container(
                                  color: Colors.blueAccent,
                                  height: 10,
                                  width: 10,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 10,
                                        color: Colors.blueAccent,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        height: 10,
                                        color: Colors.blueAccent,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        }))
                : ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemExtent: 100,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: homeModel.getIssueList.length,
                    itemBuilder: (context, index) => CreationAwareListItem(
                      itemCreated: () async {
                        if (index % 3 == 0 && homeModel.hasMoreIssues == true) {
                          await homeModel.getIssues();
                        }
                      },
                      child: IssueContainer(
                          index,
                          homeModel.getIssueList[index].description,
                          homeModel.getIssueList[index].image,
                          homeModel.getIssueList.length, () {
                        homeModel.showCustomDialog(
                            homeModel.getIssueList[index].image,
                            homeModel.getIssueList[index].description,
                            homeModel.getIssueList[index].issueId,
                            index);
                      }),
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }
}
