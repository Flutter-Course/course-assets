import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_shop/models/PaymentCard.dart';
import 'package:my_shop/models/cart.dart';
import 'package:my_shop/providers/users_provider.dart';
import 'package:my_shop/screens/home_screen.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatefulWidget {
  static const routeName = '/checkout';

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String paymentMethod, number, month, year, cvv;

  @override
  void initState() {
    super.initState();
    paymentMethod = 'Cash';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Delivery Details',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    margin: EdgeInsets.zero,
                    elevation: 10,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(FontAwesomeIcons.user),
                              SizedBox(
                                width: 10,
                              ),
                              Text(Provider.of<UsersProvider>(context)
                                  .currentUser
                                  .userName),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Icon(FontAwesomeIcons.mapPin),
                              SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: Text(
                                  Provider.of<UsersProvider>(context)
                                      .currentUser
                                      .address,
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Icon(FontAwesomeIcons.mobile),
                              SizedBox(
                                width: 10,
                              ),
                              Text(Provider.of<UsersProvider>(context)
                                  .currentUser
                                  .mobile),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    'Payment Method',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    margin: EdgeInsets.zero,
                    elevation: 10,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          ListTile(
                            onTap: () {
                              setState(() {
                                paymentMethod = 'Cash';
                              });
                            },
                            contentPadding: EdgeInsets.only(right: 16),
                            leading: Radio(
                              value: 'Cash',
                              groupValue: paymentMethod,
                              onChanged: (value) {
                                setState(() {
                                  paymentMethod = value;
                                });
                              },
                            ),
                            title: Text('Cash on delivery'),
                            trailing: Icon(
                              FontAwesomeIcons.moneyBillWave,
                              color: Colors.black,
                            ),
                          ),
                          Divider(
                            color: Colors.grey[600],
                          ),
                          ListTile(
                            onTap: () {
                              setState(() {
                                paymentMethod = 'Credit Card';
                              });
                            },
                            contentPadding: EdgeInsets.only(right: 16),
                            leading: Radio(
                              value: 'Credit Card',
                              groupValue: paymentMethod,
                              onChanged: (value) {
                                setState(() {
                                  paymentMethod = value;
                                });
                              },
                            ),
                            title: Text('Credit Card'),
                            trailing: Icon(
                              FontAwesomeIcons.creditCard,
                              color: Colors.black,
                            ),
                          ),
                          Form(
                            child: Column(
                              children: [
                                TextFormField(
                                  enabled: paymentMethod == 'Credit Card',
                                  onChanged: (value) {
                                    setState(() {
                                      number = value;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Card Number',
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              onChanged: (value) {
                                                setState(() {
                                                  month = value;
                                                });
                                              },
                                              textAlign: TextAlign.center,
                                              enabled: paymentMethod ==
                                                  'Credit Card',
                                              decoration: InputDecoration(
                                                labelText: 'MM',
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 16),
                                            child: Text('/'),
                                          ),
                                          Expanded(
                                            child: TextFormField(
                                              onChanged: (value) {
                                                setState(() {
                                                  year = value;
                                                });
                                              },
                                              textAlign: TextAlign.center,
                                              enabled: paymentMethod ==
                                                  'Credit Card',
                                              decoration: InputDecoration(
                                                labelText: 'YY',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      flex: 2,
                                    ),
                                    Expanded(
                                      child: Container(),
                                    ),
                                    Expanded(
                                      child: TextField(
                                        onChanged: (value) {
                                          setState(() {
                                            cvv = value;
                                          });
                                        },
                                        enabled: paymentMethod == 'Credit Card',
                                        decoration: InputDecoration(
                                          labelText: 'CVV',
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              int m, y;
              bool valid;
              try {
                m = int.parse(month);
                y = 2000 + int.parse(year);
                valid = true;
              } catch (e) {
                valid = false;
              }
              if (valid) {
                PaymentCard paymentCard = PaymentCard(number, cvv, m, y);
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  child: AlertDialog(
                    content: Container(
                      height: 300,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                );
                String error =
                    await Provider.of<UsersProvider>(context, listen: false)
                        .currentUser
                        .asCustomer
                        .addOrderUsingCard(
                            Provider.of<Cart>(context, listen: false).cartItems,
                            paymentCard);
                Navigator.of(context).pop();
                if (error == null) {
                  await showDialog(
                    context: context,
                    barrierDismissible: false,
                    child: AlertDialog(
                      title: Text('Operation completed'),
                      content: Text('Order has been added successfuly.'),
                      actions: [
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Ok'),
                        ),
                      ],
                    ),
                  );
                  Provider.of<Cart>(context, listen: false).clearCart();
                  Navigator.of(context).popUntil((route) {
                    return route.isFirst;
                  });
                } else {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text(error),
                    backgroundColor: Colors.red,
                  ));
                }
              }
            },
            child: Container(
              padding: EdgeInsets.all(16),
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Place Order',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
