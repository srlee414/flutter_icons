// Flutter Icon Grid Mobile App
import 'package:flutter/material.dart';

void main() {
  runApp(const IconMobileApp());
}

class IconMobileApp extends StatefulWidget {
  const IconMobileApp({Key? key}) : super(key: key);

  @override
  State<IconMobileApp> createState() => _IconMobileAppState();
}

class _IconMobileAppState extends State<IconMobileApp> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Icons Mobile',
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: IconGridScreen(isDarkMode: isDarkMode, onThemeToggle: toggleTheme),
    );
  }
}

class IconGridScreen extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onThemeToggle;

  const IconGridScreen({
    Key? key,
    required this.isDarkMode,
    required this.onThemeToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, IconData> icons = {
      'add': Icons.add,
      'alarm': Icons.alarm,
      'android': Icons.android,
      'arrow_back': Icons.arrow_back,
      'arrow_forward': Icons.arrow_forward,
      'attach_file': Icons.attach_file,
      'audiotrack': Icons.audiotrack,
      'battery_full': Icons.battery_full,
      'bluetooth': Icons.bluetooth,
      'bookmark': Icons.bookmark,
      'brightness': Icons.brightness_6,
      'build': Icons.build,
      'calendar': Icons.calendar_today,
      'camera': Icons.camera,
      'check': Icons.check,
      'cloud': Icons.cloud,
      'code': Icons.code,
      'delete': Icons.delete,
      'download': Icons.download,
      'edit': Icons.edit,
      'email': Icons.email,
      'favorite': Icons.favorite,
      'file': Icons.file_present,
      'flash': Icons.flash_on,
      'folder': Icons.folder,
      'games': Icons.games,
      'home': Icons.home,
      'image': Icons.image,
      'info': Icons.info,
      'language': Icons.language,
      'link': Icons.link,
      'location': Icons.location_on,
      'lock': Icons.lock,
      'map': Icons.map,
      'menu': Icons.menu,
      'mic': Icons.mic,
      'music': Icons.music_note,
      'notification': Icons.notifications,
      'person': Icons.person,
      'phone': Icons.phone,
      'photo': Icons.photo_camera,
      'print': Icons.print,
      'refresh': Icons.refresh,
      'save': Icons.save,
      'search': Icons.search,
      'security': Icons.security,
      'settings': Icons.settings,
      'share': Icons.share,
      'shopping': Icons.shopping_cart,
      'star': Icons.star,
      'timer': Icons.timer,
      'upload': Icons.upload,
      'video': Icons.videocam,
      'volume': Icons.volume_up,
      'wifi': Icons.wifi,
    };

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.grey[900] : Colors.grey[100],
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.grey[850] : Colors.grey[300],
        title: Text(
          'FLUTTER ICONS',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.white : Colors.black87,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: isDarkMode ? Colors.white : Colors.black87,
            ),
            onPressed: onThemeToggle,
          ),
        ],
        elevation: 0,
      ),
      body: InteractiveViewer(
        minScale: 0.7,
        maxScale: 1.5,
        boundaryMargin: const EdgeInsets.all(16),
        child: GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1,
          ),
          itemCount: icons.length,
          itemBuilder: (context, index) {
            final iconName = icons.keys.elementAt(index);
            return InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Selected: $iconName'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icons[iconName],
                    size: 40,
                    color: isDarkMode ? Colors.white : Colors.indigo,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    iconName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}