import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pamride/widgets/pamride_navigation_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaButtons extends StatelessWidget {
  const SocialMediaButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () async {
                const url = 'https://www.linkedin.com';
                final uri = Uri.parse(url);
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              },
              child: Container(
                height: 28,
                width: 28,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(23.5),
                  border: Border.all(color: Colors.blue, width: 1.5),
                ),
                child: SvgPicture.asset('assets/assets/linkedin-icon.svg'),
              ),
            ),
            GestureDetector(
              onTap: () async {
                const url = 'https://twitter.com';
                final uri = Uri.parse(url);
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              },
              child: Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: SvgPicture.asset('assets/assets/twitter-icon.svg'),
              ),
            ),
            GestureDetector(
              onTap: () async {
                const url = 'https://www.facebook.com';
                final uri = Uri.parse(url);
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              },
              child: Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: SvgPicture.asset('assets/assets/facebook-icon.svg'),
              ),
            ),
            Container(
              child: Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: whatsAppFloatingActionButton(30, 30, "Hi,  "),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
