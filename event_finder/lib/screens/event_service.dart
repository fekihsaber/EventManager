import 'event.dart';

class EventService {
  final List<Event> _events = [];

  Future<List<Event>> fetchEvents() async {
    await Future.delayed(Duration(seconds: 1));
    return _events; 
  }

  Future<void> addEvent(Event event) async {
    await Future.delayed(Duration(seconds: 1));
    _events.add(event); 
  }
}
