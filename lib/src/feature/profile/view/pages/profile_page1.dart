import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezyetkazz/src/core/storage/app_storage.dart';
import 'package:tezyetkazz/src/core/widgets/button_navigation_bar.dart';
import 'package:tezyetkazz/src/feature/auth/view/pages/auth_page.dart';
import 'package:tezyetkazz/src/feature/profile/view/pages/profile_bildirishnomalar_page.dart';
import 'package:tezyetkazz/src/feature/profile/view/pages/profile_card_page.dart';
import 'package:tezyetkazz/src/feature/profile/view/pages/profile_edit_language_page.dart';
import 'package:tezyetkazz/src/feature/profile/view/pages/profile_edit_page.dart';
import 'package:tezyetkazz/src/feature/profile/view/widget/profile_category_widget2.dart';
import 'package:tezyetkazz/src/feature/profile/view_model/vm/profile_vm.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://my.gov.uz/oz/pages/offer_e_pay');

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}

class ProfilePage1 extends ConsumerWidget {
  const ProfilePage1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var ctr = ref.read(profileVm);
    ref.watch(profileVm);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Text(
          "profile".tr(),
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            20.verticalSpace,
            Center(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/svg 2.png",
                    height: 90.h,
                    width: 90.w,
                  ),
                  10.verticalSpace,
                  Text(
                    "${ctr.ismTextEditingController.text}",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "+998994646057",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            40.verticalSpace,
            ProfileCategoryWidget2(
              text: "infoEdit".tr(),
              icon: const Icon(Icons.edit_outlined),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileEditPage(),
                  ),
                );
              },
            ),
            ProfileCategoryWidget2(
              text: "bildirishnomalar".tr(),
              icon: const Icon(Icons.notifications_none_outlined),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileBildirishnomalarPage(),
                  ),
                );
              },
            ),
            ProfileCategoryWidget2(
              text: "myCards".tr(),
              icon: const Icon(Icons.credit_card),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileCardPage(),
                  ),
                );
              },
            ),
            ProfileCategoryWidget2(
              text: "languageEdit".tr(),
              icon: const Icon(Icons.language),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileEditLanguagePage(),
                  ),
                );
              },
            ),
            ProfileCategoryWidget2(
              text: "ommaviyOfferta".tr(),
              icon: const Icon(Icons.copy_rounded),
              onTap: () {
                _launchUrl();
              },
            ),
            ProfileCategoryWidget2(
              text: "deleteAccount".tr(),
              icon: const Icon(Icons.delete_forever_outlined),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: Text(
                        "deleteAccount".tr(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      content: Text(
                        "deleteDialog".tr(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "bekor qilish".tr(),
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.blueAccent.shade700,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "edit".tr(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            ProfileCategoryWidget2(
              text: "exit".tr(),
              icon: const Icon(Icons.login_outlined),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: Text(
                        "exit".tr(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      content: Text(
                        "siz rostan ham o'z profilingizdan chiqmoqchimisiz?".tr(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "bekor qilish".tr(),
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.blueAccent.shade700,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            await AppStorage.$delete(key: StorageKey.accessToken);
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => ButtonNavigationBar()),
                              ModalRoute.withName("/"),
                            );
                          },
                          child: Text(
                            "exit".tr(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            InkWell(
              child: const Text("+998992173126"),
              onTap: () async {
                final Uri url = Uri(
                  scheme: "tel",
                  path: "+998992173126",
                );
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  debugPrint("Cannot not found");
                }
              },
            ),
            const Text("1.0.0(1)"),
          ],
        ),
      ),
    );
  }
}
