import 'package:flutter/material.dart';
import 'package:shega_cloth_store_app/database/auth.dart';

showBottom(context, String postId) {
  showBottomSheet(
    backgroundColor: Colors.grey[300],
    context: context,
    builder: (context) {
      return SizedBox(
        height: 200,
        child: Column(
          children: [
            Text(
              'Delete Options',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 1,
              height: 5,
              color: Colors.black54,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Are you sure you want to delete ? ',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 25,
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  height: 50,
                  minWidth: 50,
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text('Cancel'),
                ),
                SizedBox(
                  width: 10,
                ),
                MaterialButton(
                  onPressed: () async {
                    await authMethod().deletingPosts(postId);
                    Navigator.of(context).pop();
                  },
                  height: 50,
                  minWidth: 50,
                  color: Colors.red,
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Confirm Delete',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
