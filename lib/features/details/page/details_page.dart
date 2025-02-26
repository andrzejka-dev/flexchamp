import 'package:flexchamp/app/core/enums.dart';
import 'package:flexchamp/domain/repositories/details_repository.dart';
import 'package:flexchamp/features/details/cubit/details_cubit.dart';
import 'package:flexchamp/features/details/cubit/details_state.dart';
import 'package:flexchamp/features/details/page/photo_mapping_util.dart';
import 'package:flexchamp/features/home/widgets/photo_gallery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DetailsPage extends StatelessWidget {
  final String title;

  const DetailsPage({super.key, required this.title});

@override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsCubit(DetailsRepository())..getDetails(title),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        // Custom AppBar with only a white back arrow and "BACK" text
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Icon(Icons.arrow_back, color: Colors.white, size: 20),
                ),
                const Text(
                  "BACK",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          leadingWidth: 80, // Provide enough space for the arrow and text
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF7B63AA), // Brighter purple at top
                Color(0xFFA77CB2), // Vibrant mid purple
                Color(0xFFD3A1B8), // Bright mauve/pink
                Color(0xFFFFB091), // Lighter orange at bottom                
             ],
            ),
          ),
          child: BlocBuilder<DetailsCubit, DetailsState>(
            builder: (context, state) {
              switch (state.status) {
                case Status.initial:
                case Status.loading:
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  );
                
                case Status.success:
                  if (state.figures.isEmpty) {
                    return const Center(
                      child: Text(
                        'No figures found',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }
                  
                  final figure = state.figures.first;
                  return CustomScrollView(
                    slivers: [
                      // Modify SliverAppBar to not show title text
                      SliverAppBar(
                        backgroundColor: Colors.transparent,
                        expandedHeight: 180.0,
                        floating: false,
                        pinned: true,
                        // Remove back button and other navigation icons
                        automaticallyImplyLeading: false,
                        flexibleSpace: FlexibleSpaceBar(
                          // Remove the title text
                          title: null,
                          background: figure.photoURLs.isNotEmpty
                              ? Image.network(
                                  figure.photoURLs.first,
                                  fit: BoxFit.cover,
                                )
                              : Container(color: Colors.purple.withAlpha(53)),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            if (index >= figure.names.length) return null;
                            
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 8.0,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withAlpha(51),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      figure.names[index],
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                      bottom: Radius.circular(12),
                                    ),
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: 250,
                                      child: PhotoGallery(
                                        photoURLs: PhotoMappingUtil.getPhotoURLsForExercise(
                                        figure,
                                        figure.names[index],
                                        title,
                                      )
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      figure.descriptions[index],
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          childCount: state.figures.isEmpty ? 0 : state.figures.first.names.length,
                        ),
                      ),
                    ],
                  );
                
                case Status.error:
                  return Center(
                    child: Text(
                      'Error: ${state.errorMessage}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}

