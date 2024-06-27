import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:section13/Providers/place_provider.dart';
import 'package:section13/Models/place.dart';

class AddNewPlace extends ConsumerStatefulWidget {
  const AddNewPlace({super.key});

  @override
  ConsumerState<AddNewPlace> createState() => _AddNewPlaceState();
}

class _AddNewPlaceState extends ConsumerState<AddNewPlace> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _newPlaceController = TextEditingController();
  var _newPlace = '';

  @override
  void dispose() {
    _newPlaceController.dispose();
    super.dispose();
  }

  void validateAndSubmitForm() {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    ref.read(placesProvider.notifier).addNewItem(Place(placeTitle: _newPlace));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: const Text('ADD NEW PLACE'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _newPlaceController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Title should not be Empty';
                  }
                  if (value.length < 3) {
                    return 'Title can\'t be less than 3 characters';
                  }
                  return null;
                },
                onSaved: (value) {
                  _newPlace = value!;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                onPressed: validateAndSubmitForm,
                label: const Text('Add Place'),
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
