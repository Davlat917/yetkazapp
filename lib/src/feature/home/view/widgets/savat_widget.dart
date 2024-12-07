// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:tezyetkazz/src/feature/home/view_model/vm/home_detail_vm.dart';
//
// class SavatWidget extends ConsumerWidget {
//   final String image;
//   final String name;
//   final int count;
//   final num price;
//
//   const SavatWidget({
//     super.key,
//     required this.image,
//     required this.name,
//     required this.count,
//     required this.price,
//   });
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     var ctr = ref.read(homeDetailVmProvider);
//     ref.watch(homeDetailVmProvider);
//
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Image.network(
//           image,
//           width: 60.h,
//         ),
//         SizedBox(
//           height: 25.h,
//           width: 80.w,
//           child: DecoratedBox(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(30),
//               color: Colors.grey.shade300,
//             ),
//             child: Padding(
//               padding: REdgeInsets.symmetric(horizontal: 10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   InkWell(
//                     child: const Text("-"),
//                     onTap: () {
//                       ctr.decrement();
//                     },
//                   ),
//                   Text("${count}"),
//                   InkWell(
//                     child: const Text("+"),
//                     onTap: () {
//                       ctr.increment();
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 name,
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 1,
//                 style: TextStyle(fontSize: 16),
//               ),
//               Text(
//                 "$price ${"so'm".tr()}",
//                 style: TextStyle(
//                   fontSize: 15,
//                   color: Colors.grey.shade500,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
