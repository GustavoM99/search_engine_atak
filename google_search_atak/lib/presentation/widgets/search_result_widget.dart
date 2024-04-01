import 'package:flutter/material.dart';
import '/utils/colors.dart';
import '/presentation/widgets/texts/link_text.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchResultWidget extends StatelessWidget {
  final String linkToGo;
  final String link;
  final String text;
  const SearchResultWidget({
    Key? key,
    required this.linkToGo,
    required this.link,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0,),
          child: Text(
          text, style: TextStyle(
              fontSize: 20),
        ),
        ),
        Padding(padding: const EdgeInsets.only(bottom: 8.0),
        child: 
        LinkText(
            link: link,
            text: link,
            textStyle: const TextStyle(
              color: blueColor,
              fontSize: 14,
            ),
            onTap: () async {
              if (await canLaunch(linkToGo)) {
                await launch(linkToGo);
              }
            },
          ),
        )
        
      ],
    );
  }
}
