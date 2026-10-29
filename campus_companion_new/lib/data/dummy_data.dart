class EventItem {
  final String title;
  final String date;
  final String location;
  final String description;
  const EventItem({required this.title, required this.date, required this.location, required this.description});
}

class ClubItem {
  final String name;
  final String category;
  final String description;
  const ClubItem({required this.name, required this.category, required this.description});
}

const events = <EventItem>[
  EventItem(title: 'Tech Fest 2026', date: '15 October 2026', location: 'Main Auditorium', description: 'Technology, innovation and project exhibitions across campus.'),
  EventItem(title: 'Cultural Night', date: '22 October 2026', location: 'Open Air Theatre', description: 'Music, dance, performances and student activities.'),
  EventItem(title: 'Hackathon 2026', date: '5 November 2026', location: 'Innovation Lab', description: 'Build useful solutions with your team in a campus hackathon.'),
];

const clubs = <ClubItem>[
  ClubItem(name: 'Coding Club', category: 'Technology', description: 'Programming, coding contests and developer activities.'),
  ClubItem(name: 'AI & Robotics Club', category: 'Technology', description: 'AI, robotics, automation and hands-on projects.'),
  ClubItem(name: 'Art & Design Club', category: 'Creative', description: 'Sketching, design, posters and creative workshops.'),
  ClubItem(name: 'Cultural Club', category: 'Cultural', description: 'Dance, music, theatre and cultural events.'),
  ClubItem(name: 'Sports Club', category: 'Sports', description: 'Sports activities, tournaments and fitness events.'),
  ClubItem(name: 'Photography Club', category: 'Creative', description: 'Photography walks, editing and campus media.'),
  ClubItem(name: 'Literary Club', category: 'Literary', description: 'Writing, debates, public speaking and reading.'),
  ClubItem(name: 'Eco Club', category: 'Social', description: 'Sustainability, green campus and awareness activities.'),
];

const notices = <String>[
  'Mid-semester examination timetable will be announced soon.',
  'Students can register for upcoming campus events through the Events section.',
  'Club registrations are open for the new academic year.',
];
