import 'package:flutter/material.dart';
import 'package:plexion/services/chat_web_service.dart';
import 'package:plexion/theme/colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SourcesSection extends StatefulWidget {
  const SourcesSection({super.key});

  @override
  State<SourcesSection> createState() => _SourcesSectionState();
}

class _SourcesSectionState extends State<SourcesSection> {
  bool isLoading = true;
  List searchResult = [
    {
      'title': 'Docs | Flutter',
      'url': 'https://docs.flutter.dev'
    },
    {
      'title': 'Effective Dart: Documentation',
      'url': 'https://dart.dev/effective-dart/documentation'
    },
    {
      'title': 'Intro to Dart - Flutter Documentation',
      'url': 'https://docs.flutter.dev/get-started/fundamentals/dart'
    },
    {
      'title': 'Dart documentation',
      'url': 'https://dart.dev/docs'
    },

  ];

  @override
  void initState() {
    super.initState();
    ChatWebService().searchResulStream.listen((data) {
      setState(() {
        searchResult = data['data'];
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.source_outlined,
            color: Colors.white70,
            ),
            SizedBox(width: 8,),
            Text("Sources",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
            )
          ],
        ),
        const SizedBox(height: 16,),
        Skeletonizer(
          enabled: isLoading,
          child: Wrap(
          spacing: 16,
          runSpacing: 16,
          children: searchResult.map((res) {
            return Container(
              width: 150,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.circular(8)
              ),
              child: Column(
                children: [
                  Text(res['title'],
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8,),
                  Text(res['url'],
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            );
          }).toList(),
        )
        )
      ],
    );
  }
}