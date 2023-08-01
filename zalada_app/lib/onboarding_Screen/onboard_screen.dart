import 'package:flutter/material.dart';
import 'package:zalada_app/MVC/views/login_screen.dart';

import 'main_content.dart';
import 'onboard_model.dart';
import 'steps_container.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<OnboardingModel> _list = OnboardingModel.list;
  int page = 0;
  var _controller = PageController();
  var showAnimatedContainer = false;
  @override
  Widget build(BuildContext context) {
    _controller.addListener(() {
      setState(() {
        page = _controller.page!.round();
      });
    });
    return Scaffold(
        // backgroundColor: Colors.white,
        body: Stack(
      children: [
        showAnimatedContainer
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
                child: Column(
                  children: [
                    // SkipButton(),
                    Expanded(
                      child: PageView.builder(
                          controller: _controller,
                          itemCount: _list.length,
                          itemBuilder: (context, index) => MainContent(
                                list: _list,
                                index: index,
                              )),
                    ),
                    StepsContainer(
                      page: page,
                      list: _list,
                      controller: _controller,
                      showAnimatedContainerCallBack: (value) {
                        setState(() {
                          showAnimatedContainer = value;
                          if (value) {
                            Future.delayed(Duration(seconds: 1), () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => login_screen()));
                            });
                          }
                        });
                      },
                    ),
                    SizedBox(
                      height: 40,
                    )
                  ],
                ),
              ),
      ],
    ));
  }
}
