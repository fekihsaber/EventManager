import 'package:flutter/material.dart';
import 'event.dart'; 

class EditEventScreen extends StatefulWidget {
  final Event event;

  EditEventScreen({required this.event});

  @override
  _EditEventScreenState createState() => _EditEventScreenState();
}

class _EditEventScreenState extends State<EditEventScreen> {
  late TextEditingController _titleController;
  late TextEditingController _categoryController;
  late TextEditingController _locationController;
  late DateTime _date;
  late TimeOfDay _time;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.event.title);
    _categoryController = TextEditingController(text: widget.event.category);
    _locationController = TextEditingController(text: widget.event.location);
    _date = widget.event.date;
    _time = widget.event.time;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Event'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _categoryController,
              decoration: InputDecoration(labelText: 'Category'),
            ),
            TextField(
              controller: _locationController,
              decoration: InputDecoration(labelText: 'Location'),
            ),
            ElevatedButton(
              onPressed: () async {
                final pickedDate = await showDatePicker(
                  context: context,
                  initialDate: _date,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null && pickedDate != _date) {
                  setState(() {
                    _date = pickedDate;
                  });
                }
              },
              child: Text('Pick Date'),
            ),
            ElevatedButton(
              onPressed: () async {
                final pickedTime = await showTimePicker(
                  context: context,
                  initialTime: _time,
                );
                if (pickedTime != null && pickedTime != _time) {
                  setState(() {
                    _time = pickedTime;
                  });
                }
              },
              child: Text('Pick Time'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final updatedEvent = Event(
                  title: _titleController.text,
                  category: _categoryController.text,
                  date: _date,
                  time: _time,
                  location: _locationController.text,
                );
                Navigator.pop(context, updatedEvent);
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
