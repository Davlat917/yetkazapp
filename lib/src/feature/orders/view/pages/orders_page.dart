import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezyetkazz/src/core/api/api.constants.dart';
import 'package:tezyetkazz/src/feature/home/view/pages/home_tracking_page.dart';
import 'package:tezyetkazz/src/feature/home/view_model/vm/detail_restaraunt_id.dart';
import 'package:tezyetkazz/src/feature/orders/view_model/vm/orders_vm.dart';

class OrdersPage extends ConsumerWidget {
  const OrdersPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var ctr = ref.read(ordersVmProvider);
    ref.watch(ordersVmProvider);
    var ctrDetail = ref.read(restaurantDetailVm);
    ref.watch(restaurantDetailVm);

    return Scaffold(
      backgroundColor: Colors.white,
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
              ctr.orderGetDeliverModel == null
                  ? Center(
                      child: Text("buyurtmalar ro'yhati bo'sh".tr()),
                    )
                  : ctr.loadingDeliverOrders
                      ? const CupertinoActivityIndicator(
                          radius: 16,
                        )
                      : ListView.builder(
                          itemCount: ctr.orderGetDeliverModel!.data!.data!.length,
                          // itemCount: 1,
                          itemBuilder: (context, index) {
                            final data = ctr.orderGetDeliverModel!.data!.data![index];

                            // Validate and safely handle the `uploadPath`
                            String imagePath = ApiConst.baseUrl;
                            if (data.uploadPath != null && data.uploadPath!.length > 21) {
                              imagePath += data.uploadPath!.substring(21);
                            } else {
                              imagePath += ""; // Default or fallback value
                            }

                            // Validate and safely handle the `allAmount`
                            String allAmount = "0";
                            if (data.allAmount != null) {
                              allAmount = data.allAmount!.toString();
                              if (allAmount.length > 5) {
                                allAmount = allAmount.substring(0, 5);
                              }
                            }
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  onTap: () {
                                    showModalBottomSheet(
                                      useSafeArea: true,
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (context) {
                                        return HomeTrackingPage(
                                          orderPage: true,
                                          orderId: data.orderId,
                                          jami: allAmount,
                                          mahsulot: data.foodsAmount.toString(),
                                          yetkazish: data.deliverAmount.toString(),
                                          restaurantName: data.restaurantName,
                                        );
                                        // s=t,d=t => bajarildi :res = avvalgi page, && res = success
                                        // +   // s=t, d=f => kuryer yo'lda : res = hozirgi page
                                        // s=f, d=f => user atmen qildi : res = avvalgi page, && res =  not success
                                      },
                                    );
                                    // ctr.updateOrderStatusIdVm(id: "${data.orderId}", status: false);
                                  },
                                  leading: CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(imagePath),
                                  ),
                                  title: Text("${data.restaurantName}"),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("${data.allAmount} ${"so'm".tr()}"),
                                      // Text(
                                      //   "0${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year} "
                                      //   "${DateTime.now().hour}:${DateTime.now().minute}",
                                      // ),
                                      Text(
                                        ctr.orderGetDeliverModel!.data!.data![index].createdAtOrder.toString().substring(0, 16),
                                      ),
                                    ],
                                  ),
                                  // trailing: const Icon(Icons.navigate_next),
                                  trailing: IconButton(
                                    onPressed: () {
                                      ctr.updateOrderDeliverIdVm(id: "${data.orderId}", status: true);
                                    },
                                    icon: const Icon(Icons.navigate_next),
                                  ),
                                ),
                                const Divider(),
                              ],
                            );
                          },
                        ),
              ctr.orderGetDeliverModel == null
                  ? const Center(
                      child: Text("Tarix ro'yhati bo'sh"),
                    )
                  : ctr.loadingOrders
                      ? const CupertinoActivityIndicator(
                          radius: 16,
                        )
                      : ListView.builder(
                          itemCount: ctr.orderGetAllUsersModel!.data!.data!.length,
                          // itemCount: 1,
                          itemBuilder: (context, index) {
                            // final order = ctr.ordersList[index];
                            final userOrderItem = ctr.orderGetAllUsersModel!.data!.data![index];
                            return ((userOrderItem.status == true && userOrderItem.deliver == false))
                                ? const SizedBox.shrink()
                                : Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          showModalBottomSheet(
                                            useSafeArea: true,
                                            isScrollControlled: true,
                                            context: context,
                                            builder: (context) {
                                              return HomeTrackingPage(
                                                orderPage: true,
                                                orderId: userOrderItem.orderId,
                                                jami: '${userOrderItem.allAmount}',
                                                mahsulot: "${userOrderItem.foodsAmount}",
                                                yetkazish: "${userOrderItem.deliverAmount}",
                                                restaurantName: userOrderItem.restaurantName,
                                              );
                                              // s=t,d=t => bajarildi :res = avvalgi page, && res = success
                                              // +   // s=t, d=f => kuryer yo'lda : res = hozirgi page
                                              // s=f, d=f => user atmen qildi : res = avvalgi page, && res =  not success
                                            },
                                          );
                                        },
                                        child: ListTile(
                                          // leading: Image.asset("assets/images/images.jpeg"),
                                          // leading: Image.network(
                                          //   "${ApiConst.baseUrl}${ctr.orderGetAllUsersModel!.data!.data![index].uploadPath!.substring(21)}",
                                          // ),
                                          leading: CircleAvatar(
                                            radius: 30.r,
                                            backgroundImage: NetworkImage(
                                              "${ApiConst.baseUrl}${ctr.orderGetAllUsersModel!.data!.data![index].uploadPath!.substring(21)}",
                                            ),
                                          ),
                                          // leading: Image.asset(
                                          //   "${ApiConst.baseUrl}${ctrDetail.getRestaurantIdModel!.data!.uploadPath!.substring(21)}",
                                          // ),
                                          // title: Text(order['title']!),
                                          title: Text("${ctr.orderGetAllUsersModel!.data!.data![index].restaurantName}"),
                                          subtitle: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  "${ctr.orderGetAllUsersModel!.data!.data![index].allAmount.toString().substring(0, 5)} ${"so'm".tr()}"),
                                              // Text(
                                              //   "0${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year} ${DateTime.now().hour}:${DateTime.now().minute}",
                                              // ),
                                              Text(
                                                  ctr.orderGetAllUsersModel!.data!.data![index].updatedAtOrder.toString().substring(0, 16)),
                                              Text(
                                                (userOrderItem.status == true && userOrderItem.deliver == true)
                                                    ? "success".tr()
                                                    : "notSuccess".tr(),
                                                style: TextStyle(
                                                  color: ctr.orderGetAllUsersModel!.data!.data![index].status == true
                                                      ? Colors.green
                                                      : Colors.red,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                          trailing: const Icon(Icons.navigate_next),
                                        ),
                                      ),
                                      const Divider(),
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
