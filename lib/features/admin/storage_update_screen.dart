import 'package:flutter/material.dart';
import '../../services/firebase_storage_service.dart';

class StorageUpdateScreen extends StatelessWidget {
  const StorageUpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin - Storage Update')),
      body: Center(
        child: _UpdateButton(),
      ),
    );
  }
}

class _UpdateButton extends StatefulWidget {
  @override
  State<_UpdateButton> createState() => _UpdateButtonState();
}

class _UpdateButtonState extends State<_UpdateButton> {
  bool _isLoading = false;

  Future<void> _updateUrls() async {
    if (!mounted) return;
    
    setState(() {
      _isLoading = true;
    });

    try {
      final service = FirebaseStorageService();
      await service.updatePhotoURLs();
      
      if (!mounted) return;
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('URLs updated successfully!')),
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
    return _isLoading
        ? const CircularProgressIndicator()
        : ElevatedButton(
            onPressed: _updateUrls,
            child: const Text('Update Storage URLs'),
          );
  }
}