import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTxtField extends StatelessWidget {
  final TextEditingController? txtController;
  final String? fieldTitle;

  final String? hint;
  final double? height;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final double? borderRadius;
  final Widget? suffix;
  final Widget? trailingTitile;
  final Widget? suffixIcon;
  final IconData? prefixIcon;
  final Function(String)? onFieldSubmit;
  final Function(String)? onChange;
  final bool? isEnable;
  final int? maxLength;
  final int? maxLines;
  final bool? isHidden;
  final Function? onTap;

  const CustomTxtField(
      {Key? key,
      this.suffix,
      this.onChange,
      this.height,
      this.inputFormatters,
      this.onFieldSubmit,
      this.keyboardType,
      this.trailingTitile,
      this.textInputAction,
      this.suffixIcon,
      this.hint,
      this.isHidden,
      this.borderRadius,
      this.fieldTitle,
      this.isEnable = true,
      this.prefixIcon,
      this.onTap,
      this.maxLength = TextField.noMaxLength,
      this.maxLines = 1,
      this.txtController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (fieldTitle != null)
          Padding(
            padding: EdgeInsets.only(bottom: 1.0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    fieldTitle!,
                    style: TextStyle(fontSize: 2.4.sp),
                  ),
                ),
                trailingTitile == null
                    ? const SizedBox()
                    : Flexible(child: trailingTitile!),
              ],
            ),
          ),
        TextFormField(
          obscureText: isHidden ?? false,
          onChanged: onChange == null ? null : (val) => onChange!(val),
          textInputAction: textInputAction ?? TextInputAction.done,
          keyboardType: keyboardType ?? TextInputType.text,
          enabled: isEnable,
          inputFormatters: inputFormatters,
          controller: txtController,
          onTap: () => onTap,
          onFieldSubmitted:
              onFieldSubmit == null ? null : (val) => onFieldSubmit!(val),
          // maxLength: maxLength,
          maxLines: maxLines,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white.withOpacity(0.7),
            hintText: hint ?? "",
            hintStyle: const TextStyle(color: Colors.black26),
            border: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
            suffix: suffix,
            suffixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.0.w),
                  child: suffixIcon,
                ) ??
                const SizedBox(),
            prefixIconColor: Colors.black54,
            suffixIconColor: Colors.black54,
            suffixIconConstraints: const BoxConstraints(
              minWidth: 10.0,
              minHeight: 15.0,
            ),
            prefixIcon: prefixIcon != null
                ? Icon(
                    prefixIcon,
                    size: 5.0.w,
                  )
                : null,
            enabledBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(borderRadius ?? 3.0)),
              borderSide: const BorderSide(
                  width: 0.5, color: Colors.grey), //<-- SEE HERE
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(borderRadius ?? 3.0)),
              borderSide: const BorderSide(
                  width: 0.5, color: Colors.grey), //<-- SEE HERE
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(borderRadius ?? 3.0)),
              borderSide: const BorderSide(
                  width: 0.5, color: Colors.grey), //<-- SEE HERE
            ),
          ),
          style: const TextStyle(fontSize: 15.0),
        ),
      ],
    );
  }
}
