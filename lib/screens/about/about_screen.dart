import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  void copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Berhasil di salin')),
    );
  }

  Widget _listItem(
    BuildContext context, {
    required String title,
    required String subtitle,
  }) {
    return ListTile(
      title: Text(title, style: GoogleFonts.inter()),
      subtitle: Text(subtitle, style: GoogleFonts.inter()),
      onTap: () => copyToClipboard(context, title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text(
          'Tentang Aplikasi',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        children: [
          _listItem(
            context,
            title: 'Dzikir Pagi Petang',
            subtitle: 'Nama Aplikasi',
          ),
          const Divider(),
          _listItem(
            context,
            title: '1.0.0',
            subtitle: 'Versi',
          ),
          const Divider(),
          _listItem(
            context,
            title: 'Dart/Flutter',
            subtitle: 'Bahasa Pemrograman',
          ),
          const Divider(),
          _listItem(
            context,
            title: 'https://github.com/alhamda/dzikir_harian',
            subtitle: 'Kode Sumber',
          ),
          const Divider(),
          _listItem(
            context,
            title: 'alhamdadisoka@gmail.com',
            subtitle: 'Email Pengembang',
          ),
          const Divider(),
          _listItem(
            context,
            title:
                'Buku Doa Dan Wirid halaman 133- 155, Ustadz Yazid bin Abdul Qadir Jawas , Penerbit Pustaka Imam Asy-Syafii',
            subtitle: 'Rujukan Buku',
          ),
        ],
      ),
    );
  }
}
