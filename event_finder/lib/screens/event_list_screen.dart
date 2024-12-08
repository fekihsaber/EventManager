import 'package:flutter/material.dart';
import 'add_event_screen.dart';
import 'edit_event_screen.dart'; 
import 'event.dart'; 

class EventListScreen extends StatefulWidget {
  @override
  _EventListScreenState createState() => _EventListScreenState();
}

class _EventListScreenState extends State<EventListScreen> {
  List<Event> _events = [];

  void _addNewEvent(Event event) {
    setState(() {
      _events.add(event);
    });
  }

  void _editEvent(int index, Event updatedEvent) {
    setState(() {
      _events[index] = updatedEvent;
    });
  }

  void _deleteEvent(int index) {
    setState(() {
      _events.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
      ),
      body: _events.isEmpty
          ? Center(child: Text('No events added yet.'))
          : ListView.builder(
              itemCount: _events.length,
              itemBuilder: (context, index) {
                final event = _events[index];
                return ListTile(
                  title: Text(event.title),
                  subtitle: Text('${event.category} - ${event.date.toLocal()} - ${event.location}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () async {
                          final updatedEvent = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditEventScreen(event: event),
                            ),
                          );
                          if (updatedEvent != null) {
                            _editEvent(index, updatedEvent);
                          }
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          _deleteEvent(index);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newEvent = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddEventScreen()),
          );

          if (newEvent != null) {
            _addNewEvent(newEvent);
          }
        },
        child: Icon(Icons.add),
        tooltip: 'Add Event',
      ),
    );
  }
}
