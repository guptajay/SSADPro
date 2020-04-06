import 'package:flutter/material.dart';
import 'dart:async';
import 'package:volume/volume.dart';
import 'package:volume/volume.dart';
import 'package:flutter/cupertino.dart';
import 'package:ssadpro/view/appbar.dart';

class SystemSettings extends StatefulWidget {
  @override
  _SystemSettingsState createState() => _SystemSettingsState();
}

class _SystemSettingsState extends State<SystemSettings> {
  AudioManager audioManager;
  AudioManager audioManager1;
  int maxVol, currentVol;
  int maxVol1, currentVol1;

  @override
  void initState() {
    super.initState();
    audioManager = AudioManager.STREAM_SYSTEM;
    audioManager1 = AudioManager.STREAM_MUSIC;
    initPlatformState1();
    updateVolumes1();
    initPlatformState();
    updateVolumes();
  }

  Future<void> initPlatformState() async {
    await Volume.controlVolume(AudioManager.STREAM_SYSTEM);
  }

  Future<void> initPlatformState1() async {
    await Volume.controlVolume(AudioManager.STREAM_MUSIC);
  }

  updateVolumes() async {
    // get Max Volume
    maxVol = await Volume.getMaxVol;
    // get Current Volume
    currentVol = await Volume.getVol;
    setState(() {});
  }

  updateVolumes1() async {
    // get Max Volume
    maxVol1 = await Volume.getMaxVol;
    // get Current Volume
    currentVol1 = await Volume.getVol;
    setState(() {});
  }

  setVol(int i) async {
    await Volume.setVol(i);
  }

  setVol1(int j) async {
    await Volume.setVol(j);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableWidgets.getAppBar(
          "Settings", Colors.blue[600], Colors.grey[50]),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
          ),
          DropdownButton(
            value: audioManager,
            //focusColor: Colors.blueAccent.shade700,
            icon: Icon(Icons.volume_down),
            iconSize: 30,
            iconEnabledColor: Colors.blueAccent.shade700,
            //elevation: 10,
            style: TextStyle(fontSize: 25.0, color: Colors.blueAccent.shade700),

            items: [
              DropdownMenuItem(
                child: Text("System Volume "),
                value: AudioManager.STREAM_SYSTEM,
              ),
            ],
            isDense: true,
            onChanged: (AudioManager aM) async {
              AudioManager aM = AudioManager.STREAM_SYSTEM;
              print(aM.toString());
              setState(() {
                audioManager = AudioManager.STREAM_SYSTEM;
              });
              await Volume.controlVolume(AudioManager.STREAM_SYSTEM);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35.0),
          ),
          (currentVol != null || maxVol != null)
              ? CupertinoSlider(
                  value: currentVol / 1.0,
                  divisions: maxVol,
                  max: maxVol / 1.0,
                  min: 0,
                  onChanged: (double d) {
                    setVol(d.toInt());
                    updateVolumes();
                  },
                )
              : Container(),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
          ),
          DropdownButton(
            value: audioManager1,
            //focusColor: Colors.blueAccent.shade700,
            icon: Icon(Icons.volume_down),
            iconSize: 30,
            iconEnabledColor: Colors.blueAccent.shade700,
            //elevation: 10,
            style: TextStyle(fontSize: 25.0, color: Colors.blueAccent.shade700),

            items: [
              DropdownMenuItem(
                child: Text("Media Volume"),
                value: AudioManager.STREAM_MUSIC,
              ),
            ],
            isDense: true,
            onChanged: (AudioManager bm) async {
              AudioManager bm = AudioManager.STREAM_MUSIC;
              print(bm.toString());
              setState(() {
                audioManager1 = AudioManager.STREAM_MUSIC;
              });
              await Volume.controlVolume(AudioManager.STREAM_MUSIC);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35.0),
          ),
          (currentVol1 != null || maxVol1 != null)
              ? CupertinoSlider(
                  value: currentVol1 / 1.0,
                  divisions: maxVol1,
                  max: maxVol1 / 1.0,
                  min: 0,
                  onChanged: (double e) {
                    setVol1(e.toInt());
                    updateVolumes1();
                  },
                )
              : Container(),
        ],
      ),
    );
  }
}
