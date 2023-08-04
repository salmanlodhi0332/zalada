import 'package:flutter/material.dart';

class account_section extends StatelessWidget {
  final String title;
  final IconData prefixIcon;
  final bool showSwitchbtn;
  final Color backgroundcolor;

  account_section({
    required this.title,
    required this.prefixIcon,
    required this.showSwitchbtn,
    required this.backgroundcolor,
  });

  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {},
        child: ListTile(
          leading: CircleAvatar(
              backgroundColor: Theme.of(context).highlightColor,
              child: Icon(
                prefixIcon,
                color: Colors.black,
              )),
          title: Text(
            title,
            style: TextStyle(
                fontSize: 18,
                color: backgroundcolor,
                // color: Theme.of(context).hintColor,
                fontWeight: FontWeight.w500),
          ),
          trailing: showSwitchbtn
              ? Switch(
                  value: _isSwitched,
                  onChanged: (value) {
                    _isSwitched:
                    false;
                  },
                )

              // switch
              : Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
