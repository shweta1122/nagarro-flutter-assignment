import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../model/user_info.dart';
import '../data_provider.dart';

class DrawerMenu extends StatelessWidget {
  UserInfo? userInfo;

  DrawerMenu({super.key});

  Future<void> pickImageForMobileAndWeb(BuildContext context) async {
    if (userInfo == null) {
      return;
    }

    final ImagePicker picker = ImagePicker();
    // This picks file for both mobile and web platforms
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );

    // Defining the required size for image upload
    const int maxFileSizeInBytes = 500 * 1048; // This equals to 5MB of Size

    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      final base64Image = base64Encode(bytes);

      Provider.of<DataProvider>(context, listen: false)
          .setProfileImage(base64Image);
      userInfo = Provider.of<DataProvider>(context).userInfo;
    }
  }

  @override
  Widget build(BuildContext context) {
    userInfo = Provider.of<DataProvider>(context).userInfo;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(userInfo?.email ?? "Login"),
            accountEmail: Text(userInfo?.email ?? ""),
            currentAccountPicture: GestureDetector(
              onTap: () => pickImageForMobileAndWeb(context),
              child: CircleAvatar(
                backgroundColor: Colors.orange,
                backgroundImage: userInfo?.imageBase64.isNotEmpty ?? false
                    ? MemoryImage(base64Decode(userInfo!.imageBase64))
                    : null,
                child: userInfo?.imageBase64 == null
                    ? Text(
                        userInfo?.email.substring(0, 1) ?? "U",
                        style: const TextStyle(fontSize: 40.0),
                      )
                    : null,
              ),
            ),
          ),
          ListTile(
            title:
                Text((userInfo?.email ?? "").isNotEmpty ? 'Logout' : 'Login'),
            onTap: () {
              if ((userInfo?.email ?? "").isNotEmpty) {
                Provider.of<DataProvider>(context, listen: false).logout();
                userInfo = Provider.of<DataProvider>(context).userInfo;
                // Navigator.pushReplacementNamed(context, "/");
              } else {
                Navigator.pushNamed(context, "/login");
              }
            },
          ),
          ListTile(
            title: const Text('Contact Us'),
            onTap: () {
              Navigator.pushNamed(context, "/contact_us");
            },
          ),
        ],
      ),
    );
  }
}
