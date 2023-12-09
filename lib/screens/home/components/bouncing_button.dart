import 'package:do_clean_application/screens/profile/settings.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

class BouncingButton extends StatefulWidget {
  @override
  _BouncingState createState() => _BouncingState();
}

class _BouncingState extends State<BouncingButton>
    with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 100,
      ),
      lowerBound: 0.0,
      upperBound: 0.3,
    );
    _controller.addListener(
      () {
        setState(() {});
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    // Align(
    //   alignment: Alignment.topRight,
    //   child: Container(
    //     width: 35,
    //     height: 35,
    //     alignment: Alignment.center,
    //     margin: EdgeInsets.only(
    //       right: 10,
    //       top: 8,
    //     ),
    //     decoration: const BoxDecoration(
    //       borderRadius: BorderRadius.all(
    //         Radius.circular(20),
    //       ),
    //       color: kActiveColor,
    //     ),
    //     child: const Text(
    //       '2',
    //       style: TextStyle(
    //         fontFamily: 'SF Pro Text',
    //         color: kBgColor,
    //       ),
    //     ),
    //   ),
    // );
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => AccountSettings(),
        //   ),
        // );
        setState(
          () {
            Navigator.pushNamed(context, '/cart');
          },
        );
      },
      child: Transform.scale(
        scale: _scale,
        child: _animatedButtonUI,
      ),
    );
  }

  Widget get _animatedButtonUI => Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            boxShadow: const [
              BoxShadow(
                color: Color(0x80000000),
                blurRadius: 35.0,
                offset: Offset(0, 5.0),
              ),
            ],
            color: kActiveColor),
        child: const Center(
          child: Icon(
            Icons.shopping_cart_sharp,
            color: kBgColor,
          ),
        ),
      );

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }
}
