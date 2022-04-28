import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_seoul_soul/pages/details_page.dart';
import 'package:mobile_seoul_soul/flutter_flow/flutter_flow_theme.dart';
import 'package:mobile_seoul_soul/models/product.dart';

import '../flutter_flow/flutter_flow_util.dart';

Route _createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class ProductsGrid extends StatefulWidget {
  const ProductsGrid({Key? key}) : super(key: key);
  @override
  _ProductsGridState createState() => _ProductsGridState();
}

class _ProductsGridState extends State<ProductsGrid> {
  final List<Product> _productList = [
    Product("MEsWk-dZzlI", "Enhypen Perfume", 500.00, "JOKE JOKE JOKE"),
    Product("nwOip8AOZz0", "BTS Cleanser Kit", 1000.0, "JOKE JOKE JOKE"),
    Product("dwKiHoqqxk8", "Loona Kicks", 2000.0, "JOKE JOKE JOKE"),
    Product("dcbz31jdsHA", "Twice Lipstick", 14000.0, "JOKE JOKE JOKE"),
    Product("mwytIca3qNA", "BTS PS5 Controller", 4000.0, "JOKE JOKE JOKE"),
    Product("E-0ON3VGrBc", "IZ*ONE Stiletto", 6000.0, "JOKE JOKE JOKE"),
    Product("cxAZxTuL7Sk", "Astro Scented Soap", 5000.0, "JOKE JOKE JOKE"),
    Product("0FHNXqyqgg4", "SF9 Diffuser", 16000.0, "JOKE JOKE JOKE"),
    Product("HcqA34-uWo4", "CIX Sneakers", 20000.0, "JOKE JOKE JOKE"),
    Product("TBH2MLpqT0E", "Mamamoo Perfume", 15000.0, "JOKE JOKE JOKE"),
    Product("t17J7UAdhOA", "Seventeen Nail Polish", 39000.0, "JOKE JOKE JOKE"),
    Product("_h-wpskIzfw", "GFriend Lipstick", 3000.0, "JOKE JOKE JOKE"),
    Product("3_KYuMVl1Q8", "BTS Lotion", 18000.0, "JOKE JOKE JOKE"),
    Product("oWLAP7fgcKM", "Kang Daniel Watch", 12000.0, "JOKE JOKE JOKE"),
    Product("P1DnHl3qYFk", "BTS Bomb Pin", 1000.0, "JOKE JOKE JOKE"),
  ];
  List<Product> _searchList = [];

  final TextEditingController _searchController = TextEditingController();
  final _formatCurrency =
      NumberFormat.simpleCurrency(locale: 'en_US', name: 'PHP');

  @override
  void initState() {
    super.initState();

    _searchList = _productList;

    _searchController.addListener(() {
      setState(() {
        if (_searchController.text.isEmpty) {
          _searchList = _productList;
        } else {
          _searchList = _productList
              .where((product) => product.name
                  .toLowerCase()
                  .contains(_searchController.text.toLowerCase()))
              .toList();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // Search Box
      Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.86,
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.all(18.0),
          decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              border: Border.all(
                  width: 2,
                  color: FlutterFlowTheme.of(context).secondaryColor)),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color.fromRGBO(189, 189, 189, 1),
                ),
                suffixIcon: Material(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  child: IconButton(
                    icon: const Icon(Icons.clear),
                    color: Colors.grey[400],
                    onPressed: _searchController.clear,
                  ),
                ),
                hintText: 'What are you looking for?',
                hintStyle: TextStyle(color: Colors.grey[400]),
                border: InputBorder.none),
          ),
        ),
      ),
      // Products Grid

      Expanded(
          child: Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        padding: const EdgeInsets.all(14),
        margin: const EdgeInsets.fromLTRB(24, 18, 24, 0),
        child: GridView.builder(
          padding: const EdgeInsets.only(bottom: 100),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
          ),
          itemCount: _searchList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  _createRoute(DetailsPage(product: _searchList[index])),
                );
              },
              child: Card(
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      SizedBox(
                        child: CachedNetworkImage(
                            placeholder: (context, url) => const Center(
                                  child: SizedBox(
                                    width: 30.0,
                                    height: 100.0,
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            imageUrl: _searchList[index].image),
                      ),
                      Column(children: [
                        Container(
                          margin:
                              const EdgeInsets.only(left: 0, top: 5, right: 10),
                          alignment: Alignment.topLeft,
                          child: Flexible(
                              child: Text(
                            _searchList[index].name,
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                    ),
                          )),
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 5, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _formatCurrency
                                      .format(_searchList[index].price),
                                  style: const TextStyle(
                                      fontSize: 12, fontFamily: "Roboto"),
                                ),
                                Wrap(children: [
                                  const Text(
                                    'See Details',
                                    style: TextStyle(
                                        fontSize: 11, color: Colors.grey),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 1),
                                    child: const FaIcon(
                                      FontAwesomeIcons.caretRight,
                                      size: 13,
                                      color: Colors.grey,
                                    ),
                                  )
                                ])
                              ],
                            ))
                      ]),
                    ],
                  )),
            );
          },
        ),
      )),
    ]);
  }
}
