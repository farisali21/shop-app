import 'dart:async';

import 'package:flutter/material.dart';
import 'package:market/widgets/app_drawer.dart';
import 'package:provider/provider.dart';

import '../models/orders.dart' show Orders;
import '../widgets/order_item.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/order-screen';

//   @override
//   _OrderScreenState createState() => _OrderScreenState();
// }
//
// class _OrderScreenState extends State<OrderScreen> {
  // var _isInit = true;
  // var _isLoading = false;

  ///and this is anther way to solve the problem
  // @override
  // void didChangeDependencies() {
  //   if (_isInit) {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //     Provider.of<Orders>(context, listen: false).fetchAndSetOrders().then((_) {
  //       setState(() {
  //         _isLoading = false;
  //       });
  //     });
  //   }
  //   _isInit = false;
  //   super.didChangeDependencies();
  // }

  ///this is a way we can do
  // @override
  // void initState() {
  //   Future.delayed(Duration.zero).then((value) async {
  //     _isLoading = true;
  //     Provider.of<Orders>(context).fetchAndSetOrders().then((value) {
  //       setState(() {
  //         _isLoading = false;
  //       });
  //     });
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    ///if we use this we will make an infinite loop
    // final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
          future:
              Provider.of<Orders>(context, listen: false).fetchAndSetOrders(),
          builder: (context , dataSnapShot) {
           if (dataSnapShot.connectionState == ConnectionState.waiting){
             return Center(
                           child: CircularProgressIndicator(),
                         );
           } else {
             if(dataSnapShot.error != null){
               return Center(child: Text('there is an error'),);
             }else {
              return  Consumer<Orders>(
                  builder: (context, orderData, child) {
                return ListView.builder(
                  itemCount: orderData.orders.length,
                  itemBuilder: (ctx, i) => OrderItem(orderData.orders[i]),
                );
              },
              );
             }
           }
          }),
    );
  }
}
