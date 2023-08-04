import 'package:flutter/material.dart';

class customsnackbar extends StatelessWidget {
  const customsnackbar({required this.title, required this.message});
  final String title;
  final String message;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SnackBar(
        content: ListTile(
          title: Text(
            title,
            style: TextStyle(
              fontFamily: 'plusjakarta',
              color: Theme.of(context).hintColor,
            ),
          ),
          subtitle: Text(message),
        ),
        backgroundColor:
            Theme.of(context).cardColor, // Customize the background color
        behavior: SnackBarBehavior
            .floating, // Customize the behavior (floating or fixed)
        shape: RoundedRectangleBorder(
          // Customize the shape of the Snackbar
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: Colors.black, width: 2.0),
        ),
      ),
    );

    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

// class CustomSnackbar {
//   static void show(BuildContext context, String title, String message) {
//     final snackBar = SnackBar(
//       content: ListTile(
//         title: Text(
//           title,
//           style: TextStyle(
//             fontFamily: 'plusjakarta',
//             color: Theme.of(context).hintColor,
//           ),
//         ),
//         subtitle: Text(message),
//       ),
//       backgroundColor:
//           Theme.of(context).cardColor, // Customize the background color
//       behavior: SnackBarBehavior
//           .floating, // Customize the behavior (floating or fixed)
//       shape: RoundedRectangleBorder(
//         // Customize the shape of the Snackbar
//         borderRadius: BorderRadius.circular(10.0),
//         side: BorderSide(color: Colors.black, width: 2.0),
//       ),
//     );

//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }
// }
