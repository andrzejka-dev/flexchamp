import 'package:flexchamp/domain/models/detail_model.dart';
import 'package:flutter/material.dart';

class DetailsSliverAppBar extends StatelessWidget {
  final DetailModel figure;
  
  const DetailsSliverAppBar({
    super.key,
    required this.figure,
  });
  
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      expandedHeight: 180.0,
      floating: false,
      pinned: true,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        title: null,
        background: figure.photoURLs.isNotEmpty
            ? Image.network(
                figure.photoURLs.first,
                fit: BoxFit.cover,
              )
            : Container(color: Colors.purple.withAlpha(53)),
      ),
    );
  }
}