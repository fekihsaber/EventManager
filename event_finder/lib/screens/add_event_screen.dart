import 'package:flutter/material.dart';
import 'event.dart'; 

class AddEventScreen extends StatefulWidget {
  @override
  _AddEventScreenState createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  final _titleController = TextEditingController();
  final _categoryController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  final _locationController = TextEditingController();

  void _submitForm() {
    final newEvent = Event(
      title: _titleController.text,
      category: _categoryController.text,
      date: _selectedDate,
      time: _selectedTime,
      location: _locationController.text,
    );
    
    Navigator.of(context).pop(newEvent); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Event'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _titleController, decoration: InputDecoration(labelText: 'Event Title')),
            TextField(controller: _categoryController, decoration: InputDecoration(labelText: 'Category')),
            TextField(controller: _locationController, decoration: InputDecoration(labelText: 'Location')),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Add Event'),
            ),
          ],
        ),
      ),
    );
  }
}
