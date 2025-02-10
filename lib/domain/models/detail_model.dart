class DetailModel {
  final String name;    // Changed from List<String> to String
  final String description;
  final String photoURL;
  final String id;

  DetailModel({
    required this.name,
    required this.description,
    required this.photoURL,
    required this.id,
  });


 factory DetailModel.fromMap(Map<String, dynamic> map, String id) {
   return DetailModel(
     id: id,
     name: map['name'] ?? '',
     description: map['description'] ?? '',
     photoURL: map['photoURL'] ?? '',
   );
 }

 Map<String, dynamic> toMap() {
   return {
     'name': name,
     'description': description,
     'photoURL': photoURL,
   };
 }
}