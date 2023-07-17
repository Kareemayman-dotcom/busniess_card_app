import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() {
  runApp(const BusinessCardApp());
}

class BusinessCardApp extends StatelessWidget {
  final String phoneNumberUrl = "tel:01095626660";
  const BusinessCardApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: const Color(0xFF2B475E),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30.w,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 29.w,
                      backgroundImage:
                          const AssetImage('assets/images/kareem_ayman.png'),
                    ),
                  ),
                  const Text(
                    'Kareem Ayman',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontFamily: 'Pacifico',
                    ),
                  ),
                  const Text(
                    'FLUTTER DEVELOPER',
                    style: TextStyle(
                      color: Color(0xFF6C8090),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Divider(
                    color: const Color(0xFF6C8090),
                    thickness: 1.sp,
                    indent: 8.w,
                    endIndent: 8.w,
                    height: 2.h,
                  ),
                  ListTile(
                    onTap: () async {
                      // if (Platform.isAndroid) {
                      //   final AndroidIntent intent = AndroidIntent(
                      //     action: 'android.intent.action.DIAL',
                      //     data:
                      //         'tel:01095626660', // Replace with the actual phone number
                      //   );
                      //   intent.launch();
                      // }
                      if (await canLaunchUrlString(phoneNumberUrl)) {
                        await launchUrlString(phoneNumberUrl);
                      } else {
                        print('Cantno launch the URL');
                      }
                    },
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    leading: Icon(
                      Icons.phone,
                      size: 23.sp,
                      color: const Color(0xFF2B475E),
                    ),
                    title: Text(
                      '(+20)1095626660',
                      style: TextStyle(fontSize: 17.sp),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  ListTile(
                    onTap: () async {
                      if (await canLaunchUrlString(
                          'mailto:kareem.ayman1622@gmail.com')) {
                        await launchUrlString(
                            'mailto:kareem.ayman1622@gmail.com');
                      }
                    },
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    leading: Icon(
                      Icons.mail,
                      size: 23.sp,
                      color: const Color(0xFF2B475E),
                    ),
                    title: Text(
                      'kareem.ayman1622@gmail.com',
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
