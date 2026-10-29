import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: events.length,
        itemBuilder: (_, i) {
          final e = events[i];

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              isThreeLine: true,
              leading: const CircleAvatar(
                child: Icon(Icons.event),
              ),
              title: Text(
                e.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                '${e.date}\n${e.location}\n${e.description}',
              ),
            ),
          );
        },
      ),
    );
  }
}