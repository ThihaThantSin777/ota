

import 'package:flutter/material.dart';
import 'package:ota/resources/dimension.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(spacing1x),
      child: ListView(

        children:  [
         const Text(
            'If you require any more information or have any questions about our privacy policy, please feel free to contact us by email at zayarmoekaung0@gmail.com.',
            style: TextStyle(
                fontSize: fontSizeregular2x
            ),
          ),
       const  Text(
            'At https://otamyanmar.com/, the privacy of our visitors is of extreme importance to us. This privacy policy document outlines the types of personal information is received and collected by https://otamyanmar.com/ and how it is used.',
            style: TextStyle(
                fontSize: fontSizeregular2x
            ),
          ),
          const SizedBox(
            height: spacing2x,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:const [
              Text(
                'Log File',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                    fontSize: fontSizeregular2x
                ),
              ),
              Text(
                'Like many other Web sites, https://otamyanmar.com/ makes use of log files. The information inside the log files includes internet protocol ( IP ) addresses, type of browser, Internet Service Provider ( ISP ), date/time stamp, referring/exit pages, and number of clicks to analyze trends, administer the site, track users movement around the site, and gather demographic information. IP addresses, and other such information are not linked to any information that is personally identifiable.',
                style: TextStyle(
                    fontSize: fontSizeregular2x
                ),
              ),
            ],
          ),
          const SizedBox(
            height: spacing2x,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:const [
              Text(
                'Cookies and Web Beacons',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: fontSizeregular2x
                ),
              ),
              Text(
                'https://otamyanmar.com/ does not use cookies.',
                style: TextStyle(
                    fontSize: fontSizeregular2x
                ),
              ),
            ],
          ),
          const SizedBox(
            height: spacing2x,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:const [
              Text(
                'DoubleClick DART Cookie',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: fontSizeregular2x
                ),
              ),
              Text(
                ':: Google, as a third party vendor, uses cookies to serve ads on https://otamyanmar.com/..',
                style: TextStyle(
                    fontSize: fontSizeregular2x
                ),

              ),
              Text(
                '.:: Google\'s use of the DART cookie enables it to serve ads to your users based on their visit to https://otamyanmar.com/ and other sites on the Internet.',
                style: TextStyle(
                    fontSize: fontSizeregular2x
                ),

              ),
              Text(
                ':: Users may opt out of the use of the DART cookie by visiting the Google ad and content network privacy policy at the following URL - http://www.google.com/privacy_ads.html',
                style: TextStyle(
                    fontSize: fontSizeregular2x
                ),

              ),
            ],
          ),
          const SizedBox(
            height: spacing2x,
          ),

        ],
      ),
    );
  }
}
