import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giphy_picker/src/model/giphy_client.dart';
import 'package:giphy_picker/src/widgets/giphy_image.dart';

/// Presents a Giphy preview image.
class GiphyPreviewPage extends StatelessWidget {
  final GiphyGif gif;
  final Widget? title;
  final bool showGiphyAttribution;
  final ValueChanged<GiphyGif>? onSelected;

  const GiphyPreviewPage(
      {super.key,
      required this.gif,
      required this.onSelected,
      this.title,
      this.showGiphyAttribution = true});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Container(
            margin:
            const EdgeInsets.only(left: 10),
            decoration: const BoxDecoration(
                shape: BoxShape.circle),
            child: IconButton(
              icon: const Icon(CupertinoIcons.back,
                  size: 19,
               ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          title: title,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: () => onSelected?.call(gif),
            ),
          ],
        ),
        body: SafeArea(
          bottom: false,
          child: Center(
              child: GiphyImage.original(
            gif: gif,
            width: media.orientation == Orientation.portrait
                ? double.maxFinite
                : null,
            height: media.orientation == Orientation.landscape
                ? double.maxFinite
                : null,
            fit: BoxFit.contain,
            showGiphyAttribution: showGiphyAttribution,
          )),
        ));
  }
}
