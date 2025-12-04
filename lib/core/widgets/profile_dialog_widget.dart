import 'package:yell/core/barrel/barrel.dart';

class ProfileDialog extends StatefulWidget {
  final Function(Map<String, String>) onSavePressed;

  const ProfileDialog({super.key, required this.onSavePressed});

  @override
  State<ProfileDialog> createState() => _ProfileDialogState();
}

class _ProfileDialogState extends State<ProfileDialog> {
  void _handleSave() async {
    if (_selectedRole.isEmpty) {
      ToastMessage.show(
        context: context,
        message: 'Please select a role',
        isError: true,
      );
      return;
    }
    if (_profileImage == null) {
      ToastMessage.show(
        context: context,
        message: 'Please select a profile picture',
        isError: true,
      );
      return;
    }

    setState(() => _isLoading = true);

    await widget.onSavePressed({
      'profilePic': _profileImage!.path,
      'role': _selectedRole,
    });
  }

  File? _profileImage;
  String _selectedRole = '';
  bool _isLoading = false;
  final List<String> _roles = ['Service Provider', 'Service Consumer'];

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() => _profileImage = File(pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AlertDialog(
      backgroundColor: isDark ? Colors.grey[900] : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text(
        'Complete Your Profile',
        style: TextStyle(
          color: isDark ? Colors.white : Colors.black,
          fontFamily: "bold",
          fontSize: 16,
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: isDark ? Colors.grey[800] : Colors.grey[200],
                backgroundImage: _profileImage != null
                    ? FileImage(_profileImage!)
                    : null,
                child: _profileImage == null
                    ? Icon(
                        Icons.add_a_photo,
                        size: 40,
                        color: isDark ? Colors.grey[400] : Colors.grey[600],
                      )
                    : null,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Select Your Role',
              style: TextStyle(
                color: isDark ? AMColors.white : AMColors.black,
                fontSize: 15,
                fontFamily: "bold",
              ),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 8,
              children: _roles.map((role) {
                final isSelected = _selectedRole == role;
                return ChoiceChip(
                  label: Text(role),
                  selected: isSelected,
                  onSelected: _isLoading
                      ? null
                      : (selected) {
                          setState(() => _selectedRole = selected ? role : '');
                        },
                  selectedColor: Theme.of(context).primaryColor,
                  backgroundColor: isDark ? Colors.grey[800] : Colors.grey[200],
                  labelStyle: TextStyle(
                    color: isSelected
                        ? Colors.white
                        : (isDark ? Colors.white : Colors.black),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      actions: [
        SizedBox(
          width: double.infinity,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: isDark
                    ? [Color(0xFF2563EB), Color(0xFF1D4ED8)]
                    : [Color(0xFF3B82F6), Color(0xFF1D4ED8)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: isDark
                      ? Colors.blue.shade800.withValues(alpha: 0.3)
                      : Colors.blue.shade300.withValues(alpha: 0.4),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: _isLoading
                  ? null
                  : () {
                      _handleSave();
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              child: _isLoading
                  ? SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: "bold",
                        color: Colors.white,
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
