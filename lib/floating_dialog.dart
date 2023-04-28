import 'package:flutter/material.dart';

class FloatingDialog extends StatefulWidget {
  const FloatingDialog(
      {super.key,
      required this.onClose,
      this.child,
      this.showCloseButton = true,
      this.enableDragAnimation = true});

  final void Function() onClose;
  final Widget? child;
  final bool showCloseButton;
  final bool enableDragAnimation;

  @override
  FloatingDialogState createState() => FloatingDialogState();
}

class FloatingDialogState extends State<FloatingDialog> {
  bool _dragging = false;
  double _xOffset = 0.0;
  double _yOffset = 0.0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _load();
    });
  }

  void _load() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: _xOffset,
          top: _yOffset,
          child: GestureDetector(
            onPanStart: (details) {
              if (mounted) {
                setState(() {
                  _dragging = true;
                });
              }
            },
            onPanUpdate: (details) {
              if (mounted) {
                setState(() {
                  _xOffset += details.delta.dx;
                  _yOffset += details.delta.dy;
                });
              }
            },
            onPanEnd: (details) {
              if (mounted) {
                setState(() {
                  _dragging = false;
                });
              }
            },
            child: AnimatedOpacity(
              duration: Duration(milliseconds: _dragging ? 0 : 500),
              opacity: _dragging && widget.enableDragAnimation ? 0.8 : 1.0,
              child: Dialog(
                child: Stack(
                  children: [
                    if (widget.showCloseButton)
                      Positioned(
                        right: 0,
                        child: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            widget.onClose();
                          },
                        ),
                      ),
                    widget.child ??
                        const SizedBox(
                          height: 100,
                        )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
