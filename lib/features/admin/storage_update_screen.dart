import 'package:flutter/material.dart';
import '../../services/firebase_storage_service.dart';

class StorageUpdateScreen extends StatelessWidget {
  const StorageUpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin - Storage Update')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _UpdateButton(
              title: 'Update Photo URLs',
              updateFunction: (service) => service.updatePhotoURLs(),
            ),
            const SizedBox(height: 20),
            _UpdateButton(
              title: 'Update Figure Icons',
              updateFunction: (service) => service.updateFigureIconsAndPhotos(),
            ),
            const SizedBox(height: 20),
            _UpdateButton(
              title: 'Update All (Photos & Icons)',
              updateFunction: (service) async {
                await service.updatePhotoURLs();
                await service.updateFigureIconsAndPhotos();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _UpdateButton extends StatefulWidget {
  final String title;
  final Future<void> Function(FirebaseStorageService) updateFunction;

  const _UpdateButton({
    required this.title,
    required this.updateFunction,
  });

  @override
  State<_UpdateButton> createState() => _UpdateButtonState();
}

class _UpdateButtonState extends State<_UpdateButton> {
  bool _isLoading = false;

  Future<void> _performUpdate() async {
    if (!mounted) return;
    
    setState(() {
      _isLoading = true;
    });

    try {
      final service = FirebaseStorageService();
      await widget.updateFunction(service);
      
      if (!mounted) return;
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${widget.title} completed successfully!')),
      );
    } catch (e) {
      if (!mounted) return;
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }

    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ElevatedButton(
              onPressed: _performUpdate,
              child: Text(widget.title),
            ),
    );
  }
}