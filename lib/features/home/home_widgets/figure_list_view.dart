import 'package:flexchamp/app/core/enums.dart';
import 'package:flexchamp/features/home/cubit/figure_cubit.dart';
import 'package:flexchamp/features/home/cubit/figure_state.dart';
import 'package:flexchamp/features/home/home_widgets/home_page_widgets_extract.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class FigureListView extends StatelessWidget {
  const FigureListView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FigureCubit, FigureState>(
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
            return ListView.builder(
              itemCount: state.figures.length,
              itemBuilder: (context, index) {
                final figureModel = state.figures[index];
                return FigureListItem(figureModel: figureModel);
              },
            );
            
          case Status.error:
            return ErrorDisplay(errorMessage: state.errorMessage ?? 'Unknown error');
        }
      },
    );
  }
}