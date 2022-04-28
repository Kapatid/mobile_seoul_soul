import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_seoul_soul/models/product.dart';
import 'package:mobile_seoul_soul/flutter_flow/flutter_flow_theme.dart';
import 'package:mobile_seoul_soul/flutter_flow/flutter_flow_util.dart';
import 'package:provider/provider.dart';
import 'package:mobile_seoul_soul/providers/cart_provider.dart';

class DetailsPage extends StatelessWidget {
  final Product product;

  DetailsPage({Key? key, required this.product}) : super(key: key);

  final _fc = NumberFormat.simpleCurrency(locale: 'en_US', name: 'PHP');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        leading: BackButton(color: FlutterFlowTheme.of(context).primaryColor),
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        title: Text("Product Details",
            style: TextStyle(color: FlutterFlowTheme.of(context).primaryColor)),
      ),
      body: Column(
        children: [
          CachedNetworkImage(
              placeholder: (context, url) => const Center(
                    child: SizedBox(
                      width: 40.0,
                      height: 40.0,
                      child: CircularProgressIndicator(),
                    ),
                  ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageUrl: product.image),
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          product.name,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: FlutterFlowTheme.of(context).primaryText),
                        )),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        _fc.format(product.price),
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Roboto",
                            color: FlutterFlowTheme.of(context).primaryColor),
                      ),
                    ),
                    Container(
                      height: 1,
                      color: Colors.grey[350],
                      margin: const EdgeInsets.only(top: 18, bottom: 14),
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          product.description,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        )),
                    Container(
                      height: 1,
                      color: Colors.grey[350],
                      margin: const EdgeInsets.only(top: 14),
                    ),
                  ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 1,
                          child: OutlinedButton.icon(
                            icon: const FaIcon(
                              FontAwesomeIcons.heart,
                              size: 15,
                            ),
                            onPressed: () {},
                            label: const Text('ADD TO WISHLIST'),
                            style: OutlinedButton.styleFrom(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                shape: const StadiumBorder(),
                                side: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    width: 1)),
                          )),
                      const SizedBox(width: 15),
                      Expanded(
                          flex: 1,
                          child: ElevatedButton.icon(
                            icon: FaIcon(FontAwesomeIcons.shoppingCart,
                                size: 15,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor),
                            onPressed: () {
                              context.read<Cart>().addProduct(product);
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('STATUS'),
                                  content:
                                      Text('${product.name} is now in cart.'),
                                  actions: <Widget>[
                                    // TextButton(
                                    //   onPressed: () =>
                                    //       Navigator.pop(context, 'Cancel'),
                                    //   child: const Text('Cancel'),
                                    // ),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            },
                            label: Text(
                              "ADD TO CART",
                              style: TextStyle(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryColor),
                            ),
                            style: ElevatedButton.styleFrom(
                                elevation: 0.0,
                                shadowColor: Colors.transparent,
                                primary:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                shape: const StadiumBorder()),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
