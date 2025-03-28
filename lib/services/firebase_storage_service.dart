import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseStorageService {
  final FirebaseStorage storage = FirebaseStorage.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> updateFigureIconsAndPhotos() async {
    // Map of document names to their figureIcon gs:// URLs
    Map<String, String> figureIcons = {
      "bridge": "gs://flexchamp88.firebasestorage.app/images/bridge.png",
  
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
        
        ("Updated figureIcon for $docName ✅");
      }
      
      ("All figureIcons updated successfully ✅");
    } catch (e) {
      ("Error updating figureIcons: $e ❌");
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
      
      ("Updated figureIcon for $docName ✅");
    } catch (e) {
      ("Error updating figureIcon: $e ❌");
    }
  }
  
  // Your existing photoURL update method - keep this as is
  Future<void> updatePhotoURLs() async {
     // Mapping: Each document has specific names & image paths
    Map<String, Map<String, List<String>>> documentData = {
      "middle split": {
        "Hip rotation": [
          "gs://flexchamp88.firebasestorage.app/images/rotation1.png",
          "gs://flexchamp88.firebasestorage.app/images/rotation2.png",
          "gs://flexchamp88.firebasestorage.app/images/rotation3.jpg",
        ],
        "Side lean": [
          "gs://flexchamp88.firebasestorage.app/images/sidelean1.png",
          "gs://flexchamp88.firebasestorage.app/images/sidelunge2.png"
        ],
        "Grand plié": [
          "gs://flexchamp88.firebasestorage.app/images/grandplie1.png",
          "gs://flexchamp88.firebasestorage.app/images/grandplie2.png"
        ],
        "Supine side splits": [
          "gs://flexchamp88.firebasestorage.app/images/supine1.png",
          "gs://flexchamp88.firebasestorage.app/images/supine2.png"
        ],
        "Hip open": [
          "gs://flexchamp88.firebasestorage.app/images/hipopen1.png",
          "gs://flexchamp88.firebasestorage.app/images/hipopen2.png"
        ],
      },
      "bridge": {
        "Roll-out": [
          "gs://flexchamp88.firebasestorage.app/images/roll1.jpg",
          "gs://flexchamp88.firebasestorage.app/images/roll2.jpg"
        ],
        "Glute bridge": [
          "gs://flexchamp88.firebasestorage.app/images/glutebridge1.jpg",
          "gs://flexchamp88.firebasestorage.app/images/glutebridge2.jpg"
        ],
        "Forward bend": [
          "gs://flexchamp88.firebasestorage.app/images/forward1.jpg",
          "gs://flexchamp88.firebasestorage.app/images/forward2.jpg"
        ],
        "Shoulder swings": [
          "gs://flexchamp88.firebasestorage.app/images/shoulder1.jpg",
          "gs://flexchamp88.firebasestorage.app/images/shoulder2.jpg"
        ],
        "Cobra": [
          "gs://flexchamp88.firebasestorage.app/images/cobra1.png",
          "gs://flexchamp88.firebasestorage.app/images/cobra2.png",
          "gs://flexchamp88.firebasestorage.app/images/cobra3.png",
        ],
      },
      "split": {
        "Bend forward": [
          "gs://flexchamp88.firebasestorage.app/images/bend1.png",
          "gs://flexchamp88.firebasestorage.app/images/bend2.png",
          "gs://flexchamp88.firebasestorage.app/images/bend3.png",
        ],
        "Cobra": [
          "gs://flexchamp88.firebasestorage.app/images/cobraspl1.png",
          "gs://flexchamp88.firebasestorage.app/images/cobraspl2.png"
        ],
        "Pre-split transitions": [
          "gs://flexchamp88.firebasestorage.app/images/prep1.png",
          "gs://flexchamp88.firebasestorage.app/images/prep2.png",
          "gs://flexchamp88.firebasestorage.app/images/prep3.png",
        ],
      }
    };

    try {
      for (String docName in documentData.keys) {
        var exerciseMap = documentData[docName]!;
        List<String> photoURLs = [];// Get exercise names & images

   // Process each exercise's images
        for (var exerciseName in exerciseMap.keys) {
          List<String> gsUrls = exerciseMap[exerciseName]!;

          for (String gsUrl in gsUrls) {
            String path = gsUrl.replaceFirst("gs://flexchamp88.firebasestorage.app", "");
            String downloadURL = await storage.ref(path).getDownloadURL();
            photoURLs.add(downloadURL);
          }
        }

        // Update Firestore with the array of download URLs
        await firestore.collection("figure").doc(docName).update({
          "photoURL": photoURLs,
        });

        ("Updated Firestore for $docName ✅");
      }
    } catch (e) {
      ("Error updating Firestore: $e ❌");
    }
  }
}
  
