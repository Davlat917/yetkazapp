import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tezyetkazz/src/feature/profile/view/widget/profile_category_listtile_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import '../pages/profile_bildirishnomalar_page.dart';
import '../pages/profile_call_edit_page.dart';
import '../pages/profile_card_page.dart';
import '../pages/profile_edit_language_page.dart';
import '../pages/profile_edit_page.dart';

class ProfileCategoryWidget extends StatelessWidget {
  ProfileCategoryWidget({super.key});

  final Uri _url = Uri.parse('https://my.gov.uz/oz/pages/offer_e_pay');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          height: 20,
          thickness: 2,
          color: Colors.grey.shade300,
        ),
        ProfileCategoryListtileWidget(
          splashColor: Colors.grey,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfileEditPage(),
              ),
            );
          },
          leading: const Icon(Icons.edit),
          title: const Text(
            "Ma'lumotlarni o'zgartirish",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: const Text("Ism va familiyani o'zgartirish"),
          trailing: const Icon(Icons.navigate_next),
        ),
        Divider(
          height: 20,
          thickness: 2,
          color: Colors.grey.shade300,
        ),
        ProfileCategoryListtileWidget(
          splashColor: Colors.grey,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileCallEditPage(),
              ),
            );
          },
          leading: const Icon(Icons.call),
          title: const Text(
            "Telefon raqamini o'zgartirish",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: const Icon(Icons.navigate_next),
        ),
        Divider(
          height: 20,
          thickness: 2,
          color: Colors.grey.shade300,
        ),
        ProfileCategoryListtileWidget(
          splashColor: Colors.grey,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfileBildirishnomalarPage(),
              ),
            );
          },
          leading: const Icon(Icons.notifications),
          title: const Text(
            "Bildirishnomalar",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: const Text("Bildirishnomalarni o'zgartirish"),
          trailing: const Icon(Icons.navigate_next),
        ),
        Divider(
          height: 20,
          thickness: 2,
          color: Colors.grey.shade300,
        ),
        ProfileCategoryListtileWidget(
          splashColor: Colors.grey,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfileCardPage(),
              ),
            );
          },
          leading: const Icon(Icons.credit_card),
          title: const Text(
            "Mening kartalarim",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: const Icon(Icons.navigate_next),
        ),
        Divider(
          height: 20,
          thickness: 2,
          color: Colors.grey.shade300,
        ),
        ProfileCategoryListtileWidget(
          splashColor: Colors.grey,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfileEditLanguagePage(),
              ),
            );
          },
          leading: const Icon(Icons.language),
          title: const Text(
            "Tilni o'zgartirish",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: const Icon(Icons.navigate_next),
        ),
        Divider(
          height: 20,
          thickness: 2,
          color: Colors.grey.shade300,
        ),
        ProfileCategoryListtileWidget(
          splashColor: Colors.grey,
          onTap: () {
            _launchUrl();
          },
          leading: const Icon(Icons.copy_rounded),
          title: const Text(
            "Ommaviy oferta",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: const Text("Ommaviy oferta"),
          trailing: const Icon(Icons.navigate_next),
        ),
        Divider(
          height: 20,
          thickness: 2,
          color: Colors.grey.shade300,
        ),
      ],
    );
  }
}
