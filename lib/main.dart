import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const BorahApp());
}

class BorahApp extends StatelessWidget {
  const BorahApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Borah Electricals',
      theme: ThemeData(primarySwatch: Colors.orange, useMaterial3: true),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = '';
  String phone = '';
  String address = '';
  String service = 'Fan Repair';
  String selectedCategory = 'All';

  final List<Map<String, dynamic>> services = [
    {'name': 'Fan Repair', 'price': '₹149', 'icon': Icons.toys, 'cat': 'Electrical'},
    {'name': 'Wiring / Switch', 'price': '₹199', 'icon': Icons.electrical_services, 'cat': 'Electrical'},
    {'name': 'Inverter Repair', 'price': '₹299', 'icon': Icons.battery_charging_full, 'cat': 'Electrical'},
    {'name': 'AC Service', 'price': '₹499', 'icon': Icons.ac_unit, 'cat': 'AC'},
    {'name': 'Cooler Repair', 'price': '₹249', 'icon': Icons.air, 'cat': 'AC'},
    {'name': 'Plumber', 'price': '₹199', 'icon': Icons.plumbing, 'cat': 'Plumbing'},
    {'name': 'Tap / Tank Repair', 'price': '₹179', 'icon': Icons.water_drop, 'cat': 'Plumbing'},
    {'name': 'TV Repair', 'price': '₹299', 'icon': Icons.tv, 'cat': 'Appliance'},
    {'name': 'Fridge Repair', 'price': '₹349', 'icon': Icons.kitchen, 'cat': 'Appliance'},
  ];

  Future<void> callNow() async {
    final Uri url = Uri.parse('tel:9435012345');
    await launchUrl(url);
  }

  Future<void> bookWhatsApp() async {
    String msg = "Hello Borah Electricals!%0AName: $name%0APhone: $phone%0AAddress: $address%0AService: $service%0APlease book my service.";
    final Uri url = Uri.parse
