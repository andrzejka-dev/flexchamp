import 'package:flexchamp/domain/models/detail_model.dart';

class DetailsState {
 const DetailsState({
   this.figures = const [],
   this.isLoading = false,
   this.loadingErrorOccurred = false,
   this.removingErrorOccurred = false,
 });

 final List<DetailModel> figures;
 final bool isLoading;
 final bool loadingErrorOccurred; 
 final bool removingErrorOccurred;

 DetailsState copyWith({
   List<DetailModel>? figures,
   bool? isLoading,
   bool? loadingErrorOccurred,
   bool? removingErrorOccurred,
 }) {
   return DetailsState(
     figures: figures ?? this.figures,
     isLoading: isLoading ?? this.isLoading,
     loadingErrorOccurred: loadingErrorOccurred ?? this.loadingErrorOccurred,
     removingErrorOccurred: removingErrorOccurred ?? this.removingErrorOccurred,
   );
 }
}
