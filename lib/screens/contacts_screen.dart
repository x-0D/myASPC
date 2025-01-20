import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: kToolbarHeight),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.place),
                SizedBox(width: 8),
                Text(
                  'Адрес:',
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement map opening logic
              },
              child: const Text('Г.АЛМАТЫ, МКР.ТАСТАК-1Б ДОМ 1В.'),
            ),
            const SizedBox(height: 20),
            _buildContactCard(
              title: 'Пресс-Служба',
              phone: '8 775 705-45-25',
              hasWhatsApp: true,
              onCallPressed: () => _launchUrl('tel:87757054525'),
              onWhatsAppPressed: () => _launchUrl('https://wa.me/87757054525'),
            ),
            _buildContactCard(
              title: 'Приемная комиссия',
              phone: '8 727 393-39-52',
              onCallPressed: () => _launchUrl('tel:87273933952'),
            ),
            _buildContactCard(
              title: 'Канцелярия',
              phone: '8 727 393-41-91',
              onCallPressed: () => _launchUrl('tel:87273934191'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactCard({
    required String title,
    required String phone,
    bool hasWhatsApp = false,
    VoidCallback? onCallPressed,
    VoidCallback? onWhatsAppPressed,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(phone),
                if (hasWhatsApp) const Icon(Icons.message),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (hasWhatsApp)
                  ElevatedButton(
                    onPressed: onWhatsAppPressed,
                    child: const Text('WhatsApp'),
                  ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: onCallPressed,
                  child: const Text('Позвонить'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
