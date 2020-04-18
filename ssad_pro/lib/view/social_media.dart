/**
 * This class return the logic of incorporating
 * social media in the application.
 * 
 * @author Jay Gupta
 */

import 'package:flutter/material.dart';
import 'package:share/share.dart';

class SocialMedia extends StatefulWidget {
  SocialMedia({this.text, this.image, this.shareText});
  final String text;
  final String image;
  final String shareText;
  @override
  SocialMediaState createState() => SocialMediaState();
}

class SocialMediaState extends State<SocialMedia> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Builder(
          builder: (BuildContext context) {
            return RaisedButton(
              splashColor: Colors.white,
              color: Colors.blue[300],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              highlightElevation: 0,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image(image: AssetImage(widget.image), height: 35.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            widget.text,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ])),
              onPressed: () {
                final RenderBox box = context.findRenderObject();
                Share.share(widget.shareText,
                    subject: "No Subject",
                    sharePositionOrigin:
                        box.localToGlobal(Offset.zero) & box.size);
              },
            );
          },
        ),
      ],
    );
  }
}
