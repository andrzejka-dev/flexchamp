import 'package:flexchamp/domain/models/detail_model.dart';
import 'package:flexchamp/domain/repositories/details_repository.dart';
import 'package:flexchamp/features/details/cubit/details_cubit.dart';
import 'package:flexchamp/features/details/cubit/details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DetailsPage extends StatelessWidget {
 final String figureType;

 const DetailsPage({super.key, required this.figureType});

 @override
 Widget build(BuildContext context) {
   return BlocProvider(
     create: (context) => DetailsCubit(DetailsRepository())..getDetails(figureType),
     child: Scaffold(
       body: const _DetailsPageBody(),
     ),
   );
 }
}

class _DetailsPageBody extends StatelessWidget {
 const _DetailsPageBody();

 @override
 Widget build(BuildContext context) {
   return BlocBuilder<DetailsCubit, DetailsState>(
     builder: (context, state) {
       if (state.loadingErrorOccurred) {
         return const Center(child: Text('Something went wrong'));
       }

       if (state.isLoading) {
         return const Center(child: CircularProgressIndicator());
       }

       return ListView.builder(
         itemCount: state.figures.length,
         itemBuilder: (context, index) {
           final figure = state.figures[index];
           return _DetailItem(figure: figure);
         },
       );
     },
   );
 }
}

class _DetailItem extends StatelessWidget {
 final DetailModel figure;

 const _DetailItem({required this.figure});

 @override
 Widget build(BuildContext context) {
   return Column(
     children: [
       _BlackContainer(
         child: Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text(
               figure.name,
               style: const TextStyle(
                 color: Colors.white,
                 fontSize: 20,
               ),
             ),
             const Icon(Icons.add, color: Colors.white),
           ],
         ),
       ),
       _BlackContainer(
         child: Center(
           child: Text(
             figure.photoURL,
             style: const TextStyle(
               color: Colors.white,
               fontSize: 20,
             ),
           ),
         ),
       ),
       _BlackContainer(
         child: Center(
           child: Text(
             figure.description,
             style: const TextStyle(
               color: Colors.white,
               fontSize: 20,
             ),
           ),
         ),
       ),
     ],
   );
 }
}

class _BlackContainer extends StatelessWidget {
 final Widget child;

 const _BlackContainer({required this.child});

 @override
 Widget build(BuildContext context) {
   return Container(
     padding: const EdgeInsets.all(20),
     margin: const EdgeInsets.all(10),
     decoration: BoxDecoration(
       color: Colors.black,
       borderRadius: BorderRadius.circular(20),
     ),
     child: child,
   );
 }
}