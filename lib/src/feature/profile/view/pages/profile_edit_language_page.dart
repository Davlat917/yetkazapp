import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tezyetkazz/src/core/storage/app_storage.dart';
import 'package:tezyetkazz/src/feature/map/view/page/yandex_page.dart';
import 'package:tezyetkazz/src/feature/profile/view/widget/custom_checkbox_widget.dart';
import 'package:tezyetkazz/src/feature/profile/view_model/vm/profile_vm.dart';

import '../../../../core/widgets/button_widget.dart';

class ProfileEditLanguagePage extends ConsumerWidget {
  const ProfileEditLanguagePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ctr = ref.read(profileVm);
    ref.watch(profileVm);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.yellow.shade600,
      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.45,
            width: double.infinity,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.yellow.shade600,
              ),
              child: Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.12),
                child: Image.asset(
                  'assets/images/2024-07-21_07.46.42-removebg-preview.png',
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.42,
              width: double.infinity,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Text(
                        "Tilni tanlang (Выберите язык)",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "O'zbekcha",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                          CustomCheckboxWidget(
                            isSelected: context.locale.languageCode == "uz",
                            onTap: () {
                              context.setLocale(const Locale("uz", "UZ"));
                              ctr.translate();
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Русский",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                          CustomCheckboxWidget(
                              isSelected: context.locale.languageCode == "ru",
                              onTap: () {
                                context.setLocale(const Locale("ru", "RU"));
                                ctr.translate();
                              }),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
                      child: ButtonWidget(
                        text: "Tanlash (Выбрат)",
                        onPressed: () async {
                          if (await AppStorage.$read(key: StorageKey.initialKey) == "Success") {
                            Navigator.pop(context);
                          } else {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => const CustomYandexMap()),
                              ModalRoute.withName(""),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
