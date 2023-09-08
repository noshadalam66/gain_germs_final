import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;

import '../Theme/theme.dart';
import '../Theme/typography.dart';

getCommaSeparatedAmtCurrency(val) {
  try {
    val = (val == null || val.toString().trim().isEmpty) ? "0.00" : val;
    val = val is int ? val.toString() : double.parse(val.toString());
    // final oCcy = NumberFormat.simpleCurrency(locale: "en",name: "", decimalDigits: 2);
    return val;
  } catch (e) {
    return "0.00";
  }
}

enum InputFieldStyles {
  PAYMENT_FIELD,
  TRANSFER_FIELD_STATIC,
  NO_STYLE,
}

class DecimalTextInputFormatter extends TextInputFormatter {
  DecimalTextInputFormatter({this.decimalRange})
      : assert(decimalRange == null || decimalRange > 0);

  final int? decimalRange;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue, // unused.
    TextEditingValue newValue,
  ) {
    TextSelection newSelection = newValue.selection;
    String truncated = newValue.text;

    if (decimalRange != null) {
      String value = newValue.text;

      if (value.contains(".") &&
          value.substring(value.indexOf(".") + 1).length > decimalRange!) {
        truncated = oldValue.text;
        newSelection = oldValue.selection;
      } else if (value == ".") {
        truncated = "0.";

        newSelection = newValue.selection.copyWith(
          baseOffset: math.min(truncated.length, truncated.length + 1),
          extentOffset: math.min(truncated.length, truncated.length + 1),
        );
      }

      return TextEditingValue(
        text: truncated,
        selection: newSelection,
        composing: TextRange.empty,
      );
    }
    return newValue;
  }
}

class PaymentInputField extends StatefulWidget {
  final TextEditingController? txtcontrollerAmount;
  ValueChanged<String>? onChanged;
  ValueChanged<String>? onFieldSubmitted;
  bool? isBalanceInsufficient;
  bool enabled;
  TextAlign alignText;
  TextStyle? cStyle;
  InputFieldStyles cType;
  FocusNode? focus;

  PaymentInputField(
      {this.txtcontrollerAmount,
      this.onChanged,
        this.onFieldSubmitted,
      this.enabled = true,
      this.isBalanceInsufficient=false,
      this.cStyle,
      this.focus,
      this.cType = InputFieldStyles.PAYMENT_FIELD,
      this.alignText = TextAlign.center});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<PaymentInputField> {

  @override
  void initState() {
    super.initState();
  }


  InputDecoration noStyle() {
    return InputDecoration(border: InputBorder.none, hintText: '');
  }

  InputDecoration payment() {
    return InputDecoration(
        hintText: "0.00",
        hintStyle: TextStyle(
            fontSize: widget.cStyle != null ? widget.cStyle!.fontSize : 38,
            color: GainGermsTheme().getTheme().color3),
        contentPadding: EdgeInsets.only(left: 0),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: widget.isBalanceInsufficient!
                  ? GainGermsTheme().getTheme().color10
                  : GainGermsTheme().getTheme().color6),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: widget.isBalanceInsufficient!
              ? GainGermsTheme().getTheme().color10
              : GainGermsTheme().getTheme().color3),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: widget.isBalanceInsufficient!
              ? GainGermsTheme().getTheme().color10
              : GainGermsTheme().getTheme().color6),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: widget.isBalanceInsufficient!
              ? GainGermsTheme().getTheme().color10
              : GainGermsTheme().getTheme().color6),
        ));
  }


  InputDecoration transfer() {
    return InputDecoration();
  }

  InputDecoration styles() {
    switch (widget.cType) {
      case InputFieldStyles.NO_STYLE:
        return noStyle();
      case InputFieldStyles.PAYMENT_FIELD:
        return payment();
      case InputFieldStyles.TRANSFER_FIELD_STATIC:
        return transfer();
      default:
        return payment();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: ui.TextDirection.ltr,
      child: TextFormField(
        textAlign: widget.alignText,
        enabled: widget.enabled,
        focusNode: widget.focus ?? FocusNode(),
        //  autofocus: true,
        keyboardType: TextInputType.numberWithOptions(decimal: true, signed: true),
        style: widget.cStyle ??
            GainGermsText(typo: Typo.AMOUNT, color: GainGermsTheme().getTheme().headerColor, isBold: true)
                .style(),
        onFieldSubmitted: (String value) {
          String val = getCommaSeparatedAmtCurrency(value.toString());
          widget.txtcontrollerAmount!.value = TextEditingValue(
            text: val,
            selection: TextSelection.fromPosition(
              TextPosition(offset: val.length),
            ),
          );
          FocusScope.of(context).unfocus();
          if(widget.onFieldSubmitted != null) widget.onFieldSubmitted!(value);
        },
      
        onTap: () {
          String val = widget.txtcontrollerAmount!.text
              .toString()
              .trim()
              .replaceAll(",", "");
          setState(() {
            widget.txtcontrollerAmount!.text = val;
          });
        },
        onChanged: (String value) => widget.onChanged!(value),
        controller: widget.txtcontrollerAmount,
        inputFormatters: [
          DecimalTextInputFormatter(decimalRange: 2),
          FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
        ],
        decoration: styles(),
      ),
    );
  }
}
