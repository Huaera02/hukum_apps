import 'package:flutter/material.dart';
import 'package:loginn/global_colors.dart';

// import '../../../res/theme.dart';

class AnimatedCameraButton extends StatefulWidget {
  final Function onPressed;

  const AnimatedCameraButton({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  _AnimatedCameraButtonState createState() => _AnimatedCameraButtonState();
}

class _AnimatedCameraButtonState extends State<AnimatedCameraButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.forward();
        Future<dynamic>.delayed(Duration(milliseconds: 200), () {
          _controller.reverse();
        });
        widget.onPressed();
      },
      child: Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 0.75)),
        child: ScaleTransition(
          scale: Tween<double>(
            begin: 1,
            end: 0.7,
          ).animate(_controller),
          child: IconButton(
            onPressed: null,
            iconSize: 50,
            // focusColor: AppTheme.greyColor.withOpacity(0.5),
            focusColor: GlobalColors.mainColor,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: const Icon(Icons.circle, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
