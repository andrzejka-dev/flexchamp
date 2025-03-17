import 'package:flexchamp/app/core/enums.dart';
import 'package:flexchamp/domain/repositories/details_repository.dart';
import 'package:flexchamp/features/details/cubit/details_cubit.dart';
import 'package:flexchamp/features/details/cubit/details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../home/home_widgets/home_page_widgets_extract.dart';
import '../details_widgets/details_page_widget_extract.dart';




class DetailsPage extends StatelessWidget {
  final String title;

  const DetailsPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsCubit(DetailsRepository())..getDetails(title),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: DetailsAppBar(title: title),
        body: DetailsGradientBackground(

          child: BlocBuilder<DetailsCubit, DetailsState>(
            builder: (context, state) {
              switch (state.status) {
                case Status.initial:
                case Status.loading:
                  return const LoadingIndicator();
                
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
                      DetailsSliverAppBar(figure: figure),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            if (index >= figure.names.length) return null;
                            
                            return ExerciseCard(
                              exerciseName: figure.names[index],
                              exerciseDescription: figure.descriptions[index],
                              figure: figure,
                              categoryTitle: title,
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

