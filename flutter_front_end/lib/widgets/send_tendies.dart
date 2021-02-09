import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SendTendies extends StatelessWidget {
  const SendTendies({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      //padding: EdgeInsets.all(16.0),
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      onPressed: _launchURL,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('images/rocket.png', scale: 5),
          Text(
            'Send Tendies',
            style: TextStyle(
                fontFamily: 'Cookie',
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

_launchURL() async {
  const url = 'https://www.buymeacoffee.com/petermclay';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
