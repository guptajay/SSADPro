// Copyright 2019 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:share/share.dart';

class SocialMedia extends StatefulWidget {
  @override
  SocialMediaState createState() => SocialMediaState();
}

class SocialMediaState extends State<SocialMedia> {
  String text = '';
  String subject = '';

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
                        Image(
                            image:
                                AssetImage("assets/images/whatsapp_logo.png"),
                            height: 35.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Invite Students via WhatsApp',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ])),
              onPressed: () {
                // A builder is used to retrieve the context immediately
                // surrounding the RaisedButton.
                //
                // The context's `findRenderObject` returns the first
                // RenderObject in its descendent tree when it's not
                // a RenderObjectWidget. The RaisedButton's RenderObject
                // has its position and size after it's built.
                final RenderBox box = context.findRenderObject();
                Share.share(
                    "Hey there, I'm an Instructor at SSADPro. Download the app now to start your learning journey on Software Systems Analysis & Design at https://github.com/guptajay/SSADPro",
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
