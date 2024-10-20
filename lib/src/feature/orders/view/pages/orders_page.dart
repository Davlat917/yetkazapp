import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tezyetkazz/src/feature/orders/view_model/vm/orders_vm.dart';

class OrdersPage extends ConsumerWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ctr = ref.read(ordersVm);
    ref.watch(ordersVm);
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: MediaQuery.of(context).size.height * 0.01,
            backgroundColor: Colors.yellow.shade600,
            bottom: const TabBar(
              dividerColor: Colors.transparent,
              indicatorColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(
                  child: Text(
                    "Hozirgi",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Avvalgi",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              const Center(
                child: Text("Buyurtmalar ro'yhati bo'sh"),
              ),
              ListView.builder(
                itemCount: ctr.ordersList.length,
                itemBuilder: (context, index) {
                  final order = ctr.ordersList[index];
                  return ListTile(
                    leading: Image.asset("assets/images/images.jpeg"),
                    title: Text(order['title']!),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(order['price']!),
                        Text(order['time']!),
                        Text(
                          order['status']!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                    trailing: const Icon(Icons.navigate_next),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
