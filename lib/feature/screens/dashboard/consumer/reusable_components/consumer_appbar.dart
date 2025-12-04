import 'package:yell/core/barrel/barrel.dart';

class ConsumerAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final String? profileImageUrl;
  final VoidCallback? onProfileTap;

  const ConsumerAppBar({
    super.key,
    required this.userName,
    this.profileImageUrl,
    this.onProfileTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 70);

  ImageProvider? _getImageProvider() {
    if (profileImageUrl == null || profileImageUrl!.trim().isEmpty) {
      return null;
    }

    final url = profileImageUrl!.trim();
    if (url.startsWith('/data/')) {
      try {
        final file = File(url);
        if (file.existsSync()) {
          return FileImage(file);
        }
        return null;
      } catch (_) {
        return null;
      }
    }

    if (url.startsWith('http://') || url.startsWith('https://')) {
      return NetworkImage(url);
    }

    if (url.startsWith('file://')) {
      try {
        final filePath = url.substring(7);
        final file = File(filePath);
        if (file.existsSync()) {
          return FileImage(file);
        }
        return null;
      } catch (_) {
        return null;
      }
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final imageProvider = _getImageProvider();
    final hasValidImage = imageProvider != null;

    return AppBar(
      backgroundColor: isDark ? Colors.grey[900] : Colors.white,
      elevation: 0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDark
                ? [const Color(0xFF1E293B), const Color(0xFF0F172A)]
                : [const Color(0xFFF8FAFC), const Color(0xFFE2E8F0)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                GestureDetector(
                  onTap: onProfileTap,
                  child: CircleAvatar(
                    radius: 24,
                    backgroundColor: isDark ? Colors.grey[800] : Colors.grey[200],
                    backgroundImage: hasValidImage ? imageProvider : null,
                    child: hasValidImage
                        ? null
                        : Icon(
                      Icons.person,
                      color: isDark ? Colors.grey[400] : Colors.grey[600],
                      size: 28,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hello,',
                        style: TextStyle(
                          fontSize: 14,
                          color: isDark ? Colors.grey[400] : Colors.grey[600],
                          fontFamily: 'AM',
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        userName,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: isDark ? Colors.white : Colors.black,
                          fontFamily: 'bold',
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.notifications_none,
                    color: isDark ? Colors.grey[400] : Colors.grey[600],
                    size: 28,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}