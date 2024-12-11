import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tezyetkazz/src/core/api/api.constants.dart';
import 'package:tezyetkazz/src/feature/orders/view/widgets/orders_widget.dart';
import 'package:tezyetkazz/src/feature/orders/view_model/vm/orders_vm.dart';

class OrdersPage extends ConsumerWidget {
  const OrdersPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ctr = ref.read(ordersVm);
    ref.watch(ordersVm);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.yellow.shade600,
        toolbarHeight: 0,
      ),
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: MediaQuery.of(context).size.height * 0.01,
            backgroundColor: Colors.yellow.shade600,
            bottom: TabBar(
              dividerColor: Colors.transparent,
              indicatorColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(
                  child: Text(
                    "hozirgi".tr(),
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "avvalgi".tr(),
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ctr.loadingDeliverOrders
                  ? CircularProgressIndicator()
                  : ctr.orderGetDeliverModel == null
                      ? Center(
                          child: Text("buyurtmalar ro'yhati bo'sh".tr()),
                        )
                      : ListView.builder(
                          itemCount: ctr.orderGetDeliverModel!.data!.data!.length,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    // showModalBottomSheet(
                                    //   useSafeArea: true,
                                    //   isScrollControlled: true,
                                    //   context: context,
                                    //   builder: (context) {
                                    //     return const OrdersBottomSheetWidget();
                                    //   },
                                    // );
                                    ctr.updateOrderStatusIdVm(id: "${ctr.orderGetDeliverModel!.data!.data![0].orderId}");
                                  },
                                  child: ListTile(
                                    leading: Image.network(
                                      "${ApiConst.baseUrl}${ctr.orderGetDeliverModel!.data!.data![index].uploadPath.toString().substring(21)}",
                                    ),
                                    title: Text("${ctr.orderGetDeliverModel!.data!.data![index].restaurantName}"),
                                    subtitle: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            "${ctr.orderGetDeliverModel!.data!.data![index].allAmount.toString().substring(0, 5)} ${"so'm".tr()}"),
                                        Text(
                                          "0${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year} ${DateTime.now().hour}:${DateTime.now().minute}",
                                        ),
                                      ],
                                    ),
                                    trailing: IconButton(
                                      onPressed: () {
                                        // ctr.getStorageOrder();
                                      },
                                      icon: Icon(Icons.navigate_next),
                                    ),
                                  ),
                                ),
                                Divider(),
                              ],
                            );
                          },
                        ),
              ctr.loadingOrders
                  ? CircularProgressIndicator()
                  : ListView.builder(
                      itemCount: ctr.orderGetAllUsersModel!.data!.data!.length,
                      // itemCount: 1,
                      itemBuilder: (context, index) {
                        // final order = ctr.ordersList[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  useSafeArea: true,
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) {
                                    return const OrdersBottomSheetWidget();
                                  },
                                );
                              },
                              child: ListTile(
                                // leading: Image.asset("assets/images/images.jpeg"),
                                leading: Image.network(
                                    "${ApiConst.baseUrl}${ctr.orderGetAllUsersModel!.data!.data![index].uploadPath!.substring(21)}"),
                                // title: Text(order['title']!),
                                title: Text("${ctr.orderGetAllUsersModel!.data!.data![index].restaurantName}"),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "${ctr.orderGetAllUsersModel!.data!.data![index].foodsAmount.toString().substring(0, 5)} ${"so'm".tr()}"),
                                    Text(
                                      "0${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year} ${DateTime.now().hour}:${DateTime.now().minute}",
                                    ),
                                    Text(
                                      "${ctr.orderGetAllUsersModel!.data!.data![index].status == true ? "Bajarilgan" : "Bekor qilingan"}",
                                      style: TextStyle(
                                        color: ctr.orderGetAllUsersModel!.data!.data![index].status == true ? Colors.green : Colors.red,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                trailing: Icon(Icons.navigate_next),
                              ),
                            ),
                            Divider(),
                          ],
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   // ctr.getOrderAllUsersVm(page: 0);
      //   // ctr.getOrderAllDeliversVm(page: 0);
      //   // ctr.updateOrderStatusIdVm(id: "${ctr.orderGetDeliverModel!.data!.data![0].orderId}");
      // }),
    );
  }
}
