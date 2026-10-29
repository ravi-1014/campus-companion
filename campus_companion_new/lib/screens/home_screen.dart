import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import 'events_screen.dart';
import 'clubs_screen.dart';
import 'notices_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget { const HomeScreen({super.key}); @override State<HomeScreen> createState() => _HomeScreenState(); }
class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  final pages = const [HomeDashboard(), EventsScreen(), ClubsScreen(), NoticesScreen(), ProfileScreen()];
  @override Widget build(BuildContext context) => Scaffold(
    body: IndexedStack(index: index, children: pages),
    bottomNavigationBar: NavigationBar(selectedIndex: index, onDestinationSelected: (i) => setState(() => index = i), destinations: const [
      NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
      NavigationDestination(icon: Icon(Icons.event_outlined), selectedIcon: Icon(Icons.event), label: 'Events'),
      NavigationDestination(icon: Icon(Icons.groups_outlined), selectedIcon: Icon(Icons.groups), label: 'Clubs'),
      NavigationDestination(icon: Icon(Icons.campaign_outlined), selectedIcon: Icon(Icons.campaign), label: 'Notices'),
      NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profile'),
    ]),
  );
}

class HomeDashboard extends StatelessWidget {
  const HomeDashboard({super.key});
  @override Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final name = user?.displayName?.trim().isNotEmpty == true ? user!.displayName! : 'Student';
    return SafeArea(child: ListView(padding: const EdgeInsets.all(20), children: [
      Text('Welcome, $name 👋', style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
      const SizedBox(height: 6), const Text('Your campus, all in one place.', style: TextStyle(color: Colors.grey)),
      const SizedBox(height: 24),
      Card(child: Padding(padding: const EdgeInsets.all(20), child: Row(children: [const Icon(Icons.event, size: 40, color: Color(0xFF4F46E5)), const SizedBox(width: 16), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('${events.length} upcoming events', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)), const SizedBox(height: 4), const Text('Check Events for details.')])),]))),
      const SizedBox(height: 14),
      Card(child: Padding(padding: const EdgeInsets.all(20), child: Row(children: [const Icon(Icons.groups, size: 40, color: Color(0xFF4F46E5)), const SizedBox(width: 16), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('${clubs.length} clubs available', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)), const SizedBox(height: 4), const Text('Find a club that matches your interests.')])),]))),
      const SizedBox(height: 20), const Text('Latest Notices', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ...notices.map((n) => Card(margin: const EdgeInsets.only(top: 10), child: ListTile(leading: const Icon(Icons.notifications_none), title: Text(n)))),
    ]));
  }
}
