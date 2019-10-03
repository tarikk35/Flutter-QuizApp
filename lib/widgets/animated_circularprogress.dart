import 'package:flutter/material.dart';
import 'package:quiz_app/configs/default_sizes.dart';

class AnimatedCircularProgress extends StatefulWidget {
  final Color indicatorColor;
  final double size;
  final Function controllerSetter;
  final Function timeUpHandler;
  AnimatedCircularProgress(
      {@required this.controllerSetter,
      @required this.timeUpHandler,
      @required this.indicatorColor,
      @required this.size});
  @override
  State<StatefulWidget> createState() {
    return _AnimatedCircularProgressState(indicatorColor);
  }
}

class _AnimatedCircularProgressState extends State<AnimatedCircularProgress>
    with TickerProviderStateMixin {
  final Color indicatorColor;
  _AnimatedCircularProgressState(this.indicatorColor);
  AnimationController controller;
  Animation<double> tickAnimation;
  @override
  void initState() {
    super.initState();
    controller = widget.controllerSetter(AnimationController(vsync: this));
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.timeUpHandler();
      }
    });
    tickAnimation = Tween<double>(begin: 0, end: 1).animate(controller);
    // start animation
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Container(
          width: widget.size,
          height: widget.size,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              CircularProgressIndicator(
                value: tickAnimation.value,
                valueColor: AlwaysStoppedAnimation<Color>(indicatorColor),
                backgroundColor: Colors.white,
                strokeWidth: DefaultSizes().minPaddingW2,
              ),
              Align(
                alignment: Alignment(0, 0),
                child: Text((controller.duration.inSeconds -
                        (tickAnimation.value * controller.duration.inSeconds))
                    .ceil()
                    .toString()),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
