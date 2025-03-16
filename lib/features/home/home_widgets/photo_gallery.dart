import 'package:flutter/material.dart';

class PhotoGallery extends StatefulWidget {
  final List<String> photoURLs;

  const PhotoGallery({super.key, required this.photoURLs});

  @override
  State<PhotoGallery> createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGallery> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.photoURLs.isEmpty) {
      return const Center(
        child: Icon(
          Icons.image_not_supported,
          color: Colors.white,
          size: 50,
        ),
      );
    }

    return Stack(
      children: [
        // PageView for swipeable photos
        PageView.builder(
          controller: _pageController,
          itemCount: widget.photoURLs.length,
          onPageChanged: (index) {
            setState(() {
              _currentPage = index;
            });
          },
          itemBuilder: (context, index) {
            return Image.network(
              widget.photoURLs[index],
              fit: BoxFit.cover,
              width: double.infinity,
              height: 230,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox(
                  height: 200,
                  child: Center(
                    child: Icon(
                      Icons.error_outline,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            );
          },
        ),
        
        // Page indicator dots
        if (widget.photoURLs.length > 1)
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.photoURLs.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index 
                      ? Colors.white 
                      : Colors.white.withAlpha(100),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}