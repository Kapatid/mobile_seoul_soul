import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mobile_seoul_soul/flutter_flow/flutter_flow_util.dart';
import 'package:mobile_seoul_soul/pages/cart_page.dart';
import 'package:mobile_seoul_soul/pages/products_grid.dart';
import 'package:mobile_seoul_soul/widgets/custom_tab_indicator.dart';
import 'package:mobile_seoul_soul/flutter_flow/flutter_flow_theme.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);
  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  initialIndex: 0,
                  child: Stack(
                    children: [
                      const Expanded(
                        child: TabBarView(
                          children: [
                            ProductsGrid(),
                            CartPage(),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            margin: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    offset: const Offset(0.0, 3.0),
                                    blurRadius: 10.0),
                              ],
                            ),
                            child: ClipRect(
                              child: TabBar(
                                labelColor:
                                    FlutterFlowTheme.of(context).primaryColor,
                                labelStyle:
                                    FlutterFlowTheme.of(context).bodyText1,
                                indicator: CustomTabIndicator(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor),
                                // indicatorColor:
                                //     FlutterFlowTheme.of(context).primaryColor,
                                // indicatorWeight: 4,
                                tabs: const [
                                  Tab(
                                    iconMargin: EdgeInsets.fromLTRB(0, 3, 0, 3),
                                    icon: FaIcon(
                                      FontAwesomeIcons.store,
                                      size: 18,
                                    ),
                                    text: "Store",
                                  ),
                                  Tab(
                                    iconMargin: EdgeInsets.fromLTRB(0, 3, 0, 3),
                                    icon: FaIcon(
                                      FontAwesomeIcons.shoppingCart,
                                      size: 18,
                                    ),
                                    text: "Cart",
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
