import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mena/core/functions/main_funcs.dart';

import '../../../core/constants/constants.dart';
import '../../../core/responsive/responsive.dart';

class MenaDropDown extends StatefulWidget {
  Map<String, String> items;
  String hint;
  Function(String?) onChange;
  String? labelKey;

  MenaDropDown(
      {Key? key,
      required this.items,
      required this.hint,
      required this.onChange,
      this.labelKey = ''})
      : super(key: key);

  @override
  State<MenaDropDown> createState() => _MenaDropDownState();
}

class _MenaDropDownState extends State<MenaDropDown> {
  String? label;

  @override
  void initState() {
    super.initState();
    // var reversed = Map.fromEntries(
    //     widget.items.entries.map((e) => MapEntry(e.value, e.key)));
    // for (var kv in reversed.entries) {
    //   if (kv.key == widget.labelKey) {
    //     label = kv.value;
    //     break;
    //   }
    // }
    // widget.items.add('');
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      decoration: InputDecoration(
        errorMaxLines: 3,
        isDense: true,
        filled: true,
        hintText: widget.hint,
        // floatingLabelBehavior: floatingLabelBehavior,
        hintStyle: mainStyle(context, 12,
            color: newDarkGreyColor, weight: FontWeight.w700),
        contentPadding: EdgeInsets.symmetric(
            vertical: Responsive.isMobile(context) ? 10 : 15.0,
            horizontal: 0.0),
        border: const OutlineInputBorder(),
        // suffixIcon: Padding(
        //   padding: EdgeInsets.symmetric(horizontal: defaultHorizontalPadding),
        //   child: suffixIcon,
        // ),
        suffixIconConstraints: BoxConstraints(maxHeight: 30.w),
        labelStyle: mainStyle(context, 13,
            color: newDarkGreyColor, weight: FontWeight.w700),
        // labelText: label,
        // label: Text( 'sakldkl'),
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: withoutLabelPadding ? 0.0 : 2.0),
        //   child: labelWidget,
        // ),
        fillColor: Colors.white,
        focusColor: newLightGreyColor,
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(defaultRadiusVal))),

        errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.red.withOpacity(0.6), width: 1),
            borderRadius: BorderRadius.all(Radius.circular(defaultRadiusVal))),

        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: mainBlueColor, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(defaultRadiusVal))),

        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: disabledGreyColor, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(defaultRadiusVal))),

        disabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: mainBlueColor.withOpacity(0.7), width: 1),
            borderRadius: BorderRadius.all(Radius.circular(defaultRadiusVal))),
      ),
      isExpanded: true,
      hint: Text(widget.hint,
          style: mainStyle(context, 13,
              color: newDarkGreyColor, weight: FontWeight.w700)),
      items: widget.items.keys
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ))
          .toList(),
      validator: (value) {
        if (value == null) {
          return 'Please select livestream Category';
        }
        return null;
      },
      value: (label != null && label!.isEmpty) ? null : label,
      onChanged: (value) {
        setState(() {
          label = value;
        });
        widget.onChange(label);
      },
      onSaved: (value) {
        // selectedValue = value.toString();
      },
      buttonStyleData: const ButtonStyleData(
        // height: 60,
        padding: EdgeInsets.only(left: 0, right: 10),
      ),
      iconStyleData: IconStyleData(
        icon: Icon(
          Icons.keyboard_arrow_down_outlined,
          color: mainBlueColor,
        ),
        iconSize: 30,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultRadiusVal),
        ),
      ),
    );
  }
}
