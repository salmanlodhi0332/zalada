import 'package:flutter/material.dart';
import 'onboard_model.dart';

class StepsContainer extends StatelessWidget {
  StepsContainer(
      {Key? key,
      required this.page,
      required List<OnboardingModel> list,
      required PageController controller,
      required this.showAnimatedContainerCallBack})
      : _list = list,
        _controller = controller,
        super(key: key);

  final int page;
  final List<OnboardingModel> _list;
  final PageController _controller;
  final Function showAnimatedContainerCallBack;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    final width = MediaQuery.of(context).size.width;
    return Container(
      width: 150,
      height: 150,
      child: Stack(
        children: [
          Container(
            width: 150,
            height: 150,
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.red),
                value: (page + 1) / (_list.length + 1)),
          ),
          Center(
            child: InkWell(
              onTap: () {
                if (page < _list.length && page != _list.length - 1) {
                  _controller.animateToPage(page + 1,
                      duration: Duration(microseconds: 500),
                      curve: Curves.easeInCirc);
                  showAnimatedContainerCallBack(false);
                } else {
                  //TODO:- show animated Container
                  showAnimatedContainerCallBack(true);
                }
              },
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(100.0))),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
