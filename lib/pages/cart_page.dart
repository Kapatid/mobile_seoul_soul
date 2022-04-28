import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_seoul_soul/flutter_flow/flutter_flow_theme.dart';
import 'package:provider/provider.dart';
import 'package:mobile_seoul_soul/providers/cart_provider.dart';

import '../flutter_flow/flutter_flow_util.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final _fc = NumberFormat.simpleCurrency(locale: 'en_US', name: 'PHP');
  List<CartProduct> _cart = [];
  double _subTotal = 0.0;
  final double _shipping = 12.0;
  final double _tax = 8.0;

  void _updateCart() {
    _cart = context.read<Cart>().cartProducts;
    _subTotal = _cart.fold(0, (pv, p) => pv + p.product.price * p.amount);
  }

  @override
  void initState() {
    super.initState();
    _updateCart();
  }

  void _clearCart() {
    setState(() {
      context.read<Cart>().clearCart();
      _updateCart();
    });
  }

  void _removeProduct(CartProduct product) {
    setState(() {
      context.read<Cart>().removeProduct(product);
      _updateCart();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
      child: Column(
        children: [
          Expanded(
              child: Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: ListView.builder(
                itemCount: _cart.length,
                itemBuilder: (context, index) {
                  return _cart.isEmpty
                      ? const Text(
                          "No items in cart...",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w900),
                        )
                      : SizedBox(
                          height: 40,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(_cart[index].product.name),
                                Row(
                                  children: [
                                    Text(
                                        '${_fc.format(_cart[index].product.price)}  x${_cart[index].amount}',
                                        style: const TextStyle(
                                            fontFamily: "Roboto",
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    OutlinedButton.icon(
                                      icon: const FaIcon(
                                        FontAwesomeIcons.trash,
                                        size: 12,
                                      ),
                                      onPressed: () =>
                                          _removeProduct(_cart[index]),
                                      label: const Text(
                                        'REMOVE',
                                        style: TextStyle(fontSize: 10),
                                      ),
                                      style: OutlinedButton.styleFrom(
                                          shape: const StadiumBorder(),
                                          side: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor,
                                              width: 1)),
                                    )
                                  ],
                                )
                              ]));
                }),
          )),
          Container(
            margin: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
            alignment: Alignment.centerLeft,
            child: const Text("ORDER SUMMARY", style:TextStyle(color: Color.fromARGB(255, 14, 13, 13)),),
          ),

          const Divider(),
          Container(
            margin: const EdgeInsets.only(bottom: 120, left: 20, right: 20),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Sub Total",
                          style: TextStyle(color: Color.fromARGB(255, 14, 13, 13))),
                      Text(
                        _fc.format(_cart.isNotEmpty ? _subTotal : 0),
                        style: const TextStyle(
                            fontFamily: "Roboto", fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Shipping",
                          style: TextStyle(color: Color.fromARGB(255, 14, 13, 13))),
                      Text(
                        _fc.format(_cart.isNotEmpty ? _shipping : 0),
                        style: const TextStyle(
                            fontFamily: "Roboto", fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Tax", style: TextStyle(color: Color.fromARGB(255, 14, 13, 13))),
                      Text(
                        _fc.format(_cart.isNotEmpty ? _tax : 0),
                        style: const TextStyle(
                            fontFamily: "Roboto", fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                const Divider(),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "TOTAL COST",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        _fc.format(_cart.isNotEmpty
                            ? _subTotal + _shipping + _tax
                            : 0),
                        style: const TextStyle(
                            fontSize: 15,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: ElevatedButton.icon(
                          icon: FaIcon(FontAwesomeIcons.shoppingCart,
                              size: 17,
                              color: FlutterFlowTheme.of(context).primaryColor),
                          onPressed: () {
                            String msg = 'Cart is empty...';

                            if (_cart.isNotEmpty) {
                              _clearCart();
                              msg = 'Thank you for purchasing!';
                            }

                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('STATUS'),
                                content: Text(msg),
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
                            "BUY",
                            style: TextStyle(
                                fontSize: 12,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor),
                          ),
                          style: ElevatedButton.styleFrom(
                              elevation: 0.0,
                              shadowColor: Colors.transparent,
                              primary:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              shape: const StadiumBorder()),
                        ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
