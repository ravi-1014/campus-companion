import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
class NoticesScreen extends StatelessWidget { const NoticesScreen({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Notices')), body: ListView.builder(padding: const EdgeInsets.all(16), itemCount:notices.length, itemBuilder:(_,i)=>Card(margin:const EdgeInsets.only(bottom:10), child:ListTile(leading:const Icon(Icons.campaign), title:Text(notices[i]))))); }
