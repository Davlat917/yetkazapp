import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widget/profile_amal_textfield_widget.dart';
import '../widget/profile_custom_textfield_widget.dart';

class ProfileAddCardPage extends StatefulWidget {
  const ProfileAddCardPage({super.key});

  @override
  _ProfileAddCardPageState createState() => _ProfileAddCardPageState();
}

class _ProfileAddCardPageState extends State<ProfileAddCardPage> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();

  final Uri _url = Uri.parse('https://cdn.payme.uz/terms/ru/main.html');

  @override
  void initState() {
    super.initState();
    _cardNumberController.addListener(_checkFields);
    _expiryDateController.addListener(_checkFields);
  }

  void _checkFields() {
    setState(() {});
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    super.dispose();
  }

  bool get _isButtonEnabled {
    return _cardNumberController.text.length == 19 && _expiryDateController.text.length == 5;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.yellow.shade600,
        title: Text("addCard".tr()),
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 15, vertical: 60),
        child: Stack(
          children: [
            Image.asset('assets/images/2024-07-21 05.36.47.jpg'),
            Padding(
              padding: REdgeInsets.only(left: 17.sp, top: 25.sp),
              child: Text(
                "Powered by",
                style: TextStyle(fontSize: 12.sp),
              ),
            ),
            Image.asset(
              'assets/images/payme-01.png',
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Align(
                alignment: const Alignment(0, -0.7),
                child: CustomTextField(controller: _cardNumberController),
              ),
            ),
            Align(
              alignment: const Alignment(0, -0.47),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('amal qilish muddati'.tr()),
                  20.horizontalSpace,
                  SizedBox(
                    width: 80.w,
                    child: AmalTextFieldWidget(controller: _expiryDateController),
                  ),
                ],
              ),
            ),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 15),
              child: Align(
                alignment: const Alignment(0, -0.18),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'davom etish tugmasi bosish bilan Siz'.tr(),
                        style: const TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            _launchUrl();
                          },
                        text: 'ommaviy offerta'.tr(),
                        style: TextStyle(color: Colors.yellow.shade600),
                      ),
                      TextSpan(
                        text: "shartlariga rozilik bildirgan bo'lasiz".tr(),
                        style: const TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0, 1),
              child: ElevatedButton(
                onPressed: _isButtonEnabled
                    ? () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.red,
                            content: Text("Undefined array key (testEnabled)"),
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  shadowColor: Colors.black,
                  backgroundColor: _isButtonEnabled ? Colors.yellow.shade600 : Colors.grey.shade300,
                  minimumSize: const Size(double.infinity, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      5.0,
                    ),
                  ),
                ),
                child: Text(
                  "davom etish".tr(),
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
