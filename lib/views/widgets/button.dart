import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Buttons extends StatefulWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color? color;
  final Color? txtColor;
  final Color? disableBackgroundColor;

  final Widget? iconWidget;
  final Widget? rightIconWidget;
  final double? width;
  final double? height;
  final double? elevation;
  final double? radius;
  final TextDirection? rowDirection;

  final Color? borderColor;
  final double? txtFontSize;

  const Buttons(
      {super.key,
      required this.onPressed,
      this.width,
      this.txtColor,
      this.disableBackgroundColor,
      this.height,
      this.radius,
      this.elevation,
      this.txtFontSize,
      this.color,
      this.iconWidget,
      this.rightIconWidget,
      this.rowDirection,
      this.borderColor,
      required this.text});

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? 8.0.h,
      width: widget.width ?? double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: widget.elevation ?? 0.1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.radius ?? 5.0),
          ),
          disabledBackgroundColor: widget.disableBackgroundColor,
          backgroundColor: widget.color ?? Colors.white,
          side: BorderSide(
            color: widget.borderColor ?? Colors.transparent,
            width: widget.borderColor == null
                ? widget.color == null
                    ? 0.0
                    : 0.3
                : 15.0.w,
          ),
        ),
        onPressed: widget.onPressed != null
            ? () {
                widget.onPressed!();
              }
            : null,
        child: Row(
          textDirection: widget.rowDirection ?? TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.iconWidget != null)
              Padding(
                padding: EdgeInsets.only(right: 2.0.w),
                child: widget.iconWidget!,
              ),
            Text(
              widget.text,
              style: TextStyle(
                  fontSize: widget.txtFontSize ?? 3.sp,
                  color: widget.txtColor ??
                      (widget.color == null ? Colors.black : Colors.white)),
            ),
            if (widget.rightIconWidget != null)
              Padding(
                padding:
                    EdgeInsets.only(left: widget.text.isNotEmpty ? 2.0.w : 0.0),
                child: widget.rightIconWidget!,
              ),
          ],
        ),
      ),
    );
  }
}

class CircularButton extends StatelessWidget {
  final IconData iconData;
  final GestureTapCallback callback;

  const CircularButton(
      {super.key, required this.iconData, required this.callback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        width: 10.w,
        height: 10.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[200],
        ),
        child: Center(
          child: FaIcon(
            iconData,
            size: 5.0.w,
            color: Colors.black38,
          ),
        ),
      ),
    );
  }
}
