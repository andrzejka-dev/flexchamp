import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseStorageService {
  final FirebaseStorage storage = FirebaseStorage.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> updateFigureIconsAndPhotos() async {
    // Map of document names to their figureIcon gs:// URLs
    Map<String, String> figureIcons = {
      "middle split": "gs://flexchamp88.firebasestorage.app/images/Middle split icon.png",
      "bridge": "gs://flexchamp88.firebasestorage.app/images/bridge.png",
      "split": "gs://flexchamp88.firebasestorage.app/images/split icon.png"
    };

    try {
      // Process each document
      for (String docName in figureIcons.keys) {
        // Get gs:// URL for the figure icon
        String iconGsUrl = figureIcons[docName]!;
        
        // Convert gs:// to https:// URL
        String iconPath = iconGsUrl.replaceFirst("gs://flexchamp88.firebasestorage.app", "");
        String iconDownloadURL = await storage.ref(iconPath).getDownloadURL();
        
        // Update Firestore document with the https:// URL for figureIcon
        await firestore.collection("figure").doc(docName).update({
          "figureIcon": iconDownloadURL
        });
        
        print("Updated figureIcon for $docName ✅");
      }
      
      print("All figureIcons updated successfully ✅");
    } catch (e) {
      print("Error updating figureIcons: $e ❌");
    }
  }
  
  // For updating just a single document's figureIcon
  Future<void> updateSingleFigureIcon(String docName, String iconGsUrl) async {
    try {
      // Convert gs:// to https:// URL
      String iconPath = iconGsUrl.replaceFirst("gs://flexchamp88.firebasestorage.app", "");
      String iconDownloadURL = await storage.ref(iconPath).getDownloadURL();
      
      // Update Firestore
      await firestore.collection("figure").doc(docName).update({
        "figureIcon": iconDownloadURL
      });
      
      print("Updated figureIcon for $docName ✅");
    } catch (e) {
      print("Error updating figureIcon: $e ❌");
    }
  }
  
  // Your existing photoURL update method - keep this as is
  Future<void> updatePhotoURLs() async {
    // Your existing code for photoURLs
    // ...
  }
}
