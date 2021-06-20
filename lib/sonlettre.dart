import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class SonLettre extends StatefulWidget {
  final String titre;
  final String fichier;
  //SonLettre({Key? key, required this.titre, required this.fichier})
  SonLettre({Key key, this.titre, this.fichier}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SonLettre> {
  AudioPlayer player;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }

  @override
  void dispose() {
    player.dispose();
    // player2.dispose();
    super.dispose();
  }

  Future lire() async {
    await player.setAsset(widget.fichier);
    player.play();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Expanded(child: boutonIcon()),
    );
  }

  Widget boutonIcon() {
    return Container(
      color: Colors.yellow,
      child: Center(
        child: IconButton(
          icon: const Icon(Icons.record_voice_over),
          color: Colors.blue,
          onPressed: () {
            lire();
          },
        ),
      ),
    );
  }
}
